
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 13                	je     2a <main+0x2a>
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 38 06 00 00       	push   $0x638
  1e:	6a 02                	push   $0x2
  20:	e8 2f 03 00 00       	call   354 <printf>
  25:	e8 f5 01 00 00       	call   21f <exit>
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	pushl  0x8(%ebx)
  2f:	ff 73 04             	pushl  0x4(%ebx)
  32:	e8 48 02 00 00       	call   27f <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
  3e:	e8 dc 01 00 00       	call   21f <exit>
  43:	ff 73 08             	pushl  0x8(%ebx)
  46:	ff 73 04             	pushl  0x4(%ebx)
  49:	68 4b 06 00 00       	push   $0x64b
  4e:	6a 02                	push   $0x2
  50:	e8 ff 02 00 00       	call   354 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax

0000005c <strcpy>:
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	53                   	push   %ebx
  60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  63:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  66:	31 c0                	xor    %eax,%eax
  68:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  6b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6e:	40                   	inc    %eax
  6f:	84 d2                	test   %dl,%dl
  71:	75 f5                	jne    68 <strcpy+0xc>
  73:	89 c8                	mov    %ecx,%eax
  75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  78:	c9                   	leave  
  79:	c3                   	ret    
  7a:	66 90                	xchg   %ax,%ax

0000007c <strcmp>:
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	53                   	push   %ebx
  80:	8b 55 08             	mov    0x8(%ebp),%edx
  83:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  86:	0f b6 02             	movzbl (%edx),%eax
  89:	84 c0                	test   %al,%al
  8b:	75 10                	jne    9d <strcmp+0x21>
  8d:	eb 2a                	jmp    b9 <strcmp+0x3d>
  8f:	90                   	nop
  90:	42                   	inc    %edx
  91:	8d 4b 01             	lea    0x1(%ebx),%ecx
  94:	0f b6 02             	movzbl (%edx),%eax
  97:	84 c0                	test   %al,%al
  99:	74 11                	je     ac <strcmp+0x30>
  9b:	89 cb                	mov    %ecx,%ebx
  9d:	0f b6 0b             	movzbl (%ebx),%ecx
  a0:	38 c1                	cmp    %al,%cl
  a2:	74 ec                	je     90 <strcmp+0x14>
  a4:	29 c8                	sub    %ecx,%eax
  a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  a9:	c9                   	leave  
  aa:	c3                   	ret    
  ab:	90                   	nop
  ac:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  b0:	31 c0                	xor    %eax,%eax
  b2:	29 c8                	sub    %ecx,%eax
  b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b7:	c9                   	leave  
  b8:	c3                   	ret    
  b9:	0f b6 0b             	movzbl (%ebx),%ecx
  bc:	31 c0                	xor    %eax,%eax
  be:	eb e4                	jmp    a4 <strcmp+0x28>

000000c0 <strlen>:
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	40                   	inc    %eax
  d1:	89 c1                	mov    %eax,%ecx
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	75 f7                	jne    d0 <strlen+0x10>
  d9:	89 c8                	mov    %ecx,%eax
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	31 c9                	xor    %ecx,%ecx
  e2:	89 c8                	mov    %ecx,%eax
  e4:	5d                   	pop    %ebp
  e5:	c3                   	ret    
  e6:	66 90                	xchg   %ax,%ax

000000e8 <memset>:
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  eb:	57                   	push   %edi
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  ef:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  f5:	fc                   	cld    
  f6:	f3 aa                	rep stos %al,%es:(%edi)
  f8:	8b 45 08             	mov    0x8(%ebp),%eax
  fb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  fe:	c9                   	leave  
  ff:	c3                   	ret    

00000100 <strchr>:
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	8a 4d 0c             	mov    0xc(%ebp),%cl
 109:	8a 10                	mov    (%eax),%dl
 10b:	84 d2                	test   %dl,%dl
 10d:	75 0c                	jne    11b <strchr+0x1b>
 10f:	eb 13                	jmp    124 <strchr+0x24>
 111:	8d 76 00             	lea    0x0(%esi),%esi
 114:	40                   	inc    %eax
 115:	8a 10                	mov    (%eax),%dl
 117:	84 d2                	test   %dl,%dl
 119:	74 09                	je     124 <strchr+0x24>
 11b:	38 d1                	cmp    %dl,%cl
 11d:	75 f5                	jne    114 <strchr+0x14>
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	8d 76 00             	lea    0x0(%esi),%esi
 124:	31 c0                	xor    %eax,%eax
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    

00000128 <gets>:
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	57                   	push   %edi
 12c:	56                   	push   %esi
 12d:	53                   	push   %ebx
 12e:	83 ec 1c             	sub    $0x1c,%esp
 131:	31 db                	xor    %ebx,%ebx
 133:	8d 75 e7             	lea    -0x19(%ebp),%esi
 136:	eb 24                	jmp    15c <gets+0x34>
 138:	50                   	push   %eax
 139:	6a 01                	push   $0x1
 13b:	56                   	push   %esi
 13c:	6a 00                	push   $0x0
 13e:	e8 f4 00 00 00       	call   237 <read>
 143:	83 c4 10             	add    $0x10,%esp
 146:	85 c0                	test   %eax,%eax
 148:	7e 1a                	jle    164 <gets+0x3c>
 14a:	8a 45 e7             	mov    -0x19(%ebp),%al
 14d:	8b 55 08             	mov    0x8(%ebp),%edx
 150:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 154:	3c 0a                	cmp    $0xa,%al
 156:	74 0e                	je     166 <gets+0x3e>
 158:	3c 0d                	cmp    $0xd,%al
 15a:	74 0a                	je     166 <gets+0x3e>
 15c:	89 df                	mov    %ebx,%edi
 15e:	43                   	inc    %ebx
 15f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 162:	7c d4                	jl     138 <gets+0x10>
 164:	89 fb                	mov    %edi,%ebx
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 16d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 170:	5b                   	pop    %ebx
 171:	5e                   	pop    %esi
 172:	5f                   	pop    %edi
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi

00000178 <stat>:
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	56                   	push   %esi
 17c:	53                   	push   %ebx
 17d:	83 ec 08             	sub    $0x8,%esp
 180:	6a 00                	push   $0x0
 182:	ff 75 08             	pushl  0x8(%ebp)
 185:	e8 d5 00 00 00       	call   25f <open>
 18a:	83 c4 10             	add    $0x10,%esp
 18d:	85 c0                	test   %eax,%eax
 18f:	78 27                	js     1b8 <stat+0x40>
 191:	89 c3                	mov    %eax,%ebx
 193:	83 ec 08             	sub    $0x8,%esp
 196:	ff 75 0c             	pushl  0xc(%ebp)
 199:	50                   	push   %eax
 19a:	e8 d8 00 00 00       	call   277 <fstat>
 19f:	89 c6                	mov    %eax,%esi
 1a1:	89 1c 24             	mov    %ebx,(%esp)
 1a4:	e8 9e 00 00 00       	call   247 <close>
 1a9:	83 c4 10             	add    $0x10,%esp
 1ac:	89 f0                	mov    %esi,%eax
 1ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b1:	5b                   	pop    %ebx
 1b2:	5e                   	pop    %esi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    
 1b5:	8d 76 00             	lea    0x0(%esi),%esi
 1b8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1bd:	eb ed                	jmp    1ac <stat+0x34>
 1bf:	90                   	nop

000001c0 <atoi>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	53                   	push   %ebx
 1c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c7:	0f be 01             	movsbl (%ecx),%eax
 1ca:	8d 50 d0             	lea    -0x30(%eax),%edx
 1cd:	80 fa 09             	cmp    $0x9,%dl
 1d0:	ba 00 00 00 00       	mov    $0x0,%edx
 1d5:	77 16                	ja     1ed <atoi+0x2d>
 1d7:	90                   	nop
 1d8:	41                   	inc    %ecx
 1d9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1dc:	01 d2                	add    %edx,%edx
 1de:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1e2:	0f be 01             	movsbl (%ecx),%eax
 1e5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e8:	80 fb 09             	cmp    $0x9,%bl
 1eb:	76 eb                	jbe    1d8 <atoi+0x18>
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <memmove>:
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	57                   	push   %edi
 1f8:	56                   	push   %esi
 1f9:	8b 55 08             	mov    0x8(%ebp),%edx
 1fc:	8b 75 0c             	mov    0xc(%ebp),%esi
 1ff:	8b 45 10             	mov    0x10(%ebp),%eax
 202:	85 c0                	test   %eax,%eax
 204:	7e 0b                	jle    211 <memmove+0x1d>
 206:	01 d0                	add    %edx,%eax
 208:	89 d7                	mov    %edx,%edi
 20a:	66 90                	xchg   %ax,%ax
 20c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 20d:	39 f8                	cmp    %edi,%eax
 20f:	75 fb                	jne    20c <memmove+0x18>
 211:	89 d0                	mov    %edx,%eax
 213:	5e                   	pop    %esi
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    

00000217 <fork>:
 217:	b8 01 00 00 00       	mov    $0x1,%eax
 21c:	cd 40                	int    $0x40
 21e:	c3                   	ret    

0000021f <exit>:
 21f:	b8 02 00 00 00       	mov    $0x2,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <wait>:
 227:	b8 03 00 00 00       	mov    $0x3,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <pipe>:
 22f:	b8 04 00 00 00       	mov    $0x4,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <read>:
 237:	b8 05 00 00 00       	mov    $0x5,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <write>:
 23f:	b8 10 00 00 00       	mov    $0x10,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <close>:
 247:	b8 15 00 00 00       	mov    $0x15,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <kill>:
 24f:	b8 06 00 00 00       	mov    $0x6,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <exec>:
 257:	b8 07 00 00 00       	mov    $0x7,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <open>:
 25f:	b8 0f 00 00 00       	mov    $0xf,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <mknod>:
 267:	b8 11 00 00 00       	mov    $0x11,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <unlink>:
 26f:	b8 12 00 00 00       	mov    $0x12,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <fstat>:
 277:	b8 08 00 00 00       	mov    $0x8,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <link>:
 27f:	b8 13 00 00 00       	mov    $0x13,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <mkdir>:
 287:	b8 14 00 00 00       	mov    $0x14,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <chdir>:
 28f:	b8 09 00 00 00       	mov    $0x9,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <dup>:
 297:	b8 0a 00 00 00       	mov    $0xa,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <getpid>:
 29f:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <sbrk>:
 2a7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <sleep>:
 2af:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <uptime>:
 2b7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <getreadcount>:
 2bf:	b8 16 00 00 00       	mov    $0x16,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    
 2c7:	90                   	nop

000002c8 <printint>:
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	57                   	push   %edi
 2cc:	56                   	push   %esi
 2cd:	53                   	push   %ebx
 2ce:	83 ec 3c             	sub    $0x3c,%esp
 2d1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2d4:	89 cb                	mov    %ecx,%ebx
 2d6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2d9:	85 c9                	test   %ecx,%ecx
 2db:	74 04                	je     2e1 <printint+0x19>
 2dd:	85 d2                	test   %edx,%edx
 2df:	78 6b                	js     34c <printint+0x84>
 2e1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2e4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2eb:	31 c9                	xor    %ecx,%ecx
 2ed:	8d 75 d7             	lea    -0x29(%ebp),%esi
 2f0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2f3:	31 d2                	xor    %edx,%edx
 2f5:	f7 f3                	div    %ebx
 2f7:	89 cf                	mov    %ecx,%edi
 2f9:	8d 49 01             	lea    0x1(%ecx),%ecx
 2fc:	8a 92 c0 06 00 00    	mov    0x6c0(%edx),%dl
 302:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 306:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 309:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 30c:	39 da                	cmp    %ebx,%edx
 30e:	73 e0                	jae    2f0 <printint+0x28>
 310:	8b 55 08             	mov    0x8(%ebp),%edx
 313:	85 d2                	test   %edx,%edx
 315:	74 07                	je     31e <printint+0x56>
 317:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 31c:	89 cf                	mov    %ecx,%edi
 31e:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 321:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 325:	8d 76 00             	lea    0x0(%esi),%esi
 328:	8a 07                	mov    (%edi),%al
 32a:	88 45 d7             	mov    %al,-0x29(%ebp)
 32d:	50                   	push   %eax
 32e:	6a 01                	push   $0x1
 330:	56                   	push   %esi
 331:	ff 75 c0             	pushl  -0x40(%ebp)
 334:	e8 06 ff ff ff       	call   23f <write>
 339:	89 f8                	mov    %edi,%eax
 33b:	4f                   	dec    %edi
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	39 d8                	cmp    %ebx,%eax
 341:	75 e5                	jne    328 <printint+0x60>
 343:	8d 65 f4             	lea    -0xc(%ebp),%esp
 346:	5b                   	pop    %ebx
 347:	5e                   	pop    %esi
 348:	5f                   	pop    %edi
 349:	5d                   	pop    %ebp
 34a:	c3                   	ret    
 34b:	90                   	nop
 34c:	f7 da                	neg    %edx
 34e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 351:	eb 98                	jmp    2eb <printint+0x23>
 353:	90                   	nop

00000354 <printf>:
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	56                   	push   %esi
 359:	53                   	push   %ebx
 35a:	83 ec 2c             	sub    $0x2c,%esp
 35d:	8b 75 08             	mov    0x8(%ebp),%esi
 360:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 363:	8a 13                	mov    (%ebx),%dl
 365:	84 d2                	test   %dl,%dl
 367:	74 5c                	je     3c5 <printf+0x71>
 369:	43                   	inc    %ebx
 36a:	8d 45 10             	lea    0x10(%ebp),%eax
 36d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 370:	31 ff                	xor    %edi,%edi
 372:	eb 20                	jmp    394 <printf+0x40>
 374:	83 f8 25             	cmp    $0x25,%eax
 377:	74 3f                	je     3b8 <printf+0x64>
 379:	88 55 e7             	mov    %dl,-0x19(%ebp)
 37c:	50                   	push   %eax
 37d:	6a 01                	push   $0x1
 37f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 382:	50                   	push   %eax
 383:	56                   	push   %esi
 384:	e8 b6 fe ff ff       	call   23f <write>
 389:	83 c4 10             	add    $0x10,%esp
 38c:	43                   	inc    %ebx
 38d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 390:	84 d2                	test   %dl,%dl
 392:	74 31                	je     3c5 <printf+0x71>
 394:	0f b6 c2             	movzbl %dl,%eax
 397:	85 ff                	test   %edi,%edi
 399:	74 d9                	je     374 <printf+0x20>
 39b:	83 ff 25             	cmp    $0x25,%edi
 39e:	75 ec                	jne    38c <printf+0x38>
 3a0:	83 f8 25             	cmp    $0x25,%eax
 3a3:	0f 84 03 01 00 00    	je     4ac <printf+0x158>
 3a9:	83 e8 63             	sub    $0x63,%eax
 3ac:	83 f8 15             	cmp    $0x15,%eax
 3af:	77 1f                	ja     3d0 <printf+0x7c>
 3b1:	ff 24 85 68 06 00 00 	jmp    *0x668(,%eax,4)
 3b8:	bf 25 00 00 00       	mov    $0x25,%edi
 3bd:	43                   	inc    %ebx
 3be:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3c1:	84 d2                	test   %dl,%dl
 3c3:	75 cf                	jne    394 <printf+0x40>
 3c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c8:	5b                   	pop    %ebx
 3c9:	5e                   	pop    %esi
 3ca:	5f                   	pop    %edi
 3cb:	5d                   	pop    %ebp
 3cc:	c3                   	ret    
 3cd:	8d 76 00             	lea    0x0(%esi),%esi
 3d0:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3d3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3d7:	50                   	push   %eax
 3d8:	6a 01                	push   $0x1
 3da:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3dd:	57                   	push   %edi
 3de:	56                   	push   %esi
 3df:	e8 5b fe ff ff       	call   23f <write>
 3e4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3e7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3ea:	83 c4 0c             	add    $0xc,%esp
 3ed:	6a 01                	push   $0x1
 3ef:	57                   	push   %edi
 3f0:	56                   	push   %esi
 3f1:	e8 49 fe ff ff       	call   23f <write>
 3f6:	83 c4 10             	add    $0x10,%esp
 3f9:	31 ff                	xor    %edi,%edi
 3fb:	eb 8f                	jmp    38c <printf+0x38>
 3fd:	8d 76 00             	lea    0x0(%esi),%esi
 400:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 403:	8b 17                	mov    (%edi),%edx
 405:	83 ec 0c             	sub    $0xc,%esp
 408:	6a 00                	push   $0x0
 40a:	b9 10 00 00 00       	mov    $0x10,%ecx
 40f:	89 f0                	mov    %esi,%eax
 411:	e8 b2 fe ff ff       	call   2c8 <printint>
 416:	83 c7 04             	add    $0x4,%edi
 419:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 41c:	83 c4 10             	add    $0x10,%esp
 41f:	31 ff                	xor    %edi,%edi
 421:	e9 66 ff ff ff       	jmp    38c <printf+0x38>
 426:	66 90                	xchg   %ax,%ax
 428:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 42b:	8b 10                	mov    (%eax),%edx
 42d:	83 c0 04             	add    $0x4,%eax
 430:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 433:	85 d2                	test   %edx,%edx
 435:	0f 84 81 00 00 00    	je     4bc <printf+0x168>
 43b:	8a 02                	mov    (%edx),%al
 43d:	84 c0                	test   %al,%al
 43f:	0f 84 80 00 00 00    	je     4c5 <printf+0x171>
 445:	8d 7d e7             	lea    -0x19(%ebp),%edi
 448:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 44b:	89 d3                	mov    %edx,%ebx
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	88 45 e7             	mov    %al,-0x19(%ebp)
 453:	50                   	push   %eax
 454:	6a 01                	push   $0x1
 456:	57                   	push   %edi
 457:	56                   	push   %esi
 458:	e8 e2 fd ff ff       	call   23f <write>
 45d:	43                   	inc    %ebx
 45e:	8a 03                	mov    (%ebx),%al
 460:	83 c4 10             	add    $0x10,%esp
 463:	84 c0                	test   %al,%al
 465:	75 e9                	jne    450 <printf+0xfc>
 467:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 46a:	31 ff                	xor    %edi,%edi
 46c:	e9 1b ff ff ff       	jmp    38c <printf+0x38>
 471:	8d 76 00             	lea    0x0(%esi),%esi
 474:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 477:	8b 17                	mov    (%edi),%edx
 479:	83 ec 0c             	sub    $0xc,%esp
 47c:	6a 01                	push   $0x1
 47e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 483:	eb 8a                	jmp    40f <printf+0xbb>
 485:	8d 76 00             	lea    0x0(%esi),%esi
 488:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 48b:	8b 00                	mov    (%eax),%eax
 48d:	88 45 e7             	mov    %al,-0x19(%ebp)
 490:	51                   	push   %ecx
 491:	6a 01                	push   $0x1
 493:	8d 7d e7             	lea    -0x19(%ebp),%edi
 496:	57                   	push   %edi
 497:	56                   	push   %esi
 498:	e8 a2 fd ff ff       	call   23f <write>
 49d:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4a1:	83 c4 10             	add    $0x10,%esp
 4a4:	31 ff                	xor    %edi,%edi
 4a6:	e9 e1 fe ff ff       	jmp    38c <printf+0x38>
 4ab:	90                   	nop
 4ac:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4af:	52                   	push   %edx
 4b0:	6a 01                	push   $0x1
 4b2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4b5:	e9 35 ff ff ff       	jmp    3ef <printf+0x9b>
 4ba:	66 90                	xchg   %ax,%ax
 4bc:	b0 28                	mov    $0x28,%al
 4be:	ba 5f 06 00 00       	mov    $0x65f,%edx
 4c3:	eb 80                	jmp    445 <printf+0xf1>
 4c5:	31 ff                	xor    %edi,%edi
 4c7:	e9 c0 fe ff ff       	jmp    38c <printf+0x38>

000004cc <free>:
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	57                   	push   %edi
 4d0:	56                   	push   %esi
 4d1:	53                   	push   %ebx
 4d2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4d5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4d8:	a1 d4 06 00 00       	mov    0x6d4,%eax
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
 4e0:	89 c2                	mov    %eax,%edx
 4e2:	8b 00                	mov    (%eax),%eax
 4e4:	39 ca                	cmp    %ecx,%edx
 4e6:	73 2c                	jae    514 <free+0x48>
 4e8:	39 c1                	cmp    %eax,%ecx
 4ea:	72 04                	jb     4f0 <free+0x24>
 4ec:	39 c2                	cmp    %eax,%edx
 4ee:	72 f0                	jb     4e0 <free+0x14>
 4f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4f6:	39 f8                	cmp    %edi,%eax
 4f8:	74 2c                	je     526 <free+0x5a>
 4fa:	89 43 f8             	mov    %eax,-0x8(%ebx)
 4fd:	8b 42 04             	mov    0x4(%edx),%eax
 500:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 503:	39 f1                	cmp    %esi,%ecx
 505:	74 36                	je     53d <free+0x71>
 507:	89 0a                	mov    %ecx,(%edx)
 509:	89 15 d4 06 00 00    	mov    %edx,0x6d4
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5f                   	pop    %edi
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	39 c2                	cmp    %eax,%edx
 516:	72 c8                	jb     4e0 <free+0x14>
 518:	39 c1                	cmp    %eax,%ecx
 51a:	73 c4                	jae    4e0 <free+0x14>
 51c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 51f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 522:	39 f8                	cmp    %edi,%eax
 524:	75 d4                	jne    4fa <free+0x2e>
 526:	03 70 04             	add    0x4(%eax),%esi
 529:	89 73 fc             	mov    %esi,-0x4(%ebx)
 52c:	8b 02                	mov    (%edx),%eax
 52e:	8b 00                	mov    (%eax),%eax
 530:	89 43 f8             	mov    %eax,-0x8(%ebx)
 533:	8b 42 04             	mov    0x4(%edx),%eax
 536:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 539:	39 f1                	cmp    %esi,%ecx
 53b:	75 ca                	jne    507 <free+0x3b>
 53d:	03 43 fc             	add    -0x4(%ebx),%eax
 540:	89 42 04             	mov    %eax,0x4(%edx)
 543:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 546:	89 0a                	mov    %ecx,(%edx)
 548:	89 15 d4 06 00 00    	mov    %edx,0x6d4
 54e:	5b                   	pop    %ebx
 54f:	5e                   	pop    %esi
 550:	5f                   	pop    %edi
 551:	5d                   	pop    %ebp
 552:	c3                   	ret    
 553:	90                   	nop

00000554 <malloc>:
 554:	55                   	push   %ebp
 555:	89 e5                	mov    %esp,%ebp
 557:	57                   	push   %edi
 558:	56                   	push   %esi
 559:	53                   	push   %ebx
 55a:	83 ec 0c             	sub    $0xc,%esp
 55d:	8b 45 08             	mov    0x8(%ebp),%eax
 560:	8d 78 07             	lea    0x7(%eax),%edi
 563:	c1 ef 03             	shr    $0x3,%edi
 566:	47                   	inc    %edi
 567:	8b 15 d4 06 00 00    	mov    0x6d4,%edx
 56d:	85 d2                	test   %edx,%edx
 56f:	0f 84 93 00 00 00    	je     608 <malloc+0xb4>
 575:	8b 02                	mov    (%edx),%eax
 577:	8b 48 04             	mov    0x4(%eax),%ecx
 57a:	39 f9                	cmp    %edi,%ecx
 57c:	73 62                	jae    5e0 <malloc+0x8c>
 57e:	89 fb                	mov    %edi,%ebx
 580:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 586:	72 78                	jb     600 <malloc+0xac>
 588:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 58f:	eb 0e                	jmp    59f <malloc+0x4b>
 591:	8d 76 00             	lea    0x0(%esi),%esi
 594:	89 c2                	mov    %eax,%edx
 596:	8b 02                	mov    (%edx),%eax
 598:	8b 48 04             	mov    0x4(%eax),%ecx
 59b:	39 f9                	cmp    %edi,%ecx
 59d:	73 41                	jae    5e0 <malloc+0x8c>
 59f:	39 05 d4 06 00 00    	cmp    %eax,0x6d4
 5a5:	75 ed                	jne    594 <malloc+0x40>
 5a7:	83 ec 0c             	sub    $0xc,%esp
 5aa:	56                   	push   %esi
 5ab:	e8 f7 fc ff ff       	call   2a7 <sbrk>
 5b0:	83 c4 10             	add    $0x10,%esp
 5b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 5b6:	74 1c                	je     5d4 <malloc+0x80>
 5b8:	89 58 04             	mov    %ebx,0x4(%eax)
 5bb:	83 ec 0c             	sub    $0xc,%esp
 5be:	83 c0 08             	add    $0x8,%eax
 5c1:	50                   	push   %eax
 5c2:	e8 05 ff ff ff       	call   4cc <free>
 5c7:	8b 15 d4 06 00 00    	mov    0x6d4,%edx
 5cd:	83 c4 10             	add    $0x10,%esp
 5d0:	85 d2                	test   %edx,%edx
 5d2:	75 c2                	jne    596 <malloc+0x42>
 5d4:	31 c0                	xor    %eax,%eax
 5d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5f                   	pop    %edi
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    
 5de:	66 90                	xchg   %ax,%ax
 5e0:	39 cf                	cmp    %ecx,%edi
 5e2:	74 4c                	je     630 <malloc+0xdc>
 5e4:	29 f9                	sub    %edi,%ecx
 5e6:	89 48 04             	mov    %ecx,0x4(%eax)
 5e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5ec:	89 78 04             	mov    %edi,0x4(%eax)
 5ef:	89 15 d4 06 00 00    	mov    %edx,0x6d4
 5f5:	83 c0 08             	add    $0x8,%eax
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret    
 600:	bb 00 10 00 00       	mov    $0x1000,%ebx
 605:	eb 81                	jmp    588 <malloc+0x34>
 607:	90                   	nop
 608:	c7 05 d4 06 00 00 d8 	movl   $0x6d8,0x6d4
 60f:	06 00 00 
 612:	c7 05 d8 06 00 00 d8 	movl   $0x6d8,0x6d8
 619:	06 00 00 
 61c:	c7 05 dc 06 00 00 00 	movl   $0x0,0x6dc
 623:	00 00 00 
 626:	b8 d8 06 00 00       	mov    $0x6d8,%eax
 62b:	e9 4e ff ff ff       	jmp    57e <malloc+0x2a>
 630:	8b 08                	mov    (%eax),%ecx
 632:	89 0a                	mov    %ecx,(%edx)
 634:	eb b9                	jmp    5ef <malloc+0x9b>
