
_wc:     file format elf32-i386


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
  11:	83 ec 18             	sub    $0x18,%esp
  14:	8b 01                	mov    (%ecx),%eax
  16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  19:	8b 59 04             	mov    0x4(%ecx),%ebx
  1c:	48                   	dec    %eax
  1d:	7e 5a                	jle    79 <main+0x79>
  1f:	83 c3 04             	add    $0x4,%ebx
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	eb 22                	jmp    4b <main+0x4b>
  29:	8d 76 00             	lea    0x0(%esi),%esi
  2c:	83 ec 08             	sub    $0x8,%esp
  2f:	ff 33                	pushl  (%ebx)
  31:	50                   	push   %eax
  32:	e8 55 00 00 00       	call   8c <wc>
  37:	89 3c 24             	mov    %edi,(%esp)
  3a:	e8 f8 02 00 00       	call   337 <close>
  3f:	46                   	inc    %esi
  40:	83 c3 04             	add    $0x4,%ebx
  43:	83 c4 10             	add    $0x10,%esp
  46:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  49:	74 29                	je     74 <main+0x74>
  4b:	83 ec 08             	sub    $0x8,%esp
  4e:	6a 00                	push   $0x0
  50:	ff 33                	pushl  (%ebx)
  52:	e8 f8 02 00 00       	call   34f <open>
  57:	89 c7                	mov    %eax,%edi
  59:	83 c4 10             	add    $0x10,%esp
  5c:	85 c0                	test   %eax,%eax
  5e:	79 cc                	jns    2c <main+0x2c>
  60:	50                   	push   %eax
  61:	ff 33                	pushl  (%ebx)
  63:	68 4b 07 00 00       	push   $0x74b
  68:	6a 01                	push   $0x1
  6a:	e8 d5 03 00 00       	call   444 <printf>
  6f:	e8 9b 02 00 00       	call   30f <exit>
  74:	e8 96 02 00 00       	call   30f <exit>
  79:	52                   	push   %edx
  7a:	52                   	push   %edx
  7b:	68 3d 07 00 00       	push   $0x73d
  80:	6a 00                	push   $0x0
  82:	e8 05 00 00 00       	call   8c <wc>
  87:	e8 83 02 00 00       	call   30f <exit>

0000008c <wc>:
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	57                   	push   %edi
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	83 ec 1c             	sub    $0x1c,%esp
  95:	31 db                	xor    %ebx,%ebx
  97:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  9e:	31 c9                	xor    %ecx,%ecx
  a0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  a7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
  aa:	66 90                	xchg   %ax,%ax
  ac:	52                   	push   %edx
  ad:	68 00 02 00 00       	push   $0x200
  b2:	68 e0 07 00 00       	push   $0x7e0
  b7:	ff 75 08             	pushl  0x8(%ebp)
  ba:	e8 68 02 00 00       	call   327 <read>
  bf:	89 c7                	mov    %eax,%edi
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	85 c0                	test   %eax,%eax
  c6:	7e 48                	jle    110 <wc+0x84>
  c8:	31 f6                	xor    %esi,%esi
  ca:	eb 07                	jmp    d3 <wc+0x47>
  cc:	31 db                	xor    %ebx,%ebx
  ce:	46                   	inc    %esi
  cf:	39 f7                	cmp    %esi,%edi
  d1:	74 35                	je     108 <wc+0x7c>
  d3:	0f be 86 e0 07 00 00 	movsbl 0x7e0(%esi),%eax
  da:	3c 0a                	cmp    $0xa,%al
  dc:	75 03                	jne    e1 <wc+0x55>
  de:	ff 45 e4             	incl   -0x1c(%ebp)
  e1:	83 ec 08             	sub    $0x8,%esp
  e4:	50                   	push   %eax
  e5:	68 28 07 00 00       	push   $0x728
  ea:	e8 01 01 00 00       	call   1f0 <strchr>
  ef:	83 c4 10             	add    $0x10,%esp
  f2:	85 c0                	test   %eax,%eax
  f4:	75 d6                	jne    cc <wc+0x40>
  f6:	85 db                	test   %ebx,%ebx
  f8:	75 d4                	jne    ce <wc+0x42>
  fa:	ff 45 e0             	incl   -0x20(%ebp)
  fd:	bb 01 00 00 00       	mov    $0x1,%ebx
 102:	46                   	inc    %esi
 103:	39 f7                	cmp    %esi,%edi
 105:	75 cc                	jne    d3 <wc+0x47>
 107:	90                   	nop
 108:	01 7d dc             	add    %edi,-0x24(%ebp)
 10b:	eb 9f                	jmp    ac <wc+0x20>
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 113:	75 24                	jne    139 <wc+0xad>
 115:	83 ec 08             	sub    $0x8,%esp
 118:	ff 75 0c             	pushl  0xc(%ebp)
 11b:	ff 75 dc             	pushl  -0x24(%ebp)
 11e:	51                   	push   %ecx
 11f:	ff 75 e4             	pushl  -0x1c(%ebp)
 122:	68 3e 07 00 00       	push   $0x73e
 127:	6a 01                	push   $0x1
 129:	e8 16 03 00 00       	call   444 <printf>
 12e:	83 c4 20             	add    $0x20,%esp
 131:	8d 65 f4             	lea    -0xc(%ebp),%esp
 134:	5b                   	pop    %ebx
 135:	5e                   	pop    %esi
 136:	5f                   	pop    %edi
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	50                   	push   %eax
 13a:	50                   	push   %eax
 13b:	68 2e 07 00 00       	push   $0x72e
 140:	6a 01                	push   $0x1
 142:	e8 fd 02 00 00       	call   444 <printf>
 147:	e8 c3 01 00 00       	call   30f <exit>

0000014c <strcpy>:
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
 14f:	53                   	push   %ebx
 150:	8b 4d 08             	mov    0x8(%ebp),%ecx
 153:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 156:	31 c0                	xor    %eax,%eax
 158:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 15b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 15e:	40                   	inc    %eax
 15f:	84 d2                	test   %dl,%dl
 161:	75 f5                	jne    158 <strcpy+0xc>
 163:	89 c8                	mov    %ecx,%eax
 165:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 168:	c9                   	leave  
 169:	c3                   	ret    
 16a:	66 90                	xchg   %ax,%ax

0000016c <strcmp>:
 16c:	55                   	push   %ebp
 16d:	89 e5                	mov    %esp,%ebp
 16f:	53                   	push   %ebx
 170:	8b 55 08             	mov    0x8(%ebp),%edx
 173:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 176:	0f b6 02             	movzbl (%edx),%eax
 179:	84 c0                	test   %al,%al
 17b:	75 10                	jne    18d <strcmp+0x21>
 17d:	eb 2a                	jmp    1a9 <strcmp+0x3d>
 17f:	90                   	nop
 180:	42                   	inc    %edx
 181:	8d 4b 01             	lea    0x1(%ebx),%ecx
 184:	0f b6 02             	movzbl (%edx),%eax
 187:	84 c0                	test   %al,%al
 189:	74 11                	je     19c <strcmp+0x30>
 18b:	89 cb                	mov    %ecx,%ebx
 18d:	0f b6 0b             	movzbl (%ebx),%ecx
 190:	38 c1                	cmp    %al,%cl
 192:	74 ec                	je     180 <strcmp+0x14>
 194:	29 c8                	sub    %ecx,%eax
 196:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 199:	c9                   	leave  
 19a:	c3                   	ret    
 19b:	90                   	nop
 19c:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	29 c8                	sub    %ecx,%eax
 1a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a7:	c9                   	leave  
 1a8:	c3                   	ret    
 1a9:	0f b6 0b             	movzbl (%ebx),%ecx
 1ac:	31 c0                	xor    %eax,%eax
 1ae:	eb e4                	jmp    194 <strcmp+0x28>

000001b0 <strlen>:
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	40                   	inc    %eax
 1c1:	89 c1                	mov    %eax,%ecx
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	75 f7                	jne    1c0 <strlen+0x10>
 1c9:	89 c8                	mov    %ecx,%eax
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	31 c9                	xor    %ecx,%ecx
 1d2:	89 c8                	mov    %ecx,%eax
 1d4:	5d                   	pop    %ebp
 1d5:	c3                   	ret    
 1d6:	66 90                	xchg   %ax,%ax

000001d8 <memset>:
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	57                   	push   %edi
 1dc:	8b 7d 08             	mov    0x8(%ebp),%edi
 1df:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e5:	fc                   	cld    
 1e6:	f3 aa                	rep stos %al,%es:(%edi)
 1e8:	8b 45 08             	mov    0x8(%ebp),%eax
 1eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1ee:	c9                   	leave  
 1ef:	c3                   	ret    

000001f0 <strchr>:
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1f9:	8a 10                	mov    (%eax),%dl
 1fb:	84 d2                	test   %dl,%dl
 1fd:	75 0c                	jne    20b <strchr+0x1b>
 1ff:	eb 13                	jmp    214 <strchr+0x24>
 201:	8d 76 00             	lea    0x0(%esi),%esi
 204:	40                   	inc    %eax
 205:	8a 10                	mov    (%eax),%dl
 207:	84 d2                	test   %dl,%dl
 209:	74 09                	je     214 <strchr+0x24>
 20b:	38 d1                	cmp    %dl,%cl
 20d:	75 f5                	jne    204 <strchr+0x14>
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	8d 76 00             	lea    0x0(%esi),%esi
 214:	31 c0                	xor    %eax,%eax
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    

00000218 <gets>:
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	57                   	push   %edi
 21c:	56                   	push   %esi
 21d:	53                   	push   %ebx
 21e:	83 ec 1c             	sub    $0x1c,%esp
 221:	31 db                	xor    %ebx,%ebx
 223:	8d 75 e7             	lea    -0x19(%ebp),%esi
 226:	eb 24                	jmp    24c <gets+0x34>
 228:	50                   	push   %eax
 229:	6a 01                	push   $0x1
 22b:	56                   	push   %esi
 22c:	6a 00                	push   $0x0
 22e:	e8 f4 00 00 00       	call   327 <read>
 233:	83 c4 10             	add    $0x10,%esp
 236:	85 c0                	test   %eax,%eax
 238:	7e 1a                	jle    254 <gets+0x3c>
 23a:	8a 45 e7             	mov    -0x19(%ebp),%al
 23d:	8b 55 08             	mov    0x8(%ebp),%edx
 240:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 244:	3c 0a                	cmp    $0xa,%al
 246:	74 0e                	je     256 <gets+0x3e>
 248:	3c 0d                	cmp    $0xd,%al
 24a:	74 0a                	je     256 <gets+0x3e>
 24c:	89 df                	mov    %ebx,%edi
 24e:	43                   	inc    %ebx
 24f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 252:	7c d4                	jl     228 <gets+0x10>
 254:	89 fb                	mov    %edi,%ebx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 25d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 260:	5b                   	pop    %ebx
 261:	5e                   	pop    %esi
 262:	5f                   	pop    %edi
 263:	5d                   	pop    %ebp
 264:	c3                   	ret    
 265:	8d 76 00             	lea    0x0(%esi),%esi

00000268 <stat>:
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	56                   	push   %esi
 26c:	53                   	push   %ebx
 26d:	83 ec 08             	sub    $0x8,%esp
 270:	6a 00                	push   $0x0
 272:	ff 75 08             	pushl  0x8(%ebp)
 275:	e8 d5 00 00 00       	call   34f <open>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	85 c0                	test   %eax,%eax
 27f:	78 27                	js     2a8 <stat+0x40>
 281:	89 c3                	mov    %eax,%ebx
 283:	83 ec 08             	sub    $0x8,%esp
 286:	ff 75 0c             	pushl  0xc(%ebp)
 289:	50                   	push   %eax
 28a:	e8 d8 00 00 00       	call   367 <fstat>
 28f:	89 c6                	mov    %eax,%esi
 291:	89 1c 24             	mov    %ebx,(%esp)
 294:	e8 9e 00 00 00       	call   337 <close>
 299:	83 c4 10             	add    $0x10,%esp
 29c:	89 f0                	mov    %esi,%eax
 29e:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a1:	5b                   	pop    %ebx
 2a2:	5e                   	pop    %esi
 2a3:	5d                   	pop    %ebp
 2a4:	c3                   	ret    
 2a5:	8d 76 00             	lea    0x0(%esi),%esi
 2a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2ad:	eb ed                	jmp    29c <stat+0x34>
 2af:	90                   	nop

000002b0 <atoi>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	53                   	push   %ebx
 2b4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2b7:	0f be 01             	movsbl (%ecx),%eax
 2ba:	8d 50 d0             	lea    -0x30(%eax),%edx
 2bd:	80 fa 09             	cmp    $0x9,%dl
 2c0:	ba 00 00 00 00       	mov    $0x0,%edx
 2c5:	77 16                	ja     2dd <atoi+0x2d>
 2c7:	90                   	nop
 2c8:	41                   	inc    %ecx
 2c9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 2cc:	01 d2                	add    %edx,%edx
 2ce:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 2d2:	0f be 01             	movsbl (%ecx),%eax
 2d5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d8:	80 fb 09             	cmp    $0x9,%bl
 2db:	76 eb                	jbe    2c8 <atoi+0x18>
 2dd:	89 d0                	mov    %edx,%eax
 2df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e2:	c9                   	leave  
 2e3:	c3                   	ret    

000002e4 <memmove>:
 2e4:	55                   	push   %ebp
 2e5:	89 e5                	mov    %esp,%ebp
 2e7:	57                   	push   %edi
 2e8:	56                   	push   %esi
 2e9:	8b 55 08             	mov    0x8(%ebp),%edx
 2ec:	8b 75 0c             	mov    0xc(%ebp),%esi
 2ef:	8b 45 10             	mov    0x10(%ebp),%eax
 2f2:	85 c0                	test   %eax,%eax
 2f4:	7e 0b                	jle    301 <memmove+0x1d>
 2f6:	01 d0                	add    %edx,%eax
 2f8:	89 d7                	mov    %edx,%edi
 2fa:	66 90                	xchg   %ax,%ax
 2fc:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2fd:	39 f8                	cmp    %edi,%eax
 2ff:	75 fb                	jne    2fc <memmove+0x18>
 301:	89 d0                	mov    %edx,%eax
 303:	5e                   	pop    %esi
 304:	5f                   	pop    %edi
 305:	5d                   	pop    %ebp
 306:	c3                   	ret    

00000307 <fork>:
 307:	b8 01 00 00 00       	mov    $0x1,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <exit>:
 30f:	b8 02 00 00 00       	mov    $0x2,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <wait>:
 317:	b8 03 00 00 00       	mov    $0x3,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <pipe>:
 31f:	b8 04 00 00 00       	mov    $0x4,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <read>:
 327:	b8 05 00 00 00       	mov    $0x5,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <write>:
 32f:	b8 10 00 00 00       	mov    $0x10,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <close>:
 337:	b8 15 00 00 00       	mov    $0x15,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <kill>:
 33f:	b8 06 00 00 00       	mov    $0x6,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <exec>:
 347:	b8 07 00 00 00       	mov    $0x7,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <open>:
 34f:	b8 0f 00 00 00       	mov    $0xf,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <mknod>:
 357:	b8 11 00 00 00       	mov    $0x11,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <unlink>:
 35f:	b8 12 00 00 00       	mov    $0x12,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <fstat>:
 367:	b8 08 00 00 00       	mov    $0x8,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <link>:
 36f:	b8 13 00 00 00       	mov    $0x13,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <mkdir>:
 377:	b8 14 00 00 00       	mov    $0x14,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <chdir>:
 37f:	b8 09 00 00 00       	mov    $0x9,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <dup>:
 387:	b8 0a 00 00 00       	mov    $0xa,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <getpid>:
 38f:	b8 0b 00 00 00       	mov    $0xb,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <sbrk>:
 397:	b8 0c 00 00 00       	mov    $0xc,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <sleep>:
 39f:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <uptime>:
 3a7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <getreadcount>:
 3af:	b8 16 00 00 00       	mov    $0x16,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    
 3b7:	90                   	nop

000003b8 <printint>:
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	57                   	push   %edi
 3bc:	56                   	push   %esi
 3bd:	53                   	push   %ebx
 3be:	83 ec 3c             	sub    $0x3c,%esp
 3c1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 3c4:	89 cb                	mov    %ecx,%ebx
 3c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3c9:	85 c9                	test   %ecx,%ecx
 3cb:	74 04                	je     3d1 <printint+0x19>
 3cd:	85 d2                	test   %edx,%edx
 3cf:	78 6b                	js     43c <printint+0x84>
 3d1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3d4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 3db:	31 c9                	xor    %ecx,%ecx
 3dd:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3e0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3e3:	31 d2                	xor    %edx,%edx
 3e5:	f7 f3                	div    %ebx
 3e7:	89 cf                	mov    %ecx,%edi
 3e9:	8d 49 01             	lea    0x1(%ecx),%ecx
 3ec:	8a 92 c0 07 00 00    	mov    0x7c0(%edx),%dl
 3f2:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 3f6:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3f9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3fc:	39 da                	cmp    %ebx,%edx
 3fe:	73 e0                	jae    3e0 <printint+0x28>
 400:	8b 55 08             	mov    0x8(%ebp),%edx
 403:	85 d2                	test   %edx,%edx
 405:	74 07                	je     40e <printint+0x56>
 407:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 40c:	89 cf                	mov    %ecx,%edi
 40e:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 411:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 415:	8d 76 00             	lea    0x0(%esi),%esi
 418:	8a 07                	mov    (%edi),%al
 41a:	88 45 d7             	mov    %al,-0x29(%ebp)
 41d:	50                   	push   %eax
 41e:	6a 01                	push   $0x1
 420:	56                   	push   %esi
 421:	ff 75 c0             	pushl  -0x40(%ebp)
 424:	e8 06 ff ff ff       	call   32f <write>
 429:	89 f8                	mov    %edi,%eax
 42b:	4f                   	dec    %edi
 42c:	83 c4 10             	add    $0x10,%esp
 42f:	39 d8                	cmp    %ebx,%eax
 431:	75 e5                	jne    418 <printint+0x60>
 433:	8d 65 f4             	lea    -0xc(%ebp),%esp
 436:	5b                   	pop    %ebx
 437:	5e                   	pop    %esi
 438:	5f                   	pop    %edi
 439:	5d                   	pop    %ebp
 43a:	c3                   	ret    
 43b:	90                   	nop
 43c:	f7 da                	neg    %edx
 43e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 441:	eb 98                	jmp    3db <printint+0x23>
 443:	90                   	nop

00000444 <printf>:
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	57                   	push   %edi
 448:	56                   	push   %esi
 449:	53                   	push   %ebx
 44a:	83 ec 2c             	sub    $0x2c,%esp
 44d:	8b 75 08             	mov    0x8(%ebp),%esi
 450:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 453:	8a 13                	mov    (%ebx),%dl
 455:	84 d2                	test   %dl,%dl
 457:	74 5c                	je     4b5 <printf+0x71>
 459:	43                   	inc    %ebx
 45a:	8d 45 10             	lea    0x10(%ebp),%eax
 45d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 460:	31 ff                	xor    %edi,%edi
 462:	eb 20                	jmp    484 <printf+0x40>
 464:	83 f8 25             	cmp    $0x25,%eax
 467:	74 3f                	je     4a8 <printf+0x64>
 469:	88 55 e7             	mov    %dl,-0x19(%ebp)
 46c:	50                   	push   %eax
 46d:	6a 01                	push   $0x1
 46f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 472:	50                   	push   %eax
 473:	56                   	push   %esi
 474:	e8 b6 fe ff ff       	call   32f <write>
 479:	83 c4 10             	add    $0x10,%esp
 47c:	43                   	inc    %ebx
 47d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 480:	84 d2                	test   %dl,%dl
 482:	74 31                	je     4b5 <printf+0x71>
 484:	0f b6 c2             	movzbl %dl,%eax
 487:	85 ff                	test   %edi,%edi
 489:	74 d9                	je     464 <printf+0x20>
 48b:	83 ff 25             	cmp    $0x25,%edi
 48e:	75 ec                	jne    47c <printf+0x38>
 490:	83 f8 25             	cmp    $0x25,%eax
 493:	0f 84 03 01 00 00    	je     59c <printf+0x158>
 499:	83 e8 63             	sub    $0x63,%eax
 49c:	83 f8 15             	cmp    $0x15,%eax
 49f:	77 1f                	ja     4c0 <printf+0x7c>
 4a1:	ff 24 85 68 07 00 00 	jmp    *0x768(,%eax,4)
 4a8:	bf 25 00 00 00       	mov    $0x25,%edi
 4ad:	43                   	inc    %ebx
 4ae:	8a 53 ff             	mov    -0x1(%ebx),%dl
 4b1:	84 d2                	test   %dl,%dl
 4b3:	75 cf                	jne    484 <printf+0x40>
 4b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b8:	5b                   	pop    %ebx
 4b9:	5e                   	pop    %esi
 4ba:	5f                   	pop    %edi
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	88 55 d0             	mov    %dl,-0x30(%ebp)
 4c3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c7:	50                   	push   %eax
 4c8:	6a 01                	push   $0x1
 4ca:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4cd:	57                   	push   %edi
 4ce:	56                   	push   %esi
 4cf:	e8 5b fe ff ff       	call   32f <write>
 4d4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 4d7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4da:	83 c4 0c             	add    $0xc,%esp
 4dd:	6a 01                	push   $0x1
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	e8 49 fe ff ff       	call   32f <write>
 4e6:	83 c4 10             	add    $0x10,%esp
 4e9:	31 ff                	xor    %edi,%edi
 4eb:	eb 8f                	jmp    47c <printf+0x38>
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4f3:	8b 17                	mov    (%edi),%edx
 4f5:	83 ec 0c             	sub    $0xc,%esp
 4f8:	6a 00                	push   $0x0
 4fa:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ff:	89 f0                	mov    %esi,%eax
 501:	e8 b2 fe ff ff       	call   3b8 <printint>
 506:	83 c7 04             	add    $0x4,%edi
 509:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 50c:	83 c4 10             	add    $0x10,%esp
 50f:	31 ff                	xor    %edi,%edi
 511:	e9 66 ff ff ff       	jmp    47c <printf+0x38>
 516:	66 90                	xchg   %ax,%ax
 518:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 51b:	8b 10                	mov    (%eax),%edx
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 523:	85 d2                	test   %edx,%edx
 525:	0f 84 81 00 00 00    	je     5ac <printf+0x168>
 52b:	8a 02                	mov    (%edx),%al
 52d:	84 c0                	test   %al,%al
 52f:	0f 84 80 00 00 00    	je     5b5 <printf+0x171>
 535:	8d 7d e7             	lea    -0x19(%ebp),%edi
 538:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 53b:	89 d3                	mov    %edx,%ebx
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	88 45 e7             	mov    %al,-0x19(%ebp)
 543:	50                   	push   %eax
 544:	6a 01                	push   $0x1
 546:	57                   	push   %edi
 547:	56                   	push   %esi
 548:	e8 e2 fd ff ff       	call   32f <write>
 54d:	43                   	inc    %ebx
 54e:	8a 03                	mov    (%ebx),%al
 550:	83 c4 10             	add    $0x10,%esp
 553:	84 c0                	test   %al,%al
 555:	75 e9                	jne    540 <printf+0xfc>
 557:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 55a:	31 ff                	xor    %edi,%edi
 55c:	e9 1b ff ff ff       	jmp    47c <printf+0x38>
 561:	8d 76 00             	lea    0x0(%esi),%esi
 564:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 567:	8b 17                	mov    (%edi),%edx
 569:	83 ec 0c             	sub    $0xc,%esp
 56c:	6a 01                	push   $0x1
 56e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 573:	eb 8a                	jmp    4ff <printf+0xbb>
 575:	8d 76 00             	lea    0x0(%esi),%esi
 578:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 57b:	8b 00                	mov    (%eax),%eax
 57d:	88 45 e7             	mov    %al,-0x19(%ebp)
 580:	51                   	push   %ecx
 581:	6a 01                	push   $0x1
 583:	8d 7d e7             	lea    -0x19(%ebp),%edi
 586:	57                   	push   %edi
 587:	56                   	push   %esi
 588:	e8 a2 fd ff ff       	call   32f <write>
 58d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 591:	83 c4 10             	add    $0x10,%esp
 594:	31 ff                	xor    %edi,%edi
 596:	e9 e1 fe ff ff       	jmp    47c <printf+0x38>
 59b:	90                   	nop
 59c:	88 55 e7             	mov    %dl,-0x19(%ebp)
 59f:	52                   	push   %edx
 5a0:	6a 01                	push   $0x1
 5a2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5a5:	e9 35 ff ff ff       	jmp    4df <printf+0x9b>
 5aa:	66 90                	xchg   %ax,%ax
 5ac:	b0 28                	mov    $0x28,%al
 5ae:	ba 5f 07 00 00       	mov    $0x75f,%edx
 5b3:	eb 80                	jmp    535 <printf+0xf1>
 5b5:	31 ff                	xor    %edi,%edi
 5b7:	e9 c0 fe ff ff       	jmp    47c <printf+0x38>

000005bc <free>:
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	53                   	push   %ebx
 5c2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5c8:	a1 e0 09 00 00       	mov    0x9e0,%eax
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
 5d0:	89 c2                	mov    %eax,%edx
 5d2:	8b 00                	mov    (%eax),%eax
 5d4:	39 ca                	cmp    %ecx,%edx
 5d6:	73 2c                	jae    604 <free+0x48>
 5d8:	39 c1                	cmp    %eax,%ecx
 5da:	72 04                	jb     5e0 <free+0x24>
 5dc:	39 c2                	cmp    %eax,%edx
 5de:	72 f0                	jb     5d0 <free+0x14>
 5e0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5e6:	39 f8                	cmp    %edi,%eax
 5e8:	74 2c                	je     616 <free+0x5a>
 5ea:	89 43 f8             	mov    %eax,-0x8(%ebx)
 5ed:	8b 42 04             	mov    0x4(%edx),%eax
 5f0:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5f3:	39 f1                	cmp    %esi,%ecx
 5f5:	74 36                	je     62d <free+0x71>
 5f7:	89 0a                	mov    %ecx,(%edx)
 5f9:	89 15 e0 09 00 00    	mov    %edx,0x9e0
 5ff:	5b                   	pop    %ebx
 600:	5e                   	pop    %esi
 601:	5f                   	pop    %edi
 602:	5d                   	pop    %ebp
 603:	c3                   	ret    
 604:	39 c2                	cmp    %eax,%edx
 606:	72 c8                	jb     5d0 <free+0x14>
 608:	39 c1                	cmp    %eax,%ecx
 60a:	73 c4                	jae    5d0 <free+0x14>
 60c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 60f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 612:	39 f8                	cmp    %edi,%eax
 614:	75 d4                	jne    5ea <free+0x2e>
 616:	03 70 04             	add    0x4(%eax),%esi
 619:	89 73 fc             	mov    %esi,-0x4(%ebx)
 61c:	8b 02                	mov    (%edx),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	89 43 f8             	mov    %eax,-0x8(%ebx)
 623:	8b 42 04             	mov    0x4(%edx),%eax
 626:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 629:	39 f1                	cmp    %esi,%ecx
 62b:	75 ca                	jne    5f7 <free+0x3b>
 62d:	03 43 fc             	add    -0x4(%ebx),%eax
 630:	89 42 04             	mov    %eax,0x4(%edx)
 633:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 636:	89 0a                	mov    %ecx,(%edx)
 638:	89 15 e0 09 00 00    	mov    %edx,0x9e0
 63e:	5b                   	pop    %ebx
 63f:	5e                   	pop    %esi
 640:	5f                   	pop    %edi
 641:	5d                   	pop    %ebp
 642:	c3                   	ret    
 643:	90                   	nop

00000644 <malloc>:
 644:	55                   	push   %ebp
 645:	89 e5                	mov    %esp,%ebp
 647:	57                   	push   %edi
 648:	56                   	push   %esi
 649:	53                   	push   %ebx
 64a:	83 ec 0c             	sub    $0xc,%esp
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	8d 78 07             	lea    0x7(%eax),%edi
 653:	c1 ef 03             	shr    $0x3,%edi
 656:	47                   	inc    %edi
 657:	8b 15 e0 09 00 00    	mov    0x9e0,%edx
 65d:	85 d2                	test   %edx,%edx
 65f:	0f 84 93 00 00 00    	je     6f8 <malloc+0xb4>
 665:	8b 02                	mov    (%edx),%eax
 667:	8b 48 04             	mov    0x4(%eax),%ecx
 66a:	39 f9                	cmp    %edi,%ecx
 66c:	73 62                	jae    6d0 <malloc+0x8c>
 66e:	89 fb                	mov    %edi,%ebx
 670:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 676:	72 78                	jb     6f0 <malloc+0xac>
 678:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 67f:	eb 0e                	jmp    68f <malloc+0x4b>
 681:	8d 76 00             	lea    0x0(%esi),%esi
 684:	89 c2                	mov    %eax,%edx
 686:	8b 02                	mov    (%edx),%eax
 688:	8b 48 04             	mov    0x4(%eax),%ecx
 68b:	39 f9                	cmp    %edi,%ecx
 68d:	73 41                	jae    6d0 <malloc+0x8c>
 68f:	39 05 e0 09 00 00    	cmp    %eax,0x9e0
 695:	75 ed                	jne    684 <malloc+0x40>
 697:	83 ec 0c             	sub    $0xc,%esp
 69a:	56                   	push   %esi
 69b:	e8 f7 fc ff ff       	call   397 <sbrk>
 6a0:	83 c4 10             	add    $0x10,%esp
 6a3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6a6:	74 1c                	je     6c4 <malloc+0x80>
 6a8:	89 58 04             	mov    %ebx,0x4(%eax)
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	83 c0 08             	add    $0x8,%eax
 6b1:	50                   	push   %eax
 6b2:	e8 05 ff ff ff       	call   5bc <free>
 6b7:	8b 15 e0 09 00 00    	mov    0x9e0,%edx
 6bd:	83 c4 10             	add    $0x10,%esp
 6c0:	85 d2                	test   %edx,%edx
 6c2:	75 c2                	jne    686 <malloc+0x42>
 6c4:	31 c0                	xor    %eax,%eax
 6c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c9:	5b                   	pop    %ebx
 6ca:	5e                   	pop    %esi
 6cb:	5f                   	pop    %edi
 6cc:	5d                   	pop    %ebp
 6cd:	c3                   	ret    
 6ce:	66 90                	xchg   %ax,%ax
 6d0:	39 cf                	cmp    %ecx,%edi
 6d2:	74 4c                	je     720 <malloc+0xdc>
 6d4:	29 f9                	sub    %edi,%ecx
 6d6:	89 48 04             	mov    %ecx,0x4(%eax)
 6d9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6dc:	89 78 04             	mov    %edi,0x4(%eax)
 6df:	89 15 e0 09 00 00    	mov    %edx,0x9e0
 6e5:	83 c0 08             	add    $0x8,%eax
 6e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6eb:	5b                   	pop    %ebx
 6ec:	5e                   	pop    %esi
 6ed:	5f                   	pop    %edi
 6ee:	5d                   	pop    %ebp
 6ef:	c3                   	ret    
 6f0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f5:	eb 81                	jmp    678 <malloc+0x34>
 6f7:	90                   	nop
 6f8:	c7 05 e0 09 00 00 e4 	movl   $0x9e4,0x9e0
 6ff:	09 00 00 
 702:	c7 05 e4 09 00 00 e4 	movl   $0x9e4,0x9e4
 709:	09 00 00 
 70c:	c7 05 e8 09 00 00 00 	movl   $0x0,0x9e8
 713:	00 00 00 
 716:	b8 e4 09 00 00       	mov    $0x9e4,%eax
 71b:	e9 4e ff ff ff       	jmp    66e <malloc+0x2a>
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb b9                	jmp    6df <malloc+0x9b>
