
_test_1:     file format elf32-i386


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
  11:	81 ec 88 00 00 00    	sub    $0x88,%esp
  17:	e8 d7 02 00 00       	call   2f3 <getreadcount>
  1c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  22:	e8 cc 02 00 00       	call   2f3 <getreadcount>
  27:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
  2d:	52                   	push   %edx
  2e:	6a 01                	push   $0x1
  30:	8d 75 84             	lea    -0x7c(%ebp),%esi
  33:	56                   	push   %esi
  34:	6a 04                	push   $0x4
  36:	e8 30 02 00 00       	call   26b <read>
  3b:	e8 b3 02 00 00       	call   2f3 <getreadcount>
  40:	89 c7                	mov    %eax,%edi
  42:	83 c4 10             	add    $0x10,%esp
  45:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  4a:	66 90                	xchg   %ax,%ax
  4c:	50                   	push   %eax
  4d:	6a 01                	push   $0x1
  4f:	56                   	push   %esi
  50:	6a 04                	push   $0x4
  52:	e8 14 02 00 00       	call   26b <read>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	4b                   	dec    %ebx
  5b:	75 ef                	jne    4c <main+0x4c>
  5d:	e8 91 02 00 00       	call   2f3 <getreadcount>
  62:	83 ec 0c             	sub    $0xc,%esp
  65:	29 f8                	sub    %edi,%eax
  67:	50                   	push   %eax
  68:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
  6e:	29 c7                	sub    %eax,%edi
  70:	57                   	push   %edi
  71:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  77:	29 d0                	sub    %edx,%eax
  79:	50                   	push   %eax
  7a:	68 6c 06 00 00       	push   $0x66c
  7f:	6a 01                	push   $0x1
  81:	e8 02 03 00 00       	call   388 <printf>
  86:	83 c4 20             	add    $0x20,%esp
  89:	e8 c5 01 00 00       	call   253 <exit>
  8e:	66 90                	xchg   %ax,%ax

00000090 <strcpy>:
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	53                   	push   %ebx
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  9a:	31 c0                	xor    %eax,%eax
  9c:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  9f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  a2:	40                   	inc    %eax
  a3:	84 d2                	test   %dl,%dl
  a5:	75 f5                	jne    9c <strcpy+0xc>
  a7:	89 c8                	mov    %ecx,%eax
  a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ac:	c9                   	leave  
  ad:	c3                   	ret    
  ae:	66 90                	xchg   %ax,%ax

000000b0 <strcmp>:
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	53                   	push   %ebx
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ba:	0f b6 02             	movzbl (%edx),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 10                	jne    d1 <strcmp+0x21>
  c1:	eb 2a                	jmp    ed <strcmp+0x3d>
  c3:	90                   	nop
  c4:	42                   	inc    %edx
  c5:	8d 4b 01             	lea    0x1(%ebx),%ecx
  c8:	0f b6 02             	movzbl (%edx),%eax
  cb:	84 c0                	test   %al,%al
  cd:	74 11                	je     e0 <strcmp+0x30>
  cf:	89 cb                	mov    %ecx,%ebx
  d1:	0f b6 0b             	movzbl (%ebx),%ecx
  d4:	38 c1                	cmp    %al,%cl
  d6:	74 ec                	je     c4 <strcmp+0x14>
  d8:	29 c8                	sub    %ecx,%eax
  da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  dd:	c9                   	leave  
  de:	c3                   	ret    
  df:	90                   	nop
  e0:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 c8                	sub    %ecx,%eax
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  ed:	0f b6 0b             	movzbl (%ebx),%ecx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb e4                	jmp    d8 <strcmp+0x28>

000000f4 <strlen>:
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	8b 55 08             	mov    0x8(%ebp),%edx
  fa:	80 3a 00             	cmpb   $0x0,(%edx)
  fd:	74 15                	je     114 <strlen+0x20>
  ff:	31 c0                	xor    %eax,%eax
 101:	8d 76 00             	lea    0x0(%esi),%esi
 104:	40                   	inc    %eax
 105:	89 c1                	mov    %eax,%ecx
 107:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 10b:	75 f7                	jne    104 <strlen+0x10>
 10d:	89 c8                	mov    %ecx,%eax
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	8d 76 00             	lea    0x0(%esi),%esi
 114:	31 c9                	xor    %ecx,%ecx
 116:	89 c8                	mov    %ecx,%eax
 118:	5d                   	pop    %ebp
 119:	c3                   	ret    
 11a:	66 90                	xchg   %ax,%ax

0000011c <memset>:
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	57                   	push   %edi
 120:	8b 7d 08             	mov    0x8(%ebp),%edi
 123:	8b 4d 10             	mov    0x10(%ebp),%ecx
 126:	8b 45 0c             	mov    0xc(%ebp),%eax
 129:	fc                   	cld    
 12a:	f3 aa                	rep stos %al,%es:(%edi)
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	8b 7d fc             	mov    -0x4(%ebp),%edi
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <strchr>:
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	8b 45 08             	mov    0x8(%ebp),%eax
 13a:	8a 4d 0c             	mov    0xc(%ebp),%cl
 13d:	8a 10                	mov    (%eax),%dl
 13f:	84 d2                	test   %dl,%dl
 141:	75 0c                	jne    14f <strchr+0x1b>
 143:	eb 13                	jmp    158 <strchr+0x24>
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	40                   	inc    %eax
 149:	8a 10                	mov    (%eax),%dl
 14b:	84 d2                	test   %dl,%dl
 14d:	74 09                	je     158 <strchr+0x24>
 14f:	38 d1                	cmp    %dl,%cl
 151:	75 f5                	jne    148 <strchr+0x14>
 153:	5d                   	pop    %ebp
 154:	c3                   	ret    
 155:	8d 76 00             	lea    0x0(%esi),%esi
 158:	31 c0                	xor    %eax,%eax
 15a:	5d                   	pop    %ebp
 15b:	c3                   	ret    

0000015c <gets>:
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	56                   	push   %esi
 161:	53                   	push   %ebx
 162:	83 ec 1c             	sub    $0x1c,%esp
 165:	31 db                	xor    %ebx,%ebx
 167:	8d 75 e7             	lea    -0x19(%ebp),%esi
 16a:	eb 24                	jmp    190 <gets+0x34>
 16c:	50                   	push   %eax
 16d:	6a 01                	push   $0x1
 16f:	56                   	push   %esi
 170:	6a 00                	push   $0x0
 172:	e8 f4 00 00 00       	call   26b <read>
 177:	83 c4 10             	add    $0x10,%esp
 17a:	85 c0                	test   %eax,%eax
 17c:	7e 1a                	jle    198 <gets+0x3c>
 17e:	8a 45 e7             	mov    -0x19(%ebp),%al
 181:	8b 55 08             	mov    0x8(%ebp),%edx
 184:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 188:	3c 0a                	cmp    $0xa,%al
 18a:	74 0e                	je     19a <gets+0x3e>
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0a                	je     19a <gets+0x3e>
 190:	89 df                	mov    %ebx,%edi
 192:	43                   	inc    %ebx
 193:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 196:	7c d4                	jl     16c <gets+0x10>
 198:	89 fb                	mov    %edi,%ebx
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 1a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1a4:	5b                   	pop    %ebx
 1a5:	5e                   	pop    %esi
 1a6:	5f                   	pop    %edi
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8d 76 00             	lea    0x0(%esi),%esi

000001ac <stat>:
 1ac:	55                   	push   %ebp
 1ad:	89 e5                	mov    %esp,%ebp
 1af:	56                   	push   %esi
 1b0:	53                   	push   %ebx
 1b1:	83 ec 08             	sub    $0x8,%esp
 1b4:	6a 00                	push   $0x0
 1b6:	ff 75 08             	pushl  0x8(%ebp)
 1b9:	e8 d5 00 00 00       	call   293 <open>
 1be:	83 c4 10             	add    $0x10,%esp
 1c1:	85 c0                	test   %eax,%eax
 1c3:	78 27                	js     1ec <stat+0x40>
 1c5:	89 c3                	mov    %eax,%ebx
 1c7:	83 ec 08             	sub    $0x8,%esp
 1ca:	ff 75 0c             	pushl  0xc(%ebp)
 1cd:	50                   	push   %eax
 1ce:	e8 d8 00 00 00       	call   2ab <fstat>
 1d3:	89 c6                	mov    %eax,%esi
 1d5:	89 1c 24             	mov    %ebx,(%esp)
 1d8:	e8 9e 00 00 00       	call   27b <close>
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	89 f0                	mov    %esi,%eax
 1e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1e5:	5b                   	pop    %ebx
 1e6:	5e                   	pop    %esi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d 76 00             	lea    0x0(%esi),%esi
 1ec:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1f1:	eb ed                	jmp    1e0 <stat+0x34>
 1f3:	90                   	nop

000001f4 <atoi>:
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	53                   	push   %ebx
 1f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1fb:	0f be 01             	movsbl (%ecx),%eax
 1fe:	8d 50 d0             	lea    -0x30(%eax),%edx
 201:	80 fa 09             	cmp    $0x9,%dl
 204:	ba 00 00 00 00       	mov    $0x0,%edx
 209:	77 16                	ja     221 <atoi+0x2d>
 20b:	90                   	nop
 20c:	41                   	inc    %ecx
 20d:	8d 14 92             	lea    (%edx,%edx,4),%edx
 210:	01 d2                	add    %edx,%edx
 212:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 216:	0f be 01             	movsbl (%ecx),%eax
 219:	8d 58 d0             	lea    -0x30(%eax),%ebx
 21c:	80 fb 09             	cmp    $0x9,%bl
 21f:	76 eb                	jbe    20c <atoi+0x18>
 221:	89 d0                	mov    %edx,%eax
 223:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <memmove>:
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	57                   	push   %edi
 22c:	56                   	push   %esi
 22d:	8b 55 08             	mov    0x8(%ebp),%edx
 230:	8b 75 0c             	mov    0xc(%ebp),%esi
 233:	8b 45 10             	mov    0x10(%ebp),%eax
 236:	85 c0                	test   %eax,%eax
 238:	7e 0b                	jle    245 <memmove+0x1d>
 23a:	01 d0                	add    %edx,%eax
 23c:	89 d7                	mov    %edx,%edi
 23e:	66 90                	xchg   %ax,%ax
 240:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 241:	39 f8                	cmp    %edi,%eax
 243:	75 fb                	jne    240 <memmove+0x18>
 245:	89 d0                	mov    %edx,%eax
 247:	5e                   	pop    %esi
 248:	5f                   	pop    %edi
 249:	5d                   	pop    %ebp
 24a:	c3                   	ret    

0000024b <fork>:
 24b:	b8 01 00 00 00       	mov    $0x1,%eax
 250:	cd 40                	int    $0x40
 252:	c3                   	ret    

00000253 <exit>:
 253:	b8 02 00 00 00       	mov    $0x2,%eax
 258:	cd 40                	int    $0x40
 25a:	c3                   	ret    

0000025b <wait>:
 25b:	b8 03 00 00 00       	mov    $0x3,%eax
 260:	cd 40                	int    $0x40
 262:	c3                   	ret    

00000263 <pipe>:
 263:	b8 04 00 00 00       	mov    $0x4,%eax
 268:	cd 40                	int    $0x40
 26a:	c3                   	ret    

0000026b <read>:
 26b:	b8 05 00 00 00       	mov    $0x5,%eax
 270:	cd 40                	int    $0x40
 272:	c3                   	ret    

00000273 <write>:
 273:	b8 10 00 00 00       	mov    $0x10,%eax
 278:	cd 40                	int    $0x40
 27a:	c3                   	ret    

0000027b <close>:
 27b:	b8 15 00 00 00       	mov    $0x15,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <kill>:
 283:	b8 06 00 00 00       	mov    $0x6,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <exec>:
 28b:	b8 07 00 00 00       	mov    $0x7,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <open>:
 293:	b8 0f 00 00 00       	mov    $0xf,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <mknod>:
 29b:	b8 11 00 00 00       	mov    $0x11,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <unlink>:
 2a3:	b8 12 00 00 00       	mov    $0x12,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <fstat>:
 2ab:	b8 08 00 00 00       	mov    $0x8,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <link>:
 2b3:	b8 13 00 00 00       	mov    $0x13,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <mkdir>:
 2bb:	b8 14 00 00 00       	mov    $0x14,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <chdir>:
 2c3:	b8 09 00 00 00       	mov    $0x9,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <dup>:
 2cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <getpid>:
 2d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <sbrk>:
 2db:	b8 0c 00 00 00       	mov    $0xc,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <sleep>:
 2e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <uptime>:
 2eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <getreadcount>:
 2f3:	b8 16 00 00 00       	mov    $0x16,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    
 2fb:	90                   	nop

000002fc <printint>:
 2fc:	55                   	push   %ebp
 2fd:	89 e5                	mov    %esp,%ebp
 2ff:	57                   	push   %edi
 300:	56                   	push   %esi
 301:	53                   	push   %ebx
 302:	83 ec 3c             	sub    $0x3c,%esp
 305:	89 45 c0             	mov    %eax,-0x40(%ebp)
 308:	89 cb                	mov    %ecx,%ebx
 30a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 30d:	85 c9                	test   %ecx,%ecx
 30f:	74 04                	je     315 <printint+0x19>
 311:	85 d2                	test   %edx,%edx
 313:	78 6b                	js     380 <printint+0x84>
 315:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 318:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 31f:	31 c9                	xor    %ecx,%ecx
 321:	8d 75 d7             	lea    -0x29(%ebp),%esi
 324:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 327:	31 d2                	xor    %edx,%edx
 329:	f7 f3                	div    %ebx
 32b:	89 cf                	mov    %ecx,%edi
 32d:	8d 49 01             	lea    0x1(%ecx),%ecx
 330:	8a 92 e8 06 00 00    	mov    0x6e8(%edx),%dl
 336:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 33a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 33d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 340:	39 da                	cmp    %ebx,%edx
 342:	73 e0                	jae    324 <printint+0x28>
 344:	8b 55 08             	mov    0x8(%ebp),%edx
 347:	85 d2                	test   %edx,%edx
 349:	74 07                	je     352 <printint+0x56>
 34b:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 350:	89 cf                	mov    %ecx,%edi
 352:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 355:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 359:	8d 76 00             	lea    0x0(%esi),%esi
 35c:	8a 07                	mov    (%edi),%al
 35e:	88 45 d7             	mov    %al,-0x29(%ebp)
 361:	50                   	push   %eax
 362:	6a 01                	push   $0x1
 364:	56                   	push   %esi
 365:	ff 75 c0             	pushl  -0x40(%ebp)
 368:	e8 06 ff ff ff       	call   273 <write>
 36d:	89 f8                	mov    %edi,%eax
 36f:	4f                   	dec    %edi
 370:	83 c4 10             	add    $0x10,%esp
 373:	39 d8                	cmp    %ebx,%eax
 375:	75 e5                	jne    35c <printint+0x60>
 377:	8d 65 f4             	lea    -0xc(%ebp),%esp
 37a:	5b                   	pop    %ebx
 37b:	5e                   	pop    %esi
 37c:	5f                   	pop    %edi
 37d:	5d                   	pop    %ebp
 37e:	c3                   	ret    
 37f:	90                   	nop
 380:	f7 da                	neg    %edx
 382:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 385:	eb 98                	jmp    31f <printint+0x23>
 387:	90                   	nop

00000388 <printf>:
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	57                   	push   %edi
 38c:	56                   	push   %esi
 38d:	53                   	push   %ebx
 38e:	83 ec 2c             	sub    $0x2c,%esp
 391:	8b 75 08             	mov    0x8(%ebp),%esi
 394:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 397:	8a 13                	mov    (%ebx),%dl
 399:	84 d2                	test   %dl,%dl
 39b:	74 5c                	je     3f9 <printf+0x71>
 39d:	43                   	inc    %ebx
 39e:	8d 45 10             	lea    0x10(%ebp),%eax
 3a1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3a4:	31 ff                	xor    %edi,%edi
 3a6:	eb 20                	jmp    3c8 <printf+0x40>
 3a8:	83 f8 25             	cmp    $0x25,%eax
 3ab:	74 3f                	je     3ec <printf+0x64>
 3ad:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3b0:	50                   	push   %eax
 3b1:	6a 01                	push   $0x1
 3b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3b6:	50                   	push   %eax
 3b7:	56                   	push   %esi
 3b8:	e8 b6 fe ff ff       	call   273 <write>
 3bd:	83 c4 10             	add    $0x10,%esp
 3c0:	43                   	inc    %ebx
 3c1:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3c4:	84 d2                	test   %dl,%dl
 3c6:	74 31                	je     3f9 <printf+0x71>
 3c8:	0f b6 c2             	movzbl %dl,%eax
 3cb:	85 ff                	test   %edi,%edi
 3cd:	74 d9                	je     3a8 <printf+0x20>
 3cf:	83 ff 25             	cmp    $0x25,%edi
 3d2:	75 ec                	jne    3c0 <printf+0x38>
 3d4:	83 f8 25             	cmp    $0x25,%eax
 3d7:	0f 84 03 01 00 00    	je     4e0 <printf+0x158>
 3dd:	83 e8 63             	sub    $0x63,%eax
 3e0:	83 f8 15             	cmp    $0x15,%eax
 3e3:	77 1f                	ja     404 <printf+0x7c>
 3e5:	ff 24 85 90 06 00 00 	jmp    *0x690(,%eax,4)
 3ec:	bf 25 00 00 00       	mov    $0x25,%edi
 3f1:	43                   	inc    %ebx
 3f2:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3f5:	84 d2                	test   %dl,%dl
 3f7:	75 cf                	jne    3c8 <printf+0x40>
 3f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3fc:	5b                   	pop    %ebx
 3fd:	5e                   	pop    %esi
 3fe:	5f                   	pop    %edi
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    
 401:	8d 76 00             	lea    0x0(%esi),%esi
 404:	88 55 d0             	mov    %dl,-0x30(%ebp)
 407:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 40b:	50                   	push   %eax
 40c:	6a 01                	push   $0x1
 40e:	8d 7d e7             	lea    -0x19(%ebp),%edi
 411:	57                   	push   %edi
 412:	56                   	push   %esi
 413:	e8 5b fe ff ff       	call   273 <write>
 418:	8a 55 d0             	mov    -0x30(%ebp),%dl
 41b:	88 55 e7             	mov    %dl,-0x19(%ebp)
 41e:	83 c4 0c             	add    $0xc,%esp
 421:	6a 01                	push   $0x1
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	e8 49 fe ff ff       	call   273 <write>
 42a:	83 c4 10             	add    $0x10,%esp
 42d:	31 ff                	xor    %edi,%edi
 42f:	eb 8f                	jmp    3c0 <printf+0x38>
 431:	8d 76 00             	lea    0x0(%esi),%esi
 434:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 437:	8b 17                	mov    (%edi),%edx
 439:	83 ec 0c             	sub    $0xc,%esp
 43c:	6a 00                	push   $0x0
 43e:	b9 10 00 00 00       	mov    $0x10,%ecx
 443:	89 f0                	mov    %esi,%eax
 445:	e8 b2 fe ff ff       	call   2fc <printint>
 44a:	83 c7 04             	add    $0x4,%edi
 44d:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 450:	83 c4 10             	add    $0x10,%esp
 453:	31 ff                	xor    %edi,%edi
 455:	e9 66 ff ff ff       	jmp    3c0 <printf+0x38>
 45a:	66 90                	xchg   %ax,%ax
 45c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 45f:	8b 10                	mov    (%eax),%edx
 461:	83 c0 04             	add    $0x4,%eax
 464:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 467:	85 d2                	test   %edx,%edx
 469:	0f 84 81 00 00 00    	je     4f0 <printf+0x168>
 46f:	8a 02                	mov    (%edx),%al
 471:	84 c0                	test   %al,%al
 473:	0f 84 80 00 00 00    	je     4f9 <printf+0x171>
 479:	8d 7d e7             	lea    -0x19(%ebp),%edi
 47c:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 47f:	89 d3                	mov    %edx,%ebx
 481:	8d 76 00             	lea    0x0(%esi),%esi
 484:	88 45 e7             	mov    %al,-0x19(%ebp)
 487:	50                   	push   %eax
 488:	6a 01                	push   $0x1
 48a:	57                   	push   %edi
 48b:	56                   	push   %esi
 48c:	e8 e2 fd ff ff       	call   273 <write>
 491:	43                   	inc    %ebx
 492:	8a 03                	mov    (%ebx),%al
 494:	83 c4 10             	add    $0x10,%esp
 497:	84 c0                	test   %al,%al
 499:	75 e9                	jne    484 <printf+0xfc>
 49b:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 49e:	31 ff                	xor    %edi,%edi
 4a0:	e9 1b ff ff ff       	jmp    3c0 <printf+0x38>
 4a5:	8d 76 00             	lea    0x0(%esi),%esi
 4a8:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4ab:	8b 17                	mov    (%edi),%edx
 4ad:	83 ec 0c             	sub    $0xc,%esp
 4b0:	6a 01                	push   $0x1
 4b2:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4b7:	eb 8a                	jmp    443 <printf+0xbb>
 4b9:	8d 76 00             	lea    0x0(%esi),%esi
 4bc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4bf:	8b 00                	mov    (%eax),%eax
 4c1:	88 45 e7             	mov    %al,-0x19(%ebp)
 4c4:	51                   	push   %ecx
 4c5:	6a 01                	push   $0x1
 4c7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ca:	57                   	push   %edi
 4cb:	56                   	push   %esi
 4cc:	e8 a2 fd ff ff       	call   273 <write>
 4d1:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4d5:	83 c4 10             	add    $0x10,%esp
 4d8:	31 ff                	xor    %edi,%edi
 4da:	e9 e1 fe ff ff       	jmp    3c0 <printf+0x38>
 4df:	90                   	nop
 4e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4e3:	52                   	push   %edx
 4e4:	6a 01                	push   $0x1
 4e6:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4e9:	e9 35 ff ff ff       	jmp    423 <printf+0x9b>
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	b0 28                	mov    $0x28,%al
 4f2:	ba 86 06 00 00       	mov    $0x686,%edx
 4f7:	eb 80                	jmp    479 <printf+0xf1>
 4f9:	31 ff                	xor    %edi,%edi
 4fb:	e9 c0 fe ff ff       	jmp    3c0 <printf+0x38>

00000500 <free>:
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	8b 5d 08             	mov    0x8(%ebp),%ebx
 509:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 50c:	a1 fc 06 00 00       	mov    0x6fc,%eax
 511:	8d 76 00             	lea    0x0(%esi),%esi
 514:	89 c2                	mov    %eax,%edx
 516:	8b 00                	mov    (%eax),%eax
 518:	39 ca                	cmp    %ecx,%edx
 51a:	73 2c                	jae    548 <free+0x48>
 51c:	39 c1                	cmp    %eax,%ecx
 51e:	72 04                	jb     524 <free+0x24>
 520:	39 c2                	cmp    %eax,%edx
 522:	72 f0                	jb     514 <free+0x14>
 524:	8b 73 fc             	mov    -0x4(%ebx),%esi
 527:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 52a:	39 f8                	cmp    %edi,%eax
 52c:	74 2c                	je     55a <free+0x5a>
 52e:	89 43 f8             	mov    %eax,-0x8(%ebx)
 531:	8b 42 04             	mov    0x4(%edx),%eax
 534:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 537:	39 f1                	cmp    %esi,%ecx
 539:	74 36                	je     571 <free+0x71>
 53b:	89 0a                	mov    %ecx,(%edx)
 53d:	89 15 fc 06 00 00    	mov    %edx,0x6fc
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	39 c2                	cmp    %eax,%edx
 54a:	72 c8                	jb     514 <free+0x14>
 54c:	39 c1                	cmp    %eax,%ecx
 54e:	73 c4                	jae    514 <free+0x14>
 550:	8b 73 fc             	mov    -0x4(%ebx),%esi
 553:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 556:	39 f8                	cmp    %edi,%eax
 558:	75 d4                	jne    52e <free+0x2e>
 55a:	03 70 04             	add    0x4(%eax),%esi
 55d:	89 73 fc             	mov    %esi,-0x4(%ebx)
 560:	8b 02                	mov    (%edx),%eax
 562:	8b 00                	mov    (%eax),%eax
 564:	89 43 f8             	mov    %eax,-0x8(%ebx)
 567:	8b 42 04             	mov    0x4(%edx),%eax
 56a:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 56d:	39 f1                	cmp    %esi,%ecx
 56f:	75 ca                	jne    53b <free+0x3b>
 571:	03 43 fc             	add    -0x4(%ebx),%eax
 574:	89 42 04             	mov    %eax,0x4(%edx)
 577:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 57a:	89 0a                	mov    %ecx,(%edx)
 57c:	89 15 fc 06 00 00    	mov    %edx,0x6fc
 582:	5b                   	pop    %ebx
 583:	5e                   	pop    %esi
 584:	5f                   	pop    %edi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret    
 587:	90                   	nop

00000588 <malloc>:
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	57                   	push   %edi
 58c:	56                   	push   %esi
 58d:	53                   	push   %ebx
 58e:	83 ec 0c             	sub    $0xc,%esp
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	8d 78 07             	lea    0x7(%eax),%edi
 597:	c1 ef 03             	shr    $0x3,%edi
 59a:	47                   	inc    %edi
 59b:	8b 15 fc 06 00 00    	mov    0x6fc,%edx
 5a1:	85 d2                	test   %edx,%edx
 5a3:	0f 84 93 00 00 00    	je     63c <malloc+0xb4>
 5a9:	8b 02                	mov    (%edx),%eax
 5ab:	8b 48 04             	mov    0x4(%eax),%ecx
 5ae:	39 f9                	cmp    %edi,%ecx
 5b0:	73 62                	jae    614 <malloc+0x8c>
 5b2:	89 fb                	mov    %edi,%ebx
 5b4:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 5ba:	72 78                	jb     634 <malloc+0xac>
 5bc:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 5c3:	eb 0e                	jmp    5d3 <malloc+0x4b>
 5c5:	8d 76 00             	lea    0x0(%esi),%esi
 5c8:	89 c2                	mov    %eax,%edx
 5ca:	8b 02                	mov    (%edx),%eax
 5cc:	8b 48 04             	mov    0x4(%eax),%ecx
 5cf:	39 f9                	cmp    %edi,%ecx
 5d1:	73 41                	jae    614 <malloc+0x8c>
 5d3:	39 05 fc 06 00 00    	cmp    %eax,0x6fc
 5d9:	75 ed                	jne    5c8 <malloc+0x40>
 5db:	83 ec 0c             	sub    $0xc,%esp
 5de:	56                   	push   %esi
 5df:	e8 f7 fc ff ff       	call   2db <sbrk>
 5e4:	83 c4 10             	add    $0x10,%esp
 5e7:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ea:	74 1c                	je     608 <malloc+0x80>
 5ec:	89 58 04             	mov    %ebx,0x4(%eax)
 5ef:	83 ec 0c             	sub    $0xc,%esp
 5f2:	83 c0 08             	add    $0x8,%eax
 5f5:	50                   	push   %eax
 5f6:	e8 05 ff ff ff       	call   500 <free>
 5fb:	8b 15 fc 06 00 00    	mov    0x6fc,%edx
 601:	83 c4 10             	add    $0x10,%esp
 604:	85 d2                	test   %edx,%edx
 606:	75 c2                	jne    5ca <malloc+0x42>
 608:	31 c0                	xor    %eax,%eax
 60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret    
 612:	66 90                	xchg   %ax,%ax
 614:	39 cf                	cmp    %ecx,%edi
 616:	74 4c                	je     664 <malloc+0xdc>
 618:	29 f9                	sub    %edi,%ecx
 61a:	89 48 04             	mov    %ecx,0x4(%eax)
 61d:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 620:	89 78 04             	mov    %edi,0x4(%eax)
 623:	89 15 fc 06 00 00    	mov    %edx,0x6fc
 629:	83 c0 08             	add    $0x8,%eax
 62c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62f:	5b                   	pop    %ebx
 630:	5e                   	pop    %esi
 631:	5f                   	pop    %edi
 632:	5d                   	pop    %ebp
 633:	c3                   	ret    
 634:	bb 00 10 00 00       	mov    $0x1000,%ebx
 639:	eb 81                	jmp    5bc <malloc+0x34>
 63b:	90                   	nop
 63c:	c7 05 fc 06 00 00 00 	movl   $0x700,0x6fc
 643:	07 00 00 
 646:	c7 05 00 07 00 00 00 	movl   $0x700,0x700
 64d:	07 00 00 
 650:	c7 05 04 07 00 00 00 	movl   $0x0,0x704
 657:	00 00 00 
 65a:	b8 00 07 00 00       	mov    $0x700,%eax
 65f:	e9 4e ff ff ff       	jmp    5b2 <malloc+0x2a>
 664:	8b 08                	mov    (%eax),%ecx
 666:	89 0a                	mov    %ecx,(%edx)
 668:	eb b9                	jmp    623 <malloc+0x9b>
