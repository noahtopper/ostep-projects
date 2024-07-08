
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	e8 2d 00 00 00       	call   38 <forktest>
   b:	e8 bb 02 00 00       	call   2cb <exit>

00000010 <printf>:
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1a:	53                   	push   %ebx
  1b:	e8 4c 01 00 00       	call   16c <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	pushl  0x8(%ebp)
  28:	e8 be 02 00 00       	call   2eb <write>
  2d:	83 c4 10             	add    $0x10,%esp
  30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d 76 00             	lea    0x0(%esi),%esi

00000038 <forktest>:
  38:	55                   	push   %ebp
  39:	89 e5                	mov    %esp,%ebp
  3b:	53                   	push   %ebx
  3c:	83 ec 10             	sub    $0x10,%esp
  3f:	68 74 03 00 00       	push   $0x374
  44:	e8 23 01 00 00       	call   16c <strlen>
  49:	83 c4 0c             	add    $0xc,%esp
  4c:	50                   	push   %eax
  4d:	68 74 03 00 00       	push   $0x374
  52:	6a 01                	push   $0x1
  54:	e8 92 02 00 00       	call   2eb <write>
  59:	83 c4 10             	add    $0x10,%esp
  5c:	31 db                	xor    %ebx,%ebx
  5e:	eb 0f                	jmp    6f <forktest+0x37>
  60:	74 53                	je     b5 <forktest+0x7d>
  62:	43                   	inc    %ebx
  63:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  69:	0f 84 80 00 00 00    	je     ef <forktest+0xb7>
  6f:	e8 4f 02 00 00       	call   2c3 <fork>
  74:	85 c0                	test   %eax,%eax
  76:	79 e8                	jns    60 <forktest+0x28>
  78:	85 db                	test   %ebx,%ebx
  7a:	74 0c                	je     88 <forktest+0x50>
  7c:	e8 52 02 00 00       	call   2d3 <wait>
  81:	85 c0                	test   %eax,%eax
  83:	78 35                	js     ba <forktest+0x82>
  85:	4b                   	dec    %ebx
  86:	75 f4                	jne    7c <forktest+0x44>
  88:	e8 46 02 00 00       	call   2d3 <wait>
  8d:	40                   	inc    %eax
  8e:	75 4c                	jne    dc <forktest+0xa4>
  90:	83 ec 0c             	sub    $0xc,%esp
  93:	68 a6 03 00 00       	push   $0x3a6
  98:	e8 cf 00 00 00       	call   16c <strlen>
  9d:	83 c4 0c             	add    $0xc,%esp
  a0:	50                   	push   %eax
  a1:	68 a6 03 00 00       	push   $0x3a6
  a6:	6a 01                	push   $0x1
  a8:	e8 3e 02 00 00       	call   2eb <write>
  ad:	83 c4 10             	add    $0x10,%esp
  b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b3:	c9                   	leave  
  b4:	c3                   	ret    
  b5:	e8 11 02 00 00       	call   2cb <exit>
  ba:	83 ec 0c             	sub    $0xc,%esp
  bd:	68 7f 03 00 00       	push   $0x37f
  c2:	e8 a5 00 00 00       	call   16c <strlen>
  c7:	83 c4 0c             	add    $0xc,%esp
  ca:	50                   	push   %eax
  cb:	68 7f 03 00 00       	push   $0x37f
  d0:	6a 01                	push   $0x1
  d2:	e8 14 02 00 00       	call   2eb <write>
  d7:	e8 ef 01 00 00       	call   2cb <exit>
  dc:	50                   	push   %eax
  dd:	50                   	push   %eax
  de:	68 93 03 00 00       	push   $0x393
  e3:	6a 01                	push   $0x1
  e5:	e8 26 ff ff ff       	call   10 <printf>
  ea:	e8 dc 01 00 00       	call   2cb <exit>
  ef:	52                   	push   %edx
  f0:	68 e8 03 00 00       	push   $0x3e8
  f5:	68 b4 03 00 00       	push   $0x3b4
  fa:	6a 01                	push   $0x1
  fc:	e8 0f ff ff ff       	call   10 <printf>
 101:	e8 c5 01 00 00       	call   2cb <exit>
 106:	66 90                	xchg   %ax,%ax

00000108 <strcpy>:
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	53                   	push   %ebx
 10c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 10f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 112:	31 c0                	xor    %eax,%eax
 114:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 117:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 11a:	40                   	inc    %eax
 11b:	84 d2                	test   %dl,%dl
 11d:	75 f5                	jne    114 <strcpy+0xc>
 11f:	89 c8                	mov    %ecx,%eax
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave  
 125:	c3                   	ret    
 126:	66 90                	xchg   %ax,%ax

00000128 <strcmp>:
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	53                   	push   %ebx
 12c:	8b 55 08             	mov    0x8(%ebp),%edx
 12f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 132:	0f b6 02             	movzbl (%edx),%eax
 135:	84 c0                	test   %al,%al
 137:	75 10                	jne    149 <strcmp+0x21>
 139:	eb 2a                	jmp    165 <strcmp+0x3d>
 13b:	90                   	nop
 13c:	42                   	inc    %edx
 13d:	8d 4b 01             	lea    0x1(%ebx),%ecx
 140:	0f b6 02             	movzbl (%edx),%eax
 143:	84 c0                	test   %al,%al
 145:	74 11                	je     158 <strcmp+0x30>
 147:	89 cb                	mov    %ecx,%ebx
 149:	0f b6 0b             	movzbl (%ebx),%ecx
 14c:	38 c1                	cmp    %al,%cl
 14e:	74 ec                	je     13c <strcmp+0x14>
 150:	29 c8                	sub    %ecx,%eax
 152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 155:	c9                   	leave  
 156:	c3                   	ret    
 157:	90                   	nop
 158:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 15c:	31 c0                	xor    %eax,%eax
 15e:	29 c8                	sub    %ecx,%eax
 160:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	0f b6 0b             	movzbl (%ebx),%ecx
 168:	31 c0                	xor    %eax,%eax
 16a:	eb e4                	jmp    150 <strcmp+0x28>

0000016c <strlen>:
 16c:	55                   	push   %ebp
 16d:	89 e5                	mov    %esp,%ebp
 16f:	8b 55 08             	mov    0x8(%ebp),%edx
 172:	80 3a 00             	cmpb   $0x0,(%edx)
 175:	74 15                	je     18c <strlen+0x20>
 177:	31 c0                	xor    %eax,%eax
 179:	8d 76 00             	lea    0x0(%esi),%esi
 17c:	40                   	inc    %eax
 17d:	89 c1                	mov    %eax,%ecx
 17f:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 183:	75 f7                	jne    17c <strlen+0x10>
 185:	89 c8                	mov    %ecx,%eax
 187:	5d                   	pop    %ebp
 188:	c3                   	ret    
 189:	8d 76 00             	lea    0x0(%esi),%esi
 18c:	31 c9                	xor    %ecx,%ecx
 18e:	89 c8                	mov    %ecx,%eax
 190:	5d                   	pop    %ebp
 191:	c3                   	ret    
 192:	66 90                	xchg   %ax,%ax

00000194 <memset>:
 194:	55                   	push   %ebp
 195:	89 e5                	mov    %esp,%ebp
 197:	57                   	push   %edi
 198:	8b 7d 08             	mov    0x8(%ebp),%edi
 19b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 19e:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a1:	fc                   	cld    
 1a2:	f3 aa                	rep stos %al,%es:(%edi)
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1aa:	c9                   	leave  
 1ab:	c3                   	ret    

000001ac <strchr>:
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	8b 45 08             	mov    0x8(%ebp),%eax
 1b2:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1b5:	8a 10                	mov    (%eax),%dl
 1b7:	84 d2                	test   %dl,%dl
 1b9:	75 0c                	jne    1c7 <strchr+0x1b>
 1bb:	eb 13                	jmp    1d0 <strchr+0x24>
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	40                   	inc    %eax
 1c1:	8a 10                	mov    (%eax),%dl
 1c3:	84 d2                	test   %dl,%dl
 1c5:	74 09                	je     1d0 <strchr+0x24>
 1c7:	38 d1                	cmp    %dl,%cl
 1c9:	75 f5                	jne    1c0 <strchr+0x14>
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	31 c0                	xor    %eax,%eax
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <gets>:
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	56                   	push   %esi
 1d9:	53                   	push   %ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	31 db                	xor    %ebx,%ebx
 1df:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1e2:	eb 24                	jmp    208 <gets+0x34>
 1e4:	50                   	push   %eax
 1e5:	6a 01                	push   $0x1
 1e7:	56                   	push   %esi
 1e8:	6a 00                	push   $0x0
 1ea:	e8 f4 00 00 00       	call   2e3 <read>
 1ef:	83 c4 10             	add    $0x10,%esp
 1f2:	85 c0                	test   %eax,%eax
 1f4:	7e 1a                	jle    210 <gets+0x3c>
 1f6:	8a 45 e7             	mov    -0x19(%ebp),%al
 1f9:	8b 55 08             	mov    0x8(%ebp),%edx
 1fc:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 200:	3c 0a                	cmp    $0xa,%al
 202:	74 0e                	je     212 <gets+0x3e>
 204:	3c 0d                	cmp    $0xd,%al
 206:	74 0a                	je     212 <gets+0x3e>
 208:	89 df                	mov    %ebx,%edi
 20a:	43                   	inc    %ebx
 20b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 20e:	7c d4                	jl     1e4 <gets+0x10>
 210:	89 fb                	mov    %edi,%ebx
 212:	8b 45 08             	mov    0x8(%ebp),%eax
 215:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 219:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21c:	5b                   	pop    %ebx
 21d:	5e                   	pop    %esi
 21e:	5f                   	pop    %edi
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    
 221:	8d 76 00             	lea    0x0(%esi),%esi

00000224 <stat>:
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	56                   	push   %esi
 228:	53                   	push   %ebx
 229:	83 ec 08             	sub    $0x8,%esp
 22c:	6a 00                	push   $0x0
 22e:	ff 75 08             	pushl  0x8(%ebp)
 231:	e8 d5 00 00 00       	call   30b <open>
 236:	83 c4 10             	add    $0x10,%esp
 239:	85 c0                	test   %eax,%eax
 23b:	78 27                	js     264 <stat+0x40>
 23d:	89 c3                	mov    %eax,%ebx
 23f:	83 ec 08             	sub    $0x8,%esp
 242:	ff 75 0c             	pushl  0xc(%ebp)
 245:	50                   	push   %eax
 246:	e8 d8 00 00 00       	call   323 <fstat>
 24b:	89 c6                	mov    %eax,%esi
 24d:	89 1c 24             	mov    %ebx,(%esp)
 250:	e8 9e 00 00 00       	call   2f3 <close>
 255:	83 c4 10             	add    $0x10,%esp
 258:	89 f0                	mov    %esi,%eax
 25a:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25d:	5b                   	pop    %ebx
 25e:	5e                   	pop    %esi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d 76 00             	lea    0x0(%esi),%esi
 264:	be ff ff ff ff       	mov    $0xffffffff,%esi
 269:	eb ed                	jmp    258 <stat+0x34>
 26b:	90                   	nop

0000026c <atoi>:
 26c:	55                   	push   %ebp
 26d:	89 e5                	mov    %esp,%ebp
 26f:	53                   	push   %ebx
 270:	8b 4d 08             	mov    0x8(%ebp),%ecx
 273:	0f be 01             	movsbl (%ecx),%eax
 276:	8d 50 d0             	lea    -0x30(%eax),%edx
 279:	80 fa 09             	cmp    $0x9,%dl
 27c:	ba 00 00 00 00       	mov    $0x0,%edx
 281:	77 16                	ja     299 <atoi+0x2d>
 283:	90                   	nop
 284:	41                   	inc    %ecx
 285:	8d 14 92             	lea    (%edx,%edx,4),%edx
 288:	01 d2                	add    %edx,%edx
 28a:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 28e:	0f be 01             	movsbl (%ecx),%eax
 291:	8d 58 d0             	lea    -0x30(%eax),%ebx
 294:	80 fb 09             	cmp    $0x9,%bl
 297:	76 eb                	jbe    284 <atoi+0x18>
 299:	89 d0                	mov    %edx,%eax
 29b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29e:	c9                   	leave  
 29f:	c3                   	ret    

000002a0 <memmove>:
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
 2a5:	8b 55 08             	mov    0x8(%ebp),%edx
 2a8:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ab:	8b 45 10             	mov    0x10(%ebp),%eax
 2ae:	85 c0                	test   %eax,%eax
 2b0:	7e 0b                	jle    2bd <memmove+0x1d>
 2b2:	01 d0                	add    %edx,%eax
 2b4:	89 d7                	mov    %edx,%edi
 2b6:	66 90                	xchg   %ax,%ax
 2b8:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2b9:	39 f8                	cmp    %edi,%eax
 2bb:	75 fb                	jne    2b8 <memmove+0x18>
 2bd:	89 d0                	mov    %edx,%eax
 2bf:	5e                   	pop    %esi
 2c0:	5f                   	pop    %edi
 2c1:	5d                   	pop    %ebp
 2c2:	c3                   	ret    

000002c3 <fork>:
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exit>:
 2cb:	b8 02 00 00 00       	mov    $0x2,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <wait>:
 2d3:	b8 03 00 00 00       	mov    $0x3,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <pipe>:
 2db:	b8 04 00 00 00       	mov    $0x4,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <read>:
 2e3:	b8 05 00 00 00       	mov    $0x5,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <write>:
 2eb:	b8 10 00 00 00       	mov    $0x10,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <close>:
 2f3:	b8 15 00 00 00       	mov    $0x15,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <kill>:
 2fb:	b8 06 00 00 00       	mov    $0x6,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exec>:
 303:	b8 07 00 00 00       	mov    $0x7,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <open>:
 30b:	b8 0f 00 00 00       	mov    $0xf,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <mknod>:
 313:	b8 11 00 00 00       	mov    $0x11,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <unlink>:
 31b:	b8 12 00 00 00       	mov    $0x12,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <fstat>:
 323:	b8 08 00 00 00       	mov    $0x8,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <link>:
 32b:	b8 13 00 00 00       	mov    $0x13,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mkdir>:
 333:	b8 14 00 00 00       	mov    $0x14,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <chdir>:
 33b:	b8 09 00 00 00       	mov    $0x9,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <dup>:
 343:	b8 0a 00 00 00       	mov    $0xa,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <getpid>:
 34b:	b8 0b 00 00 00       	mov    $0xb,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <sbrk>:
 353:	b8 0c 00 00 00       	mov    $0xc,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <sleep>:
 35b:	b8 0d 00 00 00       	mov    $0xd,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <uptime>:
 363:	b8 0e 00 00 00       	mov    $0xe,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <getreadcount>:
 36b:	b8 16 00 00 00       	mov    $0x16,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    
