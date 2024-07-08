#include <ctype.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

void error(void)
{
    char error_message[30] = "An error has occurred\n";
    write(STDERR_FILENO, error_message, strlen(error_message)); 
}

// Frees a dynamically-allocated array of strings. Assumes final string is NULL.
char **destroy_array(char **array)
{
    int i = 0;
    while (array[i] != NULL)
        free(array[i++]);
    free(array);
    return NULL;
}

// Returns next whitespace-separated token in line and updates line to start 
// after said token
char *get_next_token(char **line)
{
    char *next = "\0";
    // strsep returns next token before whitespace; while still reading
    // whitespace, this is just the null terminator
    while (*next == '\0')
        // Break at end of input
        if ((next = strsep(line, " \t\n\v\f\r")) == NULL)
            break;
    return next;
}

// Return number of space-separated tokens in input line
int get_num_args(char *line)
{
    int len = 0;
    // Copy line to avoid altering it
    char *to_free = line = strdup(line);
    while (get_next_token(&line) != NULL)
        len++;
    // Free original address of line
    free(to_free);
    return len;
}

// Return copy of line with spaces around '>' and '&' characters
char *insert_spaces(char *line)
{
    int orig_len = strlen(line), num_extra_spaces = 0, i = 0;
    // Counter number of extra spaces needed
    while (line[i] != '\0')
    {
        if (line[i] == '>' || line[i] == '&')
            num_extra_spaces += 2;
        i++;
    }
    
    char *new_line = malloc(sizeof(char*) * (orig_len + num_extra_spaces + 1));
    int read_index = 0, write_index = 0;
    char c;
    // Copy over characters, with extra spaces where necessary
    while ((c = line[read_index++]) != '\0')
    {
        if (c == '>' || c == '&')
            new_line[write_index++] = ' ';
        new_line[write_index++] = c;
        if (c == '>' || c == '&')
            new_line[write_index++] = ' ';
    }

    return new_line;
}

char **init_path()
{
    char **path = malloc(sizeof(char*) * 2);
    path[0] = strdup("/bin");
    path[1] = NULL;
    return path;
}

// Reset path based on values passed in arguments array
void reset_path(char ***path, char **arguments)
{
    int i, num_args = 0;
    // Count number of items in new path
    while (arguments[num_args] != NULL)
        num_args++;

    destroy_array(*path);
    *path = malloc(sizeof(char*) * num_args);
    // Copy all args besides initial 'path' command arg
    for (i = 1; i < num_args; i++)
        (*path)[i-1] = strdup(arguments[i]);
    // Final element must be set to NULL
    (*path)[i-1] = NULL;
}

// Search path and return full command location, or NULL if not found
char *search_path(char **path, char *command)
{
    int i = 0, command_len = strlen(command);
    char *buffer;

    // Check each entry in path
    while (path[i] != NULL)
    {
        // Form command candidate, leaving room for '/' and null terminator
        buffer = malloc(sizeof(char) * (strlen(path[i]) + command_len + 2));
        buffer[0] = '\0';
        strcat(buffer, path[i]);
        strcat(buffer, "/");
        strcat(buffer, command);

        // Check if command exists, and return if so
        if (access(buffer, F_OK) == 0)
            return buffer;
        free(buffer);
        i++;
    }
    // If not found, print error message
    error();
    return NULL;
}

// If arguments[0] is a built-in command, execute it and return 1. Otherwise, 
// return 0. Must pass pointer to 2D path array, as it will be re-allocated if
// we run the 'path' command.
int run_built_in_command(char ***path, char **arguments)
{
    // Check for built-in commands
    if (strcmp(arguments[0], "exit") == 0)
    {
        // If we received arguments after exit, error
        if (arguments[1] != NULL)
            error();
        // Otherwise, exit with no problems
        else
            exit(0);
        return 1;
    }
    else if (strcmp(arguments[0], "cd") == 0)
    {
        // Validate that cd received exactly one arg, and attempt to chdir to it
        if (arguments[1] == NULL || arguments[2] != NULL ||
            chdir(arguments[1]) == -1)
            error();
        return 1;
    }
    else if (strcmp(arguments[0], "path") == 0)
    {
        reset_path(path, arguments);
        return 1;
    }
    return 0;
}

// Fork child process to run command specified in arguments
void run_external_command(char **path, char **arguments)
{
    int read_index = 0, write_index = 0, rc = 1, num_children = 0;
    char *filename = NULL;
    char **argv = NULL;
    // Loop in parent process to build argument arrays for potentially multiple
    // commands to run in parallel
    while (rc != 0)
    {
        char *curr = arguments[read_index];
        // If reached end of current command args, fork new process with current
        // argv array
        if (curr == NULL || strcmp(curr, "&") == 0)
        {
            // // If no command has been given, break
            if (write_index == 0)
                break;
            num_children++;
            // Set next arg as NULL and fork new process
            argv[write_index] = NULL;
            rc = fork();
            // Reset parent process to build next command
            if (rc != 0)
            {
                argv = destroy_array(argv);
                write_index = 0;
                filename = NULL;
            }
            // If there are no more args for the parent to process, break
            if (curr == NULL)
                break;
        }
        // Else if we're told to redirect output
        else if (strcmp(curr, ">") == 0)
        {
            if (read_index == 0 || // no command to redirect
                arguments[read_index+1] == NULL || // no file to redirect to
               (arguments[read_index+2] != NULL &&  // extraneous args
                strcmp(arguments[read_index+2], "&") != 0))
            {
                error();
                return;
            }
            filename = arguments[++read_index];
        }
        // Otherwise, add next argument to argv
        else
        {
            // Increase space of argv by 1 and copy next arg
            argv = realloc(argv, sizeof(char*) * (write_index + 2));
            argv[write_index++] = strdup(arguments[read_index]);
        }
        read_index++;
    }

    if (rc < 0)
        exit(1);
    else if (rc == 0)
    {
        // If no command given, exit
        if (argv[0] == NULL)
            exit(0);
        // Get full command string from path
        char *buffer = search_path(path, argv[0]);
        // If command was valid, use execv to run it
        if (buffer != NULL)
        {
            // Free old command string and set equal to new one
            free(argv[0]);
            argv[0] = buffer;
            // If a redirection filename was been passed, close stdout and
            // stderr and open file in their place
            if (filename != NULL)
            {
                close(STDOUT_FILENO);
                close(STDERR_FILENO);
                // Make two file descriptors to refer to file
                dup(open(filename, O_CREAT|O_WRONLY|O_TRUNC, S_IRWXU));
            }
            execv(argv[0], argv);
        }
        // Exit child process either if execv fails or command not found
        exit(1);
    }
    else
    {   
        // Wait for all children to finish
        for (int i = 0; i < num_children; i++)
            wait(NULL);
    }
}

// Read prompt into array of strings and return said array
char **run_prompt(int batch_mode)
{
    char *line = NULL, *to_free, **arguments;
    size_t capacity = 0;
    int num_args, i;

    if (!batch_mode)
        printf("wish > ");
    // Read line from standard input. If EOF (CTRL-D), exit.
    if (getline(&line, &capacity, stdin) == -1)
        exit(0);
    // Update line to include spaces around '>' and '&' characters
    to_free = line;
    line = insert_spaces(line);
    free(to_free);

    // Read each argument from input into arguments array
    num_args = get_num_args(line);
    arguments = malloc(sizeof(char*) * (num_args + 1));
    to_free = line;
    for (i = 0; i < num_args; i++)
        arguments[i] = strdup(get_next_token(&line));
    arguments[i] = NULL;

    free(to_free);
    return arguments;
}

int main(int argc, char **argv)
{
    char **arguments, **path = init_path();
    int batch_mode = 0;
    // Check if we should read input from a file
    if (argc > 1)
    {
        // Close stdin and open specified file
        close(STDIN_FILENO);
        int rc = open(argv[1], O_RDONLY);
        // If we fail to open file, or there is more than one file, error and
        // exit
        if (rc == -1 || argc != 2)
        {
            error();
            exit(1);
        }
        batch_mode = 1;
    }
    while (1)
    {   
        // If no argument is given, continue to next input
        arguments = run_prompt(batch_mode);
        if (arguments[0] == NULL)
        {
            destroy_array(arguments);
            continue;
        }
        // First check if command is built-in. If not, run external command.
        if (!run_built_in_command(&path, arguments))
            run_external_command(path, arguments);
        destroy_array(arguments);
    }   
    return 0;
}
