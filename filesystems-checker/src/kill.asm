
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 26                	jle    44 <main+0x44>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	90                   	nop
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 34 9f             	pushl  (%edi,%ebx,4)
  2a:	e8 8d 01 00 00       	call   1bc <atoi>
  2f:	89 04 24             	mov    %eax,(%esp)
  32:	e8 14 02 00 00       	call   24b <kill>
  37:	43                   	inc    %ebx
  38:	83 c4 10             	add    $0x10,%esp
  3b:	39 de                	cmp    %ebx,%esi
  3d:	75 e5                	jne    24 <main+0x24>
  3f:	e8 d7 01 00 00       	call   21b <exit>
  44:	50                   	push   %eax
  45:	50                   	push   %eax
  46:	68 34 06 00 00       	push   $0x634
  4b:	6a 02                	push   $0x2
  4d:	e8 fe 02 00 00       	call   350 <printf>
  52:	e8 c4 01 00 00       	call   21b <exit>
  57:	90                   	nop

00000058 <strcpy>:
  58:	55                   	push   %ebp
  59:	89 e5                	mov    %esp,%ebp
  5b:	53                   	push   %ebx
  5c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  5f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  62:	31 c0                	xor    %eax,%eax
  64:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  67:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6a:	40                   	inc    %eax
  6b:	84 d2                	test   %dl,%dl
  6d:	75 f5                	jne    64 <strcpy+0xc>
  6f:	89 c8                	mov    %ecx,%eax
  71:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  74:	c9                   	leave  
  75:	c3                   	ret    
  76:	66 90                	xchg   %ax,%ax

00000078 <strcmp>:
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  7b:	53                   	push   %ebx
  7c:	8b 55 08             	mov    0x8(%ebp),%edx
  7f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  82:	0f b6 02             	movzbl (%edx),%eax
  85:	84 c0                	test   %al,%al
  87:	75 10                	jne    99 <strcmp+0x21>
  89:	eb 2a                	jmp    b5 <strcmp+0x3d>
  8b:	90                   	nop
  8c:	42                   	inc    %edx
  8d:	8d 4b 01             	lea    0x1(%ebx),%ecx
  90:	0f b6 02             	movzbl (%edx),%eax
  93:	84 c0                	test   %al,%al
  95:	74 11                	je     a8 <strcmp+0x30>
  97:	89 cb                	mov    %ecx,%ebx
  99:	0f b6 0b             	movzbl (%ebx),%ecx
  9c:	38 c1                	cmp    %al,%cl
  9e:	74 ec                	je     8c <strcmp+0x14>
  a0:	29 c8                	sub    %ecx,%eax
  a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a5:	c9                   	leave  
  a6:	c3                   	ret    
  a7:	90                   	nop
  a8:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  ac:	31 c0                	xor    %eax,%eax
  ae:	29 c8                	sub    %ecx,%eax
  b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b3:	c9                   	leave  
  b4:	c3                   	ret    
  b5:	0f b6 0b             	movzbl (%ebx),%ecx
  b8:	31 c0                	xor    %eax,%eax
  ba:	eb e4                	jmp    a0 <strcmp+0x28>

000000bc <strlen>:
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  bf:	8b 55 08             	mov    0x8(%ebp),%edx
  c2:	80 3a 00             	cmpb   $0x0,(%edx)
  c5:	74 15                	je     dc <strlen+0x20>
  c7:	31 c0                	xor    %eax,%eax
  c9:	8d 76 00             	lea    0x0(%esi),%esi
  cc:	40                   	inc    %eax
  cd:	89 c1                	mov    %eax,%ecx
  cf:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d3:	75 f7                	jne    cc <strlen+0x10>
  d5:	89 c8                	mov    %ecx,%eax
  d7:	5d                   	pop    %ebp
  d8:	c3                   	ret    
  d9:	8d 76 00             	lea    0x0(%esi),%esi
  dc:	31 c9                	xor    %ecx,%ecx
  de:	89 c8                	mov    %ecx,%eax
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret    
  e2:	66 90                	xchg   %ax,%ax

000000e4 <memset>:
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	57                   	push   %edi
  e8:	8b 7d 08             	mov    0x8(%ebp),%edi
  eb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ee:	8b 45 0c             	mov    0xc(%ebp),%eax
  f1:	fc                   	cld    
  f2:	f3 aa                	rep stos %al,%es:(%edi)
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	8b 7d fc             	mov    -0x4(%ebp),%edi
  fa:	c9                   	leave  
  fb:	c3                   	ret    

000000fc <strchr>:
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	8b 45 08             	mov    0x8(%ebp),%eax
 102:	8a 4d 0c             	mov    0xc(%ebp),%cl
 105:	8a 10                	mov    (%eax),%dl
 107:	84 d2                	test   %dl,%dl
 109:	75 0c                	jne    117 <strchr+0x1b>
 10b:	eb 13                	jmp    120 <strchr+0x24>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	40                   	inc    %eax
 111:	8a 10                	mov    (%eax),%dl
 113:	84 d2                	test   %dl,%dl
 115:	74 09                	je     120 <strchr+0x24>
 117:	38 d1                	cmp    %dl,%cl
 119:	75 f5                	jne    110 <strchr+0x14>
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	31 c0                	xor    %eax,%eax
 122:	5d                   	pop    %ebp
 123:	c3                   	ret    

00000124 <gets>:
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	57                   	push   %edi
 128:	56                   	push   %esi
 129:	53                   	push   %ebx
 12a:	83 ec 1c             	sub    $0x1c,%esp
 12d:	31 db                	xor    %ebx,%ebx
 12f:	8d 75 e7             	lea    -0x19(%ebp),%esi
 132:	eb 24                	jmp    158 <gets+0x34>
 134:	50                   	push   %eax
 135:	6a 01                	push   $0x1
 137:	56                   	push   %esi
 138:	6a 00                	push   $0x0
 13a:	e8 f4 00 00 00       	call   233 <read>
 13f:	83 c4 10             	add    $0x10,%esp
 142:	85 c0                	test   %eax,%eax
 144:	7e 1a                	jle    160 <gets+0x3c>
 146:	8a 45 e7             	mov    -0x19(%ebp),%al
 149:	8b 55 08             	mov    0x8(%ebp),%edx
 14c:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 150:	3c 0a                	cmp    $0xa,%al
 152:	74 0e                	je     162 <gets+0x3e>
 154:	3c 0d                	cmp    $0xd,%al
 156:	74 0a                	je     162 <gets+0x3e>
 158:	89 df                	mov    %ebx,%edi
 15a:	43                   	inc    %ebx
 15b:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 15e:	7c d4                	jl     134 <gets+0x10>
 160:	89 fb                	mov    %edi,%ebx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 169:	8d 65 f4             	lea    -0xc(%ebp),%esp
 16c:	5b                   	pop    %ebx
 16d:	5e                   	pop    %esi
 16e:	5f                   	pop    %edi
 16f:	5d                   	pop    %ebp
 170:	c3                   	ret    
 171:	8d 76 00             	lea    0x0(%esi),%esi

00000174 <stat>:
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	56                   	push   %esi
 178:	53                   	push   %ebx
 179:	83 ec 08             	sub    $0x8,%esp
 17c:	6a 00                	push   $0x0
 17e:	ff 75 08             	pushl  0x8(%ebp)
 181:	e8 d5 00 00 00       	call   25b <open>
 186:	83 c4 10             	add    $0x10,%esp
 189:	85 c0                	test   %eax,%eax
 18b:	78 27                	js     1b4 <stat+0x40>
 18d:	89 c3                	mov    %eax,%ebx
 18f:	83 ec 08             	sub    $0x8,%esp
 192:	ff 75 0c             	pushl  0xc(%ebp)
 195:	50                   	push   %eax
 196:	e8 d8 00 00 00       	call   273 <fstat>
 19b:	89 c6                	mov    %eax,%esi
 19d:	89 1c 24             	mov    %ebx,(%esp)
 1a0:	e8 9e 00 00 00       	call   243 <close>
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	89 f0                	mov    %esi,%eax
 1aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1ad:	5b                   	pop    %ebx
 1ae:	5e                   	pop    %esi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d 76 00             	lea    0x0(%esi),%esi
 1b4:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b9:	eb ed                	jmp    1a8 <stat+0x34>
 1bb:	90                   	nop

000001bc <atoi>:
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	53                   	push   %ebx
 1c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c3:	0f be 01             	movsbl (%ecx),%eax
 1c6:	8d 50 d0             	lea    -0x30(%eax),%edx
 1c9:	80 fa 09             	cmp    $0x9,%dl
 1cc:	ba 00 00 00 00       	mov    $0x0,%edx
 1d1:	77 16                	ja     1e9 <atoi+0x2d>
 1d3:	90                   	nop
 1d4:	41                   	inc    %ecx
 1d5:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1d8:	01 d2                	add    %edx,%edx
 1da:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1de:	0f be 01             	movsbl (%ecx),%eax
 1e1:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e4:	80 fb 09             	cmp    $0x9,%bl
 1e7:	76 eb                	jbe    1d4 <atoi+0x18>
 1e9:	89 d0                	mov    %edx,%eax
 1eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <memmove>:
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	56                   	push   %esi
 1f5:	8b 55 08             	mov    0x8(%ebp),%edx
 1f8:	8b 75 0c             	mov    0xc(%ebp),%esi
 1fb:	8b 45 10             	mov    0x10(%ebp),%eax
 1fe:	85 c0                	test   %eax,%eax
 200:	7e 0b                	jle    20d <memmove+0x1d>
 202:	01 d0                	add    %edx,%eax
 204:	89 d7                	mov    %edx,%edi
 206:	66 90                	xchg   %ax,%ax
 208:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 209:	39 f8                	cmp    %edi,%eax
 20b:	75 fb                	jne    208 <memmove+0x18>
 20d:	89 d0                	mov    %edx,%eax
 20f:	5e                   	pop    %esi
 210:	5f                   	pop    %edi
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    

00000213 <fork>:
 213:	b8 01 00 00 00       	mov    $0x1,%eax
 218:	cd 40                	int    $0x40
 21a:	c3                   	ret    

0000021b <exit>:
 21b:	b8 02 00 00 00       	mov    $0x2,%eax
 220:	cd 40                	int    $0x40
 222:	c3                   	ret    

00000223 <wait>:
 223:	b8 03 00 00 00       	mov    $0x3,%eax
 228:	cd 40                	int    $0x40
 22a:	c3                   	ret    

0000022b <pipe>:
 22b:	b8 04 00 00 00       	mov    $0x4,%eax
 230:	cd 40                	int    $0x40
 232:	c3                   	ret    

00000233 <read>:
 233:	b8 05 00 00 00       	mov    $0x5,%eax
 238:	cd 40                	int    $0x40
 23a:	c3                   	ret    

0000023b <write>:
 23b:	b8 10 00 00 00       	mov    $0x10,%eax
 240:	cd 40                	int    $0x40
 242:	c3                   	ret    

00000243 <close>:
 243:	b8 15 00 00 00       	mov    $0x15,%eax
 248:	cd 40                	int    $0x40
 24a:	c3                   	ret    

0000024b <kill>:
 24b:	b8 06 00 00 00       	mov    $0x6,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <exec>:
 253:	b8 07 00 00 00       	mov    $0x7,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <open>:
 25b:	b8 0f 00 00 00       	mov    $0xf,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <mknod>:
 263:	b8 11 00 00 00       	mov    $0x11,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <unlink>:
 26b:	b8 12 00 00 00       	mov    $0x12,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <fstat>:
 273:	b8 08 00 00 00       	mov    $0x8,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <link>:
 27b:	b8 13 00 00 00       	mov    $0x13,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <mkdir>:
 283:	b8 14 00 00 00       	mov    $0x14,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <chdir>:
 28b:	b8 09 00 00 00       	mov    $0x9,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <dup>:
 293:	b8 0a 00 00 00       	mov    $0xa,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <getpid>:
 29b:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <sbrk>:
 2a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <sleep>:
 2ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <uptime>:
 2b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <getreadcount>:
 2bb:	b8 16 00 00 00       	mov    $0x16,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    
 2c3:	90                   	nop

000002c4 <printint>:
 2c4:	55                   	push   %ebp
 2c5:	89 e5                	mov    %esp,%ebp
 2c7:	57                   	push   %edi
 2c8:	56                   	push   %esi
 2c9:	53                   	push   %ebx
 2ca:	83 ec 3c             	sub    $0x3c,%esp
 2cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2d0:	89 cb                	mov    %ecx,%ebx
 2d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d5:	85 c9                	test   %ecx,%ecx
 2d7:	74 04                	je     2dd <printint+0x19>
 2d9:	85 d2                	test   %edx,%edx
 2db:	78 6b                	js     348 <printint+0x84>
 2dd:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2e0:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2e7:	31 c9                	xor    %ecx,%ecx
 2e9:	8d 75 d7             	lea    -0x29(%ebp),%esi
 2ec:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2ef:	31 d2                	xor    %edx,%edx
 2f1:	f7 f3                	div    %ebx
 2f3:	89 cf                	mov    %ecx,%edi
 2f5:	8d 49 01             	lea    0x1(%ecx),%ecx
 2f8:	8a 92 a8 06 00 00    	mov    0x6a8(%edx),%dl
 2fe:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 302:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 305:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 308:	39 da                	cmp    %ebx,%edx
 30a:	73 e0                	jae    2ec <printint+0x28>
 30c:	8b 55 08             	mov    0x8(%ebp),%edx
 30f:	85 d2                	test   %edx,%edx
 311:	74 07                	je     31a <printint+0x56>
 313:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 318:	89 cf                	mov    %ecx,%edi
 31a:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 31d:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 321:	8d 76 00             	lea    0x0(%esi),%esi
 324:	8a 07                	mov    (%edi),%al
 326:	88 45 d7             	mov    %al,-0x29(%ebp)
 329:	50                   	push   %eax
 32a:	6a 01                	push   $0x1
 32c:	56                   	push   %esi
 32d:	ff 75 c0             	pushl  -0x40(%ebp)
 330:	e8 06 ff ff ff       	call   23b <write>
 335:	89 f8                	mov    %edi,%eax
 337:	4f                   	dec    %edi
 338:	83 c4 10             	add    $0x10,%esp
 33b:	39 d8                	cmp    %ebx,%eax
 33d:	75 e5                	jne    324 <printint+0x60>
 33f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 342:	5b                   	pop    %ebx
 343:	5e                   	pop    %esi
 344:	5f                   	pop    %edi
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    
 347:	90                   	nop
 348:	f7 da                	neg    %edx
 34a:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 34d:	eb 98                	jmp    2e7 <printint+0x23>
 34f:	90                   	nop

00000350 <printf>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 2c             	sub    $0x2c,%esp
 359:	8b 75 08             	mov    0x8(%ebp),%esi
 35c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 35f:	8a 13                	mov    (%ebx),%dl
 361:	84 d2                	test   %dl,%dl
 363:	74 5c                	je     3c1 <printf+0x71>
 365:	43                   	inc    %ebx
 366:	8d 45 10             	lea    0x10(%ebp),%eax
 369:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 36c:	31 ff                	xor    %edi,%edi
 36e:	eb 20                	jmp    390 <printf+0x40>
 370:	83 f8 25             	cmp    $0x25,%eax
 373:	74 3f                	je     3b4 <printf+0x64>
 375:	88 55 e7             	mov    %dl,-0x19(%ebp)
 378:	50                   	push   %eax
 379:	6a 01                	push   $0x1
 37b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 37e:	50                   	push   %eax
 37f:	56                   	push   %esi
 380:	e8 b6 fe ff ff       	call   23b <write>
 385:	83 c4 10             	add    $0x10,%esp
 388:	43                   	inc    %ebx
 389:	8a 53 ff             	mov    -0x1(%ebx),%dl
 38c:	84 d2                	test   %dl,%dl
 38e:	74 31                	je     3c1 <printf+0x71>
 390:	0f b6 c2             	movzbl %dl,%eax
 393:	85 ff                	test   %edi,%edi
 395:	74 d9                	je     370 <printf+0x20>
 397:	83 ff 25             	cmp    $0x25,%edi
 39a:	75 ec                	jne    388 <printf+0x38>
 39c:	83 f8 25             	cmp    $0x25,%eax
 39f:	0f 84 03 01 00 00    	je     4a8 <printf+0x158>
 3a5:	83 e8 63             	sub    $0x63,%eax
 3a8:	83 f8 15             	cmp    $0x15,%eax
 3ab:	77 1f                	ja     3cc <printf+0x7c>
 3ad:	ff 24 85 50 06 00 00 	jmp    *0x650(,%eax,4)
 3b4:	bf 25 00 00 00       	mov    $0x25,%edi
 3b9:	43                   	inc    %ebx
 3ba:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3bd:	84 d2                	test   %dl,%dl
 3bf:	75 cf                	jne    390 <printf+0x40>
 3c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c4:	5b                   	pop    %ebx
 3c5:	5e                   	pop    %esi
 3c6:	5f                   	pop    %edi
 3c7:	5d                   	pop    %ebp
 3c8:	c3                   	ret    
 3c9:	8d 76 00             	lea    0x0(%esi),%esi
 3cc:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3cf:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3d3:	50                   	push   %eax
 3d4:	6a 01                	push   $0x1
 3d6:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3d9:	57                   	push   %edi
 3da:	56                   	push   %esi
 3db:	e8 5b fe ff ff       	call   23b <write>
 3e0:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3e3:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3e6:	83 c4 0c             	add    $0xc,%esp
 3e9:	6a 01                	push   $0x1
 3eb:	57                   	push   %edi
 3ec:	56                   	push   %esi
 3ed:	e8 49 fe ff ff       	call   23b <write>
 3f2:	83 c4 10             	add    $0x10,%esp
 3f5:	31 ff                	xor    %edi,%edi
 3f7:	eb 8f                	jmp    388 <printf+0x38>
 3f9:	8d 76 00             	lea    0x0(%esi),%esi
 3fc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3ff:	8b 17                	mov    (%edi),%edx
 401:	83 ec 0c             	sub    $0xc,%esp
 404:	6a 00                	push   $0x0
 406:	b9 10 00 00 00       	mov    $0x10,%ecx
 40b:	89 f0                	mov    %esi,%eax
 40d:	e8 b2 fe ff ff       	call   2c4 <printint>
 412:	83 c7 04             	add    $0x4,%edi
 415:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 418:	83 c4 10             	add    $0x10,%esp
 41b:	31 ff                	xor    %edi,%edi
 41d:	e9 66 ff ff ff       	jmp    388 <printf+0x38>
 422:	66 90                	xchg   %ax,%ax
 424:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 427:	8b 10                	mov    (%eax),%edx
 429:	83 c0 04             	add    $0x4,%eax
 42c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 42f:	85 d2                	test   %edx,%edx
 431:	0f 84 81 00 00 00    	je     4b8 <printf+0x168>
 437:	8a 02                	mov    (%edx),%al
 439:	84 c0                	test   %al,%al
 43b:	0f 84 80 00 00 00    	je     4c1 <printf+0x171>
 441:	8d 7d e7             	lea    -0x19(%ebp),%edi
 444:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 447:	89 d3                	mov    %edx,%ebx
 449:	8d 76 00             	lea    0x0(%esi),%esi
 44c:	88 45 e7             	mov    %al,-0x19(%ebp)
 44f:	50                   	push   %eax
 450:	6a 01                	push   $0x1
 452:	57                   	push   %edi
 453:	56                   	push   %esi
 454:	e8 e2 fd ff ff       	call   23b <write>
 459:	43                   	inc    %ebx
 45a:	8a 03                	mov    (%ebx),%al
 45c:	83 c4 10             	add    $0x10,%esp
 45f:	84 c0                	test   %al,%al
 461:	75 e9                	jne    44c <printf+0xfc>
 463:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 466:	31 ff                	xor    %edi,%edi
 468:	e9 1b ff ff ff       	jmp    388 <printf+0x38>
 46d:	8d 76 00             	lea    0x0(%esi),%esi
 470:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 473:	8b 17                	mov    (%edi),%edx
 475:	83 ec 0c             	sub    $0xc,%esp
 478:	6a 01                	push   $0x1
 47a:	b9 0a 00 00 00       	mov    $0xa,%ecx
 47f:	eb 8a                	jmp    40b <printf+0xbb>
 481:	8d 76 00             	lea    0x0(%esi),%esi
 484:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 487:	8b 00                	mov    (%eax),%eax
 489:	88 45 e7             	mov    %al,-0x19(%ebp)
 48c:	51                   	push   %ecx
 48d:	6a 01                	push   $0x1
 48f:	8d 7d e7             	lea    -0x19(%ebp),%edi
 492:	57                   	push   %edi
 493:	56                   	push   %esi
 494:	e8 a2 fd ff ff       	call   23b <write>
 499:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 49d:	83 c4 10             	add    $0x10,%esp
 4a0:	31 ff                	xor    %edi,%edi
 4a2:	e9 e1 fe ff ff       	jmp    388 <printf+0x38>
 4a7:	90                   	nop
 4a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4ab:	52                   	push   %edx
 4ac:	6a 01                	push   $0x1
 4ae:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4b1:	e9 35 ff ff ff       	jmp    3eb <printf+0x9b>
 4b6:	66 90                	xchg   %ax,%ax
 4b8:	b0 28                	mov    $0x28,%al
 4ba:	ba 48 06 00 00       	mov    $0x648,%edx
 4bf:	eb 80                	jmp    441 <printf+0xf1>
 4c1:	31 ff                	xor    %edi,%edi
 4c3:	e9 c0 fe ff ff       	jmp    388 <printf+0x38>

000004c8 <free>:
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	57                   	push   %edi
 4cc:	56                   	push   %esi
 4cd:	53                   	push   %ebx
 4ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4d1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4d4:	a1 bc 06 00 00       	mov    0x6bc,%eax
 4d9:	8d 76 00             	lea    0x0(%esi),%esi
 4dc:	89 c2                	mov    %eax,%edx
 4de:	8b 00                	mov    (%eax),%eax
 4e0:	39 ca                	cmp    %ecx,%edx
 4e2:	73 2c                	jae    510 <free+0x48>
 4e4:	39 c1                	cmp    %eax,%ecx
 4e6:	72 04                	jb     4ec <free+0x24>
 4e8:	39 c2                	cmp    %eax,%edx
 4ea:	72 f0                	jb     4dc <free+0x14>
 4ec:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4ef:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4f2:	39 f8                	cmp    %edi,%eax
 4f4:	74 2c                	je     522 <free+0x5a>
 4f6:	89 43 f8             	mov    %eax,-0x8(%ebx)
 4f9:	8b 42 04             	mov    0x4(%edx),%eax
 4fc:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 4ff:	39 f1                	cmp    %esi,%ecx
 501:	74 36                	je     539 <free+0x71>
 503:	89 0a                	mov    %ecx,(%edx)
 505:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5f                   	pop    %edi
 50e:	5d                   	pop    %ebp
 50f:	c3                   	ret    
 510:	39 c2                	cmp    %eax,%edx
 512:	72 c8                	jb     4dc <free+0x14>
 514:	39 c1                	cmp    %eax,%ecx
 516:	73 c4                	jae    4dc <free+0x14>
 518:	8b 73 fc             	mov    -0x4(%ebx),%esi
 51b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 51e:	39 f8                	cmp    %edi,%eax
 520:	75 d4                	jne    4f6 <free+0x2e>
 522:	03 70 04             	add    0x4(%eax),%esi
 525:	89 73 fc             	mov    %esi,-0x4(%ebx)
 528:	8b 02                	mov    (%edx),%eax
 52a:	8b 00                	mov    (%eax),%eax
 52c:	89 43 f8             	mov    %eax,-0x8(%ebx)
 52f:	8b 42 04             	mov    0x4(%edx),%eax
 532:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 535:	39 f1                	cmp    %esi,%ecx
 537:	75 ca                	jne    503 <free+0x3b>
 539:	03 43 fc             	add    -0x4(%ebx),%eax
 53c:	89 42 04             	mov    %eax,0x4(%edx)
 53f:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 542:	89 0a                	mov    %ecx,(%edx)
 544:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 54a:	5b                   	pop    %ebx
 54b:	5e                   	pop    %esi
 54c:	5f                   	pop    %edi
 54d:	5d                   	pop    %ebp
 54e:	c3                   	ret    
 54f:	90                   	nop

00000550 <malloc>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 0c             	sub    $0xc,%esp
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	8d 78 07             	lea    0x7(%eax),%edi
 55f:	c1 ef 03             	shr    $0x3,%edi
 562:	47                   	inc    %edi
 563:	8b 15 bc 06 00 00    	mov    0x6bc,%edx
 569:	85 d2                	test   %edx,%edx
 56b:	0f 84 93 00 00 00    	je     604 <malloc+0xb4>
 571:	8b 02                	mov    (%edx),%eax
 573:	8b 48 04             	mov    0x4(%eax),%ecx
 576:	39 f9                	cmp    %edi,%ecx
 578:	73 62                	jae    5dc <malloc+0x8c>
 57a:	89 fb                	mov    %edi,%ebx
 57c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 582:	72 78                	jb     5fc <malloc+0xac>
 584:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 58b:	eb 0e                	jmp    59b <malloc+0x4b>
 58d:	8d 76 00             	lea    0x0(%esi),%esi
 590:	89 c2                	mov    %eax,%edx
 592:	8b 02                	mov    (%edx),%eax
 594:	8b 48 04             	mov    0x4(%eax),%ecx
 597:	39 f9                	cmp    %edi,%ecx
 599:	73 41                	jae    5dc <malloc+0x8c>
 59b:	39 05 bc 06 00 00    	cmp    %eax,0x6bc
 5a1:	75 ed                	jne    590 <malloc+0x40>
 5a3:	83 ec 0c             	sub    $0xc,%esp
 5a6:	56                   	push   %esi
 5a7:	e8 f7 fc ff ff       	call   2a3 <sbrk>
 5ac:	83 c4 10             	add    $0x10,%esp
 5af:	83 f8 ff             	cmp    $0xffffffff,%eax
 5b2:	74 1c                	je     5d0 <malloc+0x80>
 5b4:	89 58 04             	mov    %ebx,0x4(%eax)
 5b7:	83 ec 0c             	sub    $0xc,%esp
 5ba:	83 c0 08             	add    $0x8,%eax
 5bd:	50                   	push   %eax
 5be:	e8 05 ff ff ff       	call   4c8 <free>
 5c3:	8b 15 bc 06 00 00    	mov    0x6bc,%edx
 5c9:	83 c4 10             	add    $0x10,%esp
 5cc:	85 d2                	test   %edx,%edx
 5ce:	75 c2                	jne    592 <malloc+0x42>
 5d0:	31 c0                	xor    %eax,%eax
 5d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d5:	5b                   	pop    %ebx
 5d6:	5e                   	pop    %esi
 5d7:	5f                   	pop    %edi
 5d8:	5d                   	pop    %ebp
 5d9:	c3                   	ret    
 5da:	66 90                	xchg   %ax,%ax
 5dc:	39 cf                	cmp    %ecx,%edi
 5de:	74 4c                	je     62c <malloc+0xdc>
 5e0:	29 f9                	sub    %edi,%ecx
 5e2:	89 48 04             	mov    %ecx,0x4(%eax)
 5e5:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5e8:	89 78 04             	mov    %edi,0x4(%eax)
 5eb:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 5f1:	83 c0 08             	add    $0x8,%eax
 5f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f7:	5b                   	pop    %ebx
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret    
 5fc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 601:	eb 81                	jmp    584 <malloc+0x34>
 603:	90                   	nop
 604:	c7 05 bc 06 00 00 c0 	movl   $0x6c0,0x6bc
 60b:	06 00 00 
 60e:	c7 05 c0 06 00 00 c0 	movl   $0x6c0,0x6c0
 615:	06 00 00 
 618:	c7 05 c4 06 00 00 00 	movl   $0x0,0x6c4
 61f:	00 00 00 
 622:	b8 c0 06 00 00       	mov    $0x6c0,%eax
 627:	e9 4e ff ff ff       	jmp    57a <malloc+0x2a>
 62c:	8b 08                	mov    (%eax),%ecx
 62e:	89 0a                	mov    %ecx,(%edx)
 630:	eb b9                	jmp    5eb <malloc+0x9b>
