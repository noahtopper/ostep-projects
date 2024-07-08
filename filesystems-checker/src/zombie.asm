
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	50                   	push   %eax
   f:	e8 d3 01 00 00       	call   1e7 <fork>
  14:	85 c0                	test   %eax,%eax
  16:	7e 0d                	jle    25 <main+0x25>
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	6a 05                	push   $0x5
  1d:	e8 5d 02 00 00       	call   27f <sleep>
  22:	83 c4 10             	add    $0x10,%esp
  25:	e8 c5 01 00 00       	call   1ef <exit>
  2a:	66 90                	xchg   %ax,%ax

0000002c <strcpy>:
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	53                   	push   %ebx
  30:	8b 4d 08             	mov    0x8(%ebp),%ecx
  33:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  36:	31 c0                	xor    %eax,%eax
  38:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  3b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  3e:	40                   	inc    %eax
  3f:	84 d2                	test   %dl,%dl
  41:	75 f5                	jne    38 <strcpy+0xc>
  43:	89 c8                	mov    %ecx,%eax
  45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  48:	c9                   	leave  
  49:	c3                   	ret    
  4a:	66 90                	xchg   %ax,%ax

0000004c <strcmp>:
  4c:	55                   	push   %ebp
  4d:	89 e5                	mov    %esp,%ebp
  4f:	53                   	push   %ebx
  50:	8b 55 08             	mov    0x8(%ebp),%edx
  53:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  56:	0f b6 02             	movzbl (%edx),%eax
  59:	84 c0                	test   %al,%al
  5b:	75 10                	jne    6d <strcmp+0x21>
  5d:	eb 2a                	jmp    89 <strcmp+0x3d>
  5f:	90                   	nop
  60:	42                   	inc    %edx
  61:	8d 4b 01             	lea    0x1(%ebx),%ecx
  64:	0f b6 02             	movzbl (%edx),%eax
  67:	84 c0                	test   %al,%al
  69:	74 11                	je     7c <strcmp+0x30>
  6b:	89 cb                	mov    %ecx,%ebx
  6d:	0f b6 0b             	movzbl (%ebx),%ecx
  70:	38 c1                	cmp    %al,%cl
  72:	74 ec                	je     60 <strcmp+0x14>
  74:	29 c8                	sub    %ecx,%eax
  76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  79:	c9                   	leave  
  7a:	c3                   	ret    
  7b:	90                   	nop
  7c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  80:	31 c0                	xor    %eax,%eax
  82:	29 c8                	sub    %ecx,%eax
  84:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  87:	c9                   	leave  
  88:	c3                   	ret    
  89:	0f b6 0b             	movzbl (%ebx),%ecx
  8c:	31 c0                	xor    %eax,%eax
  8e:	eb e4                	jmp    74 <strcmp+0x28>

00000090 <strlen>:
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 55 08             	mov    0x8(%ebp),%edx
  96:	80 3a 00             	cmpb   $0x0,(%edx)
  99:	74 15                	je     b0 <strlen+0x20>
  9b:	31 c0                	xor    %eax,%eax
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  a0:	40                   	inc    %eax
  a1:	89 c1                	mov    %eax,%ecx
  a3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  a7:	75 f7                	jne    a0 <strlen+0x10>
  a9:	89 c8                	mov    %ecx,%eax
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  b0:	31 c9                	xor    %ecx,%ecx
  b2:	89 c8                	mov    %ecx,%eax
  b4:	5d                   	pop    %ebp
  b5:	c3                   	ret    
  b6:	66 90                	xchg   %ax,%ax

000000b8 <memset>:
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	8b 7d 08             	mov    0x8(%ebp),%edi
  bf:	8b 4d 10             	mov    0x10(%ebp),%ecx
  c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  c5:	fc                   	cld    
  c6:	f3 aa                	rep stos %al,%es:(%edi)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ce:	c9                   	leave  
  cf:	c3                   	ret    

000000d0 <strchr>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	8a 4d 0c             	mov    0xc(%ebp),%cl
  d9:	8a 10                	mov    (%eax),%dl
  db:	84 d2                	test   %dl,%dl
  dd:	75 0c                	jne    eb <strchr+0x1b>
  df:	eb 13                	jmp    f4 <strchr+0x24>
  e1:	8d 76 00             	lea    0x0(%esi),%esi
  e4:	40                   	inc    %eax
  e5:	8a 10                	mov    (%eax),%dl
  e7:	84 d2                	test   %dl,%dl
  e9:	74 09                	je     f4 <strchr+0x24>
  eb:	38 d1                	cmp    %dl,%cl
  ed:	75 f5                	jne    e4 <strchr+0x14>
  ef:	5d                   	pop    %ebp
  f0:	c3                   	ret    
  f1:	8d 76 00             	lea    0x0(%esi),%esi
  f4:	31 c0                	xor    %eax,%eax
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    

000000f8 <gets>:
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	57                   	push   %edi
  fc:	56                   	push   %esi
  fd:	53                   	push   %ebx
  fe:	83 ec 1c             	sub    $0x1c,%esp
 101:	31 db                	xor    %ebx,%ebx
 103:	8d 75 e7             	lea    -0x19(%ebp),%esi
 106:	eb 24                	jmp    12c <gets+0x34>
 108:	50                   	push   %eax
 109:	6a 01                	push   $0x1
 10b:	56                   	push   %esi
 10c:	6a 00                	push   $0x0
 10e:	e8 f4 00 00 00       	call   207 <read>
 113:	83 c4 10             	add    $0x10,%esp
 116:	85 c0                	test   %eax,%eax
 118:	7e 1a                	jle    134 <gets+0x3c>
 11a:	8a 45 e7             	mov    -0x19(%ebp),%al
 11d:	8b 55 08             	mov    0x8(%ebp),%edx
 120:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 124:	3c 0a                	cmp    $0xa,%al
 126:	74 0e                	je     136 <gets+0x3e>
 128:	3c 0d                	cmp    $0xd,%al
 12a:	74 0a                	je     136 <gets+0x3e>
 12c:	89 df                	mov    %ebx,%edi
 12e:	43                   	inc    %ebx
 12f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 132:	7c d4                	jl     108 <gets+0x10>
 134:	89 fb                	mov    %edi,%ebx
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 13d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi

00000148 <stat>:
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	56                   	push   %esi
 14c:	53                   	push   %ebx
 14d:	83 ec 08             	sub    $0x8,%esp
 150:	6a 00                	push   $0x0
 152:	ff 75 08             	pushl  0x8(%ebp)
 155:	e8 d5 00 00 00       	call   22f <open>
 15a:	83 c4 10             	add    $0x10,%esp
 15d:	85 c0                	test   %eax,%eax
 15f:	78 27                	js     188 <stat+0x40>
 161:	89 c3                	mov    %eax,%ebx
 163:	83 ec 08             	sub    $0x8,%esp
 166:	ff 75 0c             	pushl  0xc(%ebp)
 169:	50                   	push   %eax
 16a:	e8 d8 00 00 00       	call   247 <fstat>
 16f:	89 c6                	mov    %eax,%esi
 171:	89 1c 24             	mov    %ebx,(%esp)
 174:	e8 9e 00 00 00       	call   217 <close>
 179:	83 c4 10             	add    $0x10,%esp
 17c:	89 f0                	mov    %esi,%eax
 17e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 181:	5b                   	pop    %ebx
 182:	5e                   	pop    %esi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 76 00             	lea    0x0(%esi),%esi
 188:	be ff ff ff ff       	mov    $0xffffffff,%esi
 18d:	eb ed                	jmp    17c <stat+0x34>
 18f:	90                   	nop

00000190 <atoi>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 4d 08             	mov    0x8(%ebp),%ecx
 197:	0f be 01             	movsbl (%ecx),%eax
 19a:	8d 50 d0             	lea    -0x30(%eax),%edx
 19d:	80 fa 09             	cmp    $0x9,%dl
 1a0:	ba 00 00 00 00       	mov    $0x0,%edx
 1a5:	77 16                	ja     1bd <atoi+0x2d>
 1a7:	90                   	nop
 1a8:	41                   	inc    %ecx
 1a9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1ac:	01 d2                	add    %edx,%edx
 1ae:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1b2:	0f be 01             	movsbl (%ecx),%eax
 1b5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1b8:	80 fb 09             	cmp    $0x9,%bl
 1bb:	76 eb                	jbe    1a8 <atoi+0x18>
 1bd:	89 d0                	mov    %edx,%eax
 1bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c2:	c9                   	leave  
 1c3:	c3                   	ret    

000001c4 <memmove>:
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	56                   	push   %esi
 1c9:	8b 55 08             	mov    0x8(%ebp),%edx
 1cc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1cf:	8b 45 10             	mov    0x10(%ebp),%eax
 1d2:	85 c0                	test   %eax,%eax
 1d4:	7e 0b                	jle    1e1 <memmove+0x1d>
 1d6:	01 d0                	add    %edx,%eax
 1d8:	89 d7                	mov    %edx,%edi
 1da:	66 90                	xchg   %ax,%ax
 1dc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 1dd:	39 f8                	cmp    %edi,%eax
 1df:	75 fb                	jne    1dc <memmove+0x18>
 1e1:	89 d0                	mov    %edx,%eax
 1e3:	5e                   	pop    %esi
 1e4:	5f                   	pop    %edi
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <fork>:
 1e7:	b8 01 00 00 00       	mov    $0x1,%eax
 1ec:	cd 40                	int    $0x40
 1ee:	c3                   	ret    

000001ef <exit>:
 1ef:	b8 02 00 00 00       	mov    $0x2,%eax
 1f4:	cd 40                	int    $0x40
 1f6:	c3                   	ret    

000001f7 <wait>:
 1f7:	b8 03 00 00 00       	mov    $0x3,%eax
 1fc:	cd 40                	int    $0x40
 1fe:	c3                   	ret    

000001ff <pipe>:
 1ff:	b8 04 00 00 00       	mov    $0x4,%eax
 204:	cd 40                	int    $0x40
 206:	c3                   	ret    

00000207 <read>:
 207:	b8 05 00 00 00       	mov    $0x5,%eax
 20c:	cd 40                	int    $0x40
 20e:	c3                   	ret    

0000020f <write>:
 20f:	b8 10 00 00 00       	mov    $0x10,%eax
 214:	cd 40                	int    $0x40
 216:	c3                   	ret    

00000217 <close>:
 217:	b8 15 00 00 00       	mov    $0x15,%eax
 21c:	cd 40                	int    $0x40
 21e:	c3                   	ret    

0000021f <kill>:
 21f:	b8 06 00 00 00       	mov    $0x6,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <exec>:
 227:	b8 07 00 00 00       	mov    $0x7,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <open>:
 22f:	b8 0f 00 00 00       	mov    $0xf,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <mknod>:
 237:	b8 11 00 00 00       	mov    $0x11,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <unlink>:
 23f:	b8 12 00 00 00       	mov    $0x12,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <fstat>:
 247:	b8 08 00 00 00       	mov    $0x8,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <link>:
 24f:	b8 13 00 00 00       	mov    $0x13,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <mkdir>:
 257:	b8 14 00 00 00       	mov    $0x14,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <chdir>:
 25f:	b8 09 00 00 00       	mov    $0x9,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <dup>:
 267:	b8 0a 00 00 00       	mov    $0xa,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <getpid>:
 26f:	b8 0b 00 00 00       	mov    $0xb,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <sbrk>:
 277:	b8 0c 00 00 00       	mov    $0xc,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <sleep>:
 27f:	b8 0d 00 00 00       	mov    $0xd,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <uptime>:
 287:	b8 0e 00 00 00       	mov    $0xe,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <getreadcount>:
 28f:	b8 16 00 00 00       	mov    $0x16,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    
 297:	90                   	nop

00000298 <printint>:
 298:	55                   	push   %ebp
 299:	89 e5                	mov    %esp,%ebp
 29b:	57                   	push   %edi
 29c:	56                   	push   %esi
 29d:	53                   	push   %ebx
 29e:	83 ec 3c             	sub    $0x3c,%esp
 2a1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2a4:	89 cb                	mov    %ecx,%ebx
 2a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2a9:	85 c9                	test   %ecx,%ecx
 2ab:	74 04                	je     2b1 <printint+0x19>
 2ad:	85 d2                	test   %edx,%edx
 2af:	78 6b                	js     31c <printint+0x84>
 2b1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2b4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2bb:	31 c9                	xor    %ecx,%ecx
 2bd:	8d 75 d7             	lea    -0x29(%ebp),%esi
 2c0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2c3:	31 d2                	xor    %edx,%edx
 2c5:	f7 f3                	div    %ebx
 2c7:	89 cf                	mov    %ecx,%edi
 2c9:	8d 49 01             	lea    0x1(%ecx),%ecx
 2cc:	8a 92 68 06 00 00    	mov    0x668(%edx),%dl
 2d2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 2d6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 2d9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2dc:	39 da                	cmp    %ebx,%edx
 2de:	73 e0                	jae    2c0 <printint+0x28>
 2e0:	8b 55 08             	mov    0x8(%ebp),%edx
 2e3:	85 d2                	test   %edx,%edx
 2e5:	74 07                	je     2ee <printint+0x56>
 2e7:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 2ec:	89 cf                	mov    %ecx,%edi
 2ee:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 2f1:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 2f5:	8d 76 00             	lea    0x0(%esi),%esi
 2f8:	8a 07                	mov    (%edi),%al
 2fa:	88 45 d7             	mov    %al,-0x29(%ebp)
 2fd:	50                   	push   %eax
 2fe:	6a 01                	push   $0x1
 300:	56                   	push   %esi
 301:	ff 75 c0             	pushl  -0x40(%ebp)
 304:	e8 06 ff ff ff       	call   20f <write>
 309:	89 f8                	mov    %edi,%eax
 30b:	4f                   	dec    %edi
 30c:	83 c4 10             	add    $0x10,%esp
 30f:	39 d8                	cmp    %ebx,%eax
 311:	75 e5                	jne    2f8 <printint+0x60>
 313:	8d 65 f4             	lea    -0xc(%ebp),%esp
 316:	5b                   	pop    %ebx
 317:	5e                   	pop    %esi
 318:	5f                   	pop    %edi
 319:	5d                   	pop    %ebp
 31a:	c3                   	ret    
 31b:	90                   	nop
 31c:	f7 da                	neg    %edx
 31e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 321:	eb 98                	jmp    2bb <printint+0x23>
 323:	90                   	nop

00000324 <printf>:
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	57                   	push   %edi
 328:	56                   	push   %esi
 329:	53                   	push   %ebx
 32a:	83 ec 2c             	sub    $0x2c,%esp
 32d:	8b 75 08             	mov    0x8(%ebp),%esi
 330:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 333:	8a 13                	mov    (%ebx),%dl
 335:	84 d2                	test   %dl,%dl
 337:	74 5c                	je     395 <printf+0x71>
 339:	43                   	inc    %ebx
 33a:	8d 45 10             	lea    0x10(%ebp),%eax
 33d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 340:	31 ff                	xor    %edi,%edi
 342:	eb 20                	jmp    364 <printf+0x40>
 344:	83 f8 25             	cmp    $0x25,%eax
 347:	74 3f                	je     388 <printf+0x64>
 349:	88 55 e7             	mov    %dl,-0x19(%ebp)
 34c:	50                   	push   %eax
 34d:	6a 01                	push   $0x1
 34f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 352:	50                   	push   %eax
 353:	56                   	push   %esi
 354:	e8 b6 fe ff ff       	call   20f <write>
 359:	83 c4 10             	add    $0x10,%esp
 35c:	43                   	inc    %ebx
 35d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 360:	84 d2                	test   %dl,%dl
 362:	74 31                	je     395 <printf+0x71>
 364:	0f b6 c2             	movzbl %dl,%eax
 367:	85 ff                	test   %edi,%edi
 369:	74 d9                	je     344 <printf+0x20>
 36b:	83 ff 25             	cmp    $0x25,%edi
 36e:	75 ec                	jne    35c <printf+0x38>
 370:	83 f8 25             	cmp    $0x25,%eax
 373:	0f 84 03 01 00 00    	je     47c <printf+0x158>
 379:	83 e8 63             	sub    $0x63,%eax
 37c:	83 f8 15             	cmp    $0x15,%eax
 37f:	77 1f                	ja     3a0 <printf+0x7c>
 381:	ff 24 85 10 06 00 00 	jmp    *0x610(,%eax,4)
 388:	bf 25 00 00 00       	mov    $0x25,%edi
 38d:	43                   	inc    %ebx
 38e:	8a 53 ff             	mov    -0x1(%ebx),%dl
 391:	84 d2                	test   %dl,%dl
 393:	75 cf                	jne    364 <printf+0x40>
 395:	8d 65 f4             	lea    -0xc(%ebp),%esp
 398:	5b                   	pop    %ebx
 399:	5e                   	pop    %esi
 39a:	5f                   	pop    %edi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3a3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3a7:	50                   	push   %eax
 3a8:	6a 01                	push   $0x1
 3aa:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3ad:	57                   	push   %edi
 3ae:	56                   	push   %esi
 3af:	e8 5b fe ff ff       	call   20f <write>
 3b4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3b7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3ba:	83 c4 0c             	add    $0xc,%esp
 3bd:	6a 01                	push   $0x1
 3bf:	57                   	push   %edi
 3c0:	56                   	push   %esi
 3c1:	e8 49 fe ff ff       	call   20f <write>
 3c6:	83 c4 10             	add    $0x10,%esp
 3c9:	31 ff                	xor    %edi,%edi
 3cb:	eb 8f                	jmp    35c <printf+0x38>
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3d3:	8b 17                	mov    (%edi),%edx
 3d5:	83 ec 0c             	sub    $0xc,%esp
 3d8:	6a 00                	push   $0x0
 3da:	b9 10 00 00 00       	mov    $0x10,%ecx
 3df:	89 f0                	mov    %esi,%eax
 3e1:	e8 b2 fe ff ff       	call   298 <printint>
 3e6:	83 c7 04             	add    $0x4,%edi
 3e9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 3ec:	83 c4 10             	add    $0x10,%esp
 3ef:	31 ff                	xor    %edi,%edi
 3f1:	e9 66 ff ff ff       	jmp    35c <printf+0x38>
 3f6:	66 90                	xchg   %ax,%ax
 3f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 3fb:	8b 10                	mov    (%eax),%edx
 3fd:	83 c0 04             	add    $0x4,%eax
 400:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 403:	85 d2                	test   %edx,%edx
 405:	0f 84 81 00 00 00    	je     48c <printf+0x168>
 40b:	8a 02                	mov    (%edx),%al
 40d:	84 c0                	test   %al,%al
 40f:	0f 84 80 00 00 00    	je     495 <printf+0x171>
 415:	8d 7d e7             	lea    -0x19(%ebp),%edi
 418:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 41b:	89 d3                	mov    %edx,%ebx
 41d:	8d 76 00             	lea    0x0(%esi),%esi
 420:	88 45 e7             	mov    %al,-0x19(%ebp)
 423:	50                   	push   %eax
 424:	6a 01                	push   $0x1
 426:	57                   	push   %edi
 427:	56                   	push   %esi
 428:	e8 e2 fd ff ff       	call   20f <write>
 42d:	43                   	inc    %ebx
 42e:	8a 03                	mov    (%ebx),%al
 430:	83 c4 10             	add    $0x10,%esp
 433:	84 c0                	test   %al,%al
 435:	75 e9                	jne    420 <printf+0xfc>
 437:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 43a:	31 ff                	xor    %edi,%edi
 43c:	e9 1b ff ff ff       	jmp    35c <printf+0x38>
 441:	8d 76 00             	lea    0x0(%esi),%esi
 444:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 447:	8b 17                	mov    (%edi),%edx
 449:	83 ec 0c             	sub    $0xc,%esp
 44c:	6a 01                	push   $0x1
 44e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 453:	eb 8a                	jmp    3df <printf+0xbb>
 455:	8d 76 00             	lea    0x0(%esi),%esi
 458:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 45b:	8b 00                	mov    (%eax),%eax
 45d:	88 45 e7             	mov    %al,-0x19(%ebp)
 460:	51                   	push   %ecx
 461:	6a 01                	push   $0x1
 463:	8d 7d e7             	lea    -0x19(%ebp),%edi
 466:	57                   	push   %edi
 467:	56                   	push   %esi
 468:	e8 a2 fd ff ff       	call   20f <write>
 46d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 471:	83 c4 10             	add    $0x10,%esp
 474:	31 ff                	xor    %edi,%edi
 476:	e9 e1 fe ff ff       	jmp    35c <printf+0x38>
 47b:	90                   	nop
 47c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 47f:	52                   	push   %edx
 480:	6a 01                	push   $0x1
 482:	8d 7d e7             	lea    -0x19(%ebp),%edi
 485:	e9 35 ff ff ff       	jmp    3bf <printf+0x9b>
 48a:	66 90                	xchg   %ax,%ax
 48c:	b0 28                	mov    $0x28,%al
 48e:	ba 08 06 00 00       	mov    $0x608,%edx
 493:	eb 80                	jmp    415 <printf+0xf1>
 495:	31 ff                	xor    %edi,%edi
 497:	e9 c0 fe ff ff       	jmp    35c <printf+0x38>

0000049c <free>:
 49c:	55                   	push   %ebp
 49d:	89 e5                	mov    %esp,%ebp
 49f:	57                   	push   %edi
 4a0:	56                   	push   %esi
 4a1:	53                   	push   %ebx
 4a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4a5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4a8:	a1 7c 06 00 00       	mov    0x67c,%eax
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 00                	mov    (%eax),%eax
 4b4:	39 ca                	cmp    %ecx,%edx
 4b6:	73 2c                	jae    4e4 <free+0x48>
 4b8:	39 c1                	cmp    %eax,%ecx
 4ba:	72 04                	jb     4c0 <free+0x24>
 4bc:	39 c2                	cmp    %eax,%edx
 4be:	72 f0                	jb     4b0 <free+0x14>
 4c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4c6:	39 f8                	cmp    %edi,%eax
 4c8:	74 2c                	je     4f6 <free+0x5a>
 4ca:	89 43 f8             	mov    %eax,-0x8(%ebx)
 4cd:	8b 42 04             	mov    0x4(%edx),%eax
 4d0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 4d3:	39 f1                	cmp    %esi,%ecx
 4d5:	74 36                	je     50d <free+0x71>
 4d7:	89 0a                	mov    %ecx,(%edx)
 4d9:	89 15 7c 06 00 00    	mov    %edx,0x67c
 4df:	5b                   	pop    %ebx
 4e0:	5e                   	pop    %esi
 4e1:	5f                   	pop    %edi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    
 4e4:	39 c2                	cmp    %eax,%edx
 4e6:	72 c8                	jb     4b0 <free+0x14>
 4e8:	39 c1                	cmp    %eax,%ecx
 4ea:	73 c4                	jae    4b0 <free+0x14>
 4ec:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4ef:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4f2:	39 f8                	cmp    %edi,%eax
 4f4:	75 d4                	jne    4ca <free+0x2e>
 4f6:	03 70 04             	add    0x4(%eax),%esi
 4f9:	89 73 fc             	mov    %esi,-0x4(%ebx)
 4fc:	8b 02                	mov    (%edx),%eax
 4fe:	8b 00                	mov    (%eax),%eax
 500:	89 43 f8             	mov    %eax,-0x8(%ebx)
 503:	8b 42 04             	mov    0x4(%edx),%eax
 506:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 509:	39 f1                	cmp    %esi,%ecx
 50b:	75 ca                	jne    4d7 <free+0x3b>
 50d:	03 43 fc             	add    -0x4(%ebx),%eax
 510:	89 42 04             	mov    %eax,0x4(%edx)
 513:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 516:	89 0a                	mov    %ecx,(%edx)
 518:	89 15 7c 06 00 00    	mov    %edx,0x67c
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5f                   	pop    %edi
 521:	5d                   	pop    %ebp
 522:	c3                   	ret    
 523:	90                   	nop

00000524 <malloc>:
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	57                   	push   %edi
 528:	56                   	push   %esi
 529:	53                   	push   %ebx
 52a:	83 ec 0c             	sub    $0xc,%esp
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	8d 78 07             	lea    0x7(%eax),%edi
 533:	c1 ef 03             	shr    $0x3,%edi
 536:	47                   	inc    %edi
 537:	8b 15 7c 06 00 00    	mov    0x67c,%edx
 53d:	85 d2                	test   %edx,%edx
 53f:	0f 84 93 00 00 00    	je     5d8 <malloc+0xb4>
 545:	8b 02                	mov    (%edx),%eax
 547:	8b 48 04             	mov    0x4(%eax),%ecx
 54a:	39 f9                	cmp    %edi,%ecx
 54c:	73 62                	jae    5b0 <malloc+0x8c>
 54e:	89 fb                	mov    %edi,%ebx
 550:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 556:	72 78                	jb     5d0 <malloc+0xac>
 558:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 55f:	eb 0e                	jmp    56f <malloc+0x4b>
 561:	8d 76 00             	lea    0x0(%esi),%esi
 564:	89 c2                	mov    %eax,%edx
 566:	8b 02                	mov    (%edx),%eax
 568:	8b 48 04             	mov    0x4(%eax),%ecx
 56b:	39 f9                	cmp    %edi,%ecx
 56d:	73 41                	jae    5b0 <malloc+0x8c>
 56f:	39 05 7c 06 00 00    	cmp    %eax,0x67c
 575:	75 ed                	jne    564 <malloc+0x40>
 577:	83 ec 0c             	sub    $0xc,%esp
 57a:	56                   	push   %esi
 57b:	e8 f7 fc ff ff       	call   277 <sbrk>
 580:	83 c4 10             	add    $0x10,%esp
 583:	83 f8 ff             	cmp    $0xffffffff,%eax
 586:	74 1c                	je     5a4 <malloc+0x80>
 588:	89 58 04             	mov    %ebx,0x4(%eax)
 58b:	83 ec 0c             	sub    $0xc,%esp
 58e:	83 c0 08             	add    $0x8,%eax
 591:	50                   	push   %eax
 592:	e8 05 ff ff ff       	call   49c <free>
 597:	8b 15 7c 06 00 00    	mov    0x67c,%edx
 59d:	83 c4 10             	add    $0x10,%esp
 5a0:	85 d2                	test   %edx,%edx
 5a2:	75 c2                	jne    566 <malloc+0x42>
 5a4:	31 c0                	xor    %eax,%eax
 5a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a9:	5b                   	pop    %ebx
 5aa:	5e                   	pop    %esi
 5ab:	5f                   	pop    %edi
 5ac:	5d                   	pop    %ebp
 5ad:	c3                   	ret    
 5ae:	66 90                	xchg   %ax,%ax
 5b0:	39 cf                	cmp    %ecx,%edi
 5b2:	74 4c                	je     600 <malloc+0xdc>
 5b4:	29 f9                	sub    %edi,%ecx
 5b6:	89 48 04             	mov    %ecx,0x4(%eax)
 5b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5bc:	89 78 04             	mov    %edi,0x4(%eax)
 5bf:	89 15 7c 06 00 00    	mov    %edx,0x67c
 5c5:	83 c0 08             	add    $0x8,%eax
 5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret    
 5d0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 5d5:	eb 81                	jmp    558 <malloc+0x34>
 5d7:	90                   	nop
 5d8:	c7 05 7c 06 00 00 80 	movl   $0x680,0x67c
 5df:	06 00 00 
 5e2:	c7 05 80 06 00 00 80 	movl   $0x680,0x680
 5e9:	06 00 00 
 5ec:	c7 05 84 06 00 00 00 	movl   $0x0,0x684
 5f3:	00 00 00 
 5f6:	b8 80 06 00 00       	mov    $0x680,%eax
 5fb:	e9 4e ff ff ff       	jmp    54e <malloc+0x2a>
 600:	8b 08                	mov    (%eax),%ecx
 602:	89 0a                	mov    %ecx,(%edx)
 604:	eb b9                	jmp    5bf <malloc+0x9b>
