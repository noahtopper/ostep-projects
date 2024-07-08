
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 c0 06 00 00       	push   $0x6c0
  19:	e8 c9 02 00 00       	call   2e7 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 93 00 00 00    	js     bc <main+0xbc>
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 ec 02 00 00       	call   31f <dup>
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 e0 02 00 00       	call   31f <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	66 90                	xchg   %ax,%ax
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 c8 06 00 00       	push   $0x6c8
  4c:	6a 01                	push   $0x1
  4e:	e8 89 03 00 00       	call   3dc <printf>
  53:	e8 47 02 00 00       	call   29f <fork>
  58:	89 c3                	mov    %eax,%ebx
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	85 c0                	test   %eax,%eax
  5f:	78 24                	js     85 <main+0x85>
  61:	74 35                	je     98 <main+0x98>
  63:	90                   	nop
  64:	e8 46 02 00 00       	call   2af <wait>
  69:	85 c0                	test   %eax,%eax
  6b:	78 d7                	js     44 <main+0x44>
  6d:	39 c3                	cmp    %eax,%ebx
  6f:	74 d3                	je     44 <main+0x44>
  71:	83 ec 08             	sub    $0x8,%esp
  74:	68 07 07 00 00       	push   $0x707
  79:	6a 01                	push   $0x1
  7b:	e8 5c 03 00 00       	call   3dc <printf>
  80:	83 c4 10             	add    $0x10,%esp
  83:	eb df                	jmp    64 <main+0x64>
  85:	53                   	push   %ebx
  86:	53                   	push   %ebx
  87:	68 db 06 00 00       	push   $0x6db
  8c:	6a 01                	push   $0x1
  8e:	e8 49 03 00 00       	call   3dc <printf>
  93:	e8 0f 02 00 00       	call   2a7 <exit>
  98:	50                   	push   %eax
  99:	50                   	push   %eax
  9a:	68 84 07 00 00       	push   $0x784
  9f:	68 ee 06 00 00       	push   $0x6ee
  a4:	e8 36 02 00 00       	call   2df <exec>
  a9:	5a                   	pop    %edx
  aa:	59                   	pop    %ecx
  ab:	68 f1 06 00 00       	push   $0x6f1
  b0:	6a 01                	push   $0x1
  b2:	e8 25 03 00 00       	call   3dc <printf>
  b7:	e8 eb 01 00 00       	call   2a7 <exit>
  bc:	50                   	push   %eax
  bd:	6a 01                	push   $0x1
  bf:	6a 01                	push   $0x1
  c1:	68 c0 06 00 00       	push   $0x6c0
  c6:	e8 24 02 00 00       	call   2ef <mknod>
  cb:	58                   	pop    %eax
  cc:	5a                   	pop    %edx
  cd:	6a 02                	push   $0x2
  cf:	68 c0 06 00 00       	push   $0x6c0
  d4:	e8 0e 02 00 00       	call   2e7 <open>
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	e9 48 ff ff ff       	jmp    29 <main+0x29>
  e1:	66 90                	xchg   %ax,%ax
  e3:	90                   	nop

000000e4 <strcpy>:
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  e7:	53                   	push   %ebx
  e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  eb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ee:	31 c0                	xor    %eax,%eax
  f0:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  f3:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f6:	40                   	inc    %eax
  f7:	84 d2                	test   %dl,%dl
  f9:	75 f5                	jne    f0 <strcpy+0xc>
  fb:	89 c8                	mov    %ecx,%eax
  fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 100:	c9                   	leave  
 101:	c3                   	ret    
 102:	66 90                	xchg   %ax,%ax

00000104 <strcmp>:
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	53                   	push   %ebx
 108:	8b 55 08             	mov    0x8(%ebp),%edx
 10b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 10e:	0f b6 02             	movzbl (%edx),%eax
 111:	84 c0                	test   %al,%al
 113:	75 10                	jne    125 <strcmp+0x21>
 115:	eb 2a                	jmp    141 <strcmp+0x3d>
 117:	90                   	nop
 118:	42                   	inc    %edx
 119:	8d 4b 01             	lea    0x1(%ebx),%ecx
 11c:	0f b6 02             	movzbl (%edx),%eax
 11f:	84 c0                	test   %al,%al
 121:	74 11                	je     134 <strcmp+0x30>
 123:	89 cb                	mov    %ecx,%ebx
 125:	0f b6 0b             	movzbl (%ebx),%ecx
 128:	38 c1                	cmp    %al,%cl
 12a:	74 ec                	je     118 <strcmp+0x14>
 12c:	29 c8                	sub    %ecx,%eax
 12e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 131:	c9                   	leave  
 132:	c3                   	ret    
 133:	90                   	nop
 134:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 138:	31 c0                	xor    %eax,%eax
 13a:	29 c8                	sub    %ecx,%eax
 13c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13f:	c9                   	leave  
 140:	c3                   	ret    
 141:	0f b6 0b             	movzbl (%ebx),%ecx
 144:	31 c0                	xor    %eax,%eax
 146:	eb e4                	jmp    12c <strcmp+0x28>

00000148 <strlen>:
 148:	55                   	push   %ebp
 149:	89 e5                	mov    %esp,%ebp
 14b:	8b 55 08             	mov    0x8(%ebp),%edx
 14e:	80 3a 00             	cmpb   $0x0,(%edx)
 151:	74 15                	je     168 <strlen+0x20>
 153:	31 c0                	xor    %eax,%eax
 155:	8d 76 00             	lea    0x0(%esi),%esi
 158:	40                   	inc    %eax
 159:	89 c1                	mov    %eax,%ecx
 15b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 15f:	75 f7                	jne    158 <strlen+0x10>
 161:	89 c8                	mov    %ecx,%eax
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	31 c9                	xor    %ecx,%ecx
 16a:	89 c8                	mov    %ecx,%eax
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
 16e:	66 90                	xchg   %ax,%ax

00000170 <memset>:
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 7d 08             	mov    0x8(%ebp),%edi
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	fc                   	cld    
 17e:	f3 aa                	rep stos %al,%es:(%edi)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	8b 7d fc             	mov    -0x4(%ebp),%edi
 186:	c9                   	leave  
 187:	c3                   	ret    

00000188 <strchr>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 191:	8a 10                	mov    (%eax),%dl
 193:	84 d2                	test   %dl,%dl
 195:	75 0c                	jne    1a3 <strchr+0x1b>
 197:	eb 13                	jmp    1ac <strchr+0x24>
 199:	8d 76 00             	lea    0x0(%esi),%esi
 19c:	40                   	inc    %eax
 19d:	8a 10                	mov    (%eax),%dl
 19f:	84 d2                	test   %dl,%dl
 1a1:	74 09                	je     1ac <strchr+0x24>
 1a3:	38 d1                	cmp    %dl,%cl
 1a5:	75 f5                	jne    19c <strchr+0x14>
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	31 c0                	xor    %eax,%eax
 1ae:	5d                   	pop    %ebp
 1af:	c3                   	ret    

000001b0 <gets>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
 1b6:	83 ec 1c             	sub    $0x1c,%esp
 1b9:	31 db                	xor    %ebx,%ebx
 1bb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1be:	eb 24                	jmp    1e4 <gets+0x34>
 1c0:	50                   	push   %eax
 1c1:	6a 01                	push   $0x1
 1c3:	56                   	push   %esi
 1c4:	6a 00                	push   $0x0
 1c6:	e8 f4 00 00 00       	call   2bf <read>
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	85 c0                	test   %eax,%eax
 1d0:	7e 1a                	jle    1ec <gets+0x3c>
 1d2:	8a 45 e7             	mov    -0x19(%ebp),%al
 1d5:	8b 55 08             	mov    0x8(%ebp),%edx
 1d8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1dc:	3c 0a                	cmp    $0xa,%al
 1de:	74 0e                	je     1ee <gets+0x3e>
 1e0:	3c 0d                	cmp    $0xd,%al
 1e2:	74 0a                	je     1ee <gets+0x3e>
 1e4:	89 df                	mov    %ebx,%edi
 1e6:	43                   	inc    %ebx
 1e7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ea:	7c d4                	jl     1c0 <gets+0x10>
 1ec:	89 fb                	mov    %edi,%ebx
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 1f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1f8:	5b                   	pop    %ebx
 1f9:	5e                   	pop    %esi
 1fa:	5f                   	pop    %edi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <stat>:
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 d5 00 00 00       	call   2e7 <open>
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
 219:	89 c3                	mov    %eax,%ebx
 21b:	83 ec 08             	sub    $0x8,%esp
 21e:	ff 75 0c             	pushl  0xc(%ebp)
 221:	50                   	push   %eax
 222:	e8 d8 00 00 00       	call   2ff <fstat>
 227:	89 c6                	mov    %eax,%esi
 229:	89 1c 24             	mov    %ebx,(%esp)
 22c:	e8 9e 00 00 00       	call   2cf <close>
 231:	83 c4 10             	add    $0x10,%esp
 234:	89 f0                	mov    %esi,%eax
 236:	8d 65 f8             	lea    -0x8(%ebp),%esp
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	90                   	nop

00000248 <atoi>:
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	53                   	push   %ebx
 24c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 24f:	0f be 01             	movsbl (%ecx),%eax
 252:	8d 50 d0             	lea    -0x30(%eax),%edx
 255:	80 fa 09             	cmp    $0x9,%dl
 258:	ba 00 00 00 00       	mov    $0x0,%edx
 25d:	77 16                	ja     275 <atoi+0x2d>
 25f:	90                   	nop
 260:	41                   	inc    %ecx
 261:	8d 14 92             	lea    (%edx,%edx,4),%edx
 264:	01 d2                	add    %edx,%edx
 266:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 26a:	0f be 01             	movsbl (%ecx),%eax
 26d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x18>
 275:	89 d0                	mov    %edx,%eax
 277:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 27a:	c9                   	leave  
 27b:	c3                   	ret    

0000027c <memmove>:
 27c:	55                   	push   %ebp
 27d:	89 e5                	mov    %esp,%ebp
 27f:	57                   	push   %edi
 280:	56                   	push   %esi
 281:	8b 55 08             	mov    0x8(%ebp),%edx
 284:	8b 75 0c             	mov    0xc(%ebp),%esi
 287:	8b 45 10             	mov    0x10(%ebp),%eax
 28a:	85 c0                	test   %eax,%eax
 28c:	7e 0b                	jle    299 <memmove+0x1d>
 28e:	01 d0                	add    %edx,%eax
 290:	89 d7                	mov    %edx,%edi
 292:	66 90                	xchg   %ax,%ax
 294:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 295:	39 f8                	cmp    %edi,%eax
 297:	75 fb                	jne    294 <memmove+0x18>
 299:	89 d0                	mov    %edx,%eax
 29b:	5e                   	pop    %esi
 29c:	5f                   	pop    %edi
 29d:	5d                   	pop    %ebp
 29e:	c3                   	ret    

0000029f <fork>:
 29f:	b8 01 00 00 00       	mov    $0x1,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <exit>:
 2a7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <wait>:
 2af:	b8 03 00 00 00       	mov    $0x3,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <pipe>:
 2b7:	b8 04 00 00 00       	mov    $0x4,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <read>:
 2bf:	b8 05 00 00 00       	mov    $0x5,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <write>:
 2c7:	b8 10 00 00 00       	mov    $0x10,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <close>:
 2cf:	b8 15 00 00 00       	mov    $0x15,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <kill>:
 2d7:	b8 06 00 00 00       	mov    $0x6,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <exec>:
 2df:	b8 07 00 00 00       	mov    $0x7,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <open>:
 2e7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <mknod>:
 2ef:	b8 11 00 00 00       	mov    $0x11,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <unlink>:
 2f7:	b8 12 00 00 00       	mov    $0x12,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <fstat>:
 2ff:	b8 08 00 00 00       	mov    $0x8,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <link>:
 307:	b8 13 00 00 00       	mov    $0x13,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <mkdir>:
 30f:	b8 14 00 00 00       	mov    $0x14,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <chdir>:
 317:	b8 09 00 00 00       	mov    $0x9,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <dup>:
 31f:	b8 0a 00 00 00       	mov    $0xa,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <getpid>:
 327:	b8 0b 00 00 00       	mov    $0xb,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <sbrk>:
 32f:	b8 0c 00 00 00       	mov    $0xc,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <sleep>:
 337:	b8 0d 00 00 00       	mov    $0xd,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <uptime>:
 33f:	b8 0e 00 00 00       	mov    $0xe,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <getreadcount>:
 347:	b8 16 00 00 00       	mov    $0x16,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    
 34f:	90                   	nop

00000350 <printint>:
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	56                   	push   %esi
 355:	53                   	push   %ebx
 356:	83 ec 3c             	sub    $0x3c,%esp
 359:	89 45 c0             	mov    %eax,-0x40(%ebp)
 35c:	89 cb                	mov    %ecx,%ebx
 35e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 361:	85 c9                	test   %ecx,%ecx
 363:	74 04                	je     369 <printint+0x19>
 365:	85 d2                	test   %edx,%edx
 367:	78 6b                	js     3d4 <printint+0x84>
 369:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 36c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 373:	31 c9                	xor    %ecx,%ecx
 375:	8d 75 d7             	lea    -0x29(%ebp),%esi
 378:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 37b:	31 d2                	xor    %edx,%edx
 37d:	f7 f3                	div    %ebx
 37f:	89 cf                	mov    %ecx,%edi
 381:	8d 49 01             	lea    0x1(%ecx),%ecx
 384:	8a 92 70 07 00 00    	mov    0x770(%edx),%dl
 38a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 38e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 391:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 394:	39 da                	cmp    %ebx,%edx
 396:	73 e0                	jae    378 <printint+0x28>
 398:	8b 55 08             	mov    0x8(%ebp),%edx
 39b:	85 d2                	test   %edx,%edx
 39d:	74 07                	je     3a6 <printint+0x56>
 39f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3a4:	89 cf                	mov    %ecx,%edi
 3a6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3a9:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3ad:	8d 76 00             	lea    0x0(%esi),%esi
 3b0:	8a 07                	mov    (%edi),%al
 3b2:	88 45 d7             	mov    %al,-0x29(%ebp)
 3b5:	50                   	push   %eax
 3b6:	6a 01                	push   $0x1
 3b8:	56                   	push   %esi
 3b9:	ff 75 c0             	pushl  -0x40(%ebp)
 3bc:	e8 06 ff ff ff       	call   2c7 <write>
 3c1:	89 f8                	mov    %edi,%eax
 3c3:	4f                   	dec    %edi
 3c4:	83 c4 10             	add    $0x10,%esp
 3c7:	39 d8                	cmp    %ebx,%eax
 3c9:	75 e5                	jne    3b0 <printint+0x60>
 3cb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3ce:	5b                   	pop    %ebx
 3cf:	5e                   	pop    %esi
 3d0:	5f                   	pop    %edi
 3d1:	5d                   	pop    %ebp
 3d2:	c3                   	ret    
 3d3:	90                   	nop
 3d4:	f7 da                	neg    %edx
 3d6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3d9:	eb 98                	jmp    373 <printint+0x23>
 3db:	90                   	nop

000003dc <printf>:
 3dc:	55                   	push   %ebp
 3dd:	89 e5                	mov    %esp,%ebp
 3df:	57                   	push   %edi
 3e0:	56                   	push   %esi
 3e1:	53                   	push   %ebx
 3e2:	83 ec 2c             	sub    $0x2c,%esp
 3e5:	8b 75 08             	mov    0x8(%ebp),%esi
 3e8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3eb:	8a 13                	mov    (%ebx),%dl
 3ed:	84 d2                	test   %dl,%dl
 3ef:	74 5c                	je     44d <printf+0x71>
 3f1:	43                   	inc    %ebx
 3f2:	8d 45 10             	lea    0x10(%ebp),%eax
 3f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3f8:	31 ff                	xor    %edi,%edi
 3fa:	eb 20                	jmp    41c <printf+0x40>
 3fc:	83 f8 25             	cmp    $0x25,%eax
 3ff:	74 3f                	je     440 <printf+0x64>
 401:	88 55 e7             	mov    %dl,-0x19(%ebp)
 404:	50                   	push   %eax
 405:	6a 01                	push   $0x1
 407:	8d 45 e7             	lea    -0x19(%ebp),%eax
 40a:	50                   	push   %eax
 40b:	56                   	push   %esi
 40c:	e8 b6 fe ff ff       	call   2c7 <write>
 411:	83 c4 10             	add    $0x10,%esp
 414:	43                   	inc    %ebx
 415:	8a 53 ff             	mov    -0x1(%ebx),%dl
 418:	84 d2                	test   %dl,%dl
 41a:	74 31                	je     44d <printf+0x71>
 41c:	0f b6 c2             	movzbl %dl,%eax
 41f:	85 ff                	test   %edi,%edi
 421:	74 d9                	je     3fc <printf+0x20>
 423:	83 ff 25             	cmp    $0x25,%edi
 426:	75 ec                	jne    414 <printf+0x38>
 428:	83 f8 25             	cmp    $0x25,%eax
 42b:	0f 84 03 01 00 00    	je     534 <printf+0x158>
 431:	83 e8 63             	sub    $0x63,%eax
 434:	83 f8 15             	cmp    $0x15,%eax
 437:	77 1f                	ja     458 <printf+0x7c>
 439:	ff 24 85 18 07 00 00 	jmp    *0x718(,%eax,4)
 440:	bf 25 00 00 00       	mov    $0x25,%edi
 445:	43                   	inc    %ebx
 446:	8a 53 ff             	mov    -0x1(%ebx),%dl
 449:	84 d2                	test   %dl,%dl
 44b:	75 cf                	jne    41c <printf+0x40>
 44d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 450:	5b                   	pop    %ebx
 451:	5e                   	pop    %esi
 452:	5f                   	pop    %edi
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    
 455:	8d 76 00             	lea    0x0(%esi),%esi
 458:	88 55 d0             	mov    %dl,-0x30(%ebp)
 45b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 45f:	50                   	push   %eax
 460:	6a 01                	push   $0x1
 462:	8d 7d e7             	lea    -0x19(%ebp),%edi
 465:	57                   	push   %edi
 466:	56                   	push   %esi
 467:	e8 5b fe ff ff       	call   2c7 <write>
 46c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 46f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 472:	83 c4 0c             	add    $0xc,%esp
 475:	6a 01                	push   $0x1
 477:	57                   	push   %edi
 478:	56                   	push   %esi
 479:	e8 49 fe ff ff       	call   2c7 <write>
 47e:	83 c4 10             	add    $0x10,%esp
 481:	31 ff                	xor    %edi,%edi
 483:	eb 8f                	jmp    414 <printf+0x38>
 485:	8d 76 00             	lea    0x0(%esi),%esi
 488:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 48b:	8b 17                	mov    (%edi),%edx
 48d:	83 ec 0c             	sub    $0xc,%esp
 490:	6a 00                	push   $0x0
 492:	b9 10 00 00 00       	mov    $0x10,%ecx
 497:	89 f0                	mov    %esi,%eax
 499:	e8 b2 fe ff ff       	call   350 <printint>
 49e:	83 c7 04             	add    $0x4,%edi
 4a1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4a4:	83 c4 10             	add    $0x10,%esp
 4a7:	31 ff                	xor    %edi,%edi
 4a9:	e9 66 ff ff ff       	jmp    414 <printf+0x38>
 4ae:	66 90                	xchg   %ax,%ax
 4b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4b3:	8b 10                	mov    (%eax),%edx
 4b5:	83 c0 04             	add    $0x4,%eax
 4b8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4bb:	85 d2                	test   %edx,%edx
 4bd:	0f 84 81 00 00 00    	je     544 <printf+0x168>
 4c3:	8a 02                	mov    (%edx),%al
 4c5:	84 c0                	test   %al,%al
 4c7:	0f 84 80 00 00 00    	je     54d <printf+0x171>
 4cd:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4d0:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4d3:	89 d3                	mov    %edx,%ebx
 4d5:	8d 76 00             	lea    0x0(%esi),%esi
 4d8:	88 45 e7             	mov    %al,-0x19(%ebp)
 4db:	50                   	push   %eax
 4dc:	6a 01                	push   $0x1
 4de:	57                   	push   %edi
 4df:	56                   	push   %esi
 4e0:	e8 e2 fd ff ff       	call   2c7 <write>
 4e5:	43                   	inc    %ebx
 4e6:	8a 03                	mov    (%ebx),%al
 4e8:	83 c4 10             	add    $0x10,%esp
 4eb:	84 c0                	test   %al,%al
 4ed:	75 e9                	jne    4d8 <printf+0xfc>
 4ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4f2:	31 ff                	xor    %edi,%edi
 4f4:	e9 1b ff ff ff       	jmp    414 <printf+0x38>
 4f9:	8d 76 00             	lea    0x0(%esi),%esi
 4fc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4ff:	8b 17                	mov    (%edi),%edx
 501:	83 ec 0c             	sub    $0xc,%esp
 504:	6a 01                	push   $0x1
 506:	b9 0a 00 00 00       	mov    $0xa,%ecx
 50b:	eb 8a                	jmp    497 <printf+0xbb>
 50d:	8d 76 00             	lea    0x0(%esi),%esi
 510:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 513:	8b 00                	mov    (%eax),%eax
 515:	88 45 e7             	mov    %al,-0x19(%ebp)
 518:	51                   	push   %ecx
 519:	6a 01                	push   $0x1
 51b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 51e:	57                   	push   %edi
 51f:	56                   	push   %esi
 520:	e8 a2 fd ff ff       	call   2c7 <write>
 525:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 529:	83 c4 10             	add    $0x10,%esp
 52c:	31 ff                	xor    %edi,%edi
 52e:	e9 e1 fe ff ff       	jmp    414 <printf+0x38>
 533:	90                   	nop
 534:	88 55 e7             	mov    %dl,-0x19(%ebp)
 537:	52                   	push   %edx
 538:	6a 01                	push   $0x1
 53a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 53d:	e9 35 ff ff ff       	jmp    477 <printf+0x9b>
 542:	66 90                	xchg   %ax,%ax
 544:	b0 28                	mov    $0x28,%al
 546:	ba 10 07 00 00       	mov    $0x710,%edx
 54b:	eb 80                	jmp    4cd <printf+0xf1>
 54d:	31 ff                	xor    %edi,%edi
 54f:	e9 c0 fe ff ff       	jmp    414 <printf+0x38>

00000554 <free>:
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 55d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 560:	a1 8c 07 00 00       	mov    0x78c,%eax
 565:	8d 76 00             	lea    0x0(%esi),%esi
 568:	89 c2                	mov    %eax,%edx
 56a:	8b 00                	mov    (%eax),%eax
 56c:	39 ca                	cmp    %ecx,%edx
 56e:	73 2c                	jae    59c <free+0x48>
 570:	39 c1                	cmp    %eax,%ecx
 572:	72 04                	jb     578 <free+0x24>
 574:	39 c2                	cmp    %eax,%edx
 576:	72 f0                	jb     568 <free+0x14>
 578:	8b 73 fc             	mov    -0x4(%ebx),%esi
 57b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 57e:	39 f8                	cmp    %edi,%eax
 580:	74 2c                	je     5ae <free+0x5a>
 582:	89 43 f8             	mov    %eax,-0x8(%ebx)
 585:	8b 42 04             	mov    0x4(%edx),%eax
 588:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 58b:	39 f1                	cmp    %esi,%ecx
 58d:	74 36                	je     5c5 <free+0x71>
 58f:	89 0a                	mov    %ecx,(%edx)
 591:	89 15 8c 07 00 00    	mov    %edx,0x78c
 597:	5b                   	pop    %ebx
 598:	5e                   	pop    %esi
 599:	5f                   	pop    %edi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    
 59c:	39 c2                	cmp    %eax,%edx
 59e:	72 c8                	jb     568 <free+0x14>
 5a0:	39 c1                	cmp    %eax,%ecx
 5a2:	73 c4                	jae    568 <free+0x14>
 5a4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5a7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5aa:	39 f8                	cmp    %edi,%eax
 5ac:	75 d4                	jne    582 <free+0x2e>
 5ae:	03 70 04             	add    0x4(%eax),%esi
 5b1:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5b4:	8b 02                	mov    (%edx),%eax
 5b6:	8b 00                	mov    (%eax),%eax
 5b8:	89 43 f8             	mov    %eax,-0x8(%ebx)
 5bb:	8b 42 04             	mov    0x4(%edx),%eax
 5be:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5c1:	39 f1                	cmp    %esi,%ecx
 5c3:	75 ca                	jne    58f <free+0x3b>
 5c5:	03 43 fc             	add    -0x4(%ebx),%eax
 5c8:	89 42 04             	mov    %eax,0x4(%edx)
 5cb:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 5ce:	89 0a                	mov    %ecx,(%edx)
 5d0:	89 15 8c 07 00 00    	mov    %edx,0x78c
 5d6:	5b                   	pop    %ebx
 5d7:	5e                   	pop    %esi
 5d8:	5f                   	pop    %edi
 5d9:	5d                   	pop    %ebp
 5da:	c3                   	ret    
 5db:	90                   	nop

000005dc <malloc>:
 5dc:	55                   	push   %ebp
 5dd:	89 e5                	mov    %esp,%ebp
 5df:	57                   	push   %edi
 5e0:	56                   	push   %esi
 5e1:	53                   	push   %ebx
 5e2:	83 ec 0c             	sub    $0xc,%esp
 5e5:	8b 45 08             	mov    0x8(%ebp),%eax
 5e8:	8d 78 07             	lea    0x7(%eax),%edi
 5eb:	c1 ef 03             	shr    $0x3,%edi
 5ee:	47                   	inc    %edi
 5ef:	8b 15 8c 07 00 00    	mov    0x78c,%edx
 5f5:	85 d2                	test   %edx,%edx
 5f7:	0f 84 93 00 00 00    	je     690 <malloc+0xb4>
 5fd:	8b 02                	mov    (%edx),%eax
 5ff:	8b 48 04             	mov    0x4(%eax),%ecx
 602:	39 f9                	cmp    %edi,%ecx
 604:	73 62                	jae    668 <malloc+0x8c>
 606:	89 fb                	mov    %edi,%ebx
 608:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 60e:	72 78                	jb     688 <malloc+0xac>
 610:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 617:	eb 0e                	jmp    627 <malloc+0x4b>
 619:	8d 76 00             	lea    0x0(%esi),%esi
 61c:	89 c2                	mov    %eax,%edx
 61e:	8b 02                	mov    (%edx),%eax
 620:	8b 48 04             	mov    0x4(%eax),%ecx
 623:	39 f9                	cmp    %edi,%ecx
 625:	73 41                	jae    668 <malloc+0x8c>
 627:	39 05 8c 07 00 00    	cmp    %eax,0x78c
 62d:	75 ed                	jne    61c <malloc+0x40>
 62f:	83 ec 0c             	sub    $0xc,%esp
 632:	56                   	push   %esi
 633:	e8 f7 fc ff ff       	call   32f <sbrk>
 638:	83 c4 10             	add    $0x10,%esp
 63b:	83 f8 ff             	cmp    $0xffffffff,%eax
 63e:	74 1c                	je     65c <malloc+0x80>
 640:	89 58 04             	mov    %ebx,0x4(%eax)
 643:	83 ec 0c             	sub    $0xc,%esp
 646:	83 c0 08             	add    $0x8,%eax
 649:	50                   	push   %eax
 64a:	e8 05 ff ff ff       	call   554 <free>
 64f:	8b 15 8c 07 00 00    	mov    0x78c,%edx
 655:	83 c4 10             	add    $0x10,%esp
 658:	85 d2                	test   %edx,%edx
 65a:	75 c2                	jne    61e <malloc+0x42>
 65c:	31 c0                	xor    %eax,%eax
 65e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 661:	5b                   	pop    %ebx
 662:	5e                   	pop    %esi
 663:	5f                   	pop    %edi
 664:	5d                   	pop    %ebp
 665:	c3                   	ret    
 666:	66 90                	xchg   %ax,%ax
 668:	39 cf                	cmp    %ecx,%edi
 66a:	74 4c                	je     6b8 <malloc+0xdc>
 66c:	29 f9                	sub    %edi,%ecx
 66e:	89 48 04             	mov    %ecx,0x4(%eax)
 671:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 674:	89 78 04             	mov    %edi,0x4(%eax)
 677:	89 15 8c 07 00 00    	mov    %edx,0x78c
 67d:	83 c0 08             	add    $0x8,%eax
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
 683:	5b                   	pop    %ebx
 684:	5e                   	pop    %esi
 685:	5f                   	pop    %edi
 686:	5d                   	pop    %ebp
 687:	c3                   	ret    
 688:	bb 00 10 00 00       	mov    $0x1000,%ebx
 68d:	eb 81                	jmp    610 <malloc+0x34>
 68f:	90                   	nop
 690:	c7 05 8c 07 00 00 90 	movl   $0x790,0x78c
 697:	07 00 00 
 69a:	c7 05 90 07 00 00 90 	movl   $0x790,0x790
 6a1:	07 00 00 
 6a4:	c7 05 94 07 00 00 00 	movl   $0x0,0x794
 6ab:	00 00 00 
 6ae:	b8 90 07 00 00       	mov    $0x790,%eax
 6b3:	e9 4e ff ff ff       	jmp    606 <malloc+0x2a>
 6b8:	8b 08                	mov    (%eax),%ecx
 6ba:	89 0a                	mov    %ecx,(%edx)
 6bc:	eb b9                	jmp    677 <malloc+0x9b>
