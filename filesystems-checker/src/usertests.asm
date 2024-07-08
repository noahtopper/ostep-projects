
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
      11:	68 7e 49 00 00       	push   $0x497e
      16:	6a 01                	push   $0x1
      18:	e8 8f 36 00 00       	call   36ac <printf>
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 92 49 00 00       	push   $0x4992
      26:	e8 8c 35 00 00       	call   35b7 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 fc 50 00 00       	push   $0x50fc
      39:	6a 01                	push   $0x1
      3b:	e8 6c 36 00 00       	call   36ac <printf>
      40:	e8 32 35 00 00       	call   3577 <exit>
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 92 49 00 00       	push   $0x4992
      51:	e8 61 35 00 00       	call   35b7 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 41 35 00 00       	call   359f <close>
      5e:	e8 c5 32 00 00       	call   3328 <argptest>
      63:	e8 ac 10 00 00       	call   1114 <createdelete>
      68:	e8 a7 18 00 00       	call   1914 <linkunlink>
      6d:	e8 ea 15 00 00       	call   165c <concreate>
      72:	e8 d1 0e 00 00       	call   f48 <fourfiles>
      77:	e8 28 0d 00 00       	call   da4 <sharedfd>
      7c:	e8 b3 2f 00 00       	call   3034 <bigargtest>
      81:	e8 a2 21 00 00       	call   2228 <bigwrite>
      86:	e8 a9 2f 00 00       	call   3034 <bigargtest>
      8b:	e8 44 2f 00 00       	call   2fd4 <bsstest>
      90:	e8 77 2a 00 00       	call   2b0c <sbrktest>
      95:	e8 8e 2e 00 00       	call   2f28 <validatetest>
      9a:	e8 39 03 00 00       	call   3d8 <opentest>
      9f:	e8 c4 03 00 00       	call   468 <writetest>
      a4:	e8 8b 05 00 00       	call   634 <writetest1>
      a9:	e8 32 07 00 00       	call   7e0 <createtest>
      ae:	e8 35 02 00 00       	call   2e8 <openiputtest>
      b3:	e8 3c 01 00 00       	call   1f4 <exitiputtest>
      b8:	e8 57 00 00 00       	call   114 <iputtest>
      bd:	e8 2a 0c 00 00       	call   cec <mem>
      c2:	e8 e1 08 00 00       	call   9a8 <pipe1>
      c7:	e8 68 0a 00 00       	call   b34 <preempt>
      cc:	e8 a3 0b 00 00       	call   c74 <exitwait>
      d1:	e8 12 25 00 00       	call   25e8 <rmdot>
      d6:	e8 d9 23 00 00       	call   24b4 <fourteen>
      db:	e8 1c 22 00 00       	call   22fc <bigfile>
      e0:	e8 6b 1a 00 00       	call   1b50 <subdir>
      e5:	e8 66 13 00 00       	call   1450 <linktest>
      ea:	e8 dd 11 00 00       	call   12cc <unlinkread>
      ef:	e8 68 26 00 00       	call   275c <dirfile>
      f4:	e8 5b 28 00 00       	call   2954 <iref>
      f9:	e8 6e 29 00 00       	call   2a6c <forktest>
      fe:	e8 21 19 00 00       	call   1a24 <bigdir>
     103:	e8 b0 31 00 00       	call   32b8 <uio>
     108:	e8 53 08 00 00       	call   960 <exectest>
     10d:	e8 65 34 00 00       	call   3577 <exit>
     112:	66 90                	xchg   %ax,%ax

00000114 <iputtest>:
     114:	55                   	push   %ebp
     115:	89 e5                	mov    %esp,%ebp
     117:	83 ec 10             	sub    $0x10,%esp
     11a:	68 24 3a 00 00       	push   $0x3a24
     11f:	ff 35 b0 51 00 00    	pushl  0x51b0
     125:	e8 82 35 00 00       	call   36ac <printf>
     12a:	c7 04 24 b7 39 00 00 	movl   $0x39b7,(%esp)
     131:	e8 a9 34 00 00       	call   35df <mkdir>
     136:	83 c4 10             	add    $0x10,%esp
     139:	85 c0                	test   %eax,%eax
     13b:	78 58                	js     195 <iputtest+0x81>
     13d:	83 ec 0c             	sub    $0xc,%esp
     140:	68 b7 39 00 00       	push   $0x39b7
     145:	e8 9d 34 00 00       	call   35e7 <chdir>
     14a:	83 c4 10             	add    $0x10,%esp
     14d:	85 c0                	test   %eax,%eax
     14f:	0f 88 85 00 00 00    	js     1da <iputtest+0xc6>
     155:	83 ec 0c             	sub    $0xc,%esp
     158:	68 b4 39 00 00       	push   $0x39b4
     15d:	e8 65 34 00 00       	call   35c7 <unlink>
     162:	83 c4 10             	add    $0x10,%esp
     165:	85 c0                	test   %eax,%eax
     167:	78 5a                	js     1c3 <iputtest+0xaf>
     169:	83 ec 0c             	sub    $0xc,%esp
     16c:	68 d9 39 00 00       	push   $0x39d9
     171:	e8 71 34 00 00       	call   35e7 <chdir>
     176:	83 c4 10             	add    $0x10,%esp
     179:	85 c0                	test   %eax,%eax
     17b:	78 2f                	js     1ac <iputtest+0x98>
     17d:	83 ec 08             	sub    $0x8,%esp
     180:	68 5c 3a 00 00       	push   $0x3a5c
     185:	ff 35 b0 51 00 00    	pushl  0x51b0
     18b:	e8 1c 35 00 00       	call   36ac <printf>
     190:	83 c4 10             	add    $0x10,%esp
     193:	c9                   	leave  
     194:	c3                   	ret    
     195:	50                   	push   %eax
     196:	50                   	push   %eax
     197:	68 90 39 00 00       	push   $0x3990
     19c:	ff 35 b0 51 00 00    	pushl  0x51b0
     1a2:	e8 05 35 00 00       	call   36ac <printf>
     1a7:	e8 cb 33 00 00       	call   3577 <exit>
     1ac:	50                   	push   %eax
     1ad:	50                   	push   %eax
     1ae:	68 db 39 00 00       	push   $0x39db
     1b3:	ff 35 b0 51 00 00    	pushl  0x51b0
     1b9:	e8 ee 34 00 00       	call   36ac <printf>
     1be:	e8 b4 33 00 00       	call   3577 <exit>
     1c3:	52                   	push   %edx
     1c4:	52                   	push   %edx
     1c5:	68 bf 39 00 00       	push   $0x39bf
     1ca:	ff 35 b0 51 00 00    	pushl  0x51b0
     1d0:	e8 d7 34 00 00       	call   36ac <printf>
     1d5:	e8 9d 33 00 00       	call   3577 <exit>
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	68 9e 39 00 00       	push   $0x399e
     1e1:	ff 35 b0 51 00 00    	pushl  0x51b0
     1e7:	e8 c0 34 00 00       	call   36ac <printf>
     1ec:	e8 86 33 00 00       	call   3577 <exit>
     1f1:	8d 76 00             	lea    0x0(%esi),%esi

000001f4 <exitiputtest>:
     1f4:	55                   	push   %ebp
     1f5:	89 e5                	mov    %esp,%ebp
     1f7:	83 ec 10             	sub    $0x10,%esp
     1fa:	68 eb 39 00 00       	push   $0x39eb
     1ff:	ff 35 b0 51 00 00    	pushl  0x51b0
     205:	e8 a2 34 00 00       	call   36ac <printf>
     20a:	e8 60 33 00 00       	call   356f <fork>
     20f:	83 c4 10             	add    $0x10,%esp
     212:	85 c0                	test   %eax,%eax
     214:	0f 88 86 00 00 00    	js     2a0 <exitiputtest+0xac>
     21a:	75 4c                	jne    268 <exitiputtest+0x74>
     21c:	83 ec 0c             	sub    $0xc,%esp
     21f:	68 b7 39 00 00       	push   $0x39b7
     224:	e8 b6 33 00 00       	call   35df <mkdir>
     229:	83 c4 10             	add    $0x10,%esp
     22c:	85 c0                	test   %eax,%eax
     22e:	0f 88 83 00 00 00    	js     2b7 <exitiputtest+0xc3>
     234:	83 ec 0c             	sub    $0xc,%esp
     237:	68 b7 39 00 00       	push   $0x39b7
     23c:	e8 a6 33 00 00       	call   35e7 <chdir>
     241:	83 c4 10             	add    $0x10,%esp
     244:	85 c0                	test   %eax,%eax
     246:	0f 88 82 00 00 00    	js     2ce <exitiputtest+0xda>
     24c:	83 ec 0c             	sub    $0xc,%esp
     24f:	68 b4 39 00 00       	push   $0x39b4
     254:	e8 6e 33 00 00       	call   35c7 <unlink>
     259:	83 c4 10             	add    $0x10,%esp
     25c:	85 c0                	test   %eax,%eax
     25e:	78 28                	js     288 <exitiputtest+0x94>
     260:	e8 12 33 00 00       	call   3577 <exit>
     265:	8d 76 00             	lea    0x0(%esi),%esi
     268:	e8 12 33 00 00       	call   357f <wait>
     26d:	83 ec 08             	sub    $0x8,%esp
     270:	68 0e 3a 00 00       	push   $0x3a0e
     275:	ff 35 b0 51 00 00    	pushl  0x51b0
     27b:	e8 2c 34 00 00       	call   36ac <printf>
     280:	83 c4 10             	add    $0x10,%esp
     283:	c9                   	leave  
     284:	c3                   	ret    
     285:	8d 76 00             	lea    0x0(%esi),%esi
     288:	83 ec 08             	sub    $0x8,%esp
     28b:	68 bf 39 00 00       	push   $0x39bf
     290:	ff 35 b0 51 00 00    	pushl  0x51b0
     296:	e8 11 34 00 00       	call   36ac <printf>
     29b:	e8 d7 32 00 00       	call   3577 <exit>
     2a0:	51                   	push   %ecx
     2a1:	51                   	push   %ecx
     2a2:	68 d1 48 00 00       	push   $0x48d1
     2a7:	ff 35 b0 51 00 00    	pushl  0x51b0
     2ad:	e8 fa 33 00 00       	call   36ac <printf>
     2b2:	e8 c0 32 00 00       	call   3577 <exit>
     2b7:	52                   	push   %edx
     2b8:	52                   	push   %edx
     2b9:	68 90 39 00 00       	push   $0x3990
     2be:	ff 35 b0 51 00 00    	pushl  0x51b0
     2c4:	e8 e3 33 00 00       	call   36ac <printf>
     2c9:	e8 a9 32 00 00       	call   3577 <exit>
     2ce:	50                   	push   %eax
     2cf:	50                   	push   %eax
     2d0:	68 fa 39 00 00       	push   $0x39fa
     2d5:	ff 35 b0 51 00 00    	pushl  0x51b0
     2db:	e8 cc 33 00 00       	call   36ac <printf>
     2e0:	e8 92 32 00 00       	call   3577 <exit>
     2e5:	8d 76 00             	lea    0x0(%esi),%esi

000002e8 <openiputtest>:
     2e8:	55                   	push   %ebp
     2e9:	89 e5                	mov    %esp,%ebp
     2eb:	83 ec 10             	sub    $0x10,%esp
     2ee:	68 20 3a 00 00       	push   $0x3a20
     2f3:	ff 35 b0 51 00 00    	pushl  0x51b0
     2f9:	e8 ae 33 00 00       	call   36ac <printf>
     2fe:	c7 04 24 2f 3a 00 00 	movl   $0x3a2f,(%esp)
     305:	e8 d5 32 00 00       	call   35df <mkdir>
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	85 c0                	test   %eax,%eax
     30f:	0f 88 93 00 00 00    	js     3a8 <openiputtest+0xc0>
     315:	e8 55 32 00 00       	call   356f <fork>
     31a:	85 c0                	test   %eax,%eax
     31c:	78 73                	js     391 <openiputtest+0xa9>
     31e:	75 30                	jne    350 <openiputtest+0x68>
     320:	83 ec 08             	sub    $0x8,%esp
     323:	6a 02                	push   $0x2
     325:	68 2f 3a 00 00       	push   $0x3a2f
     32a:	e8 88 32 00 00       	call   35b7 <open>
     32f:	83 c4 10             	add    $0x10,%esp
     332:	85 c0                	test   %eax,%eax
     334:	78 56                	js     38c <openiputtest+0xa4>
     336:	83 ec 08             	sub    $0x8,%esp
     339:	68 b4 49 00 00       	push   $0x49b4
     33e:	ff 35 b0 51 00 00    	pushl  0x51b0
     344:	e8 63 33 00 00       	call   36ac <printf>
     349:	e8 29 32 00 00       	call   3577 <exit>
     34e:	66 90                	xchg   %ax,%ax
     350:	83 ec 0c             	sub    $0xc,%esp
     353:	6a 01                	push   $0x1
     355:	e8 ad 32 00 00       	call   3607 <sleep>
     35a:	c7 04 24 2f 3a 00 00 	movl   $0x3a2f,(%esp)
     361:	e8 61 32 00 00       	call   35c7 <unlink>
     366:	83 c4 10             	add    $0x10,%esp
     369:	85 c0                	test   %eax,%eax
     36b:	75 52                	jne    3bf <openiputtest+0xd7>
     36d:	e8 0d 32 00 00       	call   357f <wait>
     372:	83 ec 08             	sub    $0x8,%esp
     375:	68 58 3a 00 00       	push   $0x3a58
     37a:	ff 35 b0 51 00 00    	pushl  0x51b0
     380:	e8 27 33 00 00       	call   36ac <printf>
     385:	83 c4 10             	add    $0x10,%esp
     388:	c9                   	leave  
     389:	c3                   	ret    
     38a:	66 90                	xchg   %ax,%ax
     38c:	e8 e6 31 00 00       	call   3577 <exit>
     391:	52                   	push   %edx
     392:	52                   	push   %edx
     393:	68 d1 48 00 00       	push   $0x48d1
     398:	ff 35 b0 51 00 00    	pushl  0x51b0
     39e:	e8 09 33 00 00       	call   36ac <printf>
     3a3:	e8 cf 31 00 00       	call   3577 <exit>
     3a8:	51                   	push   %ecx
     3a9:	51                   	push   %ecx
     3aa:	68 35 3a 00 00       	push   $0x3a35
     3af:	ff 35 b0 51 00 00    	pushl  0x51b0
     3b5:	e8 f2 32 00 00       	call   36ac <printf>
     3ba:	e8 b8 31 00 00       	call   3577 <exit>
     3bf:	50                   	push   %eax
     3c0:	50                   	push   %eax
     3c1:	68 49 3a 00 00       	push   $0x3a49
     3c6:	ff 35 b0 51 00 00    	pushl  0x51b0
     3cc:	e8 db 32 00 00       	call   36ac <printf>
     3d1:	e8 a1 31 00 00       	call   3577 <exit>
     3d6:	66 90                	xchg   %ax,%ax

000003d8 <opentest>:
     3d8:	55                   	push   %ebp
     3d9:	89 e5                	mov    %esp,%ebp
     3db:	83 ec 10             	sub    $0x10,%esp
     3de:	68 6a 3a 00 00       	push   $0x3a6a
     3e3:	ff 35 b0 51 00 00    	pushl  0x51b0
     3e9:	e8 be 32 00 00       	call   36ac <printf>
     3ee:	58                   	pop    %eax
     3ef:	5a                   	pop    %edx
     3f0:	6a 00                	push   $0x0
     3f2:	68 75 3a 00 00       	push   $0x3a75
     3f7:	e8 bb 31 00 00       	call   35b7 <open>
     3fc:	83 c4 10             	add    $0x10,%esp
     3ff:	85 c0                	test   %eax,%eax
     401:	78 36                	js     439 <opentest+0x61>
     403:	83 ec 0c             	sub    $0xc,%esp
     406:	50                   	push   %eax
     407:	e8 93 31 00 00       	call   359f <close>
     40c:	5a                   	pop    %edx
     40d:	59                   	pop    %ecx
     40e:	6a 00                	push   $0x0
     410:	68 8d 3a 00 00       	push   $0x3a8d
     415:	e8 9d 31 00 00       	call   35b7 <open>
     41a:	83 c4 10             	add    $0x10,%esp
     41d:	85 c0                	test   %eax,%eax
     41f:	79 2f                	jns    450 <opentest+0x78>
     421:	83 ec 08             	sub    $0x8,%esp
     424:	68 b8 3a 00 00       	push   $0x3ab8
     429:	ff 35 b0 51 00 00    	pushl  0x51b0
     42f:	e8 78 32 00 00       	call   36ac <printf>
     434:	83 c4 10             	add    $0x10,%esp
     437:	c9                   	leave  
     438:	c3                   	ret    
     439:	50                   	push   %eax
     43a:	50                   	push   %eax
     43b:	68 7a 3a 00 00       	push   $0x3a7a
     440:	ff 35 b0 51 00 00    	pushl  0x51b0
     446:	e8 61 32 00 00       	call   36ac <printf>
     44b:	e8 27 31 00 00       	call   3577 <exit>
     450:	50                   	push   %eax
     451:	50                   	push   %eax
     452:	68 9a 3a 00 00       	push   $0x3a9a
     457:	ff 35 b0 51 00 00    	pushl  0x51b0
     45d:	e8 4a 32 00 00       	call   36ac <printf>
     462:	e8 10 31 00 00       	call   3577 <exit>
     467:	90                   	nop

00000468 <writetest>:
     468:	55                   	push   %ebp
     469:	89 e5                	mov    %esp,%ebp
     46b:	56                   	push   %esi
     46c:	53                   	push   %ebx
     46d:	83 ec 08             	sub    $0x8,%esp
     470:	68 c6 3a 00 00       	push   $0x3ac6
     475:	ff 35 b0 51 00 00    	pushl  0x51b0
     47b:	e8 2c 32 00 00       	call   36ac <printf>
     480:	5a                   	pop    %edx
     481:	59                   	pop    %ecx
     482:	68 02 02 00 00       	push   $0x202
     487:	68 d7 3a 00 00       	push   $0x3ad7
     48c:	e8 26 31 00 00       	call   35b7 <open>
     491:	83 c4 10             	add    $0x10,%esp
     494:	85 c0                	test   %eax,%eax
     496:	0f 88 7e 01 00 00    	js     61a <writetest+0x1b2>
     49c:	89 c6                	mov    %eax,%esi
     49e:	83 ec 08             	sub    $0x8,%esp
     4a1:	68 dd 3a 00 00       	push   $0x3add
     4a6:	ff 35 b0 51 00 00    	pushl  0x51b0
     4ac:	e8 fb 31 00 00       	call   36ac <printf>
     4b1:	83 c4 10             	add    $0x10,%esp
     4b4:	31 db                	xor    %ebx,%ebx
     4b6:	66 90                	xchg   %ax,%ax
     4b8:	50                   	push   %eax
     4b9:	6a 0a                	push   $0xa
     4bb:	68 14 3b 00 00       	push   $0x3b14
     4c0:	56                   	push   %esi
     4c1:	e8 d1 30 00 00       	call   3597 <write>
     4c6:	83 c4 10             	add    $0x10,%esp
     4c9:	83 f8 0a             	cmp    $0xa,%eax
     4cc:	0f 85 d5 00 00 00    	jne    5a7 <writetest+0x13f>
     4d2:	50                   	push   %eax
     4d3:	6a 0a                	push   $0xa
     4d5:	68 1f 3b 00 00       	push   $0x3b1f
     4da:	56                   	push   %esi
     4db:	e8 b7 30 00 00       	call   3597 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d2 00 00 00    	jne    5be <writetest+0x156>
     4ec:	43                   	inc    %ebx
     4ed:	83 fb 64             	cmp    $0x64,%ebx
     4f0:	75 c6                	jne    4b8 <writetest+0x50>
     4f2:	83 ec 08             	sub    $0x8,%esp
     4f5:	68 2a 3b 00 00       	push   $0x3b2a
     4fa:	ff 35 b0 51 00 00    	pushl  0x51b0
     500:	e8 a7 31 00 00       	call   36ac <printf>
     505:	89 34 24             	mov    %esi,(%esp)
     508:	e8 92 30 00 00       	call   359f <close>
     50d:	5b                   	pop    %ebx
     50e:	5e                   	pop    %esi
     50f:	6a 00                	push   $0x0
     511:	68 d7 3a 00 00       	push   $0x3ad7
     516:	e8 9c 30 00 00       	call   35b7 <open>
     51b:	89 c3                	mov    %eax,%ebx
     51d:	83 c4 10             	add    $0x10,%esp
     520:	85 c0                	test   %eax,%eax
     522:	0f 88 ad 00 00 00    	js     5d5 <writetest+0x16d>
     528:	83 ec 08             	sub    $0x8,%esp
     52b:	68 35 3b 00 00       	push   $0x3b35
     530:	ff 35 b0 51 00 00    	pushl  0x51b0
     536:	e8 71 31 00 00       	call   36ac <printf>
     53b:	83 c4 0c             	add    $0xc,%esp
     53e:	68 d0 07 00 00       	push   $0x7d0
     543:	68 00 79 00 00       	push   $0x7900
     548:	53                   	push   %ebx
     549:	e8 41 30 00 00       	call   358f <read>
     54e:	83 c4 10             	add    $0x10,%esp
     551:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     556:	0f 85 90 00 00 00    	jne    5ec <writetest+0x184>
     55c:	83 ec 08             	sub    $0x8,%esp
     55f:	68 69 3b 00 00       	push   $0x3b69
     564:	ff 35 b0 51 00 00    	pushl  0x51b0
     56a:	e8 3d 31 00 00       	call   36ac <printf>
     56f:	89 1c 24             	mov    %ebx,(%esp)
     572:	e8 28 30 00 00       	call   359f <close>
     577:	c7 04 24 d7 3a 00 00 	movl   $0x3ad7,(%esp)
     57e:	e8 44 30 00 00       	call   35c7 <unlink>
     583:	83 c4 10             	add    $0x10,%esp
     586:	85 c0                	test   %eax,%eax
     588:	78 79                	js     603 <writetest+0x19b>
     58a:	83 ec 08             	sub    $0x8,%esp
     58d:	68 91 3b 00 00       	push   $0x3b91
     592:	ff 35 b0 51 00 00    	pushl  0x51b0
     598:	e8 0f 31 00 00       	call   36ac <printf>
     59d:	83 c4 10             	add    $0x10,%esp
     5a0:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5a3:	5b                   	pop    %ebx
     5a4:	5e                   	pop    %esi
     5a5:	5d                   	pop    %ebp
     5a6:	c3                   	ret    
     5a7:	50                   	push   %eax
     5a8:	53                   	push   %ebx
     5a9:	68 d8 49 00 00       	push   $0x49d8
     5ae:	ff 35 b0 51 00 00    	pushl  0x51b0
     5b4:	e8 f3 30 00 00       	call   36ac <printf>
     5b9:	e8 b9 2f 00 00       	call   3577 <exit>
     5be:	50                   	push   %eax
     5bf:	53                   	push   %ebx
     5c0:	68 fc 49 00 00       	push   $0x49fc
     5c5:	ff 35 b0 51 00 00    	pushl  0x51b0
     5cb:	e8 dc 30 00 00       	call   36ac <printf>
     5d0:	e8 a2 2f 00 00       	call   3577 <exit>
     5d5:	51                   	push   %ecx
     5d6:	51                   	push   %ecx
     5d7:	68 4e 3b 00 00       	push   $0x3b4e
     5dc:	ff 35 b0 51 00 00    	pushl  0x51b0
     5e2:	e8 c5 30 00 00       	call   36ac <printf>
     5e7:	e8 8b 2f 00 00       	call   3577 <exit>
     5ec:	52                   	push   %edx
     5ed:	52                   	push   %edx
     5ee:	68 95 3e 00 00       	push   $0x3e95
     5f3:	ff 35 b0 51 00 00    	pushl  0x51b0
     5f9:	e8 ae 30 00 00       	call   36ac <printf>
     5fe:	e8 74 2f 00 00       	call   3577 <exit>
     603:	50                   	push   %eax
     604:	50                   	push   %eax
     605:	68 7c 3b 00 00       	push   $0x3b7c
     60a:	ff 35 b0 51 00 00    	pushl  0x51b0
     610:	e8 97 30 00 00       	call   36ac <printf>
     615:	e8 5d 2f 00 00       	call   3577 <exit>
     61a:	50                   	push   %eax
     61b:	50                   	push   %eax
     61c:	68 f8 3a 00 00       	push   $0x3af8
     621:	ff 35 b0 51 00 00    	pushl  0x51b0
     627:	e8 80 30 00 00       	call   36ac <printf>
     62c:	e8 46 2f 00 00       	call   3577 <exit>
     631:	8d 76 00             	lea    0x0(%esi),%esi

00000634 <writetest1>:
     634:	55                   	push   %ebp
     635:	89 e5                	mov    %esp,%ebp
     637:	56                   	push   %esi
     638:	53                   	push   %ebx
     639:	83 ec 08             	sub    $0x8,%esp
     63c:	68 a5 3b 00 00       	push   $0x3ba5
     641:	ff 35 b0 51 00 00    	pushl  0x51b0
     647:	e8 60 30 00 00       	call   36ac <printf>
     64c:	58                   	pop    %eax
     64d:	5a                   	pop    %edx
     64e:	68 02 02 00 00       	push   $0x202
     653:	68 1f 3c 00 00       	push   $0x3c1f
     658:	e8 5a 2f 00 00       	call   35b7 <open>
     65d:	83 c4 10             	add    $0x10,%esp
     660:	85 c0                	test   %eax,%eax
     662:	0f 88 49 01 00 00    	js     7b1 <writetest1+0x17d>
     668:	89 c6                	mov    %eax,%esi
     66a:	31 db                	xor    %ebx,%ebx
     66c:	89 1d 00 79 00 00    	mov    %ebx,0x7900
     672:	50                   	push   %eax
     673:	68 00 02 00 00       	push   $0x200
     678:	68 00 79 00 00       	push   $0x7900
     67d:	56                   	push   %esi
     67e:	e8 14 2f 00 00       	call   3597 <write>
     683:	83 c4 10             	add    $0x10,%esp
     686:	3d 00 02 00 00       	cmp    $0x200,%eax
     68b:	0f 85 a9 00 00 00    	jne    73a <writetest1+0x106>
     691:	43                   	inc    %ebx
     692:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     698:	75 d2                	jne    66c <writetest1+0x38>
     69a:	83 ec 0c             	sub    $0xc,%esp
     69d:	56                   	push   %esi
     69e:	e8 fc 2e 00 00       	call   359f <close>
     6a3:	58                   	pop    %eax
     6a4:	5a                   	pop    %edx
     6a5:	6a 00                	push   $0x0
     6a7:	68 1f 3c 00 00       	push   $0x3c1f
     6ac:	e8 06 2f 00 00       	call   35b7 <open>
     6b1:	89 c6                	mov    %eax,%esi
     6b3:	83 c4 10             	add    $0x10,%esp
     6b6:	85 c0                	test   %eax,%eax
     6b8:	0f 88 dc 00 00 00    	js     79a <writetest1+0x166>
     6be:	31 db                	xor    %ebx,%ebx
     6c0:	eb 17                	jmp    6d9 <writetest1+0xa5>
     6c2:	66 90                	xchg   %ax,%ax
     6c4:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c9:	0f 85 99 00 00 00    	jne    768 <writetest1+0x134>
     6cf:	a1 00 79 00 00       	mov    0x7900,%eax
     6d4:	39 d8                	cmp    %ebx,%eax
     6d6:	75 79                	jne    751 <writetest1+0x11d>
     6d8:	43                   	inc    %ebx
     6d9:	50                   	push   %eax
     6da:	68 00 02 00 00       	push   $0x200
     6df:	68 00 79 00 00       	push   $0x7900
     6e4:	56                   	push   %esi
     6e5:	e8 a5 2e 00 00       	call   358f <read>
     6ea:	83 c4 10             	add    $0x10,%esp
     6ed:	85 c0                	test   %eax,%eax
     6ef:	75 d3                	jne    6c4 <writetest1+0x90>
     6f1:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     6f7:	0f 84 82 00 00 00    	je     77f <writetest1+0x14b>
     6fd:	83 ec 0c             	sub    $0xc,%esp
     700:	56                   	push   %esi
     701:	e8 99 2e 00 00       	call   359f <close>
     706:	c7 04 24 1f 3c 00 00 	movl   $0x3c1f,(%esp)
     70d:	e8 b5 2e 00 00       	call   35c7 <unlink>
     712:	83 c4 10             	add    $0x10,%esp
     715:	85 c0                	test   %eax,%eax
     717:	0f 88 ab 00 00 00    	js     7c8 <writetest1+0x194>
     71d:	83 ec 08             	sub    $0x8,%esp
     720:	68 46 3c 00 00       	push   $0x3c46
     725:	ff 35 b0 51 00 00    	pushl  0x51b0
     72b:	e8 7c 2f 00 00       	call   36ac <printf>
     730:	83 c4 10             	add    $0x10,%esp
     733:	8d 65 f8             	lea    -0x8(%ebp),%esp
     736:	5b                   	pop    %ebx
     737:	5e                   	pop    %esi
     738:	5d                   	pop    %ebp
     739:	c3                   	ret    
     73a:	51                   	push   %ecx
     73b:	53                   	push   %ebx
     73c:	68 cf 3b 00 00       	push   $0x3bcf
     741:	ff 35 b0 51 00 00    	pushl  0x51b0
     747:	e8 60 2f 00 00       	call   36ac <printf>
     74c:	e8 26 2e 00 00       	call   3577 <exit>
     751:	50                   	push   %eax
     752:	53                   	push   %ebx
     753:	68 20 4a 00 00       	push   $0x4a20
     758:	ff 35 b0 51 00 00    	pushl  0x51b0
     75e:	e8 49 2f 00 00       	call   36ac <printf>
     763:	e8 0f 2e 00 00       	call   3577 <exit>
     768:	52                   	push   %edx
     769:	50                   	push   %eax
     76a:	68 23 3c 00 00       	push   $0x3c23
     76f:	ff 35 b0 51 00 00    	pushl  0x51b0
     775:	e8 32 2f 00 00       	call   36ac <printf>
     77a:	e8 f8 2d 00 00       	call   3577 <exit>
     77f:	51                   	push   %ecx
     780:	68 8b 00 00 00       	push   $0x8b
     785:	68 06 3c 00 00       	push   $0x3c06
     78a:	ff 35 b0 51 00 00    	pushl  0x51b0
     790:	e8 17 2f 00 00       	call   36ac <printf>
     795:	e8 dd 2d 00 00       	call   3577 <exit>
     79a:	50                   	push   %eax
     79b:	50                   	push   %eax
     79c:	68 ed 3b 00 00       	push   $0x3bed
     7a1:	ff 35 b0 51 00 00    	pushl  0x51b0
     7a7:	e8 00 2f 00 00       	call   36ac <printf>
     7ac:	e8 c6 2d 00 00       	call   3577 <exit>
     7b1:	50                   	push   %eax
     7b2:	50                   	push   %eax
     7b3:	68 b5 3b 00 00       	push   $0x3bb5
     7b8:	ff 35 b0 51 00 00    	pushl  0x51b0
     7be:	e8 e9 2e 00 00       	call   36ac <printf>
     7c3:	e8 af 2d 00 00       	call   3577 <exit>
     7c8:	50                   	push   %eax
     7c9:	50                   	push   %eax
     7ca:	68 33 3c 00 00       	push   $0x3c33
     7cf:	ff 35 b0 51 00 00    	pushl  0x51b0
     7d5:	e8 d2 2e 00 00       	call   36ac <printf>
     7da:	e8 98 2d 00 00       	call   3577 <exit>
     7df:	90                   	nop

000007e0 <createtest>:
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	53                   	push   %ebx
     7e4:	83 ec 0c             	sub    $0xc,%esp
     7e7:	68 40 4a 00 00       	push   $0x4a40
     7ec:	ff 35 b0 51 00 00    	pushl  0x51b0
     7f2:	e8 b5 2e 00 00       	call   36ac <printf>
     7f7:	c6 05 f0 78 00 00 61 	movb   $0x61,0x78f0
     7fe:	c6 05 f2 78 00 00 00 	movb   $0x0,0x78f2
     805:	83 c4 10             	add    $0x10,%esp
     808:	b3 30                	mov    $0x30,%bl
     80a:	66 90                	xchg   %ax,%ax
     80c:	88 1d f1 78 00 00    	mov    %bl,0x78f1
     812:	83 ec 08             	sub    $0x8,%esp
     815:	68 02 02 00 00       	push   $0x202
     81a:	68 f0 78 00 00       	push   $0x78f0
     81f:	e8 93 2d 00 00       	call   35b7 <open>
     824:	89 04 24             	mov    %eax,(%esp)
     827:	e8 73 2d 00 00       	call   359f <close>
     82c:	43                   	inc    %ebx
     82d:	83 c4 10             	add    $0x10,%esp
     830:	80 fb 64             	cmp    $0x64,%bl
     833:	75 d7                	jne    80c <createtest+0x2c>
     835:	c6 05 f0 78 00 00 61 	movb   $0x61,0x78f0
     83c:	c6 05 f2 78 00 00 00 	movb   $0x0,0x78f2
     843:	b3 30                	mov    $0x30,%bl
     845:	8d 76 00             	lea    0x0(%esi),%esi
     848:	88 1d f1 78 00 00    	mov    %bl,0x78f1
     84e:	83 ec 0c             	sub    $0xc,%esp
     851:	68 f0 78 00 00       	push   $0x78f0
     856:	e8 6c 2d 00 00       	call   35c7 <unlink>
     85b:	43                   	inc    %ebx
     85c:	83 c4 10             	add    $0x10,%esp
     85f:	80 fb 64             	cmp    $0x64,%bl
     862:	75 e4                	jne    848 <createtest+0x68>
     864:	83 ec 08             	sub    $0x8,%esp
     867:	68 68 4a 00 00       	push   $0x4a68
     86c:	ff 35 b0 51 00 00    	pushl  0x51b0
     872:	e8 35 2e 00 00       	call   36ac <printf>
     877:	83 c4 10             	add    $0x10,%esp
     87a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     87d:	c9                   	leave  
     87e:	c3                   	ret    
     87f:	90                   	nop

00000880 <dirtest>:
     880:	55                   	push   %ebp
     881:	89 e5                	mov    %esp,%ebp
     883:	83 ec 10             	sub    $0x10,%esp
     886:	68 54 3c 00 00       	push   $0x3c54
     88b:	ff 35 b0 51 00 00    	pushl  0x51b0
     891:	e8 16 2e 00 00       	call   36ac <printf>
     896:	c7 04 24 60 3c 00 00 	movl   $0x3c60,(%esp)
     89d:	e8 3d 2d 00 00       	call   35df <mkdir>
     8a2:	83 c4 10             	add    $0x10,%esp
     8a5:	85 c0                	test   %eax,%eax
     8a7:	78 58                	js     901 <dirtest+0x81>
     8a9:	83 ec 0c             	sub    $0xc,%esp
     8ac:	68 60 3c 00 00       	push   $0x3c60
     8b1:	e8 31 2d 00 00       	call   35e7 <chdir>
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	85 c0                	test   %eax,%eax
     8bb:	0f 88 85 00 00 00    	js     946 <dirtest+0xc6>
     8c1:	83 ec 0c             	sub    $0xc,%esp
     8c4:	68 05 42 00 00       	push   $0x4205
     8c9:	e8 19 2d 00 00       	call   35e7 <chdir>
     8ce:	83 c4 10             	add    $0x10,%esp
     8d1:	85 c0                	test   %eax,%eax
     8d3:	78 5a                	js     92f <dirtest+0xaf>
     8d5:	83 ec 0c             	sub    $0xc,%esp
     8d8:	68 60 3c 00 00       	push   $0x3c60
     8dd:	e8 e5 2c 00 00       	call   35c7 <unlink>
     8e2:	83 c4 10             	add    $0x10,%esp
     8e5:	85 c0                	test   %eax,%eax
     8e7:	78 2f                	js     918 <dirtest+0x98>
     8e9:	83 ec 08             	sub    $0x8,%esp
     8ec:	68 9d 3c 00 00       	push   $0x3c9d
     8f1:	ff 35 b0 51 00 00    	pushl  0x51b0
     8f7:	e8 b0 2d 00 00       	call   36ac <printf>
     8fc:	83 c4 10             	add    $0x10,%esp
     8ff:	c9                   	leave  
     900:	c3                   	ret    
     901:	50                   	push   %eax
     902:	50                   	push   %eax
     903:	68 90 39 00 00       	push   $0x3990
     908:	ff 35 b0 51 00 00    	pushl  0x51b0
     90e:	e8 99 2d 00 00       	call   36ac <printf>
     913:	e8 5f 2c 00 00       	call   3577 <exit>
     918:	50                   	push   %eax
     919:	50                   	push   %eax
     91a:	68 89 3c 00 00       	push   $0x3c89
     91f:	ff 35 b0 51 00 00    	pushl  0x51b0
     925:	e8 82 2d 00 00       	call   36ac <printf>
     92a:	e8 48 2c 00 00       	call   3577 <exit>
     92f:	52                   	push   %edx
     930:	52                   	push   %edx
     931:	68 78 3c 00 00       	push   $0x3c78
     936:	ff 35 b0 51 00 00    	pushl  0x51b0
     93c:	e8 6b 2d 00 00       	call   36ac <printf>
     941:	e8 31 2c 00 00       	call   3577 <exit>
     946:	51                   	push   %ecx
     947:	51                   	push   %ecx
     948:	68 65 3c 00 00       	push   $0x3c65
     94d:	ff 35 b0 51 00 00    	pushl  0x51b0
     953:	e8 54 2d 00 00       	call   36ac <printf>
     958:	e8 1a 2c 00 00       	call   3577 <exit>
     95d:	8d 76 00             	lea    0x0(%esi),%esi

00000960 <exectest>:
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	83 ec 10             	sub    $0x10,%esp
     966:	68 ac 3c 00 00       	push   $0x3cac
     96b:	ff 35 b0 51 00 00    	pushl  0x51b0
     971:	e8 36 2d 00 00       	call   36ac <printf>
     976:	5a                   	pop    %edx
     977:	59                   	pop    %ecx
     978:	68 b4 51 00 00       	push   $0x51b4
     97d:	68 75 3a 00 00       	push   $0x3a75
     982:	e8 28 2c 00 00       	call   35af <exec>
     987:	83 c4 10             	add    $0x10,%esp
     98a:	85 c0                	test   %eax,%eax
     98c:	78 02                	js     990 <exectest+0x30>
     98e:	c9                   	leave  
     98f:	c3                   	ret    
     990:	50                   	push   %eax
     991:	50                   	push   %eax
     992:	68 b7 3c 00 00       	push   $0x3cb7
     997:	ff 35 b0 51 00 00    	pushl  0x51b0
     99d:	e8 0a 2d 00 00       	call   36ac <printf>
     9a2:	e8 d0 2b 00 00       	call   3577 <exit>
     9a7:	90                   	nop

000009a8 <pipe1>:
     9a8:	55                   	push   %ebp
     9a9:	89 e5                	mov    %esp,%ebp
     9ab:	57                   	push   %edi
     9ac:	56                   	push   %esi
     9ad:	53                   	push   %ebx
     9ae:	83 ec 28             	sub    $0x28,%esp
     9b1:	8d 45 e0             	lea    -0x20(%ebp),%eax
     9b4:	50                   	push   %eax
     9b5:	e8 cd 2b 00 00       	call   3587 <pipe>
     9ba:	83 c4 10             	add    $0x10,%esp
     9bd:	85 c0                	test   %eax,%eax
     9bf:	0f 85 35 01 00 00    	jne    afa <pipe1+0x152>
     9c5:	89 c6                	mov    %eax,%esi
     9c7:	e8 a3 2b 00 00       	call   356f <fork>
     9cc:	85 c0                	test   %eax,%eax
     9ce:	0f 84 8f 00 00 00    	je     a63 <pipe1+0xbb>
     9d4:	0f 8e 33 01 00 00    	jle    b0d <pipe1+0x165>
     9da:	83 ec 0c             	sub    $0xc,%esp
     9dd:	ff 75 e4             	pushl  -0x1c(%ebp)
     9e0:	e8 ba 2b 00 00       	call   359f <close>
     9e5:	83 c4 10             	add    $0x10,%esp
     9e8:	31 db                	xor    %ebx,%ebx
     9ea:	bf 01 00 00 00       	mov    $0x1,%edi
     9ef:	50                   	push   %eax
     9f0:	57                   	push   %edi
     9f1:	68 00 79 00 00       	push   $0x7900
     9f6:	ff 75 e0             	pushl  -0x20(%ebp)
     9f9:	e8 91 2b 00 00       	call   358f <read>
     9fe:	89 c1                	mov    %eax,%ecx
     a00:	83 c4 10             	add    $0x10,%esp
     a03:	85 c0                	test   %eax,%eax
     a05:	0f 8e ae 00 00 00    	jle    ab9 <pipe1+0x111>
     a0b:	89 f0                	mov    %esi,%eax
     a0d:	33 05 00 79 00 00    	xor    0x7900,%eax
     a13:	0f b6 c0             	movzbl %al,%eax
     a16:	85 c0                	test   %eax,%eax
     a18:	75 26                	jne    a40 <pipe1+0x98>
     a1a:	46                   	inc    %esi
     a1b:	eb 0b                	jmp    a28 <pipe1+0x80>
     a1d:	8d 76 00             	lea    0x0(%esi),%esi
     a20:	38 90 00 79 00 00    	cmp    %dl,0x7900(%eax)
     a26:	75 18                	jne    a40 <pipe1+0x98>
     a28:	8d 14 06             	lea    (%esi,%eax,1),%edx
     a2b:	40                   	inc    %eax
     a2c:	39 c1                	cmp    %eax,%ecx
     a2e:	75 f0                	jne    a20 <pipe1+0x78>
     a30:	01 cb                	add    %ecx,%ebx
     a32:	01 ff                	add    %edi,%edi
     a34:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     a3a:	7f 1e                	jg     a5a <pipe1+0xb2>
     a3c:	89 d6                	mov    %edx,%esi
     a3e:	eb af                	jmp    9ef <pipe1+0x47>
     a40:	83 ec 08             	sub    $0x8,%esp
     a43:	68 e6 3c 00 00       	push   $0x3ce6
     a48:	6a 01                	push   $0x1
     a4a:	e8 5d 2c 00 00       	call   36ac <printf>
     a4f:	83 c4 10             	add    $0x10,%esp
     a52:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a55:	5b                   	pop    %ebx
     a56:	5e                   	pop    %esi
     a57:	5f                   	pop    %edi
     a58:	5d                   	pop    %ebp
     a59:	c3                   	ret    
     a5a:	bf 00 20 00 00       	mov    $0x2000,%edi
     a5f:	89 d6                	mov    %edx,%esi
     a61:	eb 8c                	jmp    9ef <pipe1+0x47>
     a63:	83 ec 0c             	sub    $0xc,%esp
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 31 2b 00 00       	call   359f <close>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	31 db                	xor    %ebx,%ebx
     a73:	90                   	nop
     a74:	31 c0                	xor    %eax,%eax
     a76:	66 90                	xchg   %ax,%ax
     a78:	8d 14 03             	lea    (%ebx,%eax,1),%edx
     a7b:	88 90 00 79 00 00    	mov    %dl,0x7900(%eax)
     a81:	40                   	inc    %eax
     a82:	3d 09 04 00 00       	cmp    $0x409,%eax
     a87:	75 ef                	jne    a78 <pipe1+0xd0>
     a89:	81 c3 09 04 00 00    	add    $0x409,%ebx
     a8f:	50                   	push   %eax
     a90:	68 09 04 00 00       	push   $0x409
     a95:	68 00 79 00 00       	push   $0x7900
     a9a:	ff 75 e4             	pushl  -0x1c(%ebp)
     a9d:	e8 f5 2a 00 00       	call   3597 <write>
     aa2:	83 c4 10             	add    $0x10,%esp
     aa5:	3d 09 04 00 00       	cmp    $0x409,%eax
     aaa:	75 74                	jne    b20 <pipe1+0x178>
     aac:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     ab2:	75 c0                	jne    a74 <pipe1+0xcc>
     ab4:	e8 be 2a 00 00       	call   3577 <exit>
     ab9:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     abf:	75 26                	jne    ae7 <pipe1+0x13f>
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
     ac7:	e8 d3 2a 00 00       	call   359f <close>
     acc:	e8 ae 2a 00 00       	call   357f <wait>
     ad1:	5a                   	pop    %edx
     ad2:	59                   	pop    %ecx
     ad3:	68 0b 3d 00 00       	push   $0x3d0b
     ad8:	6a 01                	push   $0x1
     ada:	e8 cd 2b 00 00       	call   36ac <printf>
     adf:	83 c4 10             	add    $0x10,%esp
     ae2:	e9 6b ff ff ff       	jmp    a52 <pipe1+0xaa>
     ae7:	56                   	push   %esi
     ae8:	53                   	push   %ebx
     ae9:	68 f4 3c 00 00       	push   $0x3cf4
     aee:	6a 01                	push   $0x1
     af0:	e8 b7 2b 00 00       	call   36ac <printf>
     af5:	e8 7d 2a 00 00       	call   3577 <exit>
     afa:	50                   	push   %eax
     afb:	50                   	push   %eax
     afc:	68 c9 3c 00 00       	push   $0x3cc9
     b01:	6a 01                	push   $0x1
     b03:	e8 a4 2b 00 00       	call   36ac <printf>
     b08:	e8 6a 2a 00 00       	call   3577 <exit>
     b0d:	50                   	push   %eax
     b0e:	50                   	push   %eax
     b0f:	68 15 3d 00 00       	push   $0x3d15
     b14:	6a 01                	push   $0x1
     b16:	e8 91 2b 00 00       	call   36ac <printf>
     b1b:	e8 57 2a 00 00       	call   3577 <exit>
     b20:	50                   	push   %eax
     b21:	50                   	push   %eax
     b22:	68 d8 3c 00 00       	push   $0x3cd8
     b27:	6a 01                	push   $0x1
     b29:	e8 7e 2b 00 00       	call   36ac <printf>
     b2e:	e8 44 2a 00 00       	call   3577 <exit>
     b33:	90                   	nop

00000b34 <preempt>:
     b34:	55                   	push   %ebp
     b35:	89 e5                	mov    %esp,%ebp
     b37:	57                   	push   %edi
     b38:	56                   	push   %esi
     b39:	53                   	push   %ebx
     b3a:	83 ec 24             	sub    $0x24,%esp
     b3d:	68 24 3d 00 00       	push   $0x3d24
     b42:	6a 01                	push   $0x1
     b44:	e8 63 2b 00 00       	call   36ac <printf>
     b49:	e8 21 2a 00 00       	call   356f <fork>
     b4e:	83 c4 10             	add    $0x10,%esp
     b51:	85 c0                	test   %eax,%eax
     b53:	75 03                	jne    b58 <preempt+0x24>
     b55:	eb fe                	jmp    b55 <preempt+0x21>
     b57:	90                   	nop
     b58:	89 c3                	mov    %eax,%ebx
     b5a:	e8 10 2a 00 00       	call   356f <fork>
     b5f:	89 c6                	mov    %eax,%esi
     b61:	85 c0                	test   %eax,%eax
     b63:	75 03                	jne    b68 <preempt+0x34>
     b65:	eb fe                	jmp    b65 <preempt+0x31>
     b67:	90                   	nop
     b68:	83 ec 0c             	sub    $0xc,%esp
     b6b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b6e:	50                   	push   %eax
     b6f:	e8 13 2a 00 00       	call   3587 <pipe>
     b74:	e8 f6 29 00 00       	call   356f <fork>
     b79:	89 c7                	mov    %eax,%edi
     b7b:	83 c4 10             	add    $0x10,%esp
     b7e:	85 c0                	test   %eax,%eax
     b80:	75 3a                	jne    bbc <preempt+0x88>
     b82:	83 ec 0c             	sub    $0xc,%esp
     b85:	ff 75 e0             	pushl  -0x20(%ebp)
     b88:	e8 12 2a 00 00       	call   359f <close>
     b8d:	83 c4 0c             	add    $0xc,%esp
     b90:	6a 01                	push   $0x1
     b92:	68 e9 42 00 00       	push   $0x42e9
     b97:	ff 75 e4             	pushl  -0x1c(%ebp)
     b9a:	e8 f8 29 00 00       	call   3597 <write>
     b9f:	83 c4 10             	add    $0x10,%esp
     ba2:	48                   	dec    %eax
     ba3:	0f 85 b4 00 00 00    	jne    c5d <preempt+0x129>
     ba9:	83 ec 0c             	sub    $0xc,%esp
     bac:	ff 75 e4             	pushl  -0x1c(%ebp)
     baf:	e8 eb 29 00 00       	call   359f <close>
     bb4:	83 c4 10             	add    $0x10,%esp
     bb7:	eb fe                	jmp    bb7 <preempt+0x83>
     bb9:	8d 76 00             	lea    0x0(%esi),%esi
     bbc:	83 ec 0c             	sub    $0xc,%esp
     bbf:	ff 75 e4             	pushl  -0x1c(%ebp)
     bc2:	e8 d8 29 00 00       	call   359f <close>
     bc7:	83 c4 0c             	add    $0xc,%esp
     bca:	68 00 20 00 00       	push   $0x2000
     bcf:	68 00 79 00 00       	push   $0x7900
     bd4:	ff 75 e0             	pushl  -0x20(%ebp)
     bd7:	e8 b3 29 00 00       	call   358f <read>
     bdc:	83 c4 10             	add    $0x10,%esp
     bdf:	48                   	dec    %eax
     be0:	75 67                	jne    c49 <preempt+0x115>
     be2:	83 ec 0c             	sub    $0xc,%esp
     be5:	ff 75 e0             	pushl  -0x20(%ebp)
     be8:	e8 b2 29 00 00       	call   359f <close>
     bed:	58                   	pop    %eax
     bee:	5a                   	pop    %edx
     bef:	68 55 3d 00 00       	push   $0x3d55
     bf4:	6a 01                	push   $0x1
     bf6:	e8 b1 2a 00 00       	call   36ac <printf>
     bfb:	89 1c 24             	mov    %ebx,(%esp)
     bfe:	e8 a4 29 00 00       	call   35a7 <kill>
     c03:	89 34 24             	mov    %esi,(%esp)
     c06:	e8 9c 29 00 00       	call   35a7 <kill>
     c0b:	89 3c 24             	mov    %edi,(%esp)
     c0e:	e8 94 29 00 00       	call   35a7 <kill>
     c13:	59                   	pop    %ecx
     c14:	5b                   	pop    %ebx
     c15:	68 5e 3d 00 00       	push   $0x3d5e
     c1a:	6a 01                	push   $0x1
     c1c:	e8 8b 2a 00 00       	call   36ac <printf>
     c21:	e8 59 29 00 00       	call   357f <wait>
     c26:	e8 54 29 00 00       	call   357f <wait>
     c2b:	e8 4f 29 00 00       	call   357f <wait>
     c30:	5e                   	pop    %esi
     c31:	5f                   	pop    %edi
     c32:	68 67 3d 00 00       	push   $0x3d67
     c37:	6a 01                	push   $0x1
     c39:	e8 6e 2a 00 00       	call   36ac <printf>
     c3e:	83 c4 10             	add    $0x10,%esp
     c41:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c44:	5b                   	pop    %ebx
     c45:	5e                   	pop    %esi
     c46:	5f                   	pop    %edi
     c47:	5d                   	pop    %ebp
     c48:	c3                   	ret    
     c49:	83 ec 08             	sub    $0x8,%esp
     c4c:	68 42 3d 00 00       	push   $0x3d42
     c51:	6a 01                	push   $0x1
     c53:	e8 54 2a 00 00       	call   36ac <printf>
     c58:	83 c4 10             	add    $0x10,%esp
     c5b:	eb e4                	jmp    c41 <preempt+0x10d>
     c5d:	83 ec 08             	sub    $0x8,%esp
     c60:	68 2e 3d 00 00       	push   $0x3d2e
     c65:	6a 01                	push   $0x1
     c67:	e8 40 2a 00 00       	call   36ac <printf>
     c6c:	83 c4 10             	add    $0x10,%esp
     c6f:	e9 35 ff ff ff       	jmp    ba9 <preempt+0x75>

00000c74 <exitwait>:
     c74:	55                   	push   %ebp
     c75:	89 e5                	mov    %esp,%ebp
     c77:	56                   	push   %esi
     c78:	53                   	push   %ebx
     c79:	be 64 00 00 00       	mov    $0x64,%esi
     c7e:	eb 0e                	jmp    c8e <exitwait+0x1a>
     c80:	74 64                	je     ce6 <exitwait+0x72>
     c82:	e8 f8 28 00 00       	call   357f <wait>
     c87:	39 d8                	cmp    %ebx,%eax
     c89:	75 29                	jne    cb4 <exitwait+0x40>
     c8b:	4e                   	dec    %esi
     c8c:	74 3f                	je     ccd <exitwait+0x59>
     c8e:	e8 dc 28 00 00       	call   356f <fork>
     c93:	89 c3                	mov    %eax,%ebx
     c95:	85 c0                	test   %eax,%eax
     c97:	79 e7                	jns    c80 <exitwait+0xc>
     c99:	83 ec 08             	sub    $0x8,%esp
     c9c:	68 d1 48 00 00       	push   $0x48d1
     ca1:	6a 01                	push   $0x1
     ca3:	e8 04 2a 00 00       	call   36ac <printf>
     ca8:	83 c4 10             	add    $0x10,%esp
     cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cae:	5b                   	pop    %ebx
     caf:	5e                   	pop    %esi
     cb0:	5d                   	pop    %ebp
     cb1:	c3                   	ret    
     cb2:	66 90                	xchg   %ax,%ax
     cb4:	83 ec 08             	sub    $0x8,%esp
     cb7:	68 73 3d 00 00       	push   $0x3d73
     cbc:	6a 01                	push   $0x1
     cbe:	e8 e9 29 00 00       	call   36ac <printf>
     cc3:	83 c4 10             	add    $0x10,%esp
     cc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     cc9:	5b                   	pop    %ebx
     cca:	5e                   	pop    %esi
     ccb:	5d                   	pop    %ebp
     ccc:	c3                   	ret    
     ccd:	83 ec 08             	sub    $0x8,%esp
     cd0:	68 83 3d 00 00       	push   $0x3d83
     cd5:	6a 01                	push   $0x1
     cd7:	e8 d0 29 00 00       	call   36ac <printf>
     cdc:	83 c4 10             	add    $0x10,%esp
     cdf:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ce2:	5b                   	pop    %ebx
     ce3:	5e                   	pop    %esi
     ce4:	5d                   	pop    %ebp
     ce5:	c3                   	ret    
     ce6:	e8 8c 28 00 00       	call   3577 <exit>
     ceb:	90                   	nop

00000cec <mem>:
     cec:	55                   	push   %ebp
     ced:	89 e5                	mov    %esp,%ebp
     cef:	56                   	push   %esi
     cf0:	53                   	push   %ebx
     cf1:	83 ec 08             	sub    $0x8,%esp
     cf4:	68 90 3d 00 00       	push   $0x3d90
     cf9:	6a 01                	push   $0x1
     cfb:	e8 ac 29 00 00       	call   36ac <printf>
     d00:	e8 f2 28 00 00       	call   35f7 <getpid>
     d05:	89 c3                	mov    %eax,%ebx
     d07:	e8 63 28 00 00       	call   356f <fork>
     d0c:	83 c4 10             	add    $0x10,%esp
     d0f:	85 c0                	test   %eax,%eax
     d11:	0f 85 81 00 00 00    	jne    d98 <mem+0xac>
     d17:	31 f6                	xor    %esi,%esi
     d19:	eb 05                	jmp    d20 <mem+0x34>
     d1b:	90                   	nop
     d1c:	89 30                	mov    %esi,(%eax)
     d1e:	89 c6                	mov    %eax,%esi
     d20:	83 ec 0c             	sub    $0xc,%esp
     d23:	68 11 27 00 00       	push   $0x2711
     d28:	e8 7f 2b 00 00       	call   38ac <malloc>
     d2d:	83 c4 10             	add    $0x10,%esp
     d30:	85 c0                	test   %eax,%eax
     d32:	75 e8                	jne    d1c <mem+0x30>
     d34:	85 f6                	test   %esi,%esi
     d36:	74 14                	je     d4c <mem+0x60>
     d38:	89 f0                	mov    %esi,%eax
     d3a:	8b 36                	mov    (%esi),%esi
     d3c:	83 ec 0c             	sub    $0xc,%esp
     d3f:	50                   	push   %eax
     d40:	e8 df 2a 00 00       	call   3824 <free>
     d45:	83 c4 10             	add    $0x10,%esp
     d48:	85 f6                	test   %esi,%esi
     d4a:	75 ec                	jne    d38 <mem+0x4c>
     d4c:	83 ec 0c             	sub    $0xc,%esp
     d4f:	68 00 50 00 00       	push   $0x5000
     d54:	e8 53 2b 00 00       	call   38ac <malloc>
     d59:	83 c4 10             	add    $0x10,%esp
     d5c:	85 c0                	test   %eax,%eax
     d5e:	74 1c                	je     d7c <mem+0x90>
     d60:	83 ec 0c             	sub    $0xc,%esp
     d63:	50                   	push   %eax
     d64:	e8 bb 2a 00 00       	call   3824 <free>
     d69:	58                   	pop    %eax
     d6a:	5a                   	pop    %edx
     d6b:	68 b4 3d 00 00       	push   $0x3db4
     d70:	6a 01                	push   $0x1
     d72:	e8 35 29 00 00       	call   36ac <printf>
     d77:	e8 fb 27 00 00       	call   3577 <exit>
     d7c:	83 ec 08             	sub    $0x8,%esp
     d7f:	68 9a 3d 00 00       	push   $0x3d9a
     d84:	6a 01                	push   $0x1
     d86:	e8 21 29 00 00       	call   36ac <printf>
     d8b:	89 1c 24             	mov    %ebx,(%esp)
     d8e:	e8 14 28 00 00       	call   35a7 <kill>
     d93:	e8 df 27 00 00       	call   3577 <exit>
     d98:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d9b:	5b                   	pop    %ebx
     d9c:	5e                   	pop    %esi
     d9d:	5d                   	pop    %ebp
     d9e:	e9 dc 27 00 00       	jmp    357f <wait>
     da3:	90                   	nop

00000da4 <sharedfd>:
     da4:	55                   	push   %ebp
     da5:	89 e5                	mov    %esp,%ebp
     da7:	57                   	push   %edi
     da8:	56                   	push   %esi
     da9:	53                   	push   %ebx
     daa:	83 ec 34             	sub    $0x34,%esp
     dad:	68 bc 3d 00 00       	push   $0x3dbc
     db2:	6a 01                	push   $0x1
     db4:	e8 f3 28 00 00       	call   36ac <printf>
     db9:	c7 04 24 cb 3d 00 00 	movl   $0x3dcb,(%esp)
     dc0:	e8 02 28 00 00       	call   35c7 <unlink>
     dc5:	59                   	pop    %ecx
     dc6:	5b                   	pop    %ebx
     dc7:	68 02 02 00 00       	push   $0x202
     dcc:	68 cb 3d 00 00       	push   $0x3dcb
     dd1:	e8 e1 27 00 00       	call   35b7 <open>
     dd6:	83 c4 10             	add    $0x10,%esp
     dd9:	85 c0                	test   %eax,%eax
     ddb:	0f 88 18 01 00 00    	js     ef9 <sharedfd+0x155>
     de1:	89 c7                	mov    %eax,%edi
     de3:	e8 87 27 00 00       	call   356f <fork>
     de8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     deb:	83 f8 01             	cmp    $0x1,%eax
     dee:	19 c0                	sbb    %eax,%eax
     df0:	83 e0 f3             	and    $0xfffffff3,%eax
     df3:	83 c0 70             	add    $0x70,%eax
     df6:	52                   	push   %edx
     df7:	6a 0a                	push   $0xa
     df9:	50                   	push   %eax
     dfa:	8d 75 de             	lea    -0x22(%ebp),%esi
     dfd:	56                   	push   %esi
     dfe:	e8 3d 26 00 00       	call   3440 <memset>
     e03:	83 c4 10             	add    $0x10,%esp
     e06:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     e0b:	eb 06                	jmp    e13 <sharedfd+0x6f>
     e0d:	8d 76 00             	lea    0x0(%esi),%esi
     e10:	4b                   	dec    %ebx
     e11:	74 24                	je     e37 <sharedfd+0x93>
     e13:	50                   	push   %eax
     e14:	6a 0a                	push   $0xa
     e16:	56                   	push   %esi
     e17:	57                   	push   %edi
     e18:	e8 7a 27 00 00       	call   3597 <write>
     e1d:	83 c4 10             	add    $0x10,%esp
     e20:	83 f8 0a             	cmp    $0xa,%eax
     e23:	74 eb                	je     e10 <sharedfd+0x6c>
     e25:	83 ec 08             	sub    $0x8,%esp
     e28:	68 bc 4a 00 00       	push   $0x4abc
     e2d:	6a 01                	push   $0x1
     e2f:	e8 78 28 00 00       	call   36ac <printf>
     e34:	83 c4 10             	add    $0x10,%esp
     e37:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
     e3a:	85 db                	test   %ebx,%ebx
     e3c:	0f 84 eb 00 00 00    	je     f2d <sharedfd+0x189>
     e42:	e8 38 27 00 00       	call   357f <wait>
     e47:	83 ec 0c             	sub    $0xc,%esp
     e4a:	57                   	push   %edi
     e4b:	e8 4f 27 00 00       	call   359f <close>
     e50:	5a                   	pop    %edx
     e51:	59                   	pop    %ecx
     e52:	6a 00                	push   $0x0
     e54:	68 cb 3d 00 00       	push   $0x3dcb
     e59:	e8 59 27 00 00       	call   35b7 <open>
     e5e:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e61:	83 c4 10             	add    $0x10,%esp
     e64:	85 c0                	test   %eax,%eax
     e66:	0f 88 a7 00 00 00    	js     f13 <sharedfd+0x16f>
     e6c:	31 ff                	xor    %edi,%edi
     e6e:	8d 5d e8             	lea    -0x18(%ebp),%ebx
     e71:	89 7d d4             	mov    %edi,-0x2c(%ebp)
     e74:	50                   	push   %eax
     e75:	6a 0a                	push   $0xa
     e77:	56                   	push   %esi
     e78:	ff 75 d0             	pushl  -0x30(%ebp)
     e7b:	e8 0f 27 00 00       	call   358f <read>
     e80:	83 c4 10             	add    $0x10,%esp
     e83:	85 c0                	test   %eax,%eax
     e85:	7e 25                	jle    eac <sharedfd+0x108>
     e87:	89 f1                	mov    %esi,%ecx
     e89:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     e8c:	eb 0c                	jmp    e9a <sharedfd+0xf6>
     e8e:	66 90                	xchg   %ax,%ax
     e90:	3c 70                	cmp    $0x70,%al
     e92:	75 01                	jne    e95 <sharedfd+0xf1>
     e94:	47                   	inc    %edi
     e95:	41                   	inc    %ecx
     e96:	39 d9                	cmp    %ebx,%ecx
     e98:	74 0c                	je     ea6 <sharedfd+0x102>
     e9a:	8a 01                	mov    (%ecx),%al
     e9c:	3c 63                	cmp    $0x63,%al
     e9e:	75 f0                	jne    e90 <sharedfd+0xec>
     ea0:	42                   	inc    %edx
     ea1:	41                   	inc    %ecx
     ea2:	39 d9                	cmp    %ebx,%ecx
     ea4:	75 f4                	jne    e9a <sharedfd+0xf6>
     ea6:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     ea9:	eb c9                	jmp    e74 <sharedfd+0xd0>
     eab:	90                   	nop
     eac:	89 7d cc             	mov    %edi,-0x34(%ebp)
     eaf:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     eb2:	83 ec 0c             	sub    $0xc,%esp
     eb5:	ff 75 d0             	pushl  -0x30(%ebp)
     eb8:	e8 e2 26 00 00       	call   359f <close>
     ebd:	c7 04 24 cb 3d 00 00 	movl   $0x3dcb,(%esp)
     ec4:	e8 fe 26 00 00       	call   35c7 <unlink>
     ec9:	83 c4 10             	add    $0x10,%esp
     ecc:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     ed2:	8b 55 cc             	mov    -0x34(%ebp),%edx
     ed5:	75 5b                	jne    f32 <sharedfd+0x18e>
     ed7:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     edd:	75 53                	jne    f32 <sharedfd+0x18e>
     edf:	83 ec 08             	sub    $0x8,%esp
     ee2:	68 d4 3d 00 00       	push   $0x3dd4
     ee7:	6a 01                	push   $0x1
     ee9:	e8 be 27 00 00       	call   36ac <printf>
     eee:	83 c4 10             	add    $0x10,%esp
     ef1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ef4:	5b                   	pop    %ebx
     ef5:	5e                   	pop    %esi
     ef6:	5f                   	pop    %edi
     ef7:	5d                   	pop    %ebp
     ef8:	c3                   	ret    
     ef9:	83 ec 08             	sub    $0x8,%esp
     efc:	68 90 4a 00 00       	push   $0x4a90
     f01:	6a 01                	push   $0x1
     f03:	e8 a4 27 00 00       	call   36ac <printf>
     f08:	83 c4 10             	add    $0x10,%esp
     f0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f0e:	5b                   	pop    %ebx
     f0f:	5e                   	pop    %esi
     f10:	5f                   	pop    %edi
     f11:	5d                   	pop    %ebp
     f12:	c3                   	ret    
     f13:	83 ec 08             	sub    $0x8,%esp
     f16:	68 dc 4a 00 00       	push   $0x4adc
     f1b:	6a 01                	push   $0x1
     f1d:	e8 8a 27 00 00       	call   36ac <printf>
     f22:	83 c4 10             	add    $0x10,%esp
     f25:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f28:	5b                   	pop    %ebx
     f29:	5e                   	pop    %esi
     f2a:	5f                   	pop    %edi
     f2b:	5d                   	pop    %ebp
     f2c:	c3                   	ret    
     f2d:	e8 45 26 00 00       	call   3577 <exit>
     f32:	52                   	push   %edx
     f33:	57                   	push   %edi
     f34:	68 e1 3d 00 00       	push   $0x3de1
     f39:	6a 01                	push   $0x1
     f3b:	e8 6c 27 00 00       	call   36ac <printf>
     f40:	e8 32 26 00 00       	call   3577 <exit>
     f45:	8d 76 00             	lea    0x0(%esi),%esi

00000f48 <fourfiles>:
     f48:	55                   	push   %ebp
     f49:	89 e5                	mov    %esp,%ebp
     f4b:	57                   	push   %edi
     f4c:	56                   	push   %esi
     f4d:	53                   	push   %ebx
     f4e:	83 ec 34             	sub    $0x34,%esp
     f51:	be 28 51 00 00       	mov    $0x5128,%esi
     f56:	b9 04 00 00 00       	mov    $0x4,%ecx
     f5b:	8d 7d d8             	lea    -0x28(%ebp),%edi
     f5e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
     f60:	68 f6 3d 00 00       	push   $0x3df6
     f65:	6a 01                	push   $0x1
     f67:	e8 40 27 00 00       	call   36ac <printf>
     f6c:	83 c4 10             	add    $0x10,%esp
     f6f:	31 db                	xor    %ebx,%ebx
     f71:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
     f75:	83 ec 0c             	sub    $0xc,%esp
     f78:	56                   	push   %esi
     f79:	e8 49 26 00 00       	call   35c7 <unlink>
     f7e:	e8 ec 25 00 00       	call   356f <fork>
     f83:	83 c4 10             	add    $0x10,%esp
     f86:	85 c0                	test   %eax,%eax
     f88:	0f 88 4a 01 00 00    	js     10d8 <fourfiles+0x190>
     f8e:	0f 84 d9 00 00 00    	je     106d <fourfiles+0x125>
     f94:	43                   	inc    %ebx
     f95:	83 fb 04             	cmp    $0x4,%ebx
     f98:	75 d7                	jne    f71 <fourfiles+0x29>
     f9a:	e8 e0 25 00 00       	call   357f <wait>
     f9f:	e8 db 25 00 00       	call   357f <wait>
     fa4:	e8 d6 25 00 00       	call   357f <wait>
     fa9:	e8 d1 25 00 00       	call   357f <wait>
     fae:	31 f6                	xor    %esi,%esi
     fb0:	8b 5c b5 d8          	mov    -0x28(%ebp,%esi,4),%ebx
     fb4:	83 ec 08             	sub    $0x8,%esp
     fb7:	6a 00                	push   $0x0
     fb9:	53                   	push   %ebx
     fba:	e8 f8 25 00 00       	call   35b7 <open>
     fbf:	89 c7                	mov    %eax,%edi
     fc1:	83 c4 10             	add    $0x10,%esp
     fc4:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     fcb:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     fce:	66 90                	xchg   %ax,%ax
     fd0:	52                   	push   %edx
     fd1:	68 00 20 00 00       	push   $0x2000
     fd6:	68 00 79 00 00       	push   $0x7900
     fdb:	57                   	push   %edi
     fdc:	e8 ae 25 00 00       	call   358f <read>
     fe1:	89 c3                	mov    %eax,%ebx
     fe3:	83 c4 10             	add    $0x10,%esp
     fe6:	85 c0                	test   %eax,%eax
     fe8:	7e 1f                	jle    1009 <fourfiles+0xc1>
     fea:	31 c0                	xor    %eax,%eax
     fec:	0f be 88 00 79 00 00 	movsbl 0x7900(%eax),%ecx
     ff3:	83 fe 01             	cmp    $0x1,%esi
     ff6:	19 d2                	sbb    %edx,%edx
     ff8:	83 c2 31             	add    $0x31,%edx
     ffb:	39 d1                	cmp    %edx,%ecx
     ffd:	75 5a                	jne    1059 <fourfiles+0x111>
     fff:	40                   	inc    %eax
    1000:	39 c3                	cmp    %eax,%ebx
    1002:	75 e8                	jne    fec <fourfiles+0xa4>
    1004:	01 5d d4             	add    %ebx,-0x2c(%ebp)
    1007:	eb c7                	jmp    fd0 <fourfiles+0x88>
    1009:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    100c:	83 ec 0c             	sub    $0xc,%esp
    100f:	57                   	push   %edi
    1010:	e8 8a 25 00 00       	call   359f <close>
    1015:	83 c4 10             	add    $0x10,%esp
    1018:	81 7d d4 70 17 00 00 	cmpl   $0x1770,-0x2c(%ebp)
    101f:	0f 85 c7 00 00 00    	jne    10ec <fourfiles+0x1a4>
    1025:	83 ec 0c             	sub    $0xc,%esp
    1028:	53                   	push   %ebx
    1029:	e8 99 25 00 00       	call   35c7 <unlink>
    102e:	83 c4 10             	add    $0x10,%esp
    1031:	85 f6                	test   %esi,%esi
    1033:	75 0a                	jne    103f <fourfiles+0xf7>
    1035:	be 01 00 00 00       	mov    $0x1,%esi
    103a:	e9 71 ff ff ff       	jmp    fb0 <fourfiles+0x68>
    103f:	83 ec 08             	sub    $0x8,%esp
    1042:	68 34 3e 00 00       	push   $0x3e34
    1047:	6a 01                	push   $0x1
    1049:	e8 5e 26 00 00       	call   36ac <printf>
    104e:	83 c4 10             	add    $0x10,%esp
    1051:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1054:	5b                   	pop    %ebx
    1055:	5e                   	pop    %esi
    1056:	5f                   	pop    %edi
    1057:	5d                   	pop    %ebp
    1058:	c3                   	ret    
    1059:	83 ec 08             	sub    $0x8,%esp
    105c:	68 17 3e 00 00       	push   $0x3e17
    1061:	6a 01                	push   $0x1
    1063:	e8 44 26 00 00       	call   36ac <printf>
    1068:	e8 0a 25 00 00       	call   3577 <exit>
    106d:	83 ec 08             	sub    $0x8,%esp
    1070:	68 02 02 00 00       	push   $0x202
    1075:	56                   	push   %esi
    1076:	e8 3c 25 00 00       	call   35b7 <open>
    107b:	89 c6                	mov    %eax,%esi
    107d:	83 c4 10             	add    $0x10,%esp
    1080:	85 c0                	test   %eax,%eax
    1082:	78 3f                	js     10c3 <fourfiles+0x17b>
    1084:	50                   	push   %eax
    1085:	68 00 02 00 00       	push   $0x200
    108a:	83 c3 30             	add    $0x30,%ebx
    108d:	53                   	push   %ebx
    108e:	68 00 79 00 00       	push   $0x7900
    1093:	e8 a8 23 00 00       	call   3440 <memset>
    1098:	83 c4 10             	add    $0x10,%esp
    109b:	bb 0c 00 00 00       	mov    $0xc,%ebx
    10a0:	57                   	push   %edi
    10a1:	68 f4 01 00 00       	push   $0x1f4
    10a6:	68 00 79 00 00       	push   $0x7900
    10ab:	56                   	push   %esi
    10ac:	e8 e6 24 00 00       	call   3597 <write>
    10b1:	83 c4 10             	add    $0x10,%esp
    10b4:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    10b9:	75 46                	jne    1101 <fourfiles+0x1b9>
    10bb:	4b                   	dec    %ebx
    10bc:	75 e2                	jne    10a0 <fourfiles+0x158>
    10be:	e8 b4 24 00 00       	call   3577 <exit>
    10c3:	50                   	push   %eax
    10c4:	50                   	push   %eax
    10c5:	68 97 40 00 00       	push   $0x4097
    10ca:	6a 01                	push   $0x1
    10cc:	e8 db 25 00 00       	call   36ac <printf>
    10d1:	e8 a1 24 00 00       	call   3577 <exit>
    10d6:	66 90                	xchg   %ax,%ax
    10d8:	83 ec 08             	sub    $0x8,%esp
    10db:	68 d1 48 00 00       	push   $0x48d1
    10e0:	6a 01                	push   $0x1
    10e2:	e8 c5 25 00 00       	call   36ac <printf>
    10e7:	e8 8b 24 00 00       	call   3577 <exit>
    10ec:	50                   	push   %eax
    10ed:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f0:	68 23 3e 00 00       	push   $0x3e23
    10f5:	6a 01                	push   $0x1
    10f7:	e8 b0 25 00 00       	call   36ac <printf>
    10fc:	e8 76 24 00 00       	call   3577 <exit>
    1101:	51                   	push   %ecx
    1102:	50                   	push   %eax
    1103:	68 06 3e 00 00       	push   $0x3e06
    1108:	6a 01                	push   $0x1
    110a:	e8 9d 25 00 00       	call   36ac <printf>
    110f:	e8 63 24 00 00       	call   3577 <exit>

00001114 <createdelete>:
    1114:	55                   	push   %ebp
    1115:	89 e5                	mov    %esp,%ebp
    1117:	57                   	push   %edi
    1118:	56                   	push   %esi
    1119:	53                   	push   %ebx
    111a:	83 ec 44             	sub    $0x44,%esp
    111d:	68 48 3e 00 00       	push   $0x3e48
    1122:	6a 01                	push   $0x1
    1124:	e8 83 25 00 00       	call   36ac <printf>
    1129:	83 c4 10             	add    $0x10,%esp
    112c:	31 f6                	xor    %esi,%esi
    112e:	e8 3c 24 00 00       	call   356f <fork>
    1133:	89 c3                	mov    %eax,%ebx
    1135:	85 c0                	test   %eax,%eax
    1137:	0f 88 66 01 00 00    	js     12a3 <createdelete+0x18f>
    113d:	0f 84 cd 00 00 00    	je     1210 <createdelete+0xfc>
    1143:	46                   	inc    %esi
    1144:	83 fe 04             	cmp    $0x4,%esi
    1147:	75 e5                	jne    112e <createdelete+0x1a>
    1149:	e8 31 24 00 00       	call   357f <wait>
    114e:	e8 2c 24 00 00       	call   357f <wait>
    1153:	e8 27 24 00 00       	call   357f <wait>
    1158:	e8 22 24 00 00       	call   357f <wait>
    115d:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1161:	31 f6                	xor    %esi,%esi
    1163:	8d 7d c8             	lea    -0x38(%ebp),%edi
    1166:	66 90                	xchg   %ax,%ax
    1168:	8d 46 30             	lea    0x30(%esi),%eax
    116b:	88 45 c7             	mov    %al,-0x39(%ebp)
    116e:	b3 70                	mov    $0x70,%bl
    1170:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1173:	8a 45 c7             	mov    -0x39(%ebp),%al
    1176:	88 45 c9             	mov    %al,-0x37(%ebp)
    1179:	83 ec 08             	sub    $0x8,%esp
    117c:	6a 00                	push   $0x0
    117e:	57                   	push   %edi
    117f:	e8 33 24 00 00       	call   35b7 <open>
    1184:	83 c4 10             	add    $0x10,%esp
    1187:	85 f6                	test   %esi,%esi
    1189:	74 05                	je     1190 <createdelete+0x7c>
    118b:	83 fe 09             	cmp    $0x9,%esi
    118e:	7e 68                	jle    11f8 <createdelete+0xe4>
    1190:	85 c0                	test   %eax,%eax
    1192:	0f 88 f8 00 00 00    	js     1290 <createdelete+0x17c>
    1198:	83 ec 0c             	sub    $0xc,%esp
    119b:	50                   	push   %eax
    119c:	e8 fe 23 00 00       	call   359f <close>
    11a1:	83 c4 10             	add    $0x10,%esp
    11a4:	43                   	inc    %ebx
    11a5:	80 fb 74             	cmp    $0x74,%bl
    11a8:	75 c6                	jne    1170 <createdelete+0x5c>
    11aa:	46                   	inc    %esi
    11ab:	83 fe 14             	cmp    $0x14,%esi
    11ae:	75 b8                	jne    1168 <createdelete+0x54>
    11b0:	b3 70                	mov    $0x70,%bl
    11b2:	66 90                	xchg   %ax,%ax
    11b4:	8d 43 c0             	lea    -0x40(%ebx),%eax
    11b7:	88 45 c7             	mov    %al,-0x39(%ebp)
    11ba:	be 04 00 00 00       	mov    $0x4,%esi
    11bf:	88 5d c8             	mov    %bl,-0x38(%ebp)
    11c2:	8a 45 c7             	mov    -0x39(%ebp),%al
    11c5:	88 45 c9             	mov    %al,-0x37(%ebp)
    11c8:	83 ec 0c             	sub    $0xc,%esp
    11cb:	57                   	push   %edi
    11cc:	e8 f6 23 00 00       	call   35c7 <unlink>
    11d1:	83 c4 10             	add    $0x10,%esp
    11d4:	4e                   	dec    %esi
    11d5:	75 e8                	jne    11bf <createdelete+0xab>
    11d7:	43                   	inc    %ebx
    11d8:	80 fb 84             	cmp    $0x84,%bl
    11db:	75 d7                	jne    11b4 <createdelete+0xa0>
    11dd:	83 ec 08             	sub    $0x8,%esp
    11e0:	68 5b 3e 00 00       	push   $0x3e5b
    11e5:	6a 01                	push   $0x1
    11e7:	e8 c0 24 00 00       	call   36ac <printf>
    11ec:	83 c4 10             	add    $0x10,%esp
    11ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11f2:	5b                   	pop    %ebx
    11f3:	5e                   	pop    %esi
    11f4:	5f                   	pop    %edi
    11f5:	5d                   	pop    %ebp
    11f6:	c3                   	ret    
    11f7:	90                   	nop
    11f8:	85 c0                	test   %eax,%eax
    11fa:	78 a8                	js     11a4 <createdelete+0x90>
    11fc:	50                   	push   %eax
    11fd:	57                   	push   %edi
    11fe:	68 2c 4b 00 00       	push   $0x4b2c
    1203:	6a 01                	push   $0x1
    1205:	e8 a2 24 00 00       	call   36ac <printf>
    120a:	e8 68 23 00 00       	call   3577 <exit>
    120f:	90                   	nop
    1210:	8d 46 70             	lea    0x70(%esi),%eax
    1213:	88 45 c8             	mov    %al,-0x38(%ebp)
    1216:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    121a:	8d 7d c8             	lea    -0x38(%ebp),%edi
    121d:	8d 76 00             	lea    0x0(%esi),%esi
    1220:	8d 43 30             	lea    0x30(%ebx),%eax
    1223:	88 45 c9             	mov    %al,-0x37(%ebp)
    1226:	83 ec 08             	sub    $0x8,%esp
    1229:	68 02 02 00 00       	push   $0x202
    122e:	57                   	push   %edi
    122f:	e8 83 23 00 00       	call   35b7 <open>
    1234:	83 c4 10             	add    $0x10,%esp
    1237:	85 c0                	test   %eax,%eax
    1239:	78 7c                	js     12b7 <createdelete+0x1a3>
    123b:	83 ec 0c             	sub    $0xc,%esp
    123e:	50                   	push   %eax
    123f:	e8 5b 23 00 00       	call   359f <close>
    1244:	83 c4 10             	add    $0x10,%esp
    1247:	85 db                	test   %ebx,%ebx
    1249:	74 11                	je     125c <createdelete+0x148>
    124b:	f6 c3 01             	test   $0x1,%bl
    124e:	74 13                	je     1263 <createdelete+0x14f>
    1250:	43                   	inc    %ebx
    1251:	83 fb 14             	cmp    $0x14,%ebx
    1254:	75 ca                	jne    1220 <createdelete+0x10c>
    1256:	e8 1c 23 00 00       	call   3577 <exit>
    125b:	90                   	nop
    125c:	bb 01 00 00 00       	mov    $0x1,%ebx
    1261:	eb bd                	jmp    1220 <createdelete+0x10c>
    1263:	89 d8                	mov    %ebx,%eax
    1265:	d1 f8                	sar    %eax
    1267:	83 c0 30             	add    $0x30,%eax
    126a:	88 45 c9             	mov    %al,-0x37(%ebp)
    126d:	83 ec 0c             	sub    $0xc,%esp
    1270:	57                   	push   %edi
    1271:	e8 51 23 00 00       	call   35c7 <unlink>
    1276:	83 c4 10             	add    $0x10,%esp
    1279:	85 c0                	test   %eax,%eax
    127b:	79 d3                	jns    1250 <createdelete+0x13c>
    127d:	51                   	push   %ecx
    127e:	51                   	push   %ecx
    127f:	68 49 3a 00 00       	push   $0x3a49
    1284:	6a 01                	push   $0x1
    1286:	e8 21 24 00 00       	call   36ac <printf>
    128b:	e8 e7 22 00 00       	call   3577 <exit>
    1290:	52                   	push   %edx
    1291:	57                   	push   %edi
    1292:	68 08 4b 00 00       	push   $0x4b08
    1297:	6a 01                	push   $0x1
    1299:	e8 0e 24 00 00       	call   36ac <printf>
    129e:	e8 d4 22 00 00       	call   3577 <exit>
    12a3:	83 ec 08             	sub    $0x8,%esp
    12a6:	68 d1 48 00 00       	push   $0x48d1
    12ab:	6a 01                	push   $0x1
    12ad:	e8 fa 23 00 00       	call   36ac <printf>
    12b2:	e8 c0 22 00 00       	call   3577 <exit>
    12b7:	83 ec 08             	sub    $0x8,%esp
    12ba:	68 97 40 00 00       	push   $0x4097
    12bf:	6a 01                	push   $0x1
    12c1:	e8 e6 23 00 00       	call   36ac <printf>
    12c6:	e8 ac 22 00 00       	call   3577 <exit>
    12cb:	90                   	nop

000012cc <unlinkread>:
    12cc:	55                   	push   %ebp
    12cd:	89 e5                	mov    %esp,%ebp
    12cf:	56                   	push   %esi
    12d0:	53                   	push   %ebx
    12d1:	83 ec 08             	sub    $0x8,%esp
    12d4:	68 6c 3e 00 00       	push   $0x3e6c
    12d9:	6a 01                	push   $0x1
    12db:	e8 cc 23 00 00       	call   36ac <printf>
    12e0:	5e                   	pop    %esi
    12e1:	58                   	pop    %eax
    12e2:	68 02 02 00 00       	push   $0x202
    12e7:	68 7d 3e 00 00       	push   $0x3e7d
    12ec:	e8 c6 22 00 00       	call   35b7 <open>
    12f1:	83 c4 10             	add    $0x10,%esp
    12f4:	85 c0                	test   %eax,%eax
    12f6:	0f 88 e2 00 00 00    	js     13de <unlinkread+0x112>
    12fc:	89 c3                	mov    %eax,%ebx
    12fe:	50                   	push   %eax
    12ff:	6a 05                	push   $0x5
    1301:	68 a2 3e 00 00       	push   $0x3ea2
    1306:	53                   	push   %ebx
    1307:	e8 8b 22 00 00       	call   3597 <write>
    130c:	89 1c 24             	mov    %ebx,(%esp)
    130f:	e8 8b 22 00 00       	call   359f <close>
    1314:	5a                   	pop    %edx
    1315:	59                   	pop    %ecx
    1316:	6a 02                	push   $0x2
    1318:	68 7d 3e 00 00       	push   $0x3e7d
    131d:	e8 95 22 00 00       	call   35b7 <open>
    1322:	89 c3                	mov    %eax,%ebx
    1324:	83 c4 10             	add    $0x10,%esp
    1327:	85 c0                	test   %eax,%eax
    1329:	0f 88 0e 01 00 00    	js     143d <unlinkread+0x171>
    132f:	83 ec 0c             	sub    $0xc,%esp
    1332:	68 7d 3e 00 00       	push   $0x3e7d
    1337:	e8 8b 22 00 00       	call   35c7 <unlink>
    133c:	83 c4 10             	add    $0x10,%esp
    133f:	85 c0                	test   %eax,%eax
    1341:	0f 85 e3 00 00 00    	jne    142a <unlinkread+0x15e>
    1347:	83 ec 08             	sub    $0x8,%esp
    134a:	68 02 02 00 00       	push   $0x202
    134f:	68 7d 3e 00 00       	push   $0x3e7d
    1354:	e8 5e 22 00 00       	call   35b7 <open>
    1359:	89 c6                	mov    %eax,%esi
    135b:	83 c4 0c             	add    $0xc,%esp
    135e:	6a 03                	push   $0x3
    1360:	68 da 3e 00 00       	push   $0x3eda
    1365:	50                   	push   %eax
    1366:	e8 2c 22 00 00       	call   3597 <write>
    136b:	89 34 24             	mov    %esi,(%esp)
    136e:	e8 2c 22 00 00       	call   359f <close>
    1373:	83 c4 0c             	add    $0xc,%esp
    1376:	68 00 20 00 00       	push   $0x2000
    137b:	68 00 79 00 00       	push   $0x7900
    1380:	53                   	push   %ebx
    1381:	e8 09 22 00 00       	call   358f <read>
    1386:	83 c4 10             	add    $0x10,%esp
    1389:	83 f8 05             	cmp    $0x5,%eax
    138c:	0f 85 85 00 00 00    	jne    1417 <unlinkread+0x14b>
    1392:	80 3d 00 79 00 00 68 	cmpb   $0x68,0x7900
    1399:	75 69                	jne    1404 <unlinkread+0x138>
    139b:	56                   	push   %esi
    139c:	6a 0a                	push   $0xa
    139e:	68 00 79 00 00       	push   $0x7900
    13a3:	53                   	push   %ebx
    13a4:	e8 ee 21 00 00       	call   3597 <write>
    13a9:	83 c4 10             	add    $0x10,%esp
    13ac:	83 f8 0a             	cmp    $0xa,%eax
    13af:	75 40                	jne    13f1 <unlinkread+0x125>
    13b1:	83 ec 0c             	sub    $0xc,%esp
    13b4:	53                   	push   %ebx
    13b5:	e8 e5 21 00 00       	call   359f <close>
    13ba:	c7 04 24 7d 3e 00 00 	movl   $0x3e7d,(%esp)
    13c1:	e8 01 22 00 00       	call   35c7 <unlink>
    13c6:	58                   	pop    %eax
    13c7:	5a                   	pop    %edx
    13c8:	68 25 3f 00 00       	push   $0x3f25
    13cd:	6a 01                	push   $0x1
    13cf:	e8 d8 22 00 00       	call   36ac <printf>
    13d4:	83 c4 10             	add    $0x10,%esp
    13d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    13da:	5b                   	pop    %ebx
    13db:	5e                   	pop    %esi
    13dc:	5d                   	pop    %ebp
    13dd:	c3                   	ret    
    13de:	53                   	push   %ebx
    13df:	53                   	push   %ebx
    13e0:	68 88 3e 00 00       	push   $0x3e88
    13e5:	6a 01                	push   $0x1
    13e7:	e8 c0 22 00 00       	call   36ac <printf>
    13ec:	e8 86 21 00 00       	call   3577 <exit>
    13f1:	51                   	push   %ecx
    13f2:	51                   	push   %ecx
    13f3:	68 0c 3f 00 00       	push   $0x3f0c
    13f8:	6a 01                	push   $0x1
    13fa:	e8 ad 22 00 00       	call   36ac <printf>
    13ff:	e8 73 21 00 00       	call   3577 <exit>
    1404:	50                   	push   %eax
    1405:	50                   	push   %eax
    1406:	68 f5 3e 00 00       	push   $0x3ef5
    140b:	6a 01                	push   $0x1
    140d:	e8 9a 22 00 00       	call   36ac <printf>
    1412:	e8 60 21 00 00       	call   3577 <exit>
    1417:	50                   	push   %eax
    1418:	50                   	push   %eax
    1419:	68 de 3e 00 00       	push   $0x3ede
    141e:	6a 01                	push   $0x1
    1420:	e8 87 22 00 00       	call   36ac <printf>
    1425:	e8 4d 21 00 00       	call   3577 <exit>
    142a:	50                   	push   %eax
    142b:	50                   	push   %eax
    142c:	68 c0 3e 00 00       	push   $0x3ec0
    1431:	6a 01                	push   $0x1
    1433:	e8 74 22 00 00       	call   36ac <printf>
    1438:	e8 3a 21 00 00       	call   3577 <exit>
    143d:	50                   	push   %eax
    143e:	50                   	push   %eax
    143f:	68 a8 3e 00 00       	push   $0x3ea8
    1444:	6a 01                	push   $0x1
    1446:	e8 61 22 00 00       	call   36ac <printf>
    144b:	e8 27 21 00 00       	call   3577 <exit>

00001450 <linktest>:
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	53                   	push   %ebx
    1454:	83 ec 0c             	sub    $0xc,%esp
    1457:	68 34 3f 00 00       	push   $0x3f34
    145c:	6a 01                	push   $0x1
    145e:	e8 49 22 00 00       	call   36ac <printf>
    1463:	c7 04 24 3e 3f 00 00 	movl   $0x3f3e,(%esp)
    146a:	e8 58 21 00 00       	call   35c7 <unlink>
    146f:	c7 04 24 42 3f 00 00 	movl   $0x3f42,(%esp)
    1476:	e8 4c 21 00 00       	call   35c7 <unlink>
    147b:	58                   	pop    %eax
    147c:	5a                   	pop    %edx
    147d:	68 02 02 00 00       	push   $0x202
    1482:	68 3e 3f 00 00       	push   $0x3f3e
    1487:	e8 2b 21 00 00       	call   35b7 <open>
    148c:	83 c4 10             	add    $0x10,%esp
    148f:	85 c0                	test   %eax,%eax
    1491:	0f 88 1a 01 00 00    	js     15b1 <linktest+0x161>
    1497:	89 c3                	mov    %eax,%ebx
    1499:	50                   	push   %eax
    149a:	6a 05                	push   $0x5
    149c:	68 a2 3e 00 00       	push   $0x3ea2
    14a1:	53                   	push   %ebx
    14a2:	e8 f0 20 00 00       	call   3597 <write>
    14a7:	83 c4 10             	add    $0x10,%esp
    14aa:	83 f8 05             	cmp    $0x5,%eax
    14ad:	0f 85 96 01 00 00    	jne    1649 <linktest+0x1f9>
    14b3:	83 ec 0c             	sub    $0xc,%esp
    14b6:	53                   	push   %ebx
    14b7:	e8 e3 20 00 00       	call   359f <close>
    14bc:	5b                   	pop    %ebx
    14bd:	58                   	pop    %eax
    14be:	68 42 3f 00 00       	push   $0x3f42
    14c3:	68 3e 3f 00 00       	push   $0x3f3e
    14c8:	e8 0a 21 00 00       	call   35d7 <link>
    14cd:	83 c4 10             	add    $0x10,%esp
    14d0:	85 c0                	test   %eax,%eax
    14d2:	0f 88 5e 01 00 00    	js     1636 <linktest+0x1e6>
    14d8:	83 ec 0c             	sub    $0xc,%esp
    14db:	68 3e 3f 00 00       	push   $0x3f3e
    14e0:	e8 e2 20 00 00       	call   35c7 <unlink>
    14e5:	58                   	pop    %eax
    14e6:	5a                   	pop    %edx
    14e7:	6a 00                	push   $0x0
    14e9:	68 3e 3f 00 00       	push   $0x3f3e
    14ee:	e8 c4 20 00 00       	call   35b7 <open>
    14f3:	83 c4 10             	add    $0x10,%esp
    14f6:	85 c0                	test   %eax,%eax
    14f8:	0f 89 25 01 00 00    	jns    1623 <linktest+0x1d3>
    14fe:	83 ec 08             	sub    $0x8,%esp
    1501:	6a 00                	push   $0x0
    1503:	68 42 3f 00 00       	push   $0x3f42
    1508:	e8 aa 20 00 00       	call   35b7 <open>
    150d:	89 c3                	mov    %eax,%ebx
    150f:	83 c4 10             	add    $0x10,%esp
    1512:	85 c0                	test   %eax,%eax
    1514:	0f 88 f6 00 00 00    	js     1610 <linktest+0x1c0>
    151a:	50                   	push   %eax
    151b:	68 00 20 00 00       	push   $0x2000
    1520:	68 00 79 00 00       	push   $0x7900
    1525:	53                   	push   %ebx
    1526:	e8 64 20 00 00       	call   358f <read>
    152b:	83 c4 10             	add    $0x10,%esp
    152e:	83 f8 05             	cmp    $0x5,%eax
    1531:	0f 85 c6 00 00 00    	jne    15fd <linktest+0x1ad>
    1537:	83 ec 0c             	sub    $0xc,%esp
    153a:	53                   	push   %ebx
    153b:	e8 5f 20 00 00       	call   359f <close>
    1540:	58                   	pop    %eax
    1541:	5a                   	pop    %edx
    1542:	68 42 3f 00 00       	push   $0x3f42
    1547:	68 42 3f 00 00       	push   $0x3f42
    154c:	e8 86 20 00 00       	call   35d7 <link>
    1551:	83 c4 10             	add    $0x10,%esp
    1554:	85 c0                	test   %eax,%eax
    1556:	0f 89 8e 00 00 00    	jns    15ea <linktest+0x19a>
    155c:	83 ec 0c             	sub    $0xc,%esp
    155f:	68 42 3f 00 00       	push   $0x3f42
    1564:	e8 5e 20 00 00       	call   35c7 <unlink>
    1569:	59                   	pop    %ecx
    156a:	5b                   	pop    %ebx
    156b:	68 3e 3f 00 00       	push   $0x3f3e
    1570:	68 42 3f 00 00       	push   $0x3f42
    1575:	e8 5d 20 00 00       	call   35d7 <link>
    157a:	83 c4 10             	add    $0x10,%esp
    157d:	85 c0                	test   %eax,%eax
    157f:	79 56                	jns    15d7 <linktest+0x187>
    1581:	83 ec 08             	sub    $0x8,%esp
    1584:	68 3e 3f 00 00       	push   $0x3f3e
    1589:	68 06 42 00 00       	push   $0x4206
    158e:	e8 44 20 00 00       	call   35d7 <link>
    1593:	83 c4 10             	add    $0x10,%esp
    1596:	85 c0                	test   %eax,%eax
    1598:	79 2a                	jns    15c4 <linktest+0x174>
    159a:	83 ec 08             	sub    $0x8,%esp
    159d:	68 dc 3f 00 00       	push   $0x3fdc
    15a2:	6a 01                	push   $0x1
    15a4:	e8 03 21 00 00       	call   36ac <printf>
    15a9:	83 c4 10             	add    $0x10,%esp
    15ac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15af:	c9                   	leave  
    15b0:	c3                   	ret    
    15b1:	50                   	push   %eax
    15b2:	50                   	push   %eax
    15b3:	68 46 3f 00 00       	push   $0x3f46
    15b8:	6a 01                	push   $0x1
    15ba:	e8 ed 20 00 00       	call   36ac <printf>
    15bf:	e8 b3 1f 00 00       	call   3577 <exit>
    15c4:	50                   	push   %eax
    15c5:	50                   	push   %eax
    15c6:	68 c0 3f 00 00       	push   $0x3fc0
    15cb:	6a 01                	push   $0x1
    15cd:	e8 da 20 00 00       	call   36ac <printf>
    15d2:	e8 a0 1f 00 00       	call   3577 <exit>
    15d7:	52                   	push   %edx
    15d8:	52                   	push   %edx
    15d9:	68 74 4b 00 00       	push   $0x4b74
    15de:	6a 01                	push   $0x1
    15e0:	e8 c7 20 00 00       	call   36ac <printf>
    15e5:	e8 8d 1f 00 00       	call   3577 <exit>
    15ea:	50                   	push   %eax
    15eb:	50                   	push   %eax
    15ec:	68 a2 3f 00 00       	push   $0x3fa2
    15f1:	6a 01                	push   $0x1
    15f3:	e8 b4 20 00 00       	call   36ac <printf>
    15f8:	e8 7a 1f 00 00       	call   3577 <exit>
    15fd:	51                   	push   %ecx
    15fe:	51                   	push   %ecx
    15ff:	68 91 3f 00 00       	push   $0x3f91
    1604:	6a 01                	push   $0x1
    1606:	e8 a1 20 00 00       	call   36ac <printf>
    160b:	e8 67 1f 00 00       	call   3577 <exit>
    1610:	50                   	push   %eax
    1611:	50                   	push   %eax
    1612:	68 80 3f 00 00       	push   $0x3f80
    1617:	6a 01                	push   $0x1
    1619:	e8 8e 20 00 00       	call   36ac <printf>
    161e:	e8 54 1f 00 00       	call   3577 <exit>
    1623:	50                   	push   %eax
    1624:	50                   	push   %eax
    1625:	68 4c 4b 00 00       	push   $0x4b4c
    162a:	6a 01                	push   $0x1
    162c:	e8 7b 20 00 00       	call   36ac <printf>
    1631:	e8 41 1f 00 00       	call   3577 <exit>
    1636:	51                   	push   %ecx
    1637:	51                   	push   %ecx
    1638:	68 6b 3f 00 00       	push   $0x3f6b
    163d:	6a 01                	push   $0x1
    163f:	e8 68 20 00 00       	call   36ac <printf>
    1644:	e8 2e 1f 00 00       	call   3577 <exit>
    1649:	50                   	push   %eax
    164a:	50                   	push   %eax
    164b:	68 59 3f 00 00       	push   $0x3f59
    1650:	6a 01                	push   $0x1
    1652:	e8 55 20 00 00       	call   36ac <printf>
    1657:	e8 1b 1f 00 00       	call   3577 <exit>

0000165c <concreate>:
    165c:	55                   	push   %ebp
    165d:	89 e5                	mov    %esp,%ebp
    165f:	57                   	push   %edi
    1660:	56                   	push   %esi
    1661:	53                   	push   %ebx
    1662:	83 ec 64             	sub    $0x64,%esp
    1665:	68 e9 3f 00 00       	push   $0x3fe9
    166a:	6a 01                	push   $0x1
    166c:	e8 3b 20 00 00       	call   36ac <printf>
    1671:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
    1675:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1679:	83 c4 10             	add    $0x10,%esp
    167c:	31 f6                	xor    %esi,%esi
    167e:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    1681:	bf 03 00 00 00       	mov    $0x3,%edi
    1686:	eb 38                	jmp    16c0 <concreate+0x64>
    1688:	89 f0                	mov    %esi,%eax
    168a:	99                   	cltd   
    168b:	f7 ff                	idiv   %edi
    168d:	4a                   	dec    %edx
    168e:	0f 84 84 00 00 00    	je     1718 <concreate+0xbc>
    1694:	83 ec 08             	sub    $0x8,%esp
    1697:	68 02 02 00 00       	push   $0x202
    169c:	53                   	push   %ebx
    169d:	e8 15 1f 00 00       	call   35b7 <open>
    16a2:	83 c4 10             	add    $0x10,%esp
    16a5:	85 c0                	test   %eax,%eax
    16a7:	78 5c                	js     1705 <concreate+0xa9>
    16a9:	83 ec 0c             	sub    $0xc,%esp
    16ac:	50                   	push   %eax
    16ad:	e8 ed 1e 00 00       	call   359f <close>
    16b2:	83 c4 10             	add    $0x10,%esp
    16b5:	e8 c5 1e 00 00       	call   357f <wait>
    16ba:	46                   	inc    %esi
    16bb:	83 fe 28             	cmp    $0x28,%esi
    16be:	74 74                	je     1734 <concreate+0xd8>
    16c0:	8d 46 30             	lea    0x30(%esi),%eax
    16c3:	88 45 ae             	mov    %al,-0x52(%ebp)
    16c6:	83 ec 0c             	sub    $0xc,%esp
    16c9:	53                   	push   %ebx
    16ca:	e8 f8 1e 00 00       	call   35c7 <unlink>
    16cf:	e8 9b 1e 00 00       	call   356f <fork>
    16d4:	83 c4 10             	add    $0x10,%esp
    16d7:	85 c0                	test   %eax,%eax
    16d9:	75 ad                	jne    1688 <concreate+0x2c>
    16db:	b9 05 00 00 00       	mov    $0x5,%ecx
    16e0:	89 f0                	mov    %esi,%eax
    16e2:	99                   	cltd   
    16e3:	f7 f9                	idiv   %ecx
    16e5:	4a                   	dec    %edx
    16e6:	0f 84 c0 00 00 00    	je     17ac <concreate+0x150>
    16ec:	83 ec 08             	sub    $0x8,%esp
    16ef:	68 02 02 00 00       	push   $0x202
    16f4:	53                   	push   %ebx
    16f5:	e8 bd 1e 00 00       	call   35b7 <open>
    16fa:	83 c4 10             	add    $0x10,%esp
    16fd:	85 c0                	test   %eax,%eax
    16ff:	0f 89 be 01 00 00    	jns    18c3 <concreate+0x267>
    1705:	51                   	push   %ecx
    1706:	53                   	push   %ebx
    1707:	68 fc 3f 00 00       	push   $0x3ffc
    170c:	6a 01                	push   $0x1
    170e:	e8 99 1f 00 00       	call   36ac <printf>
    1713:	e8 5f 1e 00 00       	call   3577 <exit>
    1718:	83 ec 08             	sub    $0x8,%esp
    171b:	53                   	push   %ebx
    171c:	68 f9 3f 00 00       	push   $0x3ff9
    1721:	e8 b1 1e 00 00       	call   35d7 <link>
    1726:	83 c4 10             	add    $0x10,%esp
    1729:	e8 51 1e 00 00       	call   357f <wait>
    172e:	46                   	inc    %esi
    172f:	83 fe 28             	cmp    $0x28,%esi
    1732:	75 8c                	jne    16c0 <concreate+0x64>
    1734:	50                   	push   %eax
    1735:	6a 28                	push   $0x28
    1737:	6a 00                	push   $0x0
    1739:	8d 45 c0             	lea    -0x40(%ebp),%eax
    173c:	50                   	push   %eax
    173d:	e8 fe 1c 00 00       	call   3440 <memset>
    1742:	58                   	pop    %eax
    1743:	5a                   	pop    %edx
    1744:	6a 00                	push   $0x0
    1746:	68 06 42 00 00       	push   $0x4206
    174b:	e8 67 1e 00 00       	call   35b7 <open>
    1750:	89 c6                	mov    %eax,%esi
    1752:	83 c4 10             	add    $0x10,%esp
    1755:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    175c:	8d 7d b0             	lea    -0x50(%ebp),%edi
    175f:	90                   	nop
    1760:	50                   	push   %eax
    1761:	6a 10                	push   $0x10
    1763:	57                   	push   %edi
    1764:	56                   	push   %esi
    1765:	e8 25 1e 00 00       	call   358f <read>
    176a:	83 c4 10             	add    $0x10,%esp
    176d:	85 c0                	test   %eax,%eax
    176f:	7e 53                	jle    17c4 <concreate+0x168>
    1771:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1776:	74 e8                	je     1760 <concreate+0x104>
    1778:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    177c:	75 e2                	jne    1760 <concreate+0x104>
    177e:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1782:	75 dc                	jne    1760 <concreate+0x104>
    1784:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1788:	83 e8 30             	sub    $0x30,%eax
    178b:	83 f8 27             	cmp    $0x27,%eax
    178e:	0f 87 40 01 00 00    	ja     18d4 <concreate+0x278>
    1794:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1799:	0f 85 5e 01 00 00    	jne    18fd <concreate+0x2a1>
    179f:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
    17a4:	ff 45 a4             	incl   -0x5c(%ebp)
    17a7:	eb b7                	jmp    1760 <concreate+0x104>
    17a9:	8d 76 00             	lea    0x0(%esi),%esi
    17ac:	83 ec 08             	sub    $0x8,%esp
    17af:	53                   	push   %ebx
    17b0:	68 f9 3f 00 00       	push   $0x3ff9
    17b5:	e8 1d 1e 00 00       	call   35d7 <link>
    17ba:	83 c4 10             	add    $0x10,%esp
    17bd:	e8 b5 1d 00 00       	call   3577 <exit>
    17c2:	66 90                	xchg   %ax,%ax
    17c4:	83 ec 0c             	sub    $0xc,%esp
    17c7:	56                   	push   %esi
    17c8:	e8 d2 1d 00 00       	call   359f <close>
    17cd:	83 c4 10             	add    $0x10,%esp
    17d0:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    17d4:	0f 85 10 01 00 00    	jne    18ea <concreate+0x28e>
    17da:	31 f6                	xor    %esi,%esi
    17dc:	eb 65                	jmp    1843 <concreate+0x1e7>
    17de:	66 90                	xchg   %ax,%ax
    17e0:	85 ff                	test   %edi,%edi
    17e2:	0f 85 89 00 00 00    	jne    1871 <concreate+0x215>
    17e8:	83 ec 08             	sub    $0x8,%esp
    17eb:	6a 00                	push   $0x0
    17ed:	53                   	push   %ebx
    17ee:	e8 c4 1d 00 00       	call   35b7 <open>
    17f3:	89 04 24             	mov    %eax,(%esp)
    17f6:	e8 a4 1d 00 00       	call   359f <close>
    17fb:	58                   	pop    %eax
    17fc:	5a                   	pop    %edx
    17fd:	6a 00                	push   $0x0
    17ff:	53                   	push   %ebx
    1800:	e8 b2 1d 00 00       	call   35b7 <open>
    1805:	89 04 24             	mov    %eax,(%esp)
    1808:	e8 92 1d 00 00       	call   359f <close>
    180d:	59                   	pop    %ecx
    180e:	58                   	pop    %eax
    180f:	6a 00                	push   $0x0
    1811:	53                   	push   %ebx
    1812:	e8 a0 1d 00 00       	call   35b7 <open>
    1817:	89 04 24             	mov    %eax,(%esp)
    181a:	e8 80 1d 00 00       	call   359f <close>
    181f:	58                   	pop    %eax
    1820:	5a                   	pop    %edx
    1821:	6a 00                	push   $0x0
    1823:	53                   	push   %ebx
    1824:	e8 8e 1d 00 00       	call   35b7 <open>
    1829:	89 04 24             	mov    %eax,(%esp)
    182c:	e8 6e 1d 00 00       	call   359f <close>
    1831:	83 c4 10             	add    $0x10,%esp
    1834:	85 ff                	test   %edi,%edi
    1836:	74 85                	je     17bd <concreate+0x161>
    1838:	e8 42 1d 00 00       	call   357f <wait>
    183d:	46                   	inc    %esi
    183e:	83 fe 28             	cmp    $0x28,%esi
    1841:	74 55                	je     1898 <concreate+0x23c>
    1843:	8d 46 30             	lea    0x30(%esi),%eax
    1846:	88 45 ae             	mov    %al,-0x52(%ebp)
    1849:	e8 21 1d 00 00       	call   356f <fork>
    184e:	89 c7                	mov    %eax,%edi
    1850:	85 c0                	test   %eax,%eax
    1852:	78 5b                	js     18af <concreate+0x253>
    1854:	89 f0                	mov    %esi,%eax
    1856:	b9 03 00 00 00       	mov    $0x3,%ecx
    185b:	99                   	cltd   
    185c:	f7 f9                	idiv   %ecx
    185e:	85 d2                	test   %edx,%edx
    1860:	0f 84 7a ff ff ff    	je     17e0 <concreate+0x184>
    1866:	4a                   	dec    %edx
    1867:	75 08                	jne    1871 <concreate+0x215>
    1869:	85 ff                	test   %edi,%edi
    186b:	0f 85 77 ff ff ff    	jne    17e8 <concreate+0x18c>
    1871:	83 ec 0c             	sub    $0xc,%esp
    1874:	53                   	push   %ebx
    1875:	e8 4d 1d 00 00       	call   35c7 <unlink>
    187a:	89 1c 24             	mov    %ebx,(%esp)
    187d:	e8 45 1d 00 00       	call   35c7 <unlink>
    1882:	89 1c 24             	mov    %ebx,(%esp)
    1885:	e8 3d 1d 00 00       	call   35c7 <unlink>
    188a:	89 1c 24             	mov    %ebx,(%esp)
    188d:	e8 35 1d 00 00       	call   35c7 <unlink>
    1892:	83 c4 10             	add    $0x10,%esp
    1895:	eb 9d                	jmp    1834 <concreate+0x1d8>
    1897:	90                   	nop
    1898:	83 ec 08             	sub    $0x8,%esp
    189b:	68 4e 40 00 00       	push   $0x404e
    18a0:	6a 01                	push   $0x1
    18a2:	e8 05 1e 00 00       	call   36ac <printf>
    18a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    18aa:	5b                   	pop    %ebx
    18ab:	5e                   	pop    %esi
    18ac:	5f                   	pop    %edi
    18ad:	5d                   	pop    %ebp
    18ae:	c3                   	ret    
    18af:	83 ec 08             	sub    $0x8,%esp
    18b2:	68 d1 48 00 00       	push   $0x48d1
    18b7:	6a 01                	push   $0x1
    18b9:	e8 ee 1d 00 00       	call   36ac <printf>
    18be:	e8 b4 1c 00 00       	call   3577 <exit>
    18c3:	83 ec 0c             	sub    $0xc,%esp
    18c6:	50                   	push   %eax
    18c7:	e8 d3 1c 00 00       	call   359f <close>
    18cc:	83 c4 10             	add    $0x10,%esp
    18cf:	e9 e9 fe ff ff       	jmp    17bd <concreate+0x161>
    18d4:	50                   	push   %eax
    18d5:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    18d8:	50                   	push   %eax
    18d9:	68 18 40 00 00       	push   $0x4018
    18de:	6a 01                	push   $0x1
    18e0:	e8 c7 1d 00 00       	call   36ac <printf>
    18e5:	e8 8d 1c 00 00       	call   3577 <exit>
    18ea:	51                   	push   %ecx
    18eb:	51                   	push   %ecx
    18ec:	68 98 4b 00 00       	push   $0x4b98
    18f1:	6a 01                	push   $0x1
    18f3:	e8 b4 1d 00 00       	call   36ac <printf>
    18f8:	e8 7a 1c 00 00       	call   3577 <exit>
    18fd:	50                   	push   %eax
    18fe:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1901:	50                   	push   %eax
    1902:	68 31 40 00 00       	push   $0x4031
    1907:	6a 01                	push   $0x1
    1909:	e8 9e 1d 00 00       	call   36ac <printf>
    190e:	e8 64 1c 00 00       	call   3577 <exit>
    1913:	90                   	nop

00001914 <linkunlink>:
    1914:	55                   	push   %ebp
    1915:	89 e5                	mov    %esp,%ebp
    1917:	57                   	push   %edi
    1918:	56                   	push   %esi
    1919:	53                   	push   %ebx
    191a:	83 ec 24             	sub    $0x24,%esp
    191d:	68 5c 40 00 00       	push   $0x405c
    1922:	6a 01                	push   $0x1
    1924:	e8 83 1d 00 00       	call   36ac <printf>
    1929:	c7 04 24 e9 42 00 00 	movl   $0x42e9,(%esp)
    1930:	e8 92 1c 00 00       	call   35c7 <unlink>
    1935:	e8 35 1c 00 00       	call   356f <fork>
    193a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    193d:	83 c4 10             	add    $0x10,%esp
    1940:	85 c0                	test   %eax,%eax
    1942:	0f 88 c2 00 00 00    	js     1a0a <linkunlink+0xf6>
    1948:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    194c:	19 ff                	sbb    %edi,%edi
    194e:	83 e7 60             	and    $0x60,%edi
    1951:	47                   	inc    %edi
    1952:	bb 64 00 00 00       	mov    $0x64,%ebx
    1957:	be 03 00 00 00       	mov    $0x3,%esi
    195c:	eb 1c                	jmp    197a <linkunlink+0x66>
    195e:	66 90                	xchg   %ax,%ax
    1960:	4a                   	dec    %edx
    1961:	0f 84 89 00 00 00    	je     19f0 <linkunlink+0xdc>
    1967:	83 ec 0c             	sub    $0xc,%esp
    196a:	68 e9 42 00 00       	push   $0x42e9
    196f:	e8 53 1c 00 00       	call   35c7 <unlink>
    1974:	83 c4 10             	add    $0x10,%esp
    1977:	4b                   	dec    %ebx
    1978:	74 52                	je     19cc <linkunlink+0xb8>
    197a:	89 f8                	mov    %edi,%eax
    197c:	c1 e0 09             	shl    $0x9,%eax
    197f:	29 f8                	sub    %edi,%eax
    1981:	8d 14 87             	lea    (%edi,%eax,4),%edx
    1984:	89 d0                	mov    %edx,%eax
    1986:	c1 e0 09             	shl    $0x9,%eax
    1989:	29 d0                	sub    %edx,%eax
    198b:	01 c0                	add    %eax,%eax
    198d:	01 f8                	add    %edi,%eax
    198f:	89 c2                	mov    %eax,%edx
    1991:	c1 e2 05             	shl    $0x5,%edx
    1994:	01 d0                	add    %edx,%eax
    1996:	c1 e0 02             	shl    $0x2,%eax
    1999:	29 f8                	sub    %edi,%eax
    199b:	8d bc 87 39 30 00 00 	lea    0x3039(%edi,%eax,4),%edi
    19a2:	89 f8                	mov    %edi,%eax
    19a4:	31 d2                	xor    %edx,%edx
    19a6:	f7 f6                	div    %esi
    19a8:	85 d2                	test   %edx,%edx
    19aa:	75 b4                	jne    1960 <linkunlink+0x4c>
    19ac:	83 ec 08             	sub    $0x8,%esp
    19af:	68 02 02 00 00       	push   $0x202
    19b4:	68 e9 42 00 00       	push   $0x42e9
    19b9:	e8 f9 1b 00 00       	call   35b7 <open>
    19be:	89 04 24             	mov    %eax,(%esp)
    19c1:	e8 d9 1b 00 00       	call   359f <close>
    19c6:	83 c4 10             	add    $0x10,%esp
    19c9:	4b                   	dec    %ebx
    19ca:	75 ae                	jne    197a <linkunlink+0x66>
    19cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    19cf:	85 c0                	test   %eax,%eax
    19d1:	74 4a                	je     1a1d <linkunlink+0x109>
    19d3:	e8 a7 1b 00 00       	call   357f <wait>
    19d8:	83 ec 08             	sub    $0x8,%esp
    19db:	68 71 40 00 00       	push   $0x4071
    19e0:	6a 01                	push   $0x1
    19e2:	e8 c5 1c 00 00       	call   36ac <printf>
    19e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    19ea:	5b                   	pop    %ebx
    19eb:	5e                   	pop    %esi
    19ec:	5f                   	pop    %edi
    19ed:	5d                   	pop    %ebp
    19ee:	c3                   	ret    
    19ef:	90                   	nop
    19f0:	83 ec 08             	sub    $0x8,%esp
    19f3:	68 e9 42 00 00       	push   $0x42e9
    19f8:	68 6d 40 00 00       	push   $0x406d
    19fd:	e8 d5 1b 00 00       	call   35d7 <link>
    1a02:	83 c4 10             	add    $0x10,%esp
    1a05:	e9 6d ff ff ff       	jmp    1977 <linkunlink+0x63>
    1a0a:	52                   	push   %edx
    1a0b:	52                   	push   %edx
    1a0c:	68 d1 48 00 00       	push   $0x48d1
    1a11:	6a 01                	push   $0x1
    1a13:	e8 94 1c 00 00       	call   36ac <printf>
    1a18:	e8 5a 1b 00 00       	call   3577 <exit>
    1a1d:	e8 55 1b 00 00       	call   3577 <exit>
    1a22:	66 90                	xchg   %ax,%ax

00001a24 <bigdir>:
    1a24:	55                   	push   %ebp
    1a25:	89 e5                	mov    %esp,%ebp
    1a27:	57                   	push   %edi
    1a28:	56                   	push   %esi
    1a29:	53                   	push   %ebx
    1a2a:	83 ec 24             	sub    $0x24,%esp
    1a2d:	68 80 40 00 00       	push   $0x4080
    1a32:	6a 01                	push   $0x1
    1a34:	e8 73 1c 00 00       	call   36ac <printf>
    1a39:	c7 04 24 8d 40 00 00 	movl   $0x408d,(%esp)
    1a40:	e8 82 1b 00 00       	call   35c7 <unlink>
    1a45:	5a                   	pop    %edx
    1a46:	59                   	pop    %ecx
    1a47:	68 00 02 00 00       	push   $0x200
    1a4c:	68 8d 40 00 00       	push   $0x408d
    1a51:	e8 61 1b 00 00       	call   35b7 <open>
    1a56:	83 c4 10             	add    $0x10,%esp
    1a59:	85 c0                	test   %eax,%eax
    1a5b:	0f 88 dc 00 00 00    	js     1b3d <bigdir+0x119>
    1a61:	83 ec 0c             	sub    $0xc,%esp
    1a64:	50                   	push   %eax
    1a65:	e8 35 1b 00 00       	call   359f <close>
    1a6a:	83 c4 10             	add    $0x10,%esp
    1a6d:	31 f6                	xor    %esi,%esi
    1a6f:	8d 7d de             	lea    -0x22(%ebp),%edi
    1a72:	66 90                	xchg   %ax,%ax
    1a74:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    1a78:	89 f0                	mov    %esi,%eax
    1a7a:	c1 f8 06             	sar    $0x6,%eax
    1a7d:	83 c0 30             	add    $0x30,%eax
    1a80:	88 45 df             	mov    %al,-0x21(%ebp)
    1a83:	89 f0                	mov    %esi,%eax
    1a85:	83 e0 3f             	and    $0x3f,%eax
    1a88:	83 c0 30             	add    $0x30,%eax
    1a8b:	88 45 e0             	mov    %al,-0x20(%ebp)
    1a8e:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1a92:	83 ec 08             	sub    $0x8,%esp
    1a95:	57                   	push   %edi
    1a96:	68 8d 40 00 00       	push   $0x408d
    1a9b:	e8 37 1b 00 00       	call   35d7 <link>
    1aa0:	89 c3                	mov    %eax,%ebx
    1aa2:	83 c4 10             	add    $0x10,%esp
    1aa5:	85 c0                	test   %eax,%eax
    1aa7:	75 6c                	jne    1b15 <bigdir+0xf1>
    1aa9:	46                   	inc    %esi
    1aaa:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1ab0:	75 c2                	jne    1a74 <bigdir+0x50>
    1ab2:	83 ec 0c             	sub    $0xc,%esp
    1ab5:	68 8d 40 00 00       	push   $0x408d
    1aba:	e8 08 1b 00 00       	call   35c7 <unlink>
    1abf:	83 c4 10             	add    $0x10,%esp
    1ac2:	66 90                	xchg   %ax,%ax
    1ac4:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    1ac8:	89 d8                	mov    %ebx,%eax
    1aca:	c1 f8 06             	sar    $0x6,%eax
    1acd:	83 c0 30             	add    $0x30,%eax
    1ad0:	88 45 df             	mov    %al,-0x21(%ebp)
    1ad3:	89 d8                	mov    %ebx,%eax
    1ad5:	83 e0 3f             	and    $0x3f,%eax
    1ad8:	83 c0 30             	add    $0x30,%eax
    1adb:	88 45 e0             	mov    %al,-0x20(%ebp)
    1ade:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1ae2:	83 ec 0c             	sub    $0xc,%esp
    1ae5:	57                   	push   %edi
    1ae6:	e8 dc 1a 00 00       	call   35c7 <unlink>
    1aeb:	83 c4 10             	add    $0x10,%esp
    1aee:	85 c0                	test   %eax,%eax
    1af0:	75 37                	jne    1b29 <bigdir+0x105>
    1af2:	43                   	inc    %ebx
    1af3:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1af9:	75 c9                	jne    1ac4 <bigdir+0xa0>
    1afb:	83 ec 08             	sub    $0x8,%esp
    1afe:	68 cf 40 00 00       	push   $0x40cf
    1b03:	6a 01                	push   $0x1
    1b05:	e8 a2 1b 00 00       	call   36ac <printf>
    1b0a:	83 c4 10             	add    $0x10,%esp
    1b0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b10:	5b                   	pop    %ebx
    1b11:	5e                   	pop    %esi
    1b12:	5f                   	pop    %edi
    1b13:	5d                   	pop    %ebp
    1b14:	c3                   	ret    
    1b15:	83 ec 08             	sub    $0x8,%esp
    1b18:	68 a6 40 00 00       	push   $0x40a6
    1b1d:	6a 01                	push   $0x1
    1b1f:	e8 88 1b 00 00       	call   36ac <printf>
    1b24:	e8 4e 1a 00 00       	call   3577 <exit>
    1b29:	83 ec 08             	sub    $0x8,%esp
    1b2c:	68 ba 40 00 00       	push   $0x40ba
    1b31:	6a 01                	push   $0x1
    1b33:	e8 74 1b 00 00       	call   36ac <printf>
    1b38:	e8 3a 1a 00 00       	call   3577 <exit>
    1b3d:	50                   	push   %eax
    1b3e:	50                   	push   %eax
    1b3f:	68 90 40 00 00       	push   $0x4090
    1b44:	6a 01                	push   $0x1
    1b46:	e8 61 1b 00 00       	call   36ac <printf>
    1b4b:	e8 27 1a 00 00       	call   3577 <exit>

00001b50 <subdir>:
    1b50:	55                   	push   %ebp
    1b51:	89 e5                	mov    %esp,%ebp
    1b53:	53                   	push   %ebx
    1b54:	83 ec 0c             	sub    $0xc,%esp
    1b57:	68 da 40 00 00       	push   $0x40da
    1b5c:	6a 01                	push   $0x1
    1b5e:	e8 49 1b 00 00       	call   36ac <printf>
    1b63:	c7 04 24 63 41 00 00 	movl   $0x4163,(%esp)
    1b6a:	e8 58 1a 00 00       	call   35c7 <unlink>
    1b6f:	c7 04 24 00 42 00 00 	movl   $0x4200,(%esp)
    1b76:	e8 64 1a 00 00       	call   35df <mkdir>
    1b7b:	83 c4 10             	add    $0x10,%esp
    1b7e:	85 c0                	test   %eax,%eax
    1b80:	0f 85 ab 05 00 00    	jne    2131 <subdir+0x5e1>
    1b86:	83 ec 08             	sub    $0x8,%esp
    1b89:	68 02 02 00 00       	push   $0x202
    1b8e:	68 39 41 00 00       	push   $0x4139
    1b93:	e8 1f 1a 00 00       	call   35b7 <open>
    1b98:	89 c3                	mov    %eax,%ebx
    1b9a:	83 c4 10             	add    $0x10,%esp
    1b9d:	85 c0                	test   %eax,%eax
    1b9f:	0f 88 79 05 00 00    	js     211e <subdir+0x5ce>
    1ba5:	50                   	push   %eax
    1ba6:	6a 02                	push   $0x2
    1ba8:	68 63 41 00 00       	push   $0x4163
    1bad:	53                   	push   %ebx
    1bae:	e8 e4 19 00 00       	call   3597 <write>
    1bb3:	89 1c 24             	mov    %ebx,(%esp)
    1bb6:	e8 e4 19 00 00       	call   359f <close>
    1bbb:	c7 04 24 00 42 00 00 	movl   $0x4200,(%esp)
    1bc2:	e8 00 1a 00 00       	call   35c7 <unlink>
    1bc7:	83 c4 10             	add    $0x10,%esp
    1bca:	85 c0                	test   %eax,%eax
    1bcc:	0f 89 39 05 00 00    	jns    210b <subdir+0x5bb>
    1bd2:	83 ec 0c             	sub    $0xc,%esp
    1bd5:	68 14 41 00 00       	push   $0x4114
    1bda:	e8 00 1a 00 00       	call   35df <mkdir>
    1bdf:	83 c4 10             	add    $0x10,%esp
    1be2:	85 c0                	test   %eax,%eax
    1be4:	0f 85 0e 05 00 00    	jne    20f8 <subdir+0x5a8>
    1bea:	83 ec 08             	sub    $0x8,%esp
    1bed:	68 02 02 00 00       	push   $0x202
    1bf2:	68 36 41 00 00       	push   $0x4136
    1bf7:	e8 bb 19 00 00       	call   35b7 <open>
    1bfc:	89 c3                	mov    %eax,%ebx
    1bfe:	83 c4 10             	add    $0x10,%esp
    1c01:	85 c0                	test   %eax,%eax
    1c03:	0f 88 1e 04 00 00    	js     2027 <subdir+0x4d7>
    1c09:	50                   	push   %eax
    1c0a:	6a 02                	push   $0x2
    1c0c:	68 57 41 00 00       	push   $0x4157
    1c11:	53                   	push   %ebx
    1c12:	e8 80 19 00 00       	call   3597 <write>
    1c17:	89 1c 24             	mov    %ebx,(%esp)
    1c1a:	e8 80 19 00 00       	call   359f <close>
    1c1f:	58                   	pop    %eax
    1c20:	5a                   	pop    %edx
    1c21:	6a 00                	push   $0x0
    1c23:	68 5a 41 00 00       	push   $0x415a
    1c28:	e8 8a 19 00 00       	call   35b7 <open>
    1c2d:	89 c3                	mov    %eax,%ebx
    1c2f:	83 c4 10             	add    $0x10,%esp
    1c32:	85 c0                	test   %eax,%eax
    1c34:	0f 88 da 03 00 00    	js     2014 <subdir+0x4c4>
    1c3a:	50                   	push   %eax
    1c3b:	68 00 20 00 00       	push   $0x2000
    1c40:	68 00 79 00 00       	push   $0x7900
    1c45:	53                   	push   %ebx
    1c46:	e8 44 19 00 00       	call   358f <read>
    1c4b:	83 c4 10             	add    $0x10,%esp
    1c4e:	83 f8 02             	cmp    $0x2,%eax
    1c51:	0f 85 38 03 00 00    	jne    1f8f <subdir+0x43f>
    1c57:	80 3d 00 79 00 00 66 	cmpb   $0x66,0x7900
    1c5e:	0f 85 2b 03 00 00    	jne    1f8f <subdir+0x43f>
    1c64:	83 ec 0c             	sub    $0xc,%esp
    1c67:	53                   	push   %ebx
    1c68:	e8 32 19 00 00       	call   359f <close>
    1c6d:	58                   	pop    %eax
    1c6e:	5a                   	pop    %edx
    1c6f:	68 9a 41 00 00       	push   $0x419a
    1c74:	68 36 41 00 00       	push   $0x4136
    1c79:	e8 59 19 00 00       	call   35d7 <link>
    1c7e:	83 c4 10             	add    $0x10,%esp
    1c81:	85 c0                	test   %eax,%eax
    1c83:	0f 85 c4 03 00 00    	jne    204d <subdir+0x4fd>
    1c89:	83 ec 0c             	sub    $0xc,%esp
    1c8c:	68 36 41 00 00       	push   $0x4136
    1c91:	e8 31 19 00 00       	call   35c7 <unlink>
    1c96:	83 c4 10             	add    $0x10,%esp
    1c99:	85 c0                	test   %eax,%eax
    1c9b:	0f 85 14 03 00 00    	jne    1fb5 <subdir+0x465>
    1ca1:	83 ec 08             	sub    $0x8,%esp
    1ca4:	6a 00                	push   $0x0
    1ca6:	68 36 41 00 00       	push   $0x4136
    1cab:	e8 07 19 00 00       	call   35b7 <open>
    1cb0:	83 c4 10             	add    $0x10,%esp
    1cb3:	85 c0                	test   %eax,%eax
    1cb5:	0f 89 2a 04 00 00    	jns    20e5 <subdir+0x595>
    1cbb:	83 ec 0c             	sub    $0xc,%esp
    1cbe:	68 00 42 00 00       	push   $0x4200
    1cc3:	e8 1f 19 00 00       	call   35e7 <chdir>
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	85 c0                	test   %eax,%eax
    1ccd:	0f 85 ff 03 00 00    	jne    20d2 <subdir+0x582>
    1cd3:	83 ec 0c             	sub    $0xc,%esp
    1cd6:	68 ce 41 00 00       	push   $0x41ce
    1cdb:	e8 07 19 00 00       	call   35e7 <chdir>
    1ce0:	83 c4 10             	add    $0x10,%esp
    1ce3:	85 c0                	test   %eax,%eax
    1ce5:	0f 85 b7 02 00 00    	jne    1fa2 <subdir+0x452>
    1ceb:	83 ec 0c             	sub    $0xc,%esp
    1cee:	68 f4 41 00 00       	push   $0x41f4
    1cf3:	e8 ef 18 00 00       	call   35e7 <chdir>
    1cf8:	83 c4 10             	add    $0x10,%esp
    1cfb:	85 c0                	test   %eax,%eax
    1cfd:	0f 85 9f 02 00 00    	jne    1fa2 <subdir+0x452>
    1d03:	83 ec 0c             	sub    $0xc,%esp
    1d06:	68 03 42 00 00       	push   $0x4203
    1d0b:	e8 d7 18 00 00       	call   35e7 <chdir>
    1d10:	83 c4 10             	add    $0x10,%esp
    1d13:	85 c0                	test   %eax,%eax
    1d15:	0f 85 1f 03 00 00    	jne    203a <subdir+0x4ea>
    1d1b:	83 ec 08             	sub    $0x8,%esp
    1d1e:	6a 00                	push   $0x0
    1d20:	68 9a 41 00 00       	push   $0x419a
    1d25:	e8 8d 18 00 00       	call   35b7 <open>
    1d2a:	89 c3                	mov    %eax,%ebx
    1d2c:	83 c4 10             	add    $0x10,%esp
    1d2f:	85 c0                	test   %eax,%eax
    1d31:	0f 88 de 04 00 00    	js     2215 <subdir+0x6c5>
    1d37:	50                   	push   %eax
    1d38:	68 00 20 00 00       	push   $0x2000
    1d3d:	68 00 79 00 00       	push   $0x7900
    1d42:	53                   	push   %ebx
    1d43:	e8 47 18 00 00       	call   358f <read>
    1d48:	83 c4 10             	add    $0x10,%esp
    1d4b:	83 f8 02             	cmp    $0x2,%eax
    1d4e:	0f 85 ae 04 00 00    	jne    2202 <subdir+0x6b2>
    1d54:	83 ec 0c             	sub    $0xc,%esp
    1d57:	53                   	push   %ebx
    1d58:	e8 42 18 00 00       	call   359f <close>
    1d5d:	58                   	pop    %eax
    1d5e:	5a                   	pop    %edx
    1d5f:	6a 00                	push   $0x0
    1d61:	68 36 41 00 00       	push   $0x4136
    1d66:	e8 4c 18 00 00       	call   35b7 <open>
    1d6b:	83 c4 10             	add    $0x10,%esp
    1d6e:	85 c0                	test   %eax,%eax
    1d70:	0f 89 65 02 00 00    	jns    1fdb <subdir+0x48b>
    1d76:	83 ec 08             	sub    $0x8,%esp
    1d79:	68 02 02 00 00       	push   $0x202
    1d7e:	68 4e 42 00 00       	push   $0x424e
    1d83:	e8 2f 18 00 00       	call   35b7 <open>
    1d88:	83 c4 10             	add    $0x10,%esp
    1d8b:	85 c0                	test   %eax,%eax
    1d8d:	0f 89 35 02 00 00    	jns    1fc8 <subdir+0x478>
    1d93:	83 ec 08             	sub    $0x8,%esp
    1d96:	68 02 02 00 00       	push   $0x202
    1d9b:	68 73 42 00 00       	push   $0x4273
    1da0:	e8 12 18 00 00       	call   35b7 <open>
    1da5:	83 c4 10             	add    $0x10,%esp
    1da8:	85 c0                	test   %eax,%eax
    1daa:	0f 89 0f 03 00 00    	jns    20bf <subdir+0x56f>
    1db0:	83 ec 08             	sub    $0x8,%esp
    1db3:	68 00 02 00 00       	push   $0x200
    1db8:	68 00 42 00 00       	push   $0x4200
    1dbd:	e8 f5 17 00 00       	call   35b7 <open>
    1dc2:	83 c4 10             	add    $0x10,%esp
    1dc5:	85 c0                	test   %eax,%eax
    1dc7:	0f 89 df 02 00 00    	jns    20ac <subdir+0x55c>
    1dcd:	83 ec 08             	sub    $0x8,%esp
    1dd0:	6a 02                	push   $0x2
    1dd2:	68 00 42 00 00       	push   $0x4200
    1dd7:	e8 db 17 00 00       	call   35b7 <open>
    1ddc:	83 c4 10             	add    $0x10,%esp
    1ddf:	85 c0                	test   %eax,%eax
    1de1:	0f 89 b2 02 00 00    	jns    2099 <subdir+0x549>
    1de7:	83 ec 08             	sub    $0x8,%esp
    1dea:	6a 01                	push   $0x1
    1dec:	68 00 42 00 00       	push   $0x4200
    1df1:	e8 c1 17 00 00       	call   35b7 <open>
    1df6:	83 c4 10             	add    $0x10,%esp
    1df9:	85 c0                	test   %eax,%eax
    1dfb:	0f 89 85 02 00 00    	jns    2086 <subdir+0x536>
    1e01:	83 ec 08             	sub    $0x8,%esp
    1e04:	68 e2 42 00 00       	push   $0x42e2
    1e09:	68 4e 42 00 00       	push   $0x424e
    1e0e:	e8 c4 17 00 00       	call   35d7 <link>
    1e13:	83 c4 10             	add    $0x10,%esp
    1e16:	85 c0                	test   %eax,%eax
    1e18:	0f 84 55 02 00 00    	je     2073 <subdir+0x523>
    1e1e:	83 ec 08             	sub    $0x8,%esp
    1e21:	68 e2 42 00 00       	push   $0x42e2
    1e26:	68 73 42 00 00       	push   $0x4273
    1e2b:	e8 a7 17 00 00       	call   35d7 <link>
    1e30:	83 c4 10             	add    $0x10,%esp
    1e33:	85 c0                	test   %eax,%eax
    1e35:	0f 84 25 02 00 00    	je     2060 <subdir+0x510>
    1e3b:	83 ec 08             	sub    $0x8,%esp
    1e3e:	68 9a 41 00 00       	push   $0x419a
    1e43:	68 39 41 00 00       	push   $0x4139
    1e48:	e8 8a 17 00 00       	call   35d7 <link>
    1e4d:	83 c4 10             	add    $0x10,%esp
    1e50:	85 c0                	test   %eax,%eax
    1e52:	0f 84 a9 01 00 00    	je     2001 <subdir+0x4b1>
    1e58:	83 ec 0c             	sub    $0xc,%esp
    1e5b:	68 4e 42 00 00       	push   $0x424e
    1e60:	e8 7a 17 00 00       	call   35df <mkdir>
    1e65:	83 c4 10             	add    $0x10,%esp
    1e68:	85 c0                	test   %eax,%eax
    1e6a:	0f 84 7e 01 00 00    	je     1fee <subdir+0x49e>
    1e70:	83 ec 0c             	sub    $0xc,%esp
    1e73:	68 73 42 00 00       	push   $0x4273
    1e78:	e8 62 17 00 00       	call   35df <mkdir>
    1e7d:	83 c4 10             	add    $0x10,%esp
    1e80:	85 c0                	test   %eax,%eax
    1e82:	0f 84 67 03 00 00    	je     21ef <subdir+0x69f>
    1e88:	83 ec 0c             	sub    $0xc,%esp
    1e8b:	68 9a 41 00 00       	push   $0x419a
    1e90:	e8 4a 17 00 00       	call   35df <mkdir>
    1e95:	83 c4 10             	add    $0x10,%esp
    1e98:	85 c0                	test   %eax,%eax
    1e9a:	0f 84 3c 03 00 00    	je     21dc <subdir+0x68c>
    1ea0:	83 ec 0c             	sub    $0xc,%esp
    1ea3:	68 73 42 00 00       	push   $0x4273
    1ea8:	e8 1a 17 00 00       	call   35c7 <unlink>
    1ead:	83 c4 10             	add    $0x10,%esp
    1eb0:	85 c0                	test   %eax,%eax
    1eb2:	0f 84 11 03 00 00    	je     21c9 <subdir+0x679>
    1eb8:	83 ec 0c             	sub    $0xc,%esp
    1ebb:	68 4e 42 00 00       	push   $0x424e
    1ec0:	e8 02 17 00 00       	call   35c7 <unlink>
    1ec5:	83 c4 10             	add    $0x10,%esp
    1ec8:	85 c0                	test   %eax,%eax
    1eca:	0f 84 e6 02 00 00    	je     21b6 <subdir+0x666>
    1ed0:	83 ec 0c             	sub    $0xc,%esp
    1ed3:	68 39 41 00 00       	push   $0x4139
    1ed8:	e8 0a 17 00 00       	call   35e7 <chdir>
    1edd:	83 c4 10             	add    $0x10,%esp
    1ee0:	85 c0                	test   %eax,%eax
    1ee2:	0f 84 bb 02 00 00    	je     21a3 <subdir+0x653>
    1ee8:	83 ec 0c             	sub    $0xc,%esp
    1eeb:	68 e5 42 00 00       	push   $0x42e5
    1ef0:	e8 f2 16 00 00       	call   35e7 <chdir>
    1ef5:	83 c4 10             	add    $0x10,%esp
    1ef8:	85 c0                	test   %eax,%eax
    1efa:	0f 84 90 02 00 00    	je     2190 <subdir+0x640>
    1f00:	83 ec 0c             	sub    $0xc,%esp
    1f03:	68 9a 41 00 00       	push   $0x419a
    1f08:	e8 ba 16 00 00       	call   35c7 <unlink>
    1f0d:	83 c4 10             	add    $0x10,%esp
    1f10:	85 c0                	test   %eax,%eax
    1f12:	0f 85 9d 00 00 00    	jne    1fb5 <subdir+0x465>
    1f18:	83 ec 0c             	sub    $0xc,%esp
    1f1b:	68 39 41 00 00       	push   $0x4139
    1f20:	e8 a2 16 00 00       	call   35c7 <unlink>
    1f25:	83 c4 10             	add    $0x10,%esp
    1f28:	85 c0                	test   %eax,%eax
    1f2a:	0f 85 4d 02 00 00    	jne    217d <subdir+0x62d>
    1f30:	83 ec 0c             	sub    $0xc,%esp
    1f33:	68 00 42 00 00       	push   $0x4200
    1f38:	e8 8a 16 00 00       	call   35c7 <unlink>
    1f3d:	83 c4 10             	add    $0x10,%esp
    1f40:	85 c0                	test   %eax,%eax
    1f42:	0f 84 22 02 00 00    	je     216a <subdir+0x61a>
    1f48:	83 ec 0c             	sub    $0xc,%esp
    1f4b:	68 15 41 00 00       	push   $0x4115
    1f50:	e8 72 16 00 00       	call   35c7 <unlink>
    1f55:	83 c4 10             	add    $0x10,%esp
    1f58:	85 c0                	test   %eax,%eax
    1f5a:	0f 88 f7 01 00 00    	js     2157 <subdir+0x607>
    1f60:	83 ec 0c             	sub    $0xc,%esp
    1f63:	68 00 42 00 00       	push   $0x4200
    1f68:	e8 5a 16 00 00       	call   35c7 <unlink>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 88 cc 01 00 00    	js     2144 <subdir+0x5f4>
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 e2 43 00 00       	push   $0x43e2
    1f80:	6a 01                	push   $0x1
    1f82:	e8 25 17 00 00       	call   36ac <printf>
    1f87:	83 c4 10             	add    $0x10,%esp
    1f8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f8d:	c9                   	leave  
    1f8e:	c3                   	ret    
    1f8f:	51                   	push   %ecx
    1f90:	51                   	push   %ecx
    1f91:	68 7f 41 00 00       	push   $0x417f
    1f96:	6a 01                	push   $0x1
    1f98:	e8 0f 17 00 00       	call   36ac <printf>
    1f9d:	e8 d5 15 00 00       	call   3577 <exit>
    1fa2:	50                   	push   %eax
    1fa3:	50                   	push   %eax
    1fa4:	68 da 41 00 00       	push   $0x41da
    1fa9:	6a 01                	push   $0x1
    1fab:	e8 fc 16 00 00       	call   36ac <printf>
    1fb0:	e8 c2 15 00 00       	call   3577 <exit>
    1fb5:	51                   	push   %ecx
    1fb6:	51                   	push   %ecx
    1fb7:	68 a5 41 00 00       	push   $0x41a5
    1fbc:	6a 01                	push   $0x1
    1fbe:	e8 e9 16 00 00       	call   36ac <printf>
    1fc3:	e8 af 15 00 00       	call   3577 <exit>
    1fc8:	51                   	push   %ecx
    1fc9:	51                   	push   %ecx
    1fca:	68 57 42 00 00       	push   $0x4257
    1fcf:	6a 01                	push   $0x1
    1fd1:	e8 d6 16 00 00       	call   36ac <printf>
    1fd6:	e8 9c 15 00 00       	call   3577 <exit>
    1fdb:	53                   	push   %ebx
    1fdc:	53                   	push   %ebx
    1fdd:	68 3c 4c 00 00       	push   $0x4c3c
    1fe2:	6a 01                	push   $0x1
    1fe4:	e8 c3 16 00 00       	call   36ac <printf>
    1fe9:	e8 89 15 00 00       	call   3577 <exit>
    1fee:	51                   	push   %ecx
    1fef:	51                   	push   %ecx
    1ff0:	68 eb 42 00 00       	push   $0x42eb
    1ff5:	6a 01                	push   $0x1
    1ff7:	e8 b0 16 00 00       	call   36ac <printf>
    1ffc:	e8 76 15 00 00       	call   3577 <exit>
    2001:	53                   	push   %ebx
    2002:	53                   	push   %ebx
    2003:	68 ac 4c 00 00       	push   $0x4cac
    2008:	6a 01                	push   $0x1
    200a:	e8 9d 16 00 00       	call   36ac <printf>
    200f:	e8 63 15 00 00       	call   3577 <exit>
    2014:	50                   	push   %eax
    2015:	50                   	push   %eax
    2016:	68 66 41 00 00       	push   $0x4166
    201b:	6a 01                	push   $0x1
    201d:	e8 8a 16 00 00       	call   36ac <printf>
    2022:	e8 50 15 00 00       	call   3577 <exit>
    2027:	51                   	push   %ecx
    2028:	51                   	push   %ecx
    2029:	68 3f 41 00 00       	push   $0x413f
    202e:	6a 01                	push   $0x1
    2030:	e8 77 16 00 00       	call   36ac <printf>
    2035:	e8 3d 15 00 00       	call   3577 <exit>
    203a:	50                   	push   %eax
    203b:	50                   	push   %eax
    203c:	68 08 42 00 00       	push   $0x4208
    2041:	6a 01                	push   $0x1
    2043:	e8 64 16 00 00       	call   36ac <printf>
    2048:	e8 2a 15 00 00       	call   3577 <exit>
    204d:	53                   	push   %ebx
    204e:	53                   	push   %ebx
    204f:	68 f4 4b 00 00       	push   $0x4bf4
    2054:	6a 01                	push   $0x1
    2056:	e8 51 16 00 00       	call   36ac <printf>
    205b:	e8 17 15 00 00       	call   3577 <exit>
    2060:	50                   	push   %eax
    2061:	50                   	push   %eax
    2062:	68 88 4c 00 00       	push   $0x4c88
    2067:	6a 01                	push   $0x1
    2069:	e8 3e 16 00 00       	call   36ac <printf>
    206e:	e8 04 15 00 00       	call   3577 <exit>
    2073:	50                   	push   %eax
    2074:	50                   	push   %eax
    2075:	68 64 4c 00 00       	push   $0x4c64
    207a:	6a 01                	push   $0x1
    207c:	e8 2b 16 00 00       	call   36ac <printf>
    2081:	e8 f1 14 00 00       	call   3577 <exit>
    2086:	50                   	push   %eax
    2087:	50                   	push   %eax
    2088:	68 c7 42 00 00       	push   $0x42c7
    208d:	6a 01                	push   $0x1
    208f:	e8 18 16 00 00       	call   36ac <printf>
    2094:	e8 de 14 00 00       	call   3577 <exit>
    2099:	50                   	push   %eax
    209a:	50                   	push   %eax
    209b:	68 ae 42 00 00       	push   $0x42ae
    20a0:	6a 01                	push   $0x1
    20a2:	e8 05 16 00 00       	call   36ac <printf>
    20a7:	e8 cb 14 00 00       	call   3577 <exit>
    20ac:	50                   	push   %eax
    20ad:	50                   	push   %eax
    20ae:	68 98 42 00 00       	push   $0x4298
    20b3:	6a 01                	push   $0x1
    20b5:	e8 f2 15 00 00       	call   36ac <printf>
    20ba:	e8 b8 14 00 00       	call   3577 <exit>
    20bf:	52                   	push   %edx
    20c0:	52                   	push   %edx
    20c1:	68 7c 42 00 00       	push   $0x427c
    20c6:	6a 01                	push   $0x1
    20c8:	e8 df 15 00 00       	call   36ac <printf>
    20cd:	e8 a5 14 00 00       	call   3577 <exit>
    20d2:	50                   	push   %eax
    20d3:	50                   	push   %eax
    20d4:	68 bd 41 00 00       	push   $0x41bd
    20d9:	6a 01                	push   $0x1
    20db:	e8 cc 15 00 00       	call   36ac <printf>
    20e0:	e8 92 14 00 00       	call   3577 <exit>
    20e5:	52                   	push   %edx
    20e6:	52                   	push   %edx
    20e7:	68 18 4c 00 00       	push   $0x4c18
    20ec:	6a 01                	push   $0x1
    20ee:	e8 b9 15 00 00       	call   36ac <printf>
    20f3:	e8 7f 14 00 00       	call   3577 <exit>
    20f8:	53                   	push   %ebx
    20f9:	53                   	push   %ebx
    20fa:	68 1b 41 00 00       	push   $0x411b
    20ff:	6a 01                	push   $0x1
    2101:	e8 a6 15 00 00       	call   36ac <printf>
    2106:	e8 6c 14 00 00       	call   3577 <exit>
    210b:	50                   	push   %eax
    210c:	50                   	push   %eax
    210d:	68 cc 4b 00 00       	push   $0x4bcc
    2112:	6a 01                	push   $0x1
    2114:	e8 93 15 00 00       	call   36ac <printf>
    2119:	e8 59 14 00 00       	call   3577 <exit>
    211e:	50                   	push   %eax
    211f:	50                   	push   %eax
    2120:	68 ff 40 00 00       	push   $0x40ff
    2125:	6a 01                	push   $0x1
    2127:	e8 80 15 00 00       	call   36ac <printf>
    212c:	e8 46 14 00 00       	call   3577 <exit>
    2131:	50                   	push   %eax
    2132:	50                   	push   %eax
    2133:	68 e7 40 00 00       	push   $0x40e7
    2138:	6a 01                	push   $0x1
    213a:	e8 6d 15 00 00       	call   36ac <printf>
    213f:	e8 33 14 00 00       	call   3577 <exit>
    2144:	50                   	push   %eax
    2145:	50                   	push   %eax
    2146:	68 d0 43 00 00       	push   $0x43d0
    214b:	6a 01                	push   $0x1
    214d:	e8 5a 15 00 00       	call   36ac <printf>
    2152:	e8 20 14 00 00       	call   3577 <exit>
    2157:	52                   	push   %edx
    2158:	52                   	push   %edx
    2159:	68 bb 43 00 00       	push   $0x43bb
    215e:	6a 01                	push   $0x1
    2160:	e8 47 15 00 00       	call   36ac <printf>
    2165:	e8 0d 14 00 00       	call   3577 <exit>
    216a:	51                   	push   %ecx
    216b:	51                   	push   %ecx
    216c:	68 d0 4c 00 00       	push   $0x4cd0
    2171:	6a 01                	push   $0x1
    2173:	e8 34 15 00 00       	call   36ac <printf>
    2178:	e8 fa 13 00 00       	call   3577 <exit>
    217d:	53                   	push   %ebx
    217e:	53                   	push   %ebx
    217f:	68 a6 43 00 00       	push   $0x43a6
    2184:	6a 01                	push   $0x1
    2186:	e8 21 15 00 00       	call   36ac <printf>
    218b:	e8 e7 13 00 00       	call   3577 <exit>
    2190:	50                   	push   %eax
    2191:	50                   	push   %eax
    2192:	68 8e 43 00 00       	push   $0x438e
    2197:	6a 01                	push   $0x1
    2199:	e8 0e 15 00 00       	call   36ac <printf>
    219e:	e8 d4 13 00 00       	call   3577 <exit>
    21a3:	50                   	push   %eax
    21a4:	50                   	push   %eax
    21a5:	68 76 43 00 00       	push   $0x4376
    21aa:	6a 01                	push   $0x1
    21ac:	e8 fb 14 00 00       	call   36ac <printf>
    21b1:	e8 c1 13 00 00       	call   3577 <exit>
    21b6:	50                   	push   %eax
    21b7:	50                   	push   %eax
    21b8:	68 5a 43 00 00       	push   $0x435a
    21bd:	6a 01                	push   $0x1
    21bf:	e8 e8 14 00 00       	call   36ac <printf>
    21c4:	e8 ae 13 00 00       	call   3577 <exit>
    21c9:	50                   	push   %eax
    21ca:	50                   	push   %eax
    21cb:	68 3e 43 00 00       	push   $0x433e
    21d0:	6a 01                	push   $0x1
    21d2:	e8 d5 14 00 00       	call   36ac <printf>
    21d7:	e8 9b 13 00 00       	call   3577 <exit>
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 21 43 00 00       	push   $0x4321
    21e3:	6a 01                	push   $0x1
    21e5:	e8 c2 14 00 00       	call   36ac <printf>
    21ea:	e8 88 13 00 00       	call   3577 <exit>
    21ef:	52                   	push   %edx
    21f0:	52                   	push   %edx
    21f1:	68 06 43 00 00       	push   $0x4306
    21f6:	6a 01                	push   $0x1
    21f8:	e8 af 14 00 00       	call   36ac <printf>
    21fd:	e8 75 13 00 00       	call   3577 <exit>
    2202:	51                   	push   %ecx
    2203:	51                   	push   %ecx
    2204:	68 33 42 00 00       	push   $0x4233
    2209:	6a 01                	push   $0x1
    220b:	e8 9c 14 00 00       	call   36ac <printf>
    2210:	e8 62 13 00 00       	call   3577 <exit>
    2215:	50                   	push   %eax
    2216:	50                   	push   %eax
    2217:	68 1b 42 00 00       	push   $0x421b
    221c:	6a 01                	push   $0x1
    221e:	e8 89 14 00 00       	call   36ac <printf>
    2223:	e8 4f 13 00 00       	call   3577 <exit>

00002228 <bigwrite>:
    2228:	55                   	push   %ebp
    2229:	89 e5                	mov    %esp,%ebp
    222b:	56                   	push   %esi
    222c:	53                   	push   %ebx
    222d:	83 ec 08             	sub    $0x8,%esp
    2230:	68 ed 43 00 00       	push   $0x43ed
    2235:	6a 01                	push   $0x1
    2237:	e8 70 14 00 00       	call   36ac <printf>
    223c:	c7 04 24 fc 43 00 00 	movl   $0x43fc,(%esp)
    2243:	e8 7f 13 00 00       	call   35c7 <unlink>
    2248:	83 c4 10             	add    $0x10,%esp
    224b:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    2250:	83 ec 08             	sub    $0x8,%esp
    2253:	68 02 02 00 00       	push   $0x202
    2258:	68 fc 43 00 00       	push   $0x43fc
    225d:	e8 55 13 00 00       	call   35b7 <open>
    2262:	89 c6                	mov    %eax,%esi
    2264:	83 c4 10             	add    $0x10,%esp
    2267:	85 c0                	test   %eax,%eax
    2269:	78 7a                	js     22e5 <bigwrite+0xbd>
    226b:	52                   	push   %edx
    226c:	53                   	push   %ebx
    226d:	68 00 79 00 00       	push   $0x7900
    2272:	50                   	push   %eax
    2273:	e8 1f 13 00 00       	call   3597 <write>
    2278:	83 c4 10             	add    $0x10,%esp
    227b:	39 d8                	cmp    %ebx,%eax
    227d:	75 53                	jne    22d2 <bigwrite+0xaa>
    227f:	50                   	push   %eax
    2280:	53                   	push   %ebx
    2281:	68 00 79 00 00       	push   $0x7900
    2286:	56                   	push   %esi
    2287:	e8 0b 13 00 00       	call   3597 <write>
    228c:	83 c4 10             	add    $0x10,%esp
    228f:	39 c3                	cmp    %eax,%ebx
    2291:	75 3f                	jne    22d2 <bigwrite+0xaa>
    2293:	83 ec 0c             	sub    $0xc,%esp
    2296:	56                   	push   %esi
    2297:	e8 03 13 00 00       	call   359f <close>
    229c:	c7 04 24 fc 43 00 00 	movl   $0x43fc,(%esp)
    22a3:	e8 1f 13 00 00       	call   35c7 <unlink>
    22a8:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    22ae:	83 c4 10             	add    $0x10,%esp
    22b1:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    22b7:	75 97                	jne    2250 <bigwrite+0x28>
    22b9:	83 ec 08             	sub    $0x8,%esp
    22bc:	68 2f 44 00 00       	push   $0x442f
    22c1:	6a 01                	push   $0x1
    22c3:	e8 e4 13 00 00       	call   36ac <printf>
    22c8:	83 c4 10             	add    $0x10,%esp
    22cb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    22ce:	5b                   	pop    %ebx
    22cf:	5e                   	pop    %esi
    22d0:	5d                   	pop    %ebp
    22d1:	c3                   	ret    
    22d2:	50                   	push   %eax
    22d3:	53                   	push   %ebx
    22d4:	68 1d 44 00 00       	push   $0x441d
    22d9:	6a 01                	push   $0x1
    22db:	e8 cc 13 00 00       	call   36ac <printf>
    22e0:	e8 92 12 00 00       	call   3577 <exit>
    22e5:	83 ec 08             	sub    $0x8,%esp
    22e8:	68 05 44 00 00       	push   $0x4405
    22ed:	6a 01                	push   $0x1
    22ef:	e8 b8 13 00 00       	call   36ac <printf>
    22f4:	e8 7e 12 00 00       	call   3577 <exit>
    22f9:	8d 76 00             	lea    0x0(%esi),%esi

000022fc <bigfile>:
    22fc:	55                   	push   %ebp
    22fd:	89 e5                	mov    %esp,%ebp
    22ff:	57                   	push   %edi
    2300:	56                   	push   %esi
    2301:	53                   	push   %ebx
    2302:	83 ec 14             	sub    $0x14,%esp
    2305:	68 3c 44 00 00       	push   $0x443c
    230a:	6a 01                	push   $0x1
    230c:	e8 9b 13 00 00       	call   36ac <printf>
    2311:	c7 04 24 58 44 00 00 	movl   $0x4458,(%esp)
    2318:	e8 aa 12 00 00       	call   35c7 <unlink>
    231d:	5e                   	pop    %esi
    231e:	5f                   	pop    %edi
    231f:	68 02 02 00 00       	push   $0x202
    2324:	68 58 44 00 00       	push   $0x4458
    2329:	e8 89 12 00 00       	call   35b7 <open>
    232e:	83 c4 10             	add    $0x10,%esp
    2331:	85 c0                	test   %eax,%eax
    2333:	0f 88 52 01 00 00    	js     248b <bigfile+0x18f>
    2339:	89 c6                	mov    %eax,%esi
    233b:	31 db                	xor    %ebx,%ebx
    233d:	8d 76 00             	lea    0x0(%esi),%esi
    2340:	51                   	push   %ecx
    2341:	68 58 02 00 00       	push   $0x258
    2346:	53                   	push   %ebx
    2347:	68 00 79 00 00       	push   $0x7900
    234c:	e8 ef 10 00 00       	call   3440 <memset>
    2351:	83 c4 0c             	add    $0xc,%esp
    2354:	68 58 02 00 00       	push   $0x258
    2359:	68 00 79 00 00       	push   $0x7900
    235e:	56                   	push   %esi
    235f:	e8 33 12 00 00       	call   3597 <write>
    2364:	83 c4 10             	add    $0x10,%esp
    2367:	3d 58 02 00 00       	cmp    $0x258,%eax
    236c:	0f 85 f2 00 00 00    	jne    2464 <bigfile+0x168>
    2372:	43                   	inc    %ebx
    2373:	83 fb 14             	cmp    $0x14,%ebx
    2376:	75 c8                	jne    2340 <bigfile+0x44>
    2378:	83 ec 0c             	sub    $0xc,%esp
    237b:	56                   	push   %esi
    237c:	e8 1e 12 00 00       	call   359f <close>
    2381:	58                   	pop    %eax
    2382:	5a                   	pop    %edx
    2383:	6a 00                	push   $0x0
    2385:	68 58 44 00 00       	push   $0x4458
    238a:	e8 28 12 00 00       	call   35b7 <open>
    238f:	89 c7                	mov    %eax,%edi
    2391:	83 c4 10             	add    $0x10,%esp
    2394:	85 c0                	test   %eax,%eax
    2396:	0f 88 dc 00 00 00    	js     2478 <bigfile+0x17c>
    239c:	31 f6                	xor    %esi,%esi
    239e:	31 db                	xor    %ebx,%ebx
    23a0:	eb 2e                	jmp    23d0 <bigfile+0xd4>
    23a2:	66 90                	xchg   %ax,%ax
    23a4:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    23a9:	0f 85 8d 00 00 00    	jne    243c <bigfile+0x140>
    23af:	89 da                	mov    %ebx,%edx
    23b1:	d1 fa                	sar    %edx
    23b3:	0f be 05 00 79 00 00 	movsbl 0x7900,%eax
    23ba:	39 d0                	cmp    %edx,%eax
    23bc:	75 6a                	jne    2428 <bigfile+0x12c>
    23be:	0f be 15 2b 7a 00 00 	movsbl 0x7a2b,%edx
    23c5:	39 d0                	cmp    %edx,%eax
    23c7:	75 5f                	jne    2428 <bigfile+0x12c>
    23c9:	81 c6 2c 01 00 00    	add    $0x12c,%esi
    23cf:	43                   	inc    %ebx
    23d0:	50                   	push   %eax
    23d1:	68 2c 01 00 00       	push   $0x12c
    23d6:	68 00 79 00 00       	push   $0x7900
    23db:	57                   	push   %edi
    23dc:	e8 ae 11 00 00       	call   358f <read>
    23e1:	83 c4 10             	add    $0x10,%esp
    23e4:	85 c0                	test   %eax,%eax
    23e6:	78 68                	js     2450 <bigfile+0x154>
    23e8:	75 ba                	jne    23a4 <bigfile+0xa8>
    23ea:	83 ec 0c             	sub    $0xc,%esp
    23ed:	57                   	push   %edi
    23ee:	e8 ac 11 00 00       	call   359f <close>
    23f3:	83 c4 10             	add    $0x10,%esp
    23f6:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    23fc:	0f 85 9c 00 00 00    	jne    249e <bigfile+0x1a2>
    2402:	83 ec 0c             	sub    $0xc,%esp
    2405:	68 58 44 00 00       	push   $0x4458
    240a:	e8 b8 11 00 00       	call   35c7 <unlink>
    240f:	58                   	pop    %eax
    2410:	5a                   	pop    %edx
    2411:	68 e7 44 00 00       	push   $0x44e7
    2416:	6a 01                	push   $0x1
    2418:	e8 8f 12 00 00       	call   36ac <printf>
    241d:	83 c4 10             	add    $0x10,%esp
    2420:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2423:	5b                   	pop    %ebx
    2424:	5e                   	pop    %esi
    2425:	5f                   	pop    %edi
    2426:	5d                   	pop    %ebp
    2427:	c3                   	ret    
    2428:	83 ec 08             	sub    $0x8,%esp
    242b:	68 b4 44 00 00       	push   $0x44b4
    2430:	6a 01                	push   $0x1
    2432:	e8 75 12 00 00       	call   36ac <printf>
    2437:	e8 3b 11 00 00       	call   3577 <exit>
    243c:	83 ec 08             	sub    $0x8,%esp
    243f:	68 a0 44 00 00       	push   $0x44a0
    2444:	6a 01                	push   $0x1
    2446:	e8 61 12 00 00       	call   36ac <printf>
    244b:	e8 27 11 00 00       	call   3577 <exit>
    2450:	83 ec 08             	sub    $0x8,%esp
    2453:	68 8b 44 00 00       	push   $0x448b
    2458:	6a 01                	push   $0x1
    245a:	e8 4d 12 00 00       	call   36ac <printf>
    245f:	e8 13 11 00 00       	call   3577 <exit>
    2464:	83 ec 08             	sub    $0x8,%esp
    2467:	68 60 44 00 00       	push   $0x4460
    246c:	6a 01                	push   $0x1
    246e:	e8 39 12 00 00       	call   36ac <printf>
    2473:	e8 ff 10 00 00       	call   3577 <exit>
    2478:	50                   	push   %eax
    2479:	50                   	push   %eax
    247a:	68 76 44 00 00       	push   $0x4476
    247f:	6a 01                	push   $0x1
    2481:	e8 26 12 00 00       	call   36ac <printf>
    2486:	e8 ec 10 00 00       	call   3577 <exit>
    248b:	53                   	push   %ebx
    248c:	53                   	push   %ebx
    248d:	68 4a 44 00 00       	push   $0x444a
    2492:	6a 01                	push   $0x1
    2494:	e8 13 12 00 00       	call   36ac <printf>
    2499:	e8 d9 10 00 00       	call   3577 <exit>
    249e:	51                   	push   %ecx
    249f:	51                   	push   %ecx
    24a0:	68 cd 44 00 00       	push   $0x44cd
    24a5:	6a 01                	push   $0x1
    24a7:	e8 00 12 00 00       	call   36ac <printf>
    24ac:	e8 c6 10 00 00       	call   3577 <exit>
    24b1:	8d 76 00             	lea    0x0(%esi),%esi

000024b4 <fourteen>:
    24b4:	55                   	push   %ebp
    24b5:	89 e5                	mov    %esp,%ebp
    24b7:	83 ec 10             	sub    $0x10,%esp
    24ba:	68 f8 44 00 00       	push   $0x44f8
    24bf:	6a 01                	push   $0x1
    24c1:	e8 e6 11 00 00       	call   36ac <printf>
    24c6:	c7 04 24 33 45 00 00 	movl   $0x4533,(%esp)
    24cd:	e8 0d 11 00 00       	call   35df <mkdir>
    24d2:	83 c4 10             	add    $0x10,%esp
    24d5:	85 c0                	test   %eax,%eax
    24d7:	0f 85 97 00 00 00    	jne    2574 <fourteen+0xc0>
    24dd:	83 ec 0c             	sub    $0xc,%esp
    24e0:	68 f0 4c 00 00       	push   $0x4cf0
    24e5:	e8 f5 10 00 00       	call   35df <mkdir>
    24ea:	83 c4 10             	add    $0x10,%esp
    24ed:	85 c0                	test   %eax,%eax
    24ef:	0f 85 de 00 00 00    	jne    25d3 <fourteen+0x11f>
    24f5:	83 ec 08             	sub    $0x8,%esp
    24f8:	68 00 02 00 00       	push   $0x200
    24fd:	68 40 4d 00 00       	push   $0x4d40
    2502:	e8 b0 10 00 00       	call   35b7 <open>
    2507:	83 c4 10             	add    $0x10,%esp
    250a:	85 c0                	test   %eax,%eax
    250c:	0f 88 ae 00 00 00    	js     25c0 <fourteen+0x10c>
    2512:	83 ec 0c             	sub    $0xc,%esp
    2515:	50                   	push   %eax
    2516:	e8 84 10 00 00       	call   359f <close>
    251b:	58                   	pop    %eax
    251c:	5a                   	pop    %edx
    251d:	6a 00                	push   $0x0
    251f:	68 b0 4d 00 00       	push   $0x4db0
    2524:	e8 8e 10 00 00       	call   35b7 <open>
    2529:	83 c4 10             	add    $0x10,%esp
    252c:	85 c0                	test   %eax,%eax
    252e:	78 7d                	js     25ad <fourteen+0xf9>
    2530:	83 ec 0c             	sub    $0xc,%esp
    2533:	50                   	push   %eax
    2534:	e8 66 10 00 00       	call   359f <close>
    2539:	c7 04 24 24 45 00 00 	movl   $0x4524,(%esp)
    2540:	e8 9a 10 00 00       	call   35df <mkdir>
    2545:	83 c4 10             	add    $0x10,%esp
    2548:	85 c0                	test   %eax,%eax
    254a:	74 4e                	je     259a <fourteen+0xe6>
    254c:	83 ec 0c             	sub    $0xc,%esp
    254f:	68 4c 4e 00 00       	push   $0x4e4c
    2554:	e8 86 10 00 00       	call   35df <mkdir>
    2559:	83 c4 10             	add    $0x10,%esp
    255c:	85 c0                	test   %eax,%eax
    255e:	74 27                	je     2587 <fourteen+0xd3>
    2560:	83 ec 08             	sub    $0x8,%esp
    2563:	68 42 45 00 00       	push   $0x4542
    2568:	6a 01                	push   $0x1
    256a:	e8 3d 11 00 00       	call   36ac <printf>
    256f:	83 c4 10             	add    $0x10,%esp
    2572:	c9                   	leave  
    2573:	c3                   	ret    
    2574:	50                   	push   %eax
    2575:	50                   	push   %eax
    2576:	68 07 45 00 00       	push   $0x4507
    257b:	6a 01                	push   $0x1
    257d:	e8 2a 11 00 00       	call   36ac <printf>
    2582:	e8 f0 0f 00 00       	call   3577 <exit>
    2587:	50                   	push   %eax
    2588:	50                   	push   %eax
    2589:	68 6c 4e 00 00       	push   $0x4e6c
    258e:	6a 01                	push   $0x1
    2590:	e8 17 11 00 00       	call   36ac <printf>
    2595:	e8 dd 0f 00 00       	call   3577 <exit>
    259a:	52                   	push   %edx
    259b:	52                   	push   %edx
    259c:	68 1c 4e 00 00       	push   $0x4e1c
    25a1:	6a 01                	push   $0x1
    25a3:	e8 04 11 00 00       	call   36ac <printf>
    25a8:	e8 ca 0f 00 00       	call   3577 <exit>
    25ad:	51                   	push   %ecx
    25ae:	51                   	push   %ecx
    25af:	68 e0 4d 00 00       	push   $0x4de0
    25b4:	6a 01                	push   $0x1
    25b6:	e8 f1 10 00 00       	call   36ac <printf>
    25bb:	e8 b7 0f 00 00       	call   3577 <exit>
    25c0:	51                   	push   %ecx
    25c1:	51                   	push   %ecx
    25c2:	68 70 4d 00 00       	push   $0x4d70
    25c7:	6a 01                	push   $0x1
    25c9:	e8 de 10 00 00       	call   36ac <printf>
    25ce:	e8 a4 0f 00 00       	call   3577 <exit>
    25d3:	50                   	push   %eax
    25d4:	50                   	push   %eax
    25d5:	68 10 4d 00 00       	push   $0x4d10
    25da:	6a 01                	push   $0x1
    25dc:	e8 cb 10 00 00       	call   36ac <printf>
    25e1:	e8 91 0f 00 00       	call   3577 <exit>
    25e6:	66 90                	xchg   %ax,%ax

000025e8 <rmdot>:
    25e8:	55                   	push   %ebp
    25e9:	89 e5                	mov    %esp,%ebp
    25eb:	83 ec 10             	sub    $0x10,%esp
    25ee:	68 4f 45 00 00       	push   $0x454f
    25f3:	6a 01                	push   $0x1
    25f5:	e8 b2 10 00 00       	call   36ac <printf>
    25fa:	c7 04 24 5b 45 00 00 	movl   $0x455b,(%esp)
    2601:	e8 d9 0f 00 00       	call   35df <mkdir>
    2606:	83 c4 10             	add    $0x10,%esp
    2609:	85 c0                	test   %eax,%eax
    260b:	0f 85 b0 00 00 00    	jne    26c1 <rmdot+0xd9>
    2611:	83 ec 0c             	sub    $0xc,%esp
    2614:	68 5b 45 00 00       	push   $0x455b
    2619:	e8 c9 0f 00 00       	call   35e7 <chdir>
    261e:	83 c4 10             	add    $0x10,%esp
    2621:	85 c0                	test   %eax,%eax
    2623:	0f 85 1d 01 00 00    	jne    2746 <rmdot+0x15e>
    2629:	83 ec 0c             	sub    $0xc,%esp
    262c:	68 06 42 00 00       	push   $0x4206
    2631:	e8 91 0f 00 00       	call   35c7 <unlink>
    2636:	83 c4 10             	add    $0x10,%esp
    2639:	85 c0                	test   %eax,%eax
    263b:	0f 84 f2 00 00 00    	je     2733 <rmdot+0x14b>
    2641:	83 ec 0c             	sub    $0xc,%esp
    2644:	68 05 42 00 00       	push   $0x4205
    2649:	e8 79 0f 00 00       	call   35c7 <unlink>
    264e:	83 c4 10             	add    $0x10,%esp
    2651:	85 c0                	test   %eax,%eax
    2653:	0f 84 c7 00 00 00    	je     2720 <rmdot+0x138>
    2659:	83 ec 0c             	sub    $0xc,%esp
    265c:	68 d9 39 00 00       	push   $0x39d9
    2661:	e8 81 0f 00 00       	call   35e7 <chdir>
    2666:	83 c4 10             	add    $0x10,%esp
    2669:	85 c0                	test   %eax,%eax
    266b:	0f 85 9c 00 00 00    	jne    270d <rmdot+0x125>
    2671:	83 ec 0c             	sub    $0xc,%esp
    2674:	68 a3 45 00 00       	push   $0x45a3
    2679:	e8 49 0f 00 00       	call   35c7 <unlink>
    267e:	83 c4 10             	add    $0x10,%esp
    2681:	85 c0                	test   %eax,%eax
    2683:	74 75                	je     26fa <rmdot+0x112>
    2685:	83 ec 0c             	sub    $0xc,%esp
    2688:	68 c1 45 00 00       	push   $0x45c1
    268d:	e8 35 0f 00 00       	call   35c7 <unlink>
    2692:	83 c4 10             	add    $0x10,%esp
    2695:	85 c0                	test   %eax,%eax
    2697:	74 4e                	je     26e7 <rmdot+0xff>
    2699:	83 ec 0c             	sub    $0xc,%esp
    269c:	68 5b 45 00 00       	push   $0x455b
    26a1:	e8 21 0f 00 00       	call   35c7 <unlink>
    26a6:	83 c4 10             	add    $0x10,%esp
    26a9:	85 c0                	test   %eax,%eax
    26ab:	75 27                	jne    26d4 <rmdot+0xec>
    26ad:	83 ec 08             	sub    $0x8,%esp
    26b0:	68 f6 45 00 00       	push   $0x45f6
    26b5:	6a 01                	push   $0x1
    26b7:	e8 f0 0f 00 00       	call   36ac <printf>
    26bc:	83 c4 10             	add    $0x10,%esp
    26bf:	c9                   	leave  
    26c0:	c3                   	ret    
    26c1:	50                   	push   %eax
    26c2:	50                   	push   %eax
    26c3:	68 60 45 00 00       	push   $0x4560
    26c8:	6a 01                	push   $0x1
    26ca:	e8 dd 0f 00 00       	call   36ac <printf>
    26cf:	e8 a3 0e 00 00       	call   3577 <exit>
    26d4:	50                   	push   %eax
    26d5:	50                   	push   %eax
    26d6:	68 e1 45 00 00       	push   $0x45e1
    26db:	6a 01                	push   $0x1
    26dd:	e8 ca 0f 00 00       	call   36ac <printf>
    26e2:	e8 90 0e 00 00       	call   3577 <exit>
    26e7:	52                   	push   %edx
    26e8:	52                   	push   %edx
    26e9:	68 c9 45 00 00       	push   $0x45c9
    26ee:	6a 01                	push   $0x1
    26f0:	e8 b7 0f 00 00       	call   36ac <printf>
    26f5:	e8 7d 0e 00 00       	call   3577 <exit>
    26fa:	51                   	push   %ecx
    26fb:	51                   	push   %ecx
    26fc:	68 aa 45 00 00       	push   $0x45aa
    2701:	6a 01                	push   $0x1
    2703:	e8 a4 0f 00 00       	call   36ac <printf>
    2708:	e8 6a 0e 00 00       	call   3577 <exit>
    270d:	50                   	push   %eax
    270e:	50                   	push   %eax
    270f:	68 db 39 00 00       	push   $0x39db
    2714:	6a 01                	push   $0x1
    2716:	e8 91 0f 00 00       	call   36ac <printf>
    271b:	e8 57 0e 00 00       	call   3577 <exit>
    2720:	50                   	push   %eax
    2721:	50                   	push   %eax
    2722:	68 94 45 00 00       	push   $0x4594
    2727:	6a 01                	push   $0x1
    2729:	e8 7e 0f 00 00       	call   36ac <printf>
    272e:	e8 44 0e 00 00       	call   3577 <exit>
    2733:	50                   	push   %eax
    2734:	50                   	push   %eax
    2735:	68 86 45 00 00       	push   $0x4586
    273a:	6a 01                	push   $0x1
    273c:	e8 6b 0f 00 00       	call   36ac <printf>
    2741:	e8 31 0e 00 00       	call   3577 <exit>
    2746:	50                   	push   %eax
    2747:	50                   	push   %eax
    2748:	68 73 45 00 00       	push   $0x4573
    274d:	6a 01                	push   $0x1
    274f:	e8 58 0f 00 00       	call   36ac <printf>
    2754:	e8 1e 0e 00 00       	call   3577 <exit>
    2759:	8d 76 00             	lea    0x0(%esi),%esi

0000275c <dirfile>:
    275c:	55                   	push   %ebp
    275d:	89 e5                	mov    %esp,%ebp
    275f:	53                   	push   %ebx
    2760:	83 ec 0c             	sub    $0xc,%esp
    2763:	68 00 46 00 00       	push   $0x4600
    2768:	6a 01                	push   $0x1
    276a:	e8 3d 0f 00 00       	call   36ac <printf>
    276f:	5b                   	pop    %ebx
    2770:	58                   	pop    %eax
    2771:	68 00 02 00 00       	push   $0x200
    2776:	68 0d 46 00 00       	push   $0x460d
    277b:	e8 37 0e 00 00       	call   35b7 <open>
    2780:	83 c4 10             	add    $0x10,%esp
    2783:	85 c0                	test   %eax,%eax
    2785:	0f 88 43 01 00 00    	js     28ce <dirfile+0x172>
    278b:	83 ec 0c             	sub    $0xc,%esp
    278e:	50                   	push   %eax
    278f:	e8 0b 0e 00 00       	call   359f <close>
    2794:	c7 04 24 0d 46 00 00 	movl   $0x460d,(%esp)
    279b:	e8 47 0e 00 00       	call   35e7 <chdir>
    27a0:	83 c4 10             	add    $0x10,%esp
    27a3:	85 c0                	test   %eax,%eax
    27a5:	0f 84 10 01 00 00    	je     28bb <dirfile+0x15f>
    27ab:	83 ec 08             	sub    $0x8,%esp
    27ae:	6a 00                	push   $0x0
    27b0:	68 46 46 00 00       	push   $0x4646
    27b5:	e8 fd 0d 00 00       	call   35b7 <open>
    27ba:	83 c4 10             	add    $0x10,%esp
    27bd:	85 c0                	test   %eax,%eax
    27bf:	0f 89 e3 00 00 00    	jns    28a8 <dirfile+0x14c>
    27c5:	83 ec 08             	sub    $0x8,%esp
    27c8:	68 00 02 00 00       	push   $0x200
    27cd:	68 46 46 00 00       	push   $0x4646
    27d2:	e8 e0 0d 00 00       	call   35b7 <open>
    27d7:	83 c4 10             	add    $0x10,%esp
    27da:	85 c0                	test   %eax,%eax
    27dc:	0f 89 c6 00 00 00    	jns    28a8 <dirfile+0x14c>
    27e2:	83 ec 0c             	sub    $0xc,%esp
    27e5:	68 46 46 00 00       	push   $0x4646
    27ea:	e8 f0 0d 00 00       	call   35df <mkdir>
    27ef:	83 c4 10             	add    $0x10,%esp
    27f2:	85 c0                	test   %eax,%eax
    27f4:	0f 84 46 01 00 00    	je     2940 <dirfile+0x1e4>
    27fa:	83 ec 0c             	sub    $0xc,%esp
    27fd:	68 46 46 00 00       	push   $0x4646
    2802:	e8 c0 0d 00 00       	call   35c7 <unlink>
    2807:	83 c4 10             	add    $0x10,%esp
    280a:	85 c0                	test   %eax,%eax
    280c:	0f 84 1b 01 00 00    	je     292d <dirfile+0x1d1>
    2812:	83 ec 08             	sub    $0x8,%esp
    2815:	68 46 46 00 00       	push   $0x4646
    281a:	68 aa 46 00 00       	push   $0x46aa
    281f:	e8 b3 0d 00 00       	call   35d7 <link>
    2824:	83 c4 10             	add    $0x10,%esp
    2827:	85 c0                	test   %eax,%eax
    2829:	0f 84 eb 00 00 00    	je     291a <dirfile+0x1be>
    282f:	83 ec 0c             	sub    $0xc,%esp
    2832:	68 0d 46 00 00       	push   $0x460d
    2837:	e8 8b 0d 00 00       	call   35c7 <unlink>
    283c:	83 c4 10             	add    $0x10,%esp
    283f:	85 c0                	test   %eax,%eax
    2841:	0f 85 c0 00 00 00    	jne    2907 <dirfile+0x1ab>
    2847:	83 ec 08             	sub    $0x8,%esp
    284a:	6a 02                	push   $0x2
    284c:	68 06 42 00 00       	push   $0x4206
    2851:	e8 61 0d 00 00       	call   35b7 <open>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	85 c0                	test   %eax,%eax
    285b:	0f 89 93 00 00 00    	jns    28f4 <dirfile+0x198>
    2861:	83 ec 08             	sub    $0x8,%esp
    2864:	6a 00                	push   $0x0
    2866:	68 06 42 00 00       	push   $0x4206
    286b:	e8 47 0d 00 00       	call   35b7 <open>
    2870:	89 c3                	mov    %eax,%ebx
    2872:	83 c4 0c             	add    $0xc,%esp
    2875:	6a 01                	push   $0x1
    2877:	68 e9 42 00 00       	push   $0x42e9
    287c:	50                   	push   %eax
    287d:	e8 15 0d 00 00       	call   3597 <write>
    2882:	83 c4 10             	add    $0x10,%esp
    2885:	85 c0                	test   %eax,%eax
    2887:	7f 58                	jg     28e1 <dirfile+0x185>
    2889:	83 ec 0c             	sub    $0xc,%esp
    288c:	53                   	push   %ebx
    288d:	e8 0d 0d 00 00       	call   359f <close>
    2892:	58                   	pop    %eax
    2893:	5a                   	pop    %edx
    2894:	68 dd 46 00 00       	push   $0x46dd
    2899:	6a 01                	push   $0x1
    289b:	e8 0c 0e 00 00       	call   36ac <printf>
    28a0:	83 c4 10             	add    $0x10,%esp
    28a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28a6:	c9                   	leave  
    28a7:	c3                   	ret    
    28a8:	50                   	push   %eax
    28a9:	50                   	push   %eax
    28aa:	68 51 46 00 00       	push   $0x4651
    28af:	6a 01                	push   $0x1
    28b1:	e8 f6 0d 00 00       	call   36ac <printf>
    28b6:	e8 bc 0c 00 00       	call   3577 <exit>
    28bb:	52                   	push   %edx
    28bc:	52                   	push   %edx
    28bd:	68 2c 46 00 00       	push   $0x462c
    28c2:	6a 01                	push   $0x1
    28c4:	e8 e3 0d 00 00       	call   36ac <printf>
    28c9:	e8 a9 0c 00 00       	call   3577 <exit>
    28ce:	51                   	push   %ecx
    28cf:	51                   	push   %ecx
    28d0:	68 15 46 00 00       	push   $0x4615
    28d5:	6a 01                	push   $0x1
    28d7:	e8 d0 0d 00 00       	call   36ac <printf>
    28dc:	e8 96 0c 00 00       	call   3577 <exit>
    28e1:	51                   	push   %ecx
    28e2:	51                   	push   %ecx
    28e3:	68 c9 46 00 00       	push   $0x46c9
    28e8:	6a 01                	push   $0x1
    28ea:	e8 bd 0d 00 00       	call   36ac <printf>
    28ef:	e8 83 0c 00 00       	call   3577 <exit>
    28f4:	53                   	push   %ebx
    28f5:	53                   	push   %ebx
    28f6:	68 c0 4e 00 00       	push   $0x4ec0
    28fb:	6a 01                	push   $0x1
    28fd:	e8 aa 0d 00 00       	call   36ac <printf>
    2902:	e8 70 0c 00 00       	call   3577 <exit>
    2907:	50                   	push   %eax
    2908:	50                   	push   %eax
    2909:	68 b1 46 00 00       	push   $0x46b1
    290e:	6a 01                	push   $0x1
    2910:	e8 97 0d 00 00       	call   36ac <printf>
    2915:	e8 5d 0c 00 00       	call   3577 <exit>
    291a:	50                   	push   %eax
    291b:	50                   	push   %eax
    291c:	68 a0 4e 00 00       	push   $0x4ea0
    2921:	6a 01                	push   $0x1
    2923:	e8 84 0d 00 00       	call   36ac <printf>
    2928:	e8 4a 0c 00 00       	call   3577 <exit>
    292d:	50                   	push   %eax
    292e:	50                   	push   %eax
    292f:	68 8c 46 00 00       	push   $0x468c
    2934:	6a 01                	push   $0x1
    2936:	e8 71 0d 00 00       	call   36ac <printf>
    293b:	e8 37 0c 00 00       	call   3577 <exit>
    2940:	50                   	push   %eax
    2941:	50                   	push   %eax
    2942:	68 6f 46 00 00       	push   $0x466f
    2947:	6a 01                	push   $0x1
    2949:	e8 5e 0d 00 00       	call   36ac <printf>
    294e:	e8 24 0c 00 00       	call   3577 <exit>
    2953:	90                   	nop

00002954 <iref>:
    2954:	55                   	push   %ebp
    2955:	89 e5                	mov    %esp,%ebp
    2957:	53                   	push   %ebx
    2958:	83 ec 0c             	sub    $0xc,%esp
    295b:	68 ed 46 00 00       	push   $0x46ed
    2960:	6a 01                	push   $0x1
    2962:	e8 45 0d 00 00       	call   36ac <printf>
    2967:	83 c4 10             	add    $0x10,%esp
    296a:	bb 33 00 00 00       	mov    $0x33,%ebx
    296f:	90                   	nop
    2970:	83 ec 0c             	sub    $0xc,%esp
    2973:	68 fe 46 00 00       	push   $0x46fe
    2978:	e8 62 0c 00 00       	call   35df <mkdir>
    297d:	83 c4 10             	add    $0x10,%esp
    2980:	85 c0                	test   %eax,%eax
    2982:	0f 85 b9 00 00 00    	jne    2a41 <iref+0xed>
    2988:	83 ec 0c             	sub    $0xc,%esp
    298b:	68 fe 46 00 00       	push   $0x46fe
    2990:	e8 52 0c 00 00       	call   35e7 <chdir>
    2995:	83 c4 10             	add    $0x10,%esp
    2998:	85 c0                	test   %eax,%eax
    299a:	0f 85 b5 00 00 00    	jne    2a55 <iref+0x101>
    29a0:	83 ec 0c             	sub    $0xc,%esp
    29a3:	68 b3 3d 00 00       	push   $0x3db3
    29a8:	e8 32 0c 00 00       	call   35df <mkdir>
    29ad:	59                   	pop    %ecx
    29ae:	58                   	pop    %eax
    29af:	68 b3 3d 00 00       	push   $0x3db3
    29b4:	68 aa 46 00 00       	push   $0x46aa
    29b9:	e8 19 0c 00 00       	call   35d7 <link>
    29be:	58                   	pop    %eax
    29bf:	5a                   	pop    %edx
    29c0:	68 00 02 00 00       	push   $0x200
    29c5:	68 b3 3d 00 00       	push   $0x3db3
    29ca:	e8 e8 0b 00 00       	call   35b7 <open>
    29cf:	83 c4 10             	add    $0x10,%esp
    29d2:	85 c0                	test   %eax,%eax
    29d4:	78 0c                	js     29e2 <iref+0x8e>
    29d6:	83 ec 0c             	sub    $0xc,%esp
    29d9:	50                   	push   %eax
    29da:	e8 c0 0b 00 00       	call   359f <close>
    29df:	83 c4 10             	add    $0x10,%esp
    29e2:	83 ec 08             	sub    $0x8,%esp
    29e5:	68 00 02 00 00       	push   $0x200
    29ea:	68 e8 42 00 00       	push   $0x42e8
    29ef:	e8 c3 0b 00 00       	call   35b7 <open>
    29f4:	83 c4 10             	add    $0x10,%esp
    29f7:	85 c0                	test   %eax,%eax
    29f9:	78 0c                	js     2a07 <iref+0xb3>
    29fb:	83 ec 0c             	sub    $0xc,%esp
    29fe:	50                   	push   %eax
    29ff:	e8 9b 0b 00 00       	call   359f <close>
    2a04:	83 c4 10             	add    $0x10,%esp
    2a07:	83 ec 0c             	sub    $0xc,%esp
    2a0a:	68 e8 42 00 00       	push   $0x42e8
    2a0f:	e8 b3 0b 00 00       	call   35c7 <unlink>
    2a14:	83 c4 10             	add    $0x10,%esp
    2a17:	4b                   	dec    %ebx
    2a18:	0f 85 52 ff ff ff    	jne    2970 <iref+0x1c>
    2a1e:	83 ec 0c             	sub    $0xc,%esp
    2a21:	68 d9 39 00 00       	push   $0x39d9
    2a26:	e8 bc 0b 00 00       	call   35e7 <chdir>
    2a2b:	58                   	pop    %eax
    2a2c:	5a                   	pop    %edx
    2a2d:	68 2c 47 00 00       	push   $0x472c
    2a32:	6a 01                	push   $0x1
    2a34:	e8 73 0c 00 00       	call   36ac <printf>
    2a39:	83 c4 10             	add    $0x10,%esp
    2a3c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a3f:	c9                   	leave  
    2a40:	c3                   	ret    
    2a41:	83 ec 08             	sub    $0x8,%esp
    2a44:	68 04 47 00 00       	push   $0x4704
    2a49:	6a 01                	push   $0x1
    2a4b:	e8 5c 0c 00 00       	call   36ac <printf>
    2a50:	e8 22 0b 00 00       	call   3577 <exit>
    2a55:	83 ec 08             	sub    $0x8,%esp
    2a58:	68 18 47 00 00       	push   $0x4718
    2a5d:	6a 01                	push   $0x1
    2a5f:	e8 48 0c 00 00       	call   36ac <printf>
    2a64:	e8 0e 0b 00 00       	call   3577 <exit>
    2a69:	8d 76 00             	lea    0x0(%esi),%esi

00002a6c <forktest>:
    2a6c:	55                   	push   %ebp
    2a6d:	89 e5                	mov    %esp,%ebp
    2a6f:	53                   	push   %ebx
    2a70:	83 ec 0c             	sub    $0xc,%esp
    2a73:	68 40 47 00 00       	push   $0x4740
    2a78:	6a 01                	push   $0x1
    2a7a:	e8 2d 0c 00 00       	call   36ac <printf>
    2a7f:	83 c4 10             	add    $0x10,%esp
    2a82:	31 db                	xor    %ebx,%ebx
    2a84:	eb 0d                	jmp    2a93 <forktest+0x27>
    2a86:	66 90                	xchg   %ax,%ax
    2a88:	74 41                	je     2acb <forktest+0x5f>
    2a8a:	43                   	inc    %ebx
    2a8b:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2a91:	74 64                	je     2af7 <forktest+0x8b>
    2a93:	e8 d7 0a 00 00       	call   356f <fork>
    2a98:	85 c0                	test   %eax,%eax
    2a9a:	79 ec                	jns    2a88 <forktest+0x1c>
    2a9c:	85 db                	test   %ebx,%ebx
    2a9e:	74 0c                	je     2aac <forktest+0x40>
    2aa0:	e8 da 0a 00 00       	call   357f <wait>
    2aa5:	85 c0                	test   %eax,%eax
    2aa7:	78 27                	js     2ad0 <forktest+0x64>
    2aa9:	4b                   	dec    %ebx
    2aaa:	75 f4                	jne    2aa0 <forktest+0x34>
    2aac:	e8 ce 0a 00 00       	call   357f <wait>
    2ab1:	40                   	inc    %eax
    2ab2:	75 30                	jne    2ae4 <forktest+0x78>
    2ab4:	83 ec 08             	sub    $0x8,%esp
    2ab7:	68 72 47 00 00       	push   $0x4772
    2abc:	6a 01                	push   $0x1
    2abe:	e8 e9 0b 00 00       	call   36ac <printf>
    2ac3:	83 c4 10             	add    $0x10,%esp
    2ac6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2ac9:	c9                   	leave  
    2aca:	c3                   	ret    
    2acb:	e8 a7 0a 00 00       	call   3577 <exit>
    2ad0:	83 ec 08             	sub    $0x8,%esp
    2ad3:	68 4b 47 00 00       	push   $0x474b
    2ad8:	6a 01                	push   $0x1
    2ada:	e8 cd 0b 00 00       	call   36ac <printf>
    2adf:	e8 93 0a 00 00       	call   3577 <exit>
    2ae4:	50                   	push   %eax
    2ae5:	50                   	push   %eax
    2ae6:	68 5f 47 00 00       	push   $0x475f
    2aeb:	6a 01                	push   $0x1
    2aed:	e8 ba 0b 00 00       	call   36ac <printf>
    2af2:	e8 80 0a 00 00       	call   3577 <exit>
    2af7:	52                   	push   %edx
    2af8:	52                   	push   %edx
    2af9:	68 e0 4e 00 00       	push   $0x4ee0
    2afe:	6a 01                	push   $0x1
    2b00:	e8 a7 0b 00 00       	call   36ac <printf>
    2b05:	e8 6d 0a 00 00       	call   3577 <exit>
    2b0a:	66 90                	xchg   %ax,%ax

00002b0c <sbrktest>:
    2b0c:	55                   	push   %ebp
    2b0d:	89 e5                	mov    %esp,%ebp
    2b0f:	57                   	push   %edi
    2b10:	56                   	push   %esi
    2b11:	53                   	push   %ebx
    2b12:	83 ec 64             	sub    $0x64,%esp
    2b15:	68 80 47 00 00       	push   $0x4780
    2b1a:	ff 35 b0 51 00 00    	pushl  0x51b0
    2b20:	e8 87 0b 00 00       	call   36ac <printf>
    2b25:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b2c:	e8 ce 0a 00 00       	call   35ff <sbrk>
    2b31:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    2b34:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b3b:	e8 bf 0a 00 00       	call   35ff <sbrk>
    2b40:	89 c3                	mov    %eax,%ebx
    2b42:	83 c4 10             	add    $0x10,%esp
    2b45:	31 f6                	xor    %esi,%esi
    2b47:	eb 05                	jmp    2b4e <sbrktest+0x42>
    2b49:	8d 76 00             	lea    0x0(%esi),%esi
    2b4c:	89 c3                	mov    %eax,%ebx
    2b4e:	83 ec 0c             	sub    $0xc,%esp
    2b51:	6a 01                	push   $0x1
    2b53:	e8 a7 0a 00 00       	call   35ff <sbrk>
    2b58:	83 c4 10             	add    $0x10,%esp
    2b5b:	39 d8                	cmp    %ebx,%eax
    2b5d:	0f 85 81 02 00 00    	jne    2de4 <sbrktest+0x2d8>
    2b63:	c6 03 01             	movb   $0x1,(%ebx)
    2b66:	8d 43 01             	lea    0x1(%ebx),%eax
    2b69:	46                   	inc    %esi
    2b6a:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2b70:	75 da                	jne    2b4c <sbrktest+0x40>
    2b72:	e8 f8 09 00 00       	call   356f <fork>
    2b77:	89 c6                	mov    %eax,%esi
    2b79:	85 c0                	test   %eax,%eax
    2b7b:	0f 88 e9 02 00 00    	js     2e6a <sbrktest+0x35e>
    2b81:	83 ec 0c             	sub    $0xc,%esp
    2b84:	6a 01                	push   $0x1
    2b86:	e8 74 0a 00 00       	call   35ff <sbrk>
    2b8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b92:	e8 68 0a 00 00       	call   35ff <sbrk>
    2b97:	83 c3 02             	add    $0x2,%ebx
    2b9a:	83 c4 10             	add    $0x10,%esp
    2b9d:	39 c3                	cmp    %eax,%ebx
    2b9f:	0f 85 22 03 00 00    	jne    2ec7 <sbrktest+0x3bb>
    2ba5:	85 f6                	test   %esi,%esi
    2ba7:	0f 84 15 03 00 00    	je     2ec2 <sbrktest+0x3b6>
    2bad:	e8 cd 09 00 00       	call   357f <wait>
    2bb2:	83 ec 0c             	sub    $0xc,%esp
    2bb5:	6a 00                	push   $0x0
    2bb7:	e8 43 0a 00 00       	call   35ff <sbrk>
    2bbc:	89 c3                	mov    %eax,%ebx
    2bbe:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2bc3:	29 d8                	sub    %ebx,%eax
    2bc5:	89 04 24             	mov    %eax,(%esp)
    2bc8:	e8 32 0a 00 00       	call   35ff <sbrk>
    2bcd:	83 c4 10             	add    $0x10,%esp
    2bd0:	39 c3                	cmp    %eax,%ebx
    2bd2:	0f 85 7b 02 00 00    	jne    2e53 <sbrktest+0x347>
    2bd8:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
    2bdf:	83 ec 0c             	sub    $0xc,%esp
    2be2:	6a 00                	push   $0x0
    2be4:	e8 16 0a 00 00       	call   35ff <sbrk>
    2be9:	89 c3                	mov    %eax,%ebx
    2beb:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2bf2:	e8 08 0a 00 00       	call   35ff <sbrk>
    2bf7:	83 c4 10             	add    $0x10,%esp
    2bfa:	40                   	inc    %eax
    2bfb:	0f 84 0b 03 00 00    	je     2f0c <sbrktest+0x400>
    2c01:	83 ec 0c             	sub    $0xc,%esp
    2c04:	6a 00                	push   $0x0
    2c06:	e8 f4 09 00 00       	call   35ff <sbrk>
    2c0b:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2c11:	83 c4 10             	add    $0x10,%esp
    2c14:	39 d0                	cmp    %edx,%eax
    2c16:	0f 85 d9 02 00 00    	jne    2ef5 <sbrktest+0x3e9>
    2c1c:	83 ec 0c             	sub    $0xc,%esp
    2c1f:	6a 00                	push   $0x0
    2c21:	e8 d9 09 00 00       	call   35ff <sbrk>
    2c26:	89 c3                	mov    %eax,%ebx
    2c28:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c2f:	e8 cb 09 00 00       	call   35ff <sbrk>
    2c34:	89 c6                	mov    %eax,%esi
    2c36:	83 c4 10             	add    $0x10,%esp
    2c39:	39 c3                	cmp    %eax,%ebx
    2c3b:	0f 85 9d 02 00 00    	jne    2ede <sbrktest+0x3d2>
    2c41:	83 ec 0c             	sub    $0xc,%esp
    2c44:	6a 00                	push   $0x0
    2c46:	e8 b4 09 00 00       	call   35ff <sbrk>
    2c4b:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2c51:	83 c4 10             	add    $0x10,%esp
    2c54:	39 c2                	cmp    %eax,%edx
    2c56:	0f 85 82 02 00 00    	jne    2ede <sbrktest+0x3d2>
    2c5c:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2c63:	0f 84 18 02 00 00    	je     2e81 <sbrktest+0x375>
    2c69:	83 ec 0c             	sub    $0xc,%esp
    2c6c:	6a 00                	push   $0x0
    2c6e:	e8 8c 09 00 00       	call   35ff <sbrk>
    2c73:	89 c3                	mov    %eax,%ebx
    2c75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c7c:	e8 7e 09 00 00       	call   35ff <sbrk>
    2c81:	89 c2                	mov    %eax,%edx
    2c83:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2c86:	29 d0                	sub    %edx,%eax
    2c88:	89 04 24             	mov    %eax,(%esp)
    2c8b:	e8 6f 09 00 00       	call   35ff <sbrk>
    2c90:	83 c4 10             	add    $0x10,%esp
    2c93:	39 c3                	cmp    %eax,%ebx
    2c95:	0f 85 a1 01 00 00    	jne    2e3c <sbrktest+0x330>
    2c9b:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ca0:	e8 52 09 00 00       	call   35f7 <getpid>
    2ca5:	89 c6                	mov    %eax,%esi
    2ca7:	e8 c3 08 00 00       	call   356f <fork>
    2cac:	85 c0                	test   %eax,%eax
    2cae:	0f 88 4e 01 00 00    	js     2e02 <sbrktest+0x2f6>
    2cb4:	0f 84 60 01 00 00    	je     2e1a <sbrktest+0x30e>
    2cba:	e8 c0 08 00 00       	call   357f <wait>
    2cbf:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2cc5:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2ccb:	75 d3                	jne    2ca0 <sbrktest+0x194>
    2ccd:	83 ec 0c             	sub    $0xc,%esp
    2cd0:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2cd3:	50                   	push   %eax
    2cd4:	e8 ae 08 00 00       	call   3587 <pipe>
    2cd9:	83 c4 10             	add    $0x10,%esp
    2cdc:	85 c0                	test   %eax,%eax
    2cde:	0f 85 cb 01 00 00    	jne    2eaf <sbrktest+0x3a3>
    2ce4:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2ce7:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2cea:	89 de                	mov    %ebx,%esi
    2cec:	e8 7e 08 00 00       	call   356f <fork>
    2cf1:	89 06                	mov    %eax,(%esi)
    2cf3:	85 c0                	test   %eax,%eax
    2cf5:	0f 84 87 00 00 00    	je     2d82 <sbrktest+0x276>
    2cfb:	40                   	inc    %eax
    2cfc:	74 12                	je     2d10 <sbrktest+0x204>
    2cfe:	52                   	push   %edx
    2cff:	6a 01                	push   $0x1
    2d01:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2d04:	50                   	push   %eax
    2d05:	ff 75 b8             	pushl  -0x48(%ebp)
    2d08:	e8 82 08 00 00       	call   358f <read>
    2d0d:	83 c4 10             	add    $0x10,%esp
    2d10:	83 c6 04             	add    $0x4,%esi
    2d13:	39 fe                	cmp    %edi,%esi
    2d15:	75 d5                	jne    2cec <sbrktest+0x1e0>
    2d17:	83 ec 0c             	sub    $0xc,%esp
    2d1a:	68 00 10 00 00       	push   $0x1000
    2d1f:	e8 db 08 00 00       	call   35ff <sbrk>
    2d24:	89 c6                	mov    %eax,%esi
    2d26:	83 c4 10             	add    $0x10,%esp
    2d29:	8d 76 00             	lea    0x0(%esi),%esi
    2d2c:	8b 03                	mov    (%ebx),%eax
    2d2e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2d31:	74 11                	je     2d44 <sbrktest+0x238>
    2d33:	83 ec 0c             	sub    $0xc,%esp
    2d36:	50                   	push   %eax
    2d37:	e8 6b 08 00 00       	call   35a7 <kill>
    2d3c:	e8 3e 08 00 00       	call   357f <wait>
    2d41:	83 c4 10             	add    $0x10,%esp
    2d44:	83 c3 04             	add    $0x4,%ebx
    2d47:	39 fb                	cmp    %edi,%ebx
    2d49:	75 e1                	jne    2d2c <sbrktest+0x220>
    2d4b:	46                   	inc    %esi
    2d4c:	0f 84 46 01 00 00    	je     2e98 <sbrktest+0x38c>
    2d52:	83 ec 0c             	sub    $0xc,%esp
    2d55:	6a 00                	push   $0x0
    2d57:	e8 a3 08 00 00       	call   35ff <sbrk>
    2d5c:	83 c4 10             	add    $0x10,%esp
    2d5f:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2d62:	72 62                	jb     2dc6 <sbrktest+0x2ba>
    2d64:	83 ec 08             	sub    $0x8,%esp
    2d67:	68 28 48 00 00       	push   $0x4828
    2d6c:	ff 35 b0 51 00 00    	pushl  0x51b0
    2d72:	e8 35 09 00 00       	call   36ac <printf>
    2d77:	83 c4 10             	add    $0x10,%esp
    2d7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2d7d:	5b                   	pop    %ebx
    2d7e:	5e                   	pop    %esi
    2d7f:	5f                   	pop    %edi
    2d80:	5d                   	pop    %ebp
    2d81:	c3                   	ret    
    2d82:	83 ec 0c             	sub    $0xc,%esp
    2d85:	6a 00                	push   $0x0
    2d87:	e8 73 08 00 00       	call   35ff <sbrk>
    2d8c:	89 c2                	mov    %eax,%edx
    2d8e:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2d93:	29 d0                	sub    %edx,%eax
    2d95:	89 04 24             	mov    %eax,(%esp)
    2d98:	e8 62 08 00 00       	call   35ff <sbrk>
    2d9d:	83 c4 0c             	add    $0xc,%esp
    2da0:	6a 01                	push   $0x1
    2da2:	68 e9 42 00 00       	push   $0x42e9
    2da7:	ff 75 bc             	pushl  -0x44(%ebp)
    2daa:	e8 e8 07 00 00       	call   3597 <write>
    2daf:	83 c4 10             	add    $0x10,%esp
    2db2:	66 90                	xchg   %ax,%ax
    2db4:	83 ec 0c             	sub    $0xc,%esp
    2db7:	68 e8 03 00 00       	push   $0x3e8
    2dbc:	e8 46 08 00 00       	call   3607 <sleep>
    2dc1:	83 c4 10             	add    $0x10,%esp
    2dc4:	eb ee                	jmp    2db4 <sbrktest+0x2a8>
    2dc6:	83 ec 0c             	sub    $0xc,%esp
    2dc9:	6a 00                	push   $0x0
    2dcb:	e8 2f 08 00 00       	call   35ff <sbrk>
    2dd0:	89 c2                	mov    %eax,%edx
    2dd2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2dd5:	29 d0                	sub    %edx,%eax
    2dd7:	89 04 24             	mov    %eax,(%esp)
    2dda:	e8 20 08 00 00       	call   35ff <sbrk>
    2ddf:	83 c4 10             	add    $0x10,%esp
    2de2:	eb 80                	jmp    2d64 <sbrktest+0x258>
    2de4:	83 ec 0c             	sub    $0xc,%esp
    2de7:	50                   	push   %eax
    2de8:	53                   	push   %ebx
    2de9:	56                   	push   %esi
    2dea:	68 8b 47 00 00       	push   $0x478b
    2def:	ff 35 b0 51 00 00    	pushl  0x51b0
    2df5:	e8 b2 08 00 00       	call   36ac <printf>
    2dfa:	83 c4 20             	add    $0x20,%esp
    2dfd:	e8 75 07 00 00       	call   3577 <exit>
    2e02:	83 ec 08             	sub    $0x8,%esp
    2e05:	68 d1 48 00 00       	push   $0x48d1
    2e0a:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e10:	e8 97 08 00 00       	call   36ac <printf>
    2e15:	e8 5d 07 00 00       	call   3577 <exit>
    2e1a:	0f be 03             	movsbl (%ebx),%eax
    2e1d:	50                   	push   %eax
    2e1e:	53                   	push   %ebx
    2e1f:	68 f4 47 00 00       	push   $0x47f4
    2e24:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e2a:	e8 7d 08 00 00       	call   36ac <printf>
    2e2f:	89 34 24             	mov    %esi,(%esp)
    2e32:	e8 70 07 00 00       	call   35a7 <kill>
    2e37:	e8 3b 07 00 00       	call   3577 <exit>
    2e3c:	50                   	push   %eax
    2e3d:	53                   	push   %ebx
    2e3e:	68 d4 4f 00 00       	push   $0x4fd4
    2e43:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e49:	e8 5e 08 00 00       	call   36ac <printf>
    2e4e:	e8 24 07 00 00       	call   3577 <exit>
    2e53:	57                   	push   %edi
    2e54:	57                   	push   %edi
    2e55:	68 04 4f 00 00       	push   $0x4f04
    2e5a:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e60:	e8 47 08 00 00       	call   36ac <printf>
    2e65:	e8 0d 07 00 00       	call   3577 <exit>
    2e6a:	50                   	push   %eax
    2e6b:	50                   	push   %eax
    2e6c:	68 a6 47 00 00       	push   $0x47a6
    2e71:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e77:	e8 30 08 00 00       	call   36ac <printf>
    2e7c:	e8 f6 06 00 00       	call   3577 <exit>
    2e81:	53                   	push   %ebx
    2e82:	53                   	push   %ebx
    2e83:	68 a4 4f 00 00       	push   $0x4fa4
    2e88:	ff 35 b0 51 00 00    	pushl  0x51b0
    2e8e:	e8 19 08 00 00       	call   36ac <printf>
    2e93:	e8 df 06 00 00       	call   3577 <exit>
    2e98:	50                   	push   %eax
    2e99:	50                   	push   %eax
    2e9a:	68 0d 48 00 00       	push   $0x480d
    2e9f:	ff 35 b0 51 00 00    	pushl  0x51b0
    2ea5:	e8 02 08 00 00       	call   36ac <printf>
    2eaa:	e8 c8 06 00 00       	call   3577 <exit>
    2eaf:	51                   	push   %ecx
    2eb0:	51                   	push   %ecx
    2eb1:	68 c9 3c 00 00       	push   $0x3cc9
    2eb6:	6a 01                	push   $0x1
    2eb8:	e8 ef 07 00 00       	call   36ac <printf>
    2ebd:	e8 b5 06 00 00       	call   3577 <exit>
    2ec2:	e8 b0 06 00 00       	call   3577 <exit>
    2ec7:	50                   	push   %eax
    2ec8:	50                   	push   %eax
    2ec9:	68 bd 47 00 00       	push   $0x47bd
    2ece:	ff 35 b0 51 00 00    	pushl  0x51b0
    2ed4:	e8 d3 07 00 00       	call   36ac <printf>
    2ed9:	e8 99 06 00 00       	call   3577 <exit>
    2ede:	56                   	push   %esi
    2edf:	53                   	push   %ebx
    2ee0:	68 7c 4f 00 00       	push   $0x4f7c
    2ee5:	ff 35 b0 51 00 00    	pushl  0x51b0
    2eeb:	e8 bc 07 00 00       	call   36ac <printf>
    2ef0:	e8 82 06 00 00       	call   3577 <exit>
    2ef5:	50                   	push   %eax
    2ef6:	53                   	push   %ebx
    2ef7:	68 44 4f 00 00       	push   $0x4f44
    2efc:	ff 35 b0 51 00 00    	pushl  0x51b0
    2f02:	e8 a5 07 00 00       	call   36ac <printf>
    2f07:	e8 6b 06 00 00       	call   3577 <exit>
    2f0c:	56                   	push   %esi
    2f0d:	56                   	push   %esi
    2f0e:	68 d9 47 00 00       	push   $0x47d9
    2f13:	ff 35 b0 51 00 00    	pushl  0x51b0
    2f19:	e8 8e 07 00 00       	call   36ac <printf>
    2f1e:	e8 54 06 00 00       	call   3577 <exit>
    2f23:	90                   	nop

00002f24 <validateint>:
    2f24:	c3                   	ret    
    2f25:	8d 76 00             	lea    0x0(%esi),%esi

00002f28 <validatetest>:
    2f28:	55                   	push   %ebp
    2f29:	89 e5                	mov    %esp,%ebp
    2f2b:	56                   	push   %esi
    2f2c:	53                   	push   %ebx
    2f2d:	83 ec 08             	sub    $0x8,%esp
    2f30:	68 36 48 00 00       	push   $0x4836
    2f35:	ff 35 b0 51 00 00    	pushl  0x51b0
    2f3b:	e8 6c 07 00 00       	call   36ac <printf>
    2f40:	83 c4 10             	add    $0x10,%esp
    2f43:	31 f6                	xor    %esi,%esi
    2f45:	8d 76 00             	lea    0x0(%esi),%esi
    2f48:	e8 22 06 00 00       	call   356f <fork>
    2f4d:	89 c3                	mov    %eax,%ebx
    2f4f:	85 c0                	test   %eax,%eax
    2f51:	74 61                	je     2fb4 <validatetest+0x8c>
    2f53:	83 ec 0c             	sub    $0xc,%esp
    2f56:	6a 00                	push   $0x0
    2f58:	e8 aa 06 00 00       	call   3607 <sleep>
    2f5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f64:	e8 9e 06 00 00       	call   3607 <sleep>
    2f69:	89 1c 24             	mov    %ebx,(%esp)
    2f6c:	e8 36 06 00 00       	call   35a7 <kill>
    2f71:	e8 09 06 00 00       	call   357f <wait>
    2f76:	58                   	pop    %eax
    2f77:	5a                   	pop    %edx
    2f78:	56                   	push   %esi
    2f79:	68 45 48 00 00       	push   $0x4845
    2f7e:	e8 54 06 00 00       	call   35d7 <link>
    2f83:	83 c4 10             	add    $0x10,%esp
    2f86:	40                   	inc    %eax
    2f87:	75 30                	jne    2fb9 <validatetest+0x91>
    2f89:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2f8f:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    2f95:	75 b1                	jne    2f48 <validatetest+0x20>
    2f97:	83 ec 08             	sub    $0x8,%esp
    2f9a:	68 69 48 00 00       	push   $0x4869
    2f9f:	ff 35 b0 51 00 00    	pushl  0x51b0
    2fa5:	e8 02 07 00 00       	call   36ac <printf>
    2faa:	83 c4 10             	add    $0x10,%esp
    2fad:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2fb0:	5b                   	pop    %ebx
    2fb1:	5e                   	pop    %esi
    2fb2:	5d                   	pop    %ebp
    2fb3:	c3                   	ret    
    2fb4:	e8 be 05 00 00       	call   3577 <exit>
    2fb9:	83 ec 08             	sub    $0x8,%esp
    2fbc:	68 50 48 00 00       	push   $0x4850
    2fc1:	ff 35 b0 51 00 00    	pushl  0x51b0
    2fc7:	e8 e0 06 00 00       	call   36ac <printf>
    2fcc:	e8 a6 05 00 00       	call   3577 <exit>
    2fd1:	8d 76 00             	lea    0x0(%esi),%esi

00002fd4 <bsstest>:
    2fd4:	55                   	push   %ebp
    2fd5:	89 e5                	mov    %esp,%ebp
    2fd7:	83 ec 10             	sub    $0x10,%esp
    2fda:	68 76 48 00 00       	push   $0x4876
    2fdf:	ff 35 b0 51 00 00    	pushl  0x51b0
    2fe5:	e8 c2 06 00 00       	call   36ac <printf>
    2fea:	83 c4 10             	add    $0x10,%esp
    2fed:	31 c0                	xor    %eax,%eax
    2fef:	90                   	nop
    2ff0:	80 b8 e0 51 00 00 00 	cmpb   $0x0,0x51e0(%eax)
    2ff7:	75 20                	jne    3019 <bsstest+0x45>
    2ff9:	40                   	inc    %eax
    2ffa:	3d 10 27 00 00       	cmp    $0x2710,%eax
    2fff:	75 ef                	jne    2ff0 <bsstest+0x1c>
    3001:	83 ec 08             	sub    $0x8,%esp
    3004:	68 91 48 00 00       	push   $0x4891
    3009:	ff 35 b0 51 00 00    	pushl  0x51b0
    300f:	e8 98 06 00 00       	call   36ac <printf>
    3014:	83 c4 10             	add    $0x10,%esp
    3017:	c9                   	leave  
    3018:	c3                   	ret    
    3019:	83 ec 08             	sub    $0x8,%esp
    301c:	68 80 48 00 00       	push   $0x4880
    3021:	ff 35 b0 51 00 00    	pushl  0x51b0
    3027:	e8 80 06 00 00       	call   36ac <printf>
    302c:	e8 46 05 00 00       	call   3577 <exit>
    3031:	8d 76 00             	lea    0x0(%esi),%esi

00003034 <bigargtest>:
    3034:	55                   	push   %ebp
    3035:	89 e5                	mov    %esp,%ebp
    3037:	83 ec 14             	sub    $0x14,%esp
    303a:	68 9e 48 00 00       	push   $0x489e
    303f:	e8 83 05 00 00       	call   35c7 <unlink>
    3044:	e8 26 05 00 00       	call   356f <fork>
    3049:	83 c4 10             	add    $0x10,%esp
    304c:	85 c0                	test   %eax,%eax
    304e:	74 40                	je     3090 <bigargtest+0x5c>
    3050:	0f 88 bd 00 00 00    	js     3113 <bigargtest+0xdf>
    3056:	e8 24 05 00 00       	call   357f <wait>
    305b:	83 ec 08             	sub    $0x8,%esp
    305e:	6a 00                	push   $0x0
    3060:	68 9e 48 00 00       	push   $0x489e
    3065:	e8 4d 05 00 00       	call   35b7 <open>
    306a:	83 c4 10             	add    $0x10,%esp
    306d:	85 c0                	test   %eax,%eax
    306f:	0f 88 87 00 00 00    	js     30fc <bigargtest+0xc8>
    3075:	83 ec 0c             	sub    $0xc,%esp
    3078:	50                   	push   %eax
    3079:	e8 21 05 00 00       	call   359f <close>
    307e:	c7 04 24 9e 48 00 00 	movl   $0x489e,(%esp)
    3085:	e8 3d 05 00 00       	call   35c7 <unlink>
    308a:	83 c4 10             	add    $0x10,%esp
    308d:	c9                   	leave  
    308e:	c3                   	ret    
    308f:	90                   	nop
    3090:	c7 04 85 00 99 00 00 	movl   $0x4ff8,0x9900(,%eax,4)
    3097:	f8 4f 00 00 
    309b:	40                   	inc    %eax
    309c:	83 f8 1f             	cmp    $0x1f,%eax
    309f:	75 ef                	jne    3090 <bigargtest+0x5c>
    30a1:	31 c9                	xor    %ecx,%ecx
    30a3:	89 0d 7c 99 00 00    	mov    %ecx,0x997c
    30a9:	50                   	push   %eax
    30aa:	50                   	push   %eax
    30ab:	68 a8 48 00 00       	push   $0x48a8
    30b0:	ff 35 b0 51 00 00    	pushl  0x51b0
    30b6:	e8 f1 05 00 00       	call   36ac <printf>
    30bb:	58                   	pop    %eax
    30bc:	5a                   	pop    %edx
    30bd:	68 00 99 00 00       	push   $0x9900
    30c2:	68 75 3a 00 00       	push   $0x3a75
    30c7:	e8 e3 04 00 00       	call   35af <exec>
    30cc:	59                   	pop    %ecx
    30cd:	58                   	pop    %eax
    30ce:	68 b5 48 00 00       	push   $0x48b5
    30d3:	ff 35 b0 51 00 00    	pushl  0x51b0
    30d9:	e8 ce 05 00 00       	call   36ac <printf>
    30de:	58                   	pop    %eax
    30df:	5a                   	pop    %edx
    30e0:	68 00 02 00 00       	push   $0x200
    30e5:	68 9e 48 00 00       	push   $0x489e
    30ea:	e8 c8 04 00 00       	call   35b7 <open>
    30ef:	89 04 24             	mov    %eax,(%esp)
    30f2:	e8 a8 04 00 00       	call   359f <close>
    30f7:	e8 7b 04 00 00       	call   3577 <exit>
    30fc:	50                   	push   %eax
    30fd:	50                   	push   %eax
    30fe:	68 de 48 00 00       	push   $0x48de
    3103:	ff 35 b0 51 00 00    	pushl  0x51b0
    3109:	e8 9e 05 00 00       	call   36ac <printf>
    310e:	e8 64 04 00 00       	call   3577 <exit>
    3113:	52                   	push   %edx
    3114:	52                   	push   %edx
    3115:	68 c5 48 00 00       	push   $0x48c5
    311a:	ff 35 b0 51 00 00    	pushl  0x51b0
    3120:	e8 87 05 00 00       	call   36ac <printf>
    3125:	e8 4d 04 00 00       	call   3577 <exit>
    312a:	66 90                	xchg   %ax,%ax

0000312c <fsfull>:
    312c:	55                   	push   %ebp
    312d:	89 e5                	mov    %esp,%ebp
    312f:	57                   	push   %edi
    3130:	56                   	push   %esi
    3131:	53                   	push   %ebx
    3132:	83 ec 54             	sub    $0x54,%esp
    3135:	68 f3 48 00 00       	push   $0x48f3
    313a:	6a 01                	push   $0x1
    313c:	e8 6b 05 00 00       	call   36ac <printf>
    3141:	83 c4 10             	add    $0x10,%esp
    3144:	31 f6                	xor    %esi,%esi
    3146:	66 90                	xchg   %ax,%ax
    3148:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    314c:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3151:	f7 e6                	mul    %esi
    3153:	c1 ea 06             	shr    $0x6,%edx
    3156:	83 c2 30             	add    $0x30,%edx
    3159:	88 55 a9             	mov    %dl,-0x57(%ebp)
    315c:	89 f0                	mov    %esi,%eax
    315e:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
    3163:	99                   	cltd   
    3164:	f7 f9                	idiv   %ecx
    3166:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    316b:	f7 e2                	mul    %edx
    316d:	c1 ea 05             	shr    $0x5,%edx
    3170:	83 c2 30             	add    $0x30,%edx
    3173:	88 55 aa             	mov    %dl,-0x56(%ebp)
    3176:	b9 64 00 00 00       	mov    $0x64,%ecx
    317b:	89 f0                	mov    %esi,%eax
    317d:	99                   	cltd   
    317e:	f7 f9                	idiv   %ecx
    3180:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
    3185:	f7 e2                	mul    %edx
    3187:	c1 ea 03             	shr    $0x3,%edx
    318a:	83 c2 30             	add    $0x30,%edx
    318d:	88 55 ab             	mov    %dl,-0x55(%ebp)
    3190:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3195:	89 f0                	mov    %esi,%eax
    3197:	99                   	cltd   
    3198:	f7 f9                	idiv   %ecx
    319a:	83 c2 30             	add    $0x30,%edx
    319d:	88 55 ac             	mov    %dl,-0x54(%ebp)
    31a0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    31a4:	53                   	push   %ebx
    31a5:	8d 45 a8             	lea    -0x58(%ebp),%eax
    31a8:	50                   	push   %eax
    31a9:	68 00 49 00 00       	push   $0x4900
    31ae:	6a 01                	push   $0x1
    31b0:	e8 f7 04 00 00       	call   36ac <printf>
    31b5:	5f                   	pop    %edi
    31b6:	58                   	pop    %eax
    31b7:	68 02 02 00 00       	push   $0x202
    31bc:	8d 45 a8             	lea    -0x58(%ebp),%eax
    31bf:	50                   	push   %eax
    31c0:	e8 f2 03 00 00       	call   35b7 <open>
    31c5:	89 c7                	mov    %eax,%edi
    31c7:	83 c4 10             	add    $0x10,%esp
    31ca:	85 c0                	test   %eax,%eax
    31cc:	78 46                	js     3214 <fsfull+0xe8>
    31ce:	31 db                	xor    %ebx,%ebx
    31d0:	eb 04                	jmp    31d6 <fsfull+0xaa>
    31d2:	66 90                	xchg   %ax,%ax
    31d4:	01 c3                	add    %eax,%ebx
    31d6:	52                   	push   %edx
    31d7:	68 00 02 00 00       	push   $0x200
    31dc:	68 00 79 00 00       	push   $0x7900
    31e1:	57                   	push   %edi
    31e2:	e8 b0 03 00 00       	call   3597 <write>
    31e7:	83 c4 10             	add    $0x10,%esp
    31ea:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    31ef:	7f e3                	jg     31d4 <fsfull+0xa8>
    31f1:	50                   	push   %eax
    31f2:	53                   	push   %ebx
    31f3:	68 1c 49 00 00       	push   $0x491c
    31f8:	6a 01                	push   $0x1
    31fa:	e8 ad 04 00 00       	call   36ac <printf>
    31ff:	89 3c 24             	mov    %edi,(%esp)
    3202:	e8 98 03 00 00       	call   359f <close>
    3207:	83 c4 10             	add    $0x10,%esp
    320a:	85 db                	test   %ebx,%ebx
    320c:	74 1a                	je     3228 <fsfull+0xfc>
    320e:	46                   	inc    %esi
    320f:	e9 34 ff ff ff       	jmp    3148 <fsfull+0x1c>
    3214:	51                   	push   %ecx
    3215:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3218:	50                   	push   %eax
    3219:	68 0c 49 00 00       	push   $0x490c
    321e:	6a 01                	push   $0x1
    3220:	e8 87 04 00 00       	call   36ac <printf>
    3225:	83 c4 10             	add    $0x10,%esp
    3228:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    322d:	bb e8 03 00 00       	mov    $0x3e8,%ebx
    3232:	66 90                	xchg   %ax,%ax
    3234:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    3238:	89 f0                	mov    %esi,%eax
    323a:	f7 e7                	mul    %edi
    323c:	c1 ea 06             	shr    $0x6,%edx
    323f:	83 c2 30             	add    $0x30,%edx
    3242:	88 55 a9             	mov    %dl,-0x57(%ebp)
    3245:	89 f0                	mov    %esi,%eax
    3247:	99                   	cltd   
    3248:	f7 fb                	idiv   %ebx
    324a:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    324f:	f7 e2                	mul    %edx
    3251:	c1 ea 05             	shr    $0x5,%edx
    3254:	83 c2 30             	add    $0x30,%edx
    3257:	88 55 aa             	mov    %dl,-0x56(%ebp)
    325a:	b9 64 00 00 00       	mov    $0x64,%ecx
    325f:	89 f0                	mov    %esi,%eax
    3261:	99                   	cltd   
    3262:	f7 f9                	idiv   %ecx
    3264:	b8 cd cc cc cc       	mov    $0xcccccccd,%eax
    3269:	f7 e2                	mul    %edx
    326b:	c1 ea 03             	shr    $0x3,%edx
    326e:	83 c2 30             	add    $0x30,%edx
    3271:	88 55 ab             	mov    %dl,-0x55(%ebp)
    3274:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3279:	89 f0                	mov    %esi,%eax
    327b:	99                   	cltd   
    327c:	f7 f9                	idiv   %ecx
    327e:	83 c2 30             	add    $0x30,%edx
    3281:	88 55 ac             	mov    %dl,-0x54(%ebp)
    3284:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    3288:	83 ec 0c             	sub    $0xc,%esp
    328b:	8d 45 a8             	lea    -0x58(%ebp),%eax
    328e:	50                   	push   %eax
    328f:	e8 33 03 00 00       	call   35c7 <unlink>
    3294:	4e                   	dec    %esi
    3295:	83 c4 10             	add    $0x10,%esp
    3298:	83 fe ff             	cmp    $0xffffffff,%esi
    329b:	75 97                	jne    3234 <fsfull+0x108>
    329d:	83 ec 08             	sub    $0x8,%esp
    32a0:	68 2c 49 00 00       	push   $0x492c
    32a5:	6a 01                	push   $0x1
    32a7:	e8 00 04 00 00       	call   36ac <printf>
    32ac:	83 c4 10             	add    $0x10,%esp
    32af:	8d 65 f4             	lea    -0xc(%ebp),%esp
    32b2:	5b                   	pop    %ebx
    32b3:	5e                   	pop    %esi
    32b4:	5f                   	pop    %edi
    32b5:	5d                   	pop    %ebp
    32b6:	c3                   	ret    
    32b7:	90                   	nop

000032b8 <uio>:
    32b8:	55                   	push   %ebp
    32b9:	89 e5                	mov    %esp,%ebp
    32bb:	83 ec 10             	sub    $0x10,%esp
    32be:	68 42 49 00 00       	push   $0x4942
    32c3:	6a 01                	push   $0x1
    32c5:	e8 e2 03 00 00       	call   36ac <printf>
    32ca:	e8 a0 02 00 00       	call   356f <fork>
    32cf:	83 c4 10             	add    $0x10,%esp
    32d2:	85 c0                	test   %eax,%eax
    32d4:	74 1b                	je     32f1 <uio+0x39>
    32d6:	78 3a                	js     3312 <uio+0x5a>
    32d8:	e8 a2 02 00 00       	call   357f <wait>
    32dd:	83 ec 08             	sub    $0x8,%esp
    32e0:	68 4c 49 00 00       	push   $0x494c
    32e5:	6a 01                	push   $0x1
    32e7:	e8 c0 03 00 00       	call   36ac <printf>
    32ec:	83 c4 10             	add    $0x10,%esp
    32ef:	c9                   	leave  
    32f0:	c3                   	ret    
    32f1:	b0 09                	mov    $0x9,%al
    32f3:	ba 70 00 00 00       	mov    $0x70,%edx
    32f8:	ee                   	out    %al,(%dx)
    32f9:	ba 71 00 00 00       	mov    $0x71,%edx
    32fe:	ec                   	in     (%dx),%al
    32ff:	52                   	push   %edx
    3300:	52                   	push   %edx
    3301:	68 d8 50 00 00       	push   $0x50d8
    3306:	6a 01                	push   $0x1
    3308:	e8 9f 03 00 00       	call   36ac <printf>
    330d:	e8 65 02 00 00       	call   3577 <exit>
    3312:	50                   	push   %eax
    3313:	50                   	push   %eax
    3314:	68 d1 48 00 00       	push   $0x48d1
    3319:	6a 01                	push   $0x1
    331b:	e8 8c 03 00 00       	call   36ac <printf>
    3320:	e8 52 02 00 00       	call   3577 <exit>
    3325:	8d 76 00             	lea    0x0(%esi),%esi

00003328 <argptest>:
    3328:	55                   	push   %ebp
    3329:	89 e5                	mov    %esp,%ebp
    332b:	53                   	push   %ebx
    332c:	83 ec 0c             	sub    $0xc,%esp
    332f:	6a 00                	push   $0x0
    3331:	68 5b 49 00 00       	push   $0x495b
    3336:	e8 7c 02 00 00       	call   35b7 <open>
    333b:	83 c4 10             	add    $0x10,%esp
    333e:	85 c0                	test   %eax,%eax
    3340:	78 37                	js     3379 <argptest+0x51>
    3342:	89 c3                	mov    %eax,%ebx
    3344:	83 ec 0c             	sub    $0xc,%esp
    3347:	6a 00                	push   $0x0
    3349:	e8 b1 02 00 00       	call   35ff <sbrk>
    334e:	83 c4 0c             	add    $0xc,%esp
    3351:	6a ff                	push   $0xffffffff
    3353:	48                   	dec    %eax
    3354:	50                   	push   %eax
    3355:	53                   	push   %ebx
    3356:	e8 34 02 00 00       	call   358f <read>
    335b:	89 1c 24             	mov    %ebx,(%esp)
    335e:	e8 3c 02 00 00       	call   359f <close>
    3363:	58                   	pop    %eax
    3364:	5a                   	pop    %edx
    3365:	68 6d 49 00 00       	push   $0x496d
    336a:	6a 01                	push   $0x1
    336c:	e8 3b 03 00 00       	call   36ac <printf>
    3371:	83 c4 10             	add    $0x10,%esp
    3374:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3377:	c9                   	leave  
    3378:	c3                   	ret    
    3379:	51                   	push   %ecx
    337a:	51                   	push   %ecx
    337b:	68 60 49 00 00       	push   $0x4960
    3380:	6a 02                	push   $0x2
    3382:	e8 25 03 00 00       	call   36ac <printf>
    3387:	e8 eb 01 00 00       	call   3577 <exit>

0000338c <rand>:
    338c:	a1 ac 51 00 00       	mov    0x51ac,%eax
    3391:	8d 14 00             	lea    (%eax,%eax,1),%edx
    3394:	01 c2                	add    %eax,%edx
    3396:	8d 14 90             	lea    (%eax,%edx,4),%edx
    3399:	c1 e2 08             	shl    $0x8,%edx
    339c:	01 c2                	add    %eax,%edx
    339e:	8d 14 92             	lea    (%edx,%edx,4),%edx
    33a1:	8d 04 90             	lea    (%eax,%edx,4),%eax
    33a4:	8d 04 80             	lea    (%eax,%eax,4),%eax
    33a7:	8d 84 80 5f f3 6e 3c 	lea    0x3c6ef35f(%eax,%eax,4),%eax
    33ae:	a3 ac 51 00 00       	mov    %eax,0x51ac
    33b3:	c3                   	ret    

000033b4 <strcpy>:
    33b4:	55                   	push   %ebp
    33b5:	89 e5                	mov    %esp,%ebp
    33b7:	53                   	push   %ebx
    33b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
    33bb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    33be:	31 c0                	xor    %eax,%eax
    33c0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
    33c3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    33c6:	40                   	inc    %eax
    33c7:	84 d2                	test   %dl,%dl
    33c9:	75 f5                	jne    33c0 <strcpy+0xc>
    33cb:	89 c8                	mov    %ecx,%eax
    33cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    33d0:	c9                   	leave  
    33d1:	c3                   	ret    
    33d2:	66 90                	xchg   %ax,%ax

000033d4 <strcmp>:
    33d4:	55                   	push   %ebp
    33d5:	89 e5                	mov    %esp,%ebp
    33d7:	53                   	push   %ebx
    33d8:	8b 55 08             	mov    0x8(%ebp),%edx
    33db:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    33de:	0f b6 02             	movzbl (%edx),%eax
    33e1:	84 c0                	test   %al,%al
    33e3:	75 10                	jne    33f5 <strcmp+0x21>
    33e5:	eb 2a                	jmp    3411 <strcmp+0x3d>
    33e7:	90                   	nop
    33e8:	42                   	inc    %edx
    33e9:	8d 4b 01             	lea    0x1(%ebx),%ecx
    33ec:	0f b6 02             	movzbl (%edx),%eax
    33ef:	84 c0                	test   %al,%al
    33f1:	74 11                	je     3404 <strcmp+0x30>
    33f3:	89 cb                	mov    %ecx,%ebx
    33f5:	0f b6 0b             	movzbl (%ebx),%ecx
    33f8:	38 c1                	cmp    %al,%cl
    33fa:	74 ec                	je     33e8 <strcmp+0x14>
    33fc:	29 c8                	sub    %ecx,%eax
    33fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3401:	c9                   	leave  
    3402:	c3                   	ret    
    3403:	90                   	nop
    3404:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
    3408:	31 c0                	xor    %eax,%eax
    340a:	29 c8                	sub    %ecx,%eax
    340c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    340f:	c9                   	leave  
    3410:	c3                   	ret    
    3411:	0f b6 0b             	movzbl (%ebx),%ecx
    3414:	31 c0                	xor    %eax,%eax
    3416:	eb e4                	jmp    33fc <strcmp+0x28>

00003418 <strlen>:
    3418:	55                   	push   %ebp
    3419:	89 e5                	mov    %esp,%ebp
    341b:	8b 55 08             	mov    0x8(%ebp),%edx
    341e:	80 3a 00             	cmpb   $0x0,(%edx)
    3421:	74 15                	je     3438 <strlen+0x20>
    3423:	31 c0                	xor    %eax,%eax
    3425:	8d 76 00             	lea    0x0(%esi),%esi
    3428:	40                   	inc    %eax
    3429:	89 c1                	mov    %eax,%ecx
    342b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    342f:	75 f7                	jne    3428 <strlen+0x10>
    3431:	89 c8                	mov    %ecx,%eax
    3433:	5d                   	pop    %ebp
    3434:	c3                   	ret    
    3435:	8d 76 00             	lea    0x0(%esi),%esi
    3438:	31 c9                	xor    %ecx,%ecx
    343a:	89 c8                	mov    %ecx,%eax
    343c:	5d                   	pop    %ebp
    343d:	c3                   	ret    
    343e:	66 90                	xchg   %ax,%ax

00003440 <memset>:
    3440:	55                   	push   %ebp
    3441:	89 e5                	mov    %esp,%ebp
    3443:	57                   	push   %edi
    3444:	8b 7d 08             	mov    0x8(%ebp),%edi
    3447:	8b 4d 10             	mov    0x10(%ebp),%ecx
    344a:	8b 45 0c             	mov    0xc(%ebp),%eax
    344d:	fc                   	cld    
    344e:	f3 aa                	rep stos %al,%es:(%edi)
    3450:	8b 45 08             	mov    0x8(%ebp),%eax
    3453:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3456:	c9                   	leave  
    3457:	c3                   	ret    

00003458 <strchr>:
    3458:	55                   	push   %ebp
    3459:	89 e5                	mov    %esp,%ebp
    345b:	8b 45 08             	mov    0x8(%ebp),%eax
    345e:	8a 4d 0c             	mov    0xc(%ebp),%cl
    3461:	8a 10                	mov    (%eax),%dl
    3463:	84 d2                	test   %dl,%dl
    3465:	75 0c                	jne    3473 <strchr+0x1b>
    3467:	eb 13                	jmp    347c <strchr+0x24>
    3469:	8d 76 00             	lea    0x0(%esi),%esi
    346c:	40                   	inc    %eax
    346d:	8a 10                	mov    (%eax),%dl
    346f:	84 d2                	test   %dl,%dl
    3471:	74 09                	je     347c <strchr+0x24>
    3473:	38 d1                	cmp    %dl,%cl
    3475:	75 f5                	jne    346c <strchr+0x14>
    3477:	5d                   	pop    %ebp
    3478:	c3                   	ret    
    3479:	8d 76 00             	lea    0x0(%esi),%esi
    347c:	31 c0                	xor    %eax,%eax
    347e:	5d                   	pop    %ebp
    347f:	c3                   	ret    

00003480 <gets>:
    3480:	55                   	push   %ebp
    3481:	89 e5                	mov    %esp,%ebp
    3483:	57                   	push   %edi
    3484:	56                   	push   %esi
    3485:	53                   	push   %ebx
    3486:	83 ec 1c             	sub    $0x1c,%esp
    3489:	31 db                	xor    %ebx,%ebx
    348b:	8d 75 e7             	lea    -0x19(%ebp),%esi
    348e:	eb 24                	jmp    34b4 <gets+0x34>
    3490:	50                   	push   %eax
    3491:	6a 01                	push   $0x1
    3493:	56                   	push   %esi
    3494:	6a 00                	push   $0x0
    3496:	e8 f4 00 00 00       	call   358f <read>
    349b:	83 c4 10             	add    $0x10,%esp
    349e:	85 c0                	test   %eax,%eax
    34a0:	7e 1a                	jle    34bc <gets+0x3c>
    34a2:	8a 45 e7             	mov    -0x19(%ebp),%al
    34a5:	8b 55 08             	mov    0x8(%ebp),%edx
    34a8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    34ac:	3c 0a                	cmp    $0xa,%al
    34ae:	74 0e                	je     34be <gets+0x3e>
    34b0:	3c 0d                	cmp    $0xd,%al
    34b2:	74 0a                	je     34be <gets+0x3e>
    34b4:	89 df                	mov    %ebx,%edi
    34b6:	43                   	inc    %ebx
    34b7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    34ba:	7c d4                	jl     3490 <gets+0x10>
    34bc:	89 fb                	mov    %edi,%ebx
    34be:	8b 45 08             	mov    0x8(%ebp),%eax
    34c1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
    34c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    34c8:	5b                   	pop    %ebx
    34c9:	5e                   	pop    %esi
    34ca:	5f                   	pop    %edi
    34cb:	5d                   	pop    %ebp
    34cc:	c3                   	ret    
    34cd:	8d 76 00             	lea    0x0(%esi),%esi

000034d0 <stat>:
    34d0:	55                   	push   %ebp
    34d1:	89 e5                	mov    %esp,%ebp
    34d3:	56                   	push   %esi
    34d4:	53                   	push   %ebx
    34d5:	83 ec 08             	sub    $0x8,%esp
    34d8:	6a 00                	push   $0x0
    34da:	ff 75 08             	pushl  0x8(%ebp)
    34dd:	e8 d5 00 00 00       	call   35b7 <open>
    34e2:	83 c4 10             	add    $0x10,%esp
    34e5:	85 c0                	test   %eax,%eax
    34e7:	78 27                	js     3510 <stat+0x40>
    34e9:	89 c3                	mov    %eax,%ebx
    34eb:	83 ec 08             	sub    $0x8,%esp
    34ee:	ff 75 0c             	pushl  0xc(%ebp)
    34f1:	50                   	push   %eax
    34f2:	e8 d8 00 00 00       	call   35cf <fstat>
    34f7:	89 c6                	mov    %eax,%esi
    34f9:	89 1c 24             	mov    %ebx,(%esp)
    34fc:	e8 9e 00 00 00       	call   359f <close>
    3501:	83 c4 10             	add    $0x10,%esp
    3504:	89 f0                	mov    %esi,%eax
    3506:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3509:	5b                   	pop    %ebx
    350a:	5e                   	pop    %esi
    350b:	5d                   	pop    %ebp
    350c:	c3                   	ret    
    350d:	8d 76 00             	lea    0x0(%esi),%esi
    3510:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3515:	eb ed                	jmp    3504 <stat+0x34>
    3517:	90                   	nop

00003518 <atoi>:
    3518:	55                   	push   %ebp
    3519:	89 e5                	mov    %esp,%ebp
    351b:	53                   	push   %ebx
    351c:	8b 4d 08             	mov    0x8(%ebp),%ecx
    351f:	0f be 01             	movsbl (%ecx),%eax
    3522:	8d 50 d0             	lea    -0x30(%eax),%edx
    3525:	80 fa 09             	cmp    $0x9,%dl
    3528:	ba 00 00 00 00       	mov    $0x0,%edx
    352d:	77 16                	ja     3545 <atoi+0x2d>
    352f:	90                   	nop
    3530:	41                   	inc    %ecx
    3531:	8d 14 92             	lea    (%edx,%edx,4),%edx
    3534:	01 d2                	add    %edx,%edx
    3536:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
    353a:	0f be 01             	movsbl (%ecx),%eax
    353d:	8d 58 d0             	lea    -0x30(%eax),%ebx
    3540:	80 fb 09             	cmp    $0x9,%bl
    3543:	76 eb                	jbe    3530 <atoi+0x18>
    3545:	89 d0                	mov    %edx,%eax
    3547:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    354a:	c9                   	leave  
    354b:	c3                   	ret    

0000354c <memmove>:
    354c:	55                   	push   %ebp
    354d:	89 e5                	mov    %esp,%ebp
    354f:	57                   	push   %edi
    3550:	56                   	push   %esi
    3551:	8b 55 08             	mov    0x8(%ebp),%edx
    3554:	8b 75 0c             	mov    0xc(%ebp),%esi
    3557:	8b 45 10             	mov    0x10(%ebp),%eax
    355a:	85 c0                	test   %eax,%eax
    355c:	7e 0b                	jle    3569 <memmove+0x1d>
    355e:	01 d0                	add    %edx,%eax
    3560:	89 d7                	mov    %edx,%edi
    3562:	66 90                	xchg   %ax,%ax
    3564:	a4                   	movsb  %ds:(%esi),%es:(%edi)
    3565:	39 f8                	cmp    %edi,%eax
    3567:	75 fb                	jne    3564 <memmove+0x18>
    3569:	89 d0                	mov    %edx,%eax
    356b:	5e                   	pop    %esi
    356c:	5f                   	pop    %edi
    356d:	5d                   	pop    %ebp
    356e:	c3                   	ret    

0000356f <fork>:
    356f:	b8 01 00 00 00       	mov    $0x1,%eax
    3574:	cd 40                	int    $0x40
    3576:	c3                   	ret    

00003577 <exit>:
    3577:	b8 02 00 00 00       	mov    $0x2,%eax
    357c:	cd 40                	int    $0x40
    357e:	c3                   	ret    

0000357f <wait>:
    357f:	b8 03 00 00 00       	mov    $0x3,%eax
    3584:	cd 40                	int    $0x40
    3586:	c3                   	ret    

00003587 <pipe>:
    3587:	b8 04 00 00 00       	mov    $0x4,%eax
    358c:	cd 40                	int    $0x40
    358e:	c3                   	ret    

0000358f <read>:
    358f:	b8 05 00 00 00       	mov    $0x5,%eax
    3594:	cd 40                	int    $0x40
    3596:	c3                   	ret    

00003597 <write>:
    3597:	b8 10 00 00 00       	mov    $0x10,%eax
    359c:	cd 40                	int    $0x40
    359e:	c3                   	ret    

0000359f <close>:
    359f:	b8 15 00 00 00       	mov    $0x15,%eax
    35a4:	cd 40                	int    $0x40
    35a6:	c3                   	ret    

000035a7 <kill>:
    35a7:	b8 06 00 00 00       	mov    $0x6,%eax
    35ac:	cd 40                	int    $0x40
    35ae:	c3                   	ret    

000035af <exec>:
    35af:	b8 07 00 00 00       	mov    $0x7,%eax
    35b4:	cd 40                	int    $0x40
    35b6:	c3                   	ret    

000035b7 <open>:
    35b7:	b8 0f 00 00 00       	mov    $0xf,%eax
    35bc:	cd 40                	int    $0x40
    35be:	c3                   	ret    

000035bf <mknod>:
    35bf:	b8 11 00 00 00       	mov    $0x11,%eax
    35c4:	cd 40                	int    $0x40
    35c6:	c3                   	ret    

000035c7 <unlink>:
    35c7:	b8 12 00 00 00       	mov    $0x12,%eax
    35cc:	cd 40                	int    $0x40
    35ce:	c3                   	ret    

000035cf <fstat>:
    35cf:	b8 08 00 00 00       	mov    $0x8,%eax
    35d4:	cd 40                	int    $0x40
    35d6:	c3                   	ret    

000035d7 <link>:
    35d7:	b8 13 00 00 00       	mov    $0x13,%eax
    35dc:	cd 40                	int    $0x40
    35de:	c3                   	ret    

000035df <mkdir>:
    35df:	b8 14 00 00 00       	mov    $0x14,%eax
    35e4:	cd 40                	int    $0x40
    35e6:	c3                   	ret    

000035e7 <chdir>:
    35e7:	b8 09 00 00 00       	mov    $0x9,%eax
    35ec:	cd 40                	int    $0x40
    35ee:	c3                   	ret    

000035ef <dup>:
    35ef:	b8 0a 00 00 00       	mov    $0xa,%eax
    35f4:	cd 40                	int    $0x40
    35f6:	c3                   	ret    

000035f7 <getpid>:
    35f7:	b8 0b 00 00 00       	mov    $0xb,%eax
    35fc:	cd 40                	int    $0x40
    35fe:	c3                   	ret    

000035ff <sbrk>:
    35ff:	b8 0c 00 00 00       	mov    $0xc,%eax
    3604:	cd 40                	int    $0x40
    3606:	c3                   	ret    

00003607 <sleep>:
    3607:	b8 0d 00 00 00       	mov    $0xd,%eax
    360c:	cd 40                	int    $0x40
    360e:	c3                   	ret    

0000360f <uptime>:
    360f:	b8 0e 00 00 00       	mov    $0xe,%eax
    3614:	cd 40                	int    $0x40
    3616:	c3                   	ret    

00003617 <getreadcount>:
    3617:	b8 16 00 00 00       	mov    $0x16,%eax
    361c:	cd 40                	int    $0x40
    361e:	c3                   	ret    
    361f:	90                   	nop

00003620 <printint>:
    3620:	55                   	push   %ebp
    3621:	89 e5                	mov    %esp,%ebp
    3623:	57                   	push   %edi
    3624:	56                   	push   %esi
    3625:	53                   	push   %ebx
    3626:	83 ec 3c             	sub    $0x3c,%esp
    3629:	89 45 c0             	mov    %eax,-0x40(%ebp)
    362c:	89 cb                	mov    %ecx,%ebx
    362e:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3631:	85 c9                	test   %ecx,%ecx
    3633:	74 04                	je     3639 <printint+0x19>
    3635:	85 d2                	test   %edx,%edx
    3637:	78 6b                	js     36a4 <printint+0x84>
    3639:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    363c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
    3643:	31 c9                	xor    %ecx,%ecx
    3645:	8d 75 d7             	lea    -0x29(%ebp),%esi
    3648:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    364b:	31 d2                	xor    %edx,%edx
    364d:	f7 f3                	div    %ebx
    364f:	89 cf                	mov    %ecx,%edi
    3651:	8d 49 01             	lea    0x1(%ecx),%ecx
    3654:	8a 92 98 51 00 00    	mov    0x5198(%edx),%dl
    365a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
    365e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    3661:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3664:	39 da                	cmp    %ebx,%edx
    3666:	73 e0                	jae    3648 <printint+0x28>
    3668:	8b 55 08             	mov    0x8(%ebp),%edx
    366b:	85 d2                	test   %edx,%edx
    366d:	74 07                	je     3676 <printint+0x56>
    366f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    3674:	89 cf                	mov    %ecx,%edi
    3676:	8d 5d d8             	lea    -0x28(%ebp),%ebx
    3679:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
    367d:	8d 76 00             	lea    0x0(%esi),%esi
    3680:	8a 07                	mov    (%edi),%al
    3682:	88 45 d7             	mov    %al,-0x29(%ebp)
    3685:	50                   	push   %eax
    3686:	6a 01                	push   $0x1
    3688:	56                   	push   %esi
    3689:	ff 75 c0             	pushl  -0x40(%ebp)
    368c:	e8 06 ff ff ff       	call   3597 <write>
    3691:	89 f8                	mov    %edi,%eax
    3693:	4f                   	dec    %edi
    3694:	83 c4 10             	add    $0x10,%esp
    3697:	39 d8                	cmp    %ebx,%eax
    3699:	75 e5                	jne    3680 <printint+0x60>
    369b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    369e:	5b                   	pop    %ebx
    369f:	5e                   	pop    %esi
    36a0:	5f                   	pop    %edi
    36a1:	5d                   	pop    %ebp
    36a2:	c3                   	ret    
    36a3:	90                   	nop
    36a4:	f7 da                	neg    %edx
    36a6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
    36a9:	eb 98                	jmp    3643 <printint+0x23>
    36ab:	90                   	nop

000036ac <printf>:
    36ac:	55                   	push   %ebp
    36ad:	89 e5                	mov    %esp,%ebp
    36af:	57                   	push   %edi
    36b0:	56                   	push   %esi
    36b1:	53                   	push   %ebx
    36b2:	83 ec 2c             	sub    $0x2c,%esp
    36b5:	8b 75 08             	mov    0x8(%ebp),%esi
    36b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    36bb:	8a 13                	mov    (%ebx),%dl
    36bd:	84 d2                	test   %dl,%dl
    36bf:	74 5c                	je     371d <printf+0x71>
    36c1:	43                   	inc    %ebx
    36c2:	8d 45 10             	lea    0x10(%ebp),%eax
    36c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    36c8:	31 ff                	xor    %edi,%edi
    36ca:	eb 20                	jmp    36ec <printf+0x40>
    36cc:	83 f8 25             	cmp    $0x25,%eax
    36cf:	74 3f                	je     3710 <printf+0x64>
    36d1:	88 55 e7             	mov    %dl,-0x19(%ebp)
    36d4:	50                   	push   %eax
    36d5:	6a 01                	push   $0x1
    36d7:	8d 45 e7             	lea    -0x19(%ebp),%eax
    36da:	50                   	push   %eax
    36db:	56                   	push   %esi
    36dc:	e8 b6 fe ff ff       	call   3597 <write>
    36e1:	83 c4 10             	add    $0x10,%esp
    36e4:	43                   	inc    %ebx
    36e5:	8a 53 ff             	mov    -0x1(%ebx),%dl
    36e8:	84 d2                	test   %dl,%dl
    36ea:	74 31                	je     371d <printf+0x71>
    36ec:	0f b6 c2             	movzbl %dl,%eax
    36ef:	85 ff                	test   %edi,%edi
    36f1:	74 d9                	je     36cc <printf+0x20>
    36f3:	83 ff 25             	cmp    $0x25,%edi
    36f6:	75 ec                	jne    36e4 <printf+0x38>
    36f8:	83 f8 25             	cmp    $0x25,%eax
    36fb:	0f 84 03 01 00 00    	je     3804 <printf+0x158>
    3701:	83 e8 63             	sub    $0x63,%eax
    3704:	83 f8 15             	cmp    $0x15,%eax
    3707:	77 1f                	ja     3728 <printf+0x7c>
    3709:	ff 24 85 40 51 00 00 	jmp    *0x5140(,%eax,4)
    3710:	bf 25 00 00 00       	mov    $0x25,%edi
    3715:	43                   	inc    %ebx
    3716:	8a 53 ff             	mov    -0x1(%ebx),%dl
    3719:	84 d2                	test   %dl,%dl
    371b:	75 cf                	jne    36ec <printf+0x40>
    371d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3720:	5b                   	pop    %ebx
    3721:	5e                   	pop    %esi
    3722:	5f                   	pop    %edi
    3723:	5d                   	pop    %ebp
    3724:	c3                   	ret    
    3725:	8d 76 00             	lea    0x0(%esi),%esi
    3728:	88 55 d0             	mov    %dl,-0x30(%ebp)
    372b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    372f:	50                   	push   %eax
    3730:	6a 01                	push   $0x1
    3732:	8d 7d e7             	lea    -0x19(%ebp),%edi
    3735:	57                   	push   %edi
    3736:	56                   	push   %esi
    3737:	e8 5b fe ff ff       	call   3597 <write>
    373c:	8a 55 d0             	mov    -0x30(%ebp),%dl
    373f:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3742:	83 c4 0c             	add    $0xc,%esp
    3745:	6a 01                	push   $0x1
    3747:	57                   	push   %edi
    3748:	56                   	push   %esi
    3749:	e8 49 fe ff ff       	call   3597 <write>
    374e:	83 c4 10             	add    $0x10,%esp
    3751:	31 ff                	xor    %edi,%edi
    3753:	eb 8f                	jmp    36e4 <printf+0x38>
    3755:	8d 76 00             	lea    0x0(%esi),%esi
    3758:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    375b:	8b 17                	mov    (%edi),%edx
    375d:	83 ec 0c             	sub    $0xc,%esp
    3760:	6a 00                	push   $0x0
    3762:	b9 10 00 00 00       	mov    $0x10,%ecx
    3767:	89 f0                	mov    %esi,%eax
    3769:	e8 b2 fe ff ff       	call   3620 <printint>
    376e:	83 c7 04             	add    $0x4,%edi
    3771:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3774:	83 c4 10             	add    $0x10,%esp
    3777:	31 ff                	xor    %edi,%edi
    3779:	e9 66 ff ff ff       	jmp    36e4 <printf+0x38>
    377e:	66 90                	xchg   %ax,%ax
    3780:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3783:	8b 10                	mov    (%eax),%edx
    3785:	83 c0 04             	add    $0x4,%eax
    3788:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    378b:	85 d2                	test   %edx,%edx
    378d:	0f 84 81 00 00 00    	je     3814 <printf+0x168>
    3793:	8a 02                	mov    (%edx),%al
    3795:	84 c0                	test   %al,%al
    3797:	0f 84 80 00 00 00    	je     381d <printf+0x171>
    379d:	8d 7d e7             	lea    -0x19(%ebp),%edi
    37a0:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    37a3:	89 d3                	mov    %edx,%ebx
    37a5:	8d 76 00             	lea    0x0(%esi),%esi
    37a8:	88 45 e7             	mov    %al,-0x19(%ebp)
    37ab:	50                   	push   %eax
    37ac:	6a 01                	push   $0x1
    37ae:	57                   	push   %edi
    37af:	56                   	push   %esi
    37b0:	e8 e2 fd ff ff       	call   3597 <write>
    37b5:	43                   	inc    %ebx
    37b6:	8a 03                	mov    (%ebx),%al
    37b8:	83 c4 10             	add    $0x10,%esp
    37bb:	84 c0                	test   %al,%al
    37bd:	75 e9                	jne    37a8 <printf+0xfc>
    37bf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    37c2:	31 ff                	xor    %edi,%edi
    37c4:	e9 1b ff ff ff       	jmp    36e4 <printf+0x38>
    37c9:	8d 76 00             	lea    0x0(%esi),%esi
    37cc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    37cf:	8b 17                	mov    (%edi),%edx
    37d1:	83 ec 0c             	sub    $0xc,%esp
    37d4:	6a 01                	push   $0x1
    37d6:	b9 0a 00 00 00       	mov    $0xa,%ecx
    37db:	eb 8a                	jmp    3767 <printf+0xbb>
    37dd:	8d 76 00             	lea    0x0(%esi),%esi
    37e0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    37e3:	8b 00                	mov    (%eax),%eax
    37e5:	88 45 e7             	mov    %al,-0x19(%ebp)
    37e8:	51                   	push   %ecx
    37e9:	6a 01                	push   $0x1
    37eb:	8d 7d e7             	lea    -0x19(%ebp),%edi
    37ee:	57                   	push   %edi
    37ef:	56                   	push   %esi
    37f0:	e8 a2 fd ff ff       	call   3597 <write>
    37f5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    37f9:	83 c4 10             	add    $0x10,%esp
    37fc:	31 ff                	xor    %edi,%edi
    37fe:	e9 e1 fe ff ff       	jmp    36e4 <printf+0x38>
    3803:	90                   	nop
    3804:	88 55 e7             	mov    %dl,-0x19(%ebp)
    3807:	52                   	push   %edx
    3808:	6a 01                	push   $0x1
    380a:	8d 7d e7             	lea    -0x19(%ebp),%edi
    380d:	e9 35 ff ff ff       	jmp    3747 <printf+0x9b>
    3812:	66 90                	xchg   %ax,%ax
    3814:	b0 28                	mov    $0x28,%al
    3816:	ba 38 51 00 00       	mov    $0x5138,%edx
    381b:	eb 80                	jmp    379d <printf+0xf1>
    381d:	31 ff                	xor    %edi,%edi
    381f:	e9 c0 fe ff ff       	jmp    36e4 <printf+0x38>

00003824 <free>:
    3824:	55                   	push   %ebp
    3825:	89 e5                	mov    %esp,%ebp
    3827:	57                   	push   %edi
    3828:	56                   	push   %esi
    3829:	53                   	push   %ebx
    382a:	8b 5d 08             	mov    0x8(%ebp),%ebx
    382d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3830:	a1 80 99 00 00       	mov    0x9980,%eax
    3835:	8d 76 00             	lea    0x0(%esi),%esi
    3838:	89 c2                	mov    %eax,%edx
    383a:	8b 00                	mov    (%eax),%eax
    383c:	39 ca                	cmp    %ecx,%edx
    383e:	73 2c                	jae    386c <free+0x48>
    3840:	39 c1                	cmp    %eax,%ecx
    3842:	72 04                	jb     3848 <free+0x24>
    3844:	39 c2                	cmp    %eax,%edx
    3846:	72 f0                	jb     3838 <free+0x14>
    3848:	8b 73 fc             	mov    -0x4(%ebx),%esi
    384b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    384e:	39 f8                	cmp    %edi,%eax
    3850:	74 2c                	je     387e <free+0x5a>
    3852:	89 43 f8             	mov    %eax,-0x8(%ebx)
    3855:	8b 42 04             	mov    0x4(%edx),%eax
    3858:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    385b:	39 f1                	cmp    %esi,%ecx
    385d:	74 36                	je     3895 <free+0x71>
    385f:	89 0a                	mov    %ecx,(%edx)
    3861:	89 15 80 99 00 00    	mov    %edx,0x9980
    3867:	5b                   	pop    %ebx
    3868:	5e                   	pop    %esi
    3869:	5f                   	pop    %edi
    386a:	5d                   	pop    %ebp
    386b:	c3                   	ret    
    386c:	39 c2                	cmp    %eax,%edx
    386e:	72 c8                	jb     3838 <free+0x14>
    3870:	39 c1                	cmp    %eax,%ecx
    3872:	73 c4                	jae    3838 <free+0x14>
    3874:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3877:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    387a:	39 f8                	cmp    %edi,%eax
    387c:	75 d4                	jne    3852 <free+0x2e>
    387e:	03 70 04             	add    0x4(%eax),%esi
    3881:	89 73 fc             	mov    %esi,-0x4(%ebx)
    3884:	8b 02                	mov    (%edx),%eax
    3886:	8b 00                	mov    (%eax),%eax
    3888:	89 43 f8             	mov    %eax,-0x8(%ebx)
    388b:	8b 42 04             	mov    0x4(%edx),%eax
    388e:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    3891:	39 f1                	cmp    %esi,%ecx
    3893:	75 ca                	jne    385f <free+0x3b>
    3895:	03 43 fc             	add    -0x4(%ebx),%eax
    3898:	89 42 04             	mov    %eax,0x4(%edx)
    389b:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    389e:	89 0a                	mov    %ecx,(%edx)
    38a0:	89 15 80 99 00 00    	mov    %edx,0x9980
    38a6:	5b                   	pop    %ebx
    38a7:	5e                   	pop    %esi
    38a8:	5f                   	pop    %edi
    38a9:	5d                   	pop    %ebp
    38aa:	c3                   	ret    
    38ab:	90                   	nop

000038ac <malloc>:
    38ac:	55                   	push   %ebp
    38ad:	89 e5                	mov    %esp,%ebp
    38af:	57                   	push   %edi
    38b0:	56                   	push   %esi
    38b1:	53                   	push   %ebx
    38b2:	83 ec 0c             	sub    $0xc,%esp
    38b5:	8b 45 08             	mov    0x8(%ebp),%eax
    38b8:	8d 78 07             	lea    0x7(%eax),%edi
    38bb:	c1 ef 03             	shr    $0x3,%edi
    38be:	47                   	inc    %edi
    38bf:	8b 15 80 99 00 00    	mov    0x9980,%edx
    38c5:	85 d2                	test   %edx,%edx
    38c7:	0f 84 93 00 00 00    	je     3960 <malloc+0xb4>
    38cd:	8b 02                	mov    (%edx),%eax
    38cf:	8b 48 04             	mov    0x4(%eax),%ecx
    38d2:	39 f9                	cmp    %edi,%ecx
    38d4:	73 62                	jae    3938 <malloc+0x8c>
    38d6:	89 fb                	mov    %edi,%ebx
    38d8:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    38de:	72 78                	jb     3958 <malloc+0xac>
    38e0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    38e7:	eb 0e                	jmp    38f7 <malloc+0x4b>
    38e9:	8d 76 00             	lea    0x0(%esi),%esi
    38ec:	89 c2                	mov    %eax,%edx
    38ee:	8b 02                	mov    (%edx),%eax
    38f0:	8b 48 04             	mov    0x4(%eax),%ecx
    38f3:	39 f9                	cmp    %edi,%ecx
    38f5:	73 41                	jae    3938 <malloc+0x8c>
    38f7:	39 05 80 99 00 00    	cmp    %eax,0x9980
    38fd:	75 ed                	jne    38ec <malloc+0x40>
    38ff:	83 ec 0c             	sub    $0xc,%esp
    3902:	56                   	push   %esi
    3903:	e8 f7 fc ff ff       	call   35ff <sbrk>
    3908:	83 c4 10             	add    $0x10,%esp
    390b:	83 f8 ff             	cmp    $0xffffffff,%eax
    390e:	74 1c                	je     392c <malloc+0x80>
    3910:	89 58 04             	mov    %ebx,0x4(%eax)
    3913:	83 ec 0c             	sub    $0xc,%esp
    3916:	83 c0 08             	add    $0x8,%eax
    3919:	50                   	push   %eax
    391a:	e8 05 ff ff ff       	call   3824 <free>
    391f:	8b 15 80 99 00 00    	mov    0x9980,%edx
    3925:	83 c4 10             	add    $0x10,%esp
    3928:	85 d2                	test   %edx,%edx
    392a:	75 c2                	jne    38ee <malloc+0x42>
    392c:	31 c0                	xor    %eax,%eax
    392e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3931:	5b                   	pop    %ebx
    3932:	5e                   	pop    %esi
    3933:	5f                   	pop    %edi
    3934:	5d                   	pop    %ebp
    3935:	c3                   	ret    
    3936:	66 90                	xchg   %ax,%ax
    3938:	39 cf                	cmp    %ecx,%edi
    393a:	74 4c                	je     3988 <malloc+0xdc>
    393c:	29 f9                	sub    %edi,%ecx
    393e:	89 48 04             	mov    %ecx,0x4(%eax)
    3941:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    3944:	89 78 04             	mov    %edi,0x4(%eax)
    3947:	89 15 80 99 00 00    	mov    %edx,0x9980
    394d:	83 c0 08             	add    $0x8,%eax
    3950:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3953:	5b                   	pop    %ebx
    3954:	5e                   	pop    %esi
    3955:	5f                   	pop    %edi
    3956:	5d                   	pop    %ebp
    3957:	c3                   	ret    
    3958:	bb 00 10 00 00       	mov    $0x1000,%ebx
    395d:	eb 81                	jmp    38e0 <malloc+0x34>
    395f:	90                   	nop
    3960:	c7 05 80 99 00 00 84 	movl   $0x9984,0x9980
    3967:	99 00 00 
    396a:	c7 05 84 99 00 00 84 	movl   $0x9984,0x9984
    3971:	99 00 00 
    3974:	c7 05 88 99 00 00 00 	movl   $0x0,0x9988
    397b:	00 00 00 
    397e:	b8 84 99 00 00       	mov    $0x9984,%eax
    3983:	e9 4e ff ff ff       	jmp    38d6 <malloc+0x2a>
    3988:	8b 08                	mov    (%eax),%ecx
    398a:	89 0a                	mov    %ecx,(%edx)
    398c:	eb b9                	jmp    3947 <malloc+0x9b>
