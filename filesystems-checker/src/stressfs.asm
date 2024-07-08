
_stressfs:     file format elf32-i386


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
  11:	81 ec 20 02 00 00    	sub    $0x220,%esp
  17:	be fb 06 00 00       	mov    $0x6fb,%esi
  1c:	b9 0a 00 00 00       	mov    $0xa,%ecx
  21:	8d bd de fd ff ff    	lea    -0x222(%ebp),%edi
  27:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  29:	68 d8 06 00 00       	push   $0x6d8
  2e:	6a 01                	push   $0x1
  30:	e8 bf 03 00 00       	call   3f4 <printf>
  35:	83 c4 0c             	add    $0xc,%esp
  38:	68 00 02 00 00       	push   $0x200
  3d:	6a 61                	push   $0x61
  3f:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
  45:	56                   	push   %esi
  46:	e8 3d 01 00 00       	call   188 <memset>
  4b:	83 c4 10             	add    $0x10,%esp
  4e:	31 db                	xor    %ebx,%ebx
  50:	e8 62 02 00 00       	call   2b7 <fork>
  55:	85 c0                	test   %eax,%eax
  57:	7f 06                	jg     5f <main+0x5f>
  59:	43                   	inc    %ebx
  5a:	83 fb 04             	cmp    $0x4,%ebx
  5d:	75 f1                	jne    50 <main+0x50>
  5f:	50                   	push   %eax
  60:	53                   	push   %ebx
  61:	68 eb 06 00 00       	push   $0x6eb
  66:	6a 01                	push   $0x1
  68:	e8 87 03 00 00       	call   3f4 <printf>
  6d:	00 9d e6 fd ff ff    	add    %bl,-0x21a(%ebp)
  73:	58                   	pop    %eax
  74:	5a                   	pop    %edx
  75:	68 02 02 00 00       	push   $0x202
  7a:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  80:	50                   	push   %eax
  81:	e8 79 02 00 00       	call   2ff <open>
  86:	89 c7                	mov    %eax,%edi
  88:	83 c4 10             	add    $0x10,%esp
  8b:	bb 14 00 00 00       	mov    $0x14,%ebx
  90:	50                   	push   %eax
  91:	68 00 02 00 00       	push   $0x200
  96:	56                   	push   %esi
  97:	57                   	push   %edi
  98:	e8 42 02 00 00       	call   2df <write>
  9d:	83 c4 10             	add    $0x10,%esp
  a0:	4b                   	dec    %ebx
  a1:	75 ed                	jne    90 <main+0x90>
  a3:	83 ec 0c             	sub    $0xc,%esp
  a6:	57                   	push   %edi
  a7:	e8 3b 02 00 00       	call   2e7 <close>
  ac:	5a                   	pop    %edx
  ad:	59                   	pop    %ecx
  ae:	68 f5 06 00 00       	push   $0x6f5
  b3:	6a 01                	push   $0x1
  b5:	e8 3a 03 00 00       	call   3f4 <printf>
  ba:	5b                   	pop    %ebx
  bb:	5f                   	pop    %edi
  bc:	6a 00                	push   $0x0
  be:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  c4:	50                   	push   %eax
  c5:	e8 35 02 00 00       	call   2ff <open>
  ca:	89 c7                	mov    %eax,%edi
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	bb 14 00 00 00       	mov    $0x14,%ebx
  d4:	50                   	push   %eax
  d5:	68 00 02 00 00       	push   $0x200
  da:	56                   	push   %esi
  db:	57                   	push   %edi
  dc:	e8 f6 01 00 00       	call   2d7 <read>
  e1:	83 c4 10             	add    $0x10,%esp
  e4:	4b                   	dec    %ebx
  e5:	75 ed                	jne    d4 <main+0xd4>
  e7:	83 ec 0c             	sub    $0xc,%esp
  ea:	57                   	push   %edi
  eb:	e8 f7 01 00 00       	call   2e7 <close>
  f0:	e8 d2 01 00 00       	call   2c7 <wait>
  f5:	e8 c5 01 00 00       	call   2bf <exit>
  fa:	66 90                	xchg   %ax,%ax

000000fc <strcpy>:
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	53                   	push   %ebx
 100:	8b 4d 08             	mov    0x8(%ebp),%ecx
 103:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 106:	31 c0                	xor    %eax,%eax
 108:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 10b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 10e:	40                   	inc    %eax
 10f:	84 d2                	test   %dl,%dl
 111:	75 f5                	jne    108 <strcpy+0xc>
 113:	89 c8                	mov    %ecx,%eax
 115:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 118:	c9                   	leave  
 119:	c3                   	ret    
 11a:	66 90                	xchg   %ax,%ax

0000011c <strcmp>:
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	53                   	push   %ebx
 120:	8b 55 08             	mov    0x8(%ebp),%edx
 123:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 126:	0f b6 02             	movzbl (%edx),%eax
 129:	84 c0                	test   %al,%al
 12b:	75 10                	jne    13d <strcmp+0x21>
 12d:	eb 2a                	jmp    159 <strcmp+0x3d>
 12f:	90                   	nop
 130:	42                   	inc    %edx
 131:	8d 4b 01             	lea    0x1(%ebx),%ecx
 134:	0f b6 02             	movzbl (%edx),%eax
 137:	84 c0                	test   %al,%al
 139:	74 11                	je     14c <strcmp+0x30>
 13b:	89 cb                	mov    %ecx,%ebx
 13d:	0f b6 0b             	movzbl (%ebx),%ecx
 140:	38 c1                	cmp    %al,%cl
 142:	74 ec                	je     130 <strcmp+0x14>
 144:	29 c8                	sub    %ecx,%eax
 146:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 149:	c9                   	leave  
 14a:	c3                   	ret    
 14b:	90                   	nop
 14c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 150:	31 c0                	xor    %eax,%eax
 152:	29 c8                	sub    %ecx,%eax
 154:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 157:	c9                   	leave  
 158:	c3                   	ret    
 159:	0f b6 0b             	movzbl (%ebx),%ecx
 15c:	31 c0                	xor    %eax,%eax
 15e:	eb e4                	jmp    144 <strcmp+0x28>

00000160 <strlen>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	80 3a 00             	cmpb   $0x0,(%edx)
 169:	74 15                	je     180 <strlen+0x20>
 16b:	31 c0                	xor    %eax,%eax
 16d:	8d 76 00             	lea    0x0(%esi),%esi
 170:	40                   	inc    %eax
 171:	89 c1                	mov    %eax,%ecx
 173:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 177:	75 f7                	jne    170 <strlen+0x10>
 179:	89 c8                	mov    %ecx,%eax
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	31 c9                	xor    %ecx,%ecx
 182:	89 c8                	mov    %ecx,%eax
 184:	5d                   	pop    %ebp
 185:	c3                   	ret    
 186:	66 90                	xchg   %ax,%ax

00000188 <memset>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	57                   	push   %edi
 18c:	8b 7d 08             	mov    0x8(%ebp),%edi
 18f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 192:	8b 45 0c             	mov    0xc(%ebp),%eax
 195:	fc                   	cld    
 196:	f3 aa                	rep stos %al,%es:(%edi)
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 19e:	c9                   	leave  
 19f:	c3                   	ret    

000001a0 <strchr>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1a9:	8a 10                	mov    (%eax),%dl
 1ab:	84 d2                	test   %dl,%dl
 1ad:	75 0c                	jne    1bb <strchr+0x1b>
 1af:	eb 13                	jmp    1c4 <strchr+0x24>
 1b1:	8d 76 00             	lea    0x0(%esi),%esi
 1b4:	40                   	inc    %eax
 1b5:	8a 10                	mov    (%eax),%dl
 1b7:	84 d2                	test   %dl,%dl
 1b9:	74 09                	je     1c4 <strchr+0x24>
 1bb:	38 d1                	cmp    %dl,%cl
 1bd:	75 f5                	jne    1b4 <strchr+0x14>
 1bf:	5d                   	pop    %ebp
 1c0:	c3                   	ret    
 1c1:	8d 76 00             	lea    0x0(%esi),%esi
 1c4:	31 c0                	xor    %eax,%eax
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    

000001c8 <gets>:
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	57                   	push   %edi
 1cc:	56                   	push   %esi
 1cd:	53                   	push   %ebx
 1ce:	83 ec 1c             	sub    $0x1c,%esp
 1d1:	31 db                	xor    %ebx,%ebx
 1d3:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1d6:	eb 24                	jmp    1fc <gets+0x34>
 1d8:	50                   	push   %eax
 1d9:	6a 01                	push   $0x1
 1db:	56                   	push   %esi
 1dc:	6a 00                	push   $0x0
 1de:	e8 f4 00 00 00       	call   2d7 <read>
 1e3:	83 c4 10             	add    $0x10,%esp
 1e6:	85 c0                	test   %eax,%eax
 1e8:	7e 1a                	jle    204 <gets+0x3c>
 1ea:	8a 45 e7             	mov    -0x19(%ebp),%al
 1ed:	8b 55 08             	mov    0x8(%ebp),%edx
 1f0:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1f4:	3c 0a                	cmp    $0xa,%al
 1f6:	74 0e                	je     206 <gets+0x3e>
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0a                	je     206 <gets+0x3e>
 1fc:	89 df                	mov    %ebx,%edi
 1fe:	43                   	inc    %ebx
 1ff:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 202:	7c d4                	jl     1d8 <gets+0x10>
 204:	89 fb                	mov    %edi,%ebx
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 20d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 210:	5b                   	pop    %ebx
 211:	5e                   	pop    %esi
 212:	5f                   	pop    %edi
 213:	5d                   	pop    %ebp
 214:	c3                   	ret    
 215:	8d 76 00             	lea    0x0(%esi),%esi

00000218 <stat>:
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	56                   	push   %esi
 21c:	53                   	push   %ebx
 21d:	83 ec 08             	sub    $0x8,%esp
 220:	6a 00                	push   $0x0
 222:	ff 75 08             	pushl  0x8(%ebp)
 225:	e8 d5 00 00 00       	call   2ff <open>
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	85 c0                	test   %eax,%eax
 22f:	78 27                	js     258 <stat+0x40>
 231:	89 c3                	mov    %eax,%ebx
 233:	83 ec 08             	sub    $0x8,%esp
 236:	ff 75 0c             	pushl  0xc(%ebp)
 239:	50                   	push   %eax
 23a:	e8 d8 00 00 00       	call   317 <fstat>
 23f:	89 c6                	mov    %eax,%esi
 241:	89 1c 24             	mov    %ebx,(%esp)
 244:	e8 9e 00 00 00       	call   2e7 <close>
 249:	83 c4 10             	add    $0x10,%esp
 24c:	89 f0                	mov    %esi,%eax
 24e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 251:	5b                   	pop    %ebx
 252:	5e                   	pop    %esi
 253:	5d                   	pop    %ebp
 254:	c3                   	ret    
 255:	8d 76 00             	lea    0x0(%esi),%esi
 258:	be ff ff ff ff       	mov    $0xffffffff,%esi
 25d:	eb ed                	jmp    24c <stat+0x34>
 25f:	90                   	nop

00000260 <atoi>:
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	53                   	push   %ebx
 264:	8b 4d 08             	mov    0x8(%ebp),%ecx
 267:	0f be 01             	movsbl (%ecx),%eax
 26a:	8d 50 d0             	lea    -0x30(%eax),%edx
 26d:	80 fa 09             	cmp    $0x9,%dl
 270:	ba 00 00 00 00       	mov    $0x0,%edx
 275:	77 16                	ja     28d <atoi+0x2d>
 277:	90                   	nop
 278:	41                   	inc    %ecx
 279:	8d 14 92             	lea    (%edx,%edx,4),%edx
 27c:	01 d2                	add    %edx,%edx
 27e:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 282:	0f be 01             	movsbl (%ecx),%eax
 285:	8d 58 d0             	lea    -0x30(%eax),%ebx
 288:	80 fb 09             	cmp    $0x9,%bl
 28b:	76 eb                	jbe    278 <atoi+0x18>
 28d:	89 d0                	mov    %edx,%eax
 28f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memmove>:
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	57                   	push   %edi
 298:	56                   	push   %esi
 299:	8b 55 08             	mov    0x8(%ebp),%edx
 29c:	8b 75 0c             	mov    0xc(%ebp),%esi
 29f:	8b 45 10             	mov    0x10(%ebp),%eax
 2a2:	85 c0                	test   %eax,%eax
 2a4:	7e 0b                	jle    2b1 <memmove+0x1d>
 2a6:	01 d0                	add    %edx,%eax
 2a8:	89 d7                	mov    %edx,%edi
 2aa:	66 90                	xchg   %ax,%ax
 2ac:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2ad:	39 f8                	cmp    %edi,%eax
 2af:	75 fb                	jne    2ac <memmove+0x18>
 2b1:	89 d0                	mov    %edx,%eax
 2b3:	5e                   	pop    %esi
 2b4:	5f                   	pop    %edi
 2b5:	5d                   	pop    %ebp
 2b6:	c3                   	ret    

000002b7 <fork>:
 2b7:	b8 01 00 00 00       	mov    $0x1,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <exit>:
 2bf:	b8 02 00 00 00       	mov    $0x2,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <wait>:
 2c7:	b8 03 00 00 00       	mov    $0x3,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <pipe>:
 2cf:	b8 04 00 00 00       	mov    $0x4,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <read>:
 2d7:	b8 05 00 00 00       	mov    $0x5,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <write>:
 2df:	b8 10 00 00 00       	mov    $0x10,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <close>:
 2e7:	b8 15 00 00 00       	mov    $0x15,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <kill>:
 2ef:	b8 06 00 00 00       	mov    $0x6,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <exec>:
 2f7:	b8 07 00 00 00       	mov    $0x7,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <open>:
 2ff:	b8 0f 00 00 00       	mov    $0xf,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <mknod>:
 307:	b8 11 00 00 00       	mov    $0x11,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <unlink>:
 30f:	b8 12 00 00 00       	mov    $0x12,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <fstat>:
 317:	b8 08 00 00 00       	mov    $0x8,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <link>:
 31f:	b8 13 00 00 00       	mov    $0x13,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <mkdir>:
 327:	b8 14 00 00 00       	mov    $0x14,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <chdir>:
 32f:	b8 09 00 00 00       	mov    $0x9,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <dup>:
 337:	b8 0a 00 00 00       	mov    $0xa,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <getpid>:
 33f:	b8 0b 00 00 00       	mov    $0xb,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sbrk>:
 347:	b8 0c 00 00 00       	mov    $0xc,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <sleep>:
 34f:	b8 0d 00 00 00       	mov    $0xd,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <uptime>:
 357:	b8 0e 00 00 00       	mov    $0xe,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <getreadcount>:
 35f:	b8 16 00 00 00       	mov    $0x16,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    
 367:	90                   	nop

00000368 <printint>:
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	57                   	push   %edi
 36c:	56                   	push   %esi
 36d:	53                   	push   %ebx
 36e:	83 ec 3c             	sub    $0x3c,%esp
 371:	89 45 c0             	mov    %eax,-0x40(%ebp)
 374:	89 cb                	mov    %ecx,%ebx
 376:	8b 4d 08             	mov    0x8(%ebp),%ecx
 379:	85 c9                	test   %ecx,%ecx
 37b:	74 04                	je     381 <printint+0x19>
 37d:	85 d2                	test   %edx,%edx
 37f:	78 6b                	js     3ec <printint+0x84>
 381:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 384:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 38b:	31 c9                	xor    %ecx,%ecx
 38d:	8d 75 d7             	lea    -0x29(%ebp),%esi
 390:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 393:	31 d2                	xor    %edx,%edx
 395:	f7 f3                	div    %ebx
 397:	89 cf                	mov    %ecx,%edi
 399:	8d 49 01             	lea    0x1(%ecx),%ecx
 39c:	8a 92 64 07 00 00    	mov    0x764(%edx),%dl
 3a2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 3a6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3ac:	39 da                	cmp    %ebx,%edx
 3ae:	73 e0                	jae    390 <printint+0x28>
 3b0:	8b 55 08             	mov    0x8(%ebp),%edx
 3b3:	85 d2                	test   %edx,%edx
 3b5:	74 07                	je     3be <printint+0x56>
 3b7:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3bc:	89 cf                	mov    %ecx,%edi
 3be:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3c1:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3c5:	8d 76 00             	lea    0x0(%esi),%esi
 3c8:	8a 07                	mov    (%edi),%al
 3ca:	88 45 d7             	mov    %al,-0x29(%ebp)
 3cd:	50                   	push   %eax
 3ce:	6a 01                	push   $0x1
 3d0:	56                   	push   %esi
 3d1:	ff 75 c0             	pushl  -0x40(%ebp)
 3d4:	e8 06 ff ff ff       	call   2df <write>
 3d9:	89 f8                	mov    %edi,%eax
 3db:	4f                   	dec    %edi
 3dc:	83 c4 10             	add    $0x10,%esp
 3df:	39 d8                	cmp    %ebx,%eax
 3e1:	75 e5                	jne    3c8 <printint+0x60>
 3e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e6:	5b                   	pop    %ebx
 3e7:	5e                   	pop    %esi
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	90                   	nop
 3ec:	f7 da                	neg    %edx
 3ee:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3f1:	eb 98                	jmp    38b <printint+0x23>
 3f3:	90                   	nop

000003f4 <printf>:
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	53                   	push   %ebx
 3fa:	83 ec 2c             	sub    $0x2c,%esp
 3fd:	8b 75 08             	mov    0x8(%ebp),%esi
 400:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 403:	8a 13                	mov    (%ebx),%dl
 405:	84 d2                	test   %dl,%dl
 407:	74 5c                	je     465 <printf+0x71>
 409:	43                   	inc    %ebx
 40a:	8d 45 10             	lea    0x10(%ebp),%eax
 40d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 410:	31 ff                	xor    %edi,%edi
 412:	eb 20                	jmp    434 <printf+0x40>
 414:	83 f8 25             	cmp    $0x25,%eax
 417:	74 3f                	je     458 <printf+0x64>
 419:	88 55 e7             	mov    %dl,-0x19(%ebp)
 41c:	50                   	push   %eax
 41d:	6a 01                	push   $0x1
 41f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 422:	50                   	push   %eax
 423:	56                   	push   %esi
 424:	e8 b6 fe ff ff       	call   2df <write>
 429:	83 c4 10             	add    $0x10,%esp
 42c:	43                   	inc    %ebx
 42d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 430:	84 d2                	test   %dl,%dl
 432:	74 31                	je     465 <printf+0x71>
 434:	0f b6 c2             	movzbl %dl,%eax
 437:	85 ff                	test   %edi,%edi
 439:	74 d9                	je     414 <printf+0x20>
 43b:	83 ff 25             	cmp    $0x25,%edi
 43e:	75 ec                	jne    42c <printf+0x38>
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	0f 84 03 01 00 00    	je     54c <printf+0x158>
 449:	83 e8 63             	sub    $0x63,%eax
 44c:	83 f8 15             	cmp    $0x15,%eax
 44f:	77 1f                	ja     470 <printf+0x7c>
 451:	ff 24 85 0c 07 00 00 	jmp    *0x70c(,%eax,4)
 458:	bf 25 00 00 00       	mov    $0x25,%edi
 45d:	43                   	inc    %ebx
 45e:	8a 53 ff             	mov    -0x1(%ebx),%dl
 461:	84 d2                	test   %dl,%dl
 463:	75 cf                	jne    434 <printf+0x40>
 465:	8d 65 f4             	lea    -0xc(%ebp),%esp
 468:	5b                   	pop    %ebx
 469:	5e                   	pop    %esi
 46a:	5f                   	pop    %edi
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    
 46d:	8d 76 00             	lea    0x0(%esi),%esi
 470:	88 55 d0             	mov    %dl,-0x30(%ebp)
 473:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 477:	50                   	push   %eax
 478:	6a 01                	push   $0x1
 47a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 47d:	57                   	push   %edi
 47e:	56                   	push   %esi
 47f:	e8 5b fe ff ff       	call   2df <write>
 484:	8a 55 d0             	mov    -0x30(%ebp),%dl
 487:	88 55 e7             	mov    %dl,-0x19(%ebp)
 48a:	83 c4 0c             	add    $0xc,%esp
 48d:	6a 01                	push   $0x1
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	e8 49 fe ff ff       	call   2df <write>
 496:	83 c4 10             	add    $0x10,%esp
 499:	31 ff                	xor    %edi,%edi
 49b:	eb 8f                	jmp    42c <printf+0x38>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4a3:	8b 17                	mov    (%edi),%edx
 4a5:	83 ec 0c             	sub    $0xc,%esp
 4a8:	6a 00                	push   $0x0
 4aa:	b9 10 00 00 00       	mov    $0x10,%ecx
 4af:	89 f0                	mov    %esi,%eax
 4b1:	e8 b2 fe ff ff       	call   368 <printint>
 4b6:	83 c7 04             	add    $0x4,%edi
 4b9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	31 ff                	xor    %edi,%edi
 4c1:	e9 66 ff ff ff       	jmp    42c <printf+0x38>
 4c6:	66 90                	xchg   %ax,%ax
 4c8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4cb:	8b 10                	mov    (%eax),%edx
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4d3:	85 d2                	test   %edx,%edx
 4d5:	0f 84 81 00 00 00    	je     55c <printf+0x168>
 4db:	8a 02                	mov    (%edx),%al
 4dd:	84 c0                	test   %al,%al
 4df:	0f 84 80 00 00 00    	je     565 <printf+0x171>
 4e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4e8:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4eb:	89 d3                	mov    %edx,%ebx
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	88 45 e7             	mov    %al,-0x19(%ebp)
 4f3:	50                   	push   %eax
 4f4:	6a 01                	push   $0x1
 4f6:	57                   	push   %edi
 4f7:	56                   	push   %esi
 4f8:	e8 e2 fd ff ff       	call   2df <write>
 4fd:	43                   	inc    %ebx
 4fe:	8a 03                	mov    (%ebx),%al
 500:	83 c4 10             	add    $0x10,%esp
 503:	84 c0                	test   %al,%al
 505:	75 e9                	jne    4f0 <printf+0xfc>
 507:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 50a:	31 ff                	xor    %edi,%edi
 50c:	e9 1b ff ff ff       	jmp    42c <printf+0x38>
 511:	8d 76 00             	lea    0x0(%esi),%esi
 514:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 517:	8b 17                	mov    (%edi),%edx
 519:	83 ec 0c             	sub    $0xc,%esp
 51c:	6a 01                	push   $0x1
 51e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 523:	eb 8a                	jmp    4af <printf+0xbb>
 525:	8d 76 00             	lea    0x0(%esi),%esi
 528:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 52b:	8b 00                	mov    (%eax),%eax
 52d:	88 45 e7             	mov    %al,-0x19(%ebp)
 530:	51                   	push   %ecx
 531:	6a 01                	push   $0x1
 533:	8d 7d e7             	lea    -0x19(%ebp),%edi
 536:	57                   	push   %edi
 537:	56                   	push   %esi
 538:	e8 a2 fd ff ff       	call   2df <write>
 53d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 541:	83 c4 10             	add    $0x10,%esp
 544:	31 ff                	xor    %edi,%edi
 546:	e9 e1 fe ff ff       	jmp    42c <printf+0x38>
 54b:	90                   	nop
 54c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 54f:	52                   	push   %edx
 550:	6a 01                	push   $0x1
 552:	8d 7d e7             	lea    -0x19(%ebp),%edi
 555:	e9 35 ff ff ff       	jmp    48f <printf+0x9b>
 55a:	66 90                	xchg   %ax,%ax
 55c:	b0 28                	mov    $0x28,%al
 55e:	ba 05 07 00 00       	mov    $0x705,%edx
 563:	eb 80                	jmp    4e5 <printf+0xf1>
 565:	31 ff                	xor    %edi,%edi
 567:	e9 c0 fe ff ff       	jmp    42c <printf+0x38>

0000056c <free>:
 56c:	55                   	push   %ebp
 56d:	89 e5                	mov    %esp,%ebp
 56f:	57                   	push   %edi
 570:	56                   	push   %esi
 571:	53                   	push   %ebx
 572:	8b 5d 08             	mov    0x8(%ebp),%ebx
 575:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 578:	a1 78 07 00 00       	mov    0x778,%eax
 57d:	8d 76 00             	lea    0x0(%esi),%esi
 580:	89 c2                	mov    %eax,%edx
 582:	8b 00                	mov    (%eax),%eax
 584:	39 ca                	cmp    %ecx,%edx
 586:	73 2c                	jae    5b4 <free+0x48>
 588:	39 c1                	cmp    %eax,%ecx
 58a:	72 04                	jb     590 <free+0x24>
 58c:	39 c2                	cmp    %eax,%edx
 58e:	72 f0                	jb     580 <free+0x14>
 590:	8b 73 fc             	mov    -0x4(%ebx),%esi
 593:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 596:	39 f8                	cmp    %edi,%eax
 598:	74 2c                	je     5c6 <free+0x5a>
 59a:	89 43 f8             	mov    %eax,-0x8(%ebx)
 59d:	8b 42 04             	mov    0x4(%edx),%eax
 5a0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5a3:	39 f1                	cmp    %esi,%ecx
 5a5:	74 36                	je     5dd <free+0x71>
 5a7:	89 0a                	mov    %ecx,(%edx)
 5a9:	89 15 78 07 00 00    	mov    %edx,0x778
 5af:	5b                   	pop    %ebx
 5b0:	5e                   	pop    %esi
 5b1:	5f                   	pop    %edi
 5b2:	5d                   	pop    %ebp
 5b3:	c3                   	ret    
 5b4:	39 c2                	cmp    %eax,%edx
 5b6:	72 c8                	jb     580 <free+0x14>
 5b8:	39 c1                	cmp    %eax,%ecx
 5ba:	73 c4                	jae    580 <free+0x14>
 5bc:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5bf:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5c2:	39 f8                	cmp    %edi,%eax
 5c4:	75 d4                	jne    59a <free+0x2e>
 5c6:	03 70 04             	add    0x4(%eax),%esi
 5c9:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5cc:	8b 02                	mov    (%edx),%eax
 5ce:	8b 00                	mov    (%eax),%eax
 5d0:	89 43 f8             	mov    %eax,-0x8(%ebx)
 5d3:	8b 42 04             	mov    0x4(%edx),%eax
 5d6:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5d9:	39 f1                	cmp    %esi,%ecx
 5db:	75 ca                	jne    5a7 <free+0x3b>
 5dd:	03 43 fc             	add    -0x4(%ebx),%eax
 5e0:	89 42 04             	mov    %eax,0x4(%edx)
 5e3:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 5e6:	89 0a                	mov    %ecx,(%edx)
 5e8:	89 15 78 07 00 00    	mov    %edx,0x778
 5ee:	5b                   	pop    %ebx
 5ef:	5e                   	pop    %esi
 5f0:	5f                   	pop    %edi
 5f1:	5d                   	pop    %ebp
 5f2:	c3                   	ret    
 5f3:	90                   	nop

000005f4 <malloc>:
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	57                   	push   %edi
 5f8:	56                   	push   %esi
 5f9:	53                   	push   %ebx
 5fa:	83 ec 0c             	sub    $0xc,%esp
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	8d 78 07             	lea    0x7(%eax),%edi
 603:	c1 ef 03             	shr    $0x3,%edi
 606:	47                   	inc    %edi
 607:	8b 15 78 07 00 00    	mov    0x778,%edx
 60d:	85 d2                	test   %edx,%edx
 60f:	0f 84 93 00 00 00    	je     6a8 <malloc+0xb4>
 615:	8b 02                	mov    (%edx),%eax
 617:	8b 48 04             	mov    0x4(%eax),%ecx
 61a:	39 f9                	cmp    %edi,%ecx
 61c:	73 62                	jae    680 <malloc+0x8c>
 61e:	89 fb                	mov    %edi,%ebx
 620:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 626:	72 78                	jb     6a0 <malloc+0xac>
 628:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 62f:	eb 0e                	jmp    63f <malloc+0x4b>
 631:	8d 76 00             	lea    0x0(%esi),%esi
 634:	89 c2                	mov    %eax,%edx
 636:	8b 02                	mov    (%edx),%eax
 638:	8b 48 04             	mov    0x4(%eax),%ecx
 63b:	39 f9                	cmp    %edi,%ecx
 63d:	73 41                	jae    680 <malloc+0x8c>
 63f:	39 05 78 07 00 00    	cmp    %eax,0x778
 645:	75 ed                	jne    634 <malloc+0x40>
 647:	83 ec 0c             	sub    $0xc,%esp
 64a:	56                   	push   %esi
 64b:	e8 f7 fc ff ff       	call   347 <sbrk>
 650:	83 c4 10             	add    $0x10,%esp
 653:	83 f8 ff             	cmp    $0xffffffff,%eax
 656:	74 1c                	je     674 <malloc+0x80>
 658:	89 58 04             	mov    %ebx,0x4(%eax)
 65b:	83 ec 0c             	sub    $0xc,%esp
 65e:	83 c0 08             	add    $0x8,%eax
 661:	50                   	push   %eax
 662:	e8 05 ff ff ff       	call   56c <free>
 667:	8b 15 78 07 00 00    	mov    0x778,%edx
 66d:	83 c4 10             	add    $0x10,%esp
 670:	85 d2                	test   %edx,%edx
 672:	75 c2                	jne    636 <malloc+0x42>
 674:	31 c0                	xor    %eax,%eax
 676:	8d 65 f4             	lea    -0xc(%ebp),%esp
 679:	5b                   	pop    %ebx
 67a:	5e                   	pop    %esi
 67b:	5f                   	pop    %edi
 67c:	5d                   	pop    %ebp
 67d:	c3                   	ret    
 67e:	66 90                	xchg   %ax,%ax
 680:	39 cf                	cmp    %ecx,%edi
 682:	74 4c                	je     6d0 <malloc+0xdc>
 684:	29 f9                	sub    %edi,%ecx
 686:	89 48 04             	mov    %ecx,0x4(%eax)
 689:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 68c:	89 78 04             	mov    %edi,0x4(%eax)
 68f:	89 15 78 07 00 00    	mov    %edx,0x778
 695:	83 c0 08             	add    $0x8,%eax
 698:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69b:	5b                   	pop    %ebx
 69c:	5e                   	pop    %esi
 69d:	5f                   	pop    %edi
 69e:	5d                   	pop    %ebp
 69f:	c3                   	ret    
 6a0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6a5:	eb 81                	jmp    628 <malloc+0x34>
 6a7:	90                   	nop
 6a8:	c7 05 78 07 00 00 7c 	movl   $0x77c,0x778
 6af:	07 00 00 
 6b2:	c7 05 7c 07 00 00 7c 	movl   $0x77c,0x77c
 6b9:	07 00 00 
 6bc:	c7 05 80 07 00 00 00 	movl   $0x0,0x780
 6c3:	00 00 00 
 6c6:	b8 7c 07 00 00       	mov    $0x77c,%eax
 6cb:	e9 4e ff ff ff       	jmp    61e <malloc+0x2a>
 6d0:	8b 08                	mov    (%eax),%ecx
 6d2:	89 0a                	mov    %ecx,(%edx)
 6d4:	eb b9                	jmp    68f <malloc+0x9b>
