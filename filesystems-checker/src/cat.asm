
_cat:     file format elf32-i386


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
  1d:	7e 58                	jle    77 <main+0x77>
  1f:	83 c3 04             	add    $0x4,%ebx
  22:	be 01 00 00 00       	mov    $0x1,%esi
  27:	eb 20                	jmp    49 <main+0x49>
  29:	8d 76 00             	lea    0x0(%esi),%esi
  2c:	83 ec 0c             	sub    $0xc,%esp
  2f:	50                   	push   %eax
  30:	e8 53 00 00 00       	call   88 <cat>
  35:	89 3c 24             	mov    %edi,(%esp)
  38:	e8 a2 02 00 00       	call   2df <close>
  3d:	46                   	inc    %esi
  3e:	83 c3 04             	add    $0x4,%ebx
  41:	83 c4 10             	add    $0x10,%esp
  44:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  47:	74 29                	je     72 <main+0x72>
  49:	83 ec 08             	sub    $0x8,%esp
  4c:	6a 00                	push   $0x0
  4e:	ff 33                	pushl  (%ebx)
  50:	e8 a2 02 00 00       	call   2f7 <open>
  55:	89 c7                	mov    %eax,%edi
  57:	83 c4 10             	add    $0x10,%esp
  5a:	85 c0                	test   %eax,%eax
  5c:	79 ce                	jns    2c <main+0x2c>
  5e:	50                   	push   %eax
  5f:	ff 33                	pushl  (%ebx)
  61:	68 f3 06 00 00       	push   $0x6f3
  66:	6a 01                	push   $0x1
  68:	e8 7f 03 00 00       	call   3ec <printf>
  6d:	e8 45 02 00 00       	call   2b7 <exit>
  72:	e8 40 02 00 00       	call   2b7 <exit>
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 07 00 00 00       	call   88 <cat>
  81:	e8 31 02 00 00       	call   2b7 <exit>
  86:	66 90                	xchg   %ax,%ax

00000088 <cat>:
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	56                   	push   %esi
  8c:	53                   	push   %ebx
  8d:	8b 75 08             	mov    0x8(%ebp),%esi
  90:	eb 17                	jmp    a9 <cat+0x21>
  92:	66 90                	xchg   %ax,%ax
  94:	51                   	push   %ecx
  95:	53                   	push   %ebx
  96:	68 80 07 00 00       	push   $0x780
  9b:	6a 01                	push   $0x1
  9d:	e8 35 02 00 00       	call   2d7 <write>
  a2:	83 c4 10             	add    $0x10,%esp
  a5:	39 d8                	cmp    %ebx,%eax
  a7:	75 23                	jne    cc <cat+0x44>
  a9:	52                   	push   %edx
  aa:	68 00 02 00 00       	push   $0x200
  af:	68 80 07 00 00       	push   $0x780
  b4:	56                   	push   %esi
  b5:	e8 15 02 00 00       	call   2cf <read>
  ba:	89 c3                	mov    %eax,%ebx
  bc:	83 c4 10             	add    $0x10,%esp
  bf:	85 c0                	test   %eax,%eax
  c1:	7f d1                	jg     94 <cat+0xc>
  c3:	75 1b                	jne    e0 <cat+0x58>
  c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
  c8:	5b                   	pop    %ebx
  c9:	5e                   	pop    %esi
  ca:	5d                   	pop    %ebp
  cb:	c3                   	ret    
  cc:	83 ec 08             	sub    $0x8,%esp
  cf:	68 d0 06 00 00       	push   $0x6d0
  d4:	6a 01                	push   $0x1
  d6:	e8 11 03 00 00       	call   3ec <printf>
  db:	e8 d7 01 00 00       	call   2b7 <exit>
  e0:	50                   	push   %eax
  e1:	50                   	push   %eax
  e2:	68 e2 06 00 00       	push   $0x6e2
  e7:	6a 01                	push   $0x1
  e9:	e8 fe 02 00 00       	call   3ec <printf>
  ee:	e8 c4 01 00 00       	call   2b7 <exit>
  f3:	90                   	nop

000000f4 <strcpy>:
  f4:	55                   	push   %ebp
  f5:	89 e5                	mov    %esp,%ebp
  f7:	53                   	push   %ebx
  f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fe:	31 c0                	xor    %eax,%eax
 100:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 103:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 106:	40                   	inc    %eax
 107:	84 d2                	test   %dl,%dl
 109:	75 f5                	jne    100 <strcpy+0xc>
 10b:	89 c8                	mov    %ecx,%eax
 10d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 110:	c9                   	leave  
 111:	c3                   	ret    
 112:	66 90                	xchg   %ax,%ax

00000114 <strcmp>:
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	53                   	push   %ebx
 118:	8b 55 08             	mov    0x8(%ebp),%edx
 11b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11e:	0f b6 02             	movzbl (%edx),%eax
 121:	84 c0                	test   %al,%al
 123:	75 10                	jne    135 <strcmp+0x21>
 125:	eb 2a                	jmp    151 <strcmp+0x3d>
 127:	90                   	nop
 128:	42                   	inc    %edx
 129:	8d 4b 01             	lea    0x1(%ebx),%ecx
 12c:	0f b6 02             	movzbl (%edx),%eax
 12f:	84 c0                	test   %al,%al
 131:	74 11                	je     144 <strcmp+0x30>
 133:	89 cb                	mov    %ecx,%ebx
 135:	0f b6 0b             	movzbl (%ebx),%ecx
 138:	38 c1                	cmp    %al,%cl
 13a:	74 ec                	je     128 <strcmp+0x14>
 13c:	29 c8                	sub    %ecx,%eax
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	c9                   	leave  
 142:	c3                   	ret    
 143:	90                   	nop
 144:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 148:	31 c0                	xor    %eax,%eax
 14a:	29 c8                	sub    %ecx,%eax
 14c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 14f:	c9                   	leave  
 150:	c3                   	ret    
 151:	0f b6 0b             	movzbl (%ebx),%ecx
 154:	31 c0                	xor    %eax,%eax
 156:	eb e4                	jmp    13c <strcmp+0x28>

00000158 <strlen>:
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	8b 55 08             	mov    0x8(%ebp),%edx
 15e:	80 3a 00             	cmpb   $0x0,(%edx)
 161:	74 15                	je     178 <strlen+0x20>
 163:	31 c0                	xor    %eax,%eax
 165:	8d 76 00             	lea    0x0(%esi),%esi
 168:	40                   	inc    %eax
 169:	89 c1                	mov    %eax,%ecx
 16b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 16f:	75 f7                	jne    168 <strlen+0x10>
 171:	89 c8                	mov    %ecx,%eax
 173:	5d                   	pop    %ebp
 174:	c3                   	ret    
 175:	8d 76 00             	lea    0x0(%esi),%esi
 178:	31 c9                	xor    %ecx,%ecx
 17a:	89 c8                	mov    %ecx,%eax
 17c:	5d                   	pop    %ebp
 17d:	c3                   	ret    
 17e:	66 90                	xchg   %ax,%ax

00000180 <memset>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 7d 08             	mov    0x8(%ebp),%edi
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	fc                   	cld    
 18e:	f3 aa                	rep stos %al,%es:(%edi)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	8b 7d fc             	mov    -0x4(%ebp),%edi
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <strchr>:
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 1a1:	8a 10                	mov    (%eax),%dl
 1a3:	84 d2                	test   %dl,%dl
 1a5:	75 0c                	jne    1b3 <strchr+0x1b>
 1a7:	eb 13                	jmp    1bc <strchr+0x24>
 1a9:	8d 76 00             	lea    0x0(%esi),%esi
 1ac:	40                   	inc    %eax
 1ad:	8a 10                	mov    (%eax),%dl
 1af:	84 d2                	test   %dl,%dl
 1b1:	74 09                	je     1bc <strchr+0x24>
 1b3:	38 d1                	cmp    %dl,%cl
 1b5:	75 f5                	jne    1ac <strchr+0x14>
 1b7:	5d                   	pop    %ebp
 1b8:	c3                   	ret    
 1b9:	8d 76 00             	lea    0x0(%esi),%esi
 1bc:	31 c0                	xor    %eax,%eax
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    

000001c0 <gets>:
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	57                   	push   %edi
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	83 ec 1c             	sub    $0x1c,%esp
 1c9:	31 db                	xor    %ebx,%ebx
 1cb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 1ce:	eb 24                	jmp    1f4 <gets+0x34>
 1d0:	50                   	push   %eax
 1d1:	6a 01                	push   $0x1
 1d3:	56                   	push   %esi
 1d4:	6a 00                	push   $0x0
 1d6:	e8 f4 00 00 00       	call   2cf <read>
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	85 c0                	test   %eax,%eax
 1e0:	7e 1a                	jle    1fc <gets+0x3c>
 1e2:	8a 45 e7             	mov    -0x19(%ebp),%al
 1e5:	8b 55 08             	mov    0x8(%ebp),%edx
 1e8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 1ec:	3c 0a                	cmp    $0xa,%al
 1ee:	74 0e                	je     1fe <gets+0x3e>
 1f0:	3c 0d                	cmp    $0xd,%al
 1f2:	74 0a                	je     1fe <gets+0x3e>
 1f4:	89 df                	mov    %ebx,%edi
 1f6:	43                   	inc    %ebx
 1f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1fa:	7c d4                	jl     1d0 <gets+0x10>
 1fc:	89 fb                	mov    %edi,%ebx
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 205:	8d 65 f4             	lea    -0xc(%ebp),%esp
 208:	5b                   	pop    %ebx
 209:	5e                   	pop    %esi
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi

00000210 <stat>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	56                   	push   %esi
 214:	53                   	push   %ebx
 215:	83 ec 08             	sub    $0x8,%esp
 218:	6a 00                	push   $0x0
 21a:	ff 75 08             	pushl  0x8(%ebp)
 21d:	e8 d5 00 00 00       	call   2f7 <open>
 222:	83 c4 10             	add    $0x10,%esp
 225:	85 c0                	test   %eax,%eax
 227:	78 27                	js     250 <stat+0x40>
 229:	89 c3                	mov    %eax,%ebx
 22b:	83 ec 08             	sub    $0x8,%esp
 22e:	ff 75 0c             	pushl  0xc(%ebp)
 231:	50                   	push   %eax
 232:	e8 d8 00 00 00       	call   30f <fstat>
 237:	89 c6                	mov    %eax,%esi
 239:	89 1c 24             	mov    %ebx,(%esp)
 23c:	e8 9e 00 00 00       	call   2df <close>
 241:	83 c4 10             	add    $0x10,%esp
 244:	89 f0                	mov    %esi,%eax
 246:	8d 65 f8             	lea    -0x8(%ebp),%esp
 249:	5b                   	pop    %ebx
 24a:	5e                   	pop    %esi
 24b:	5d                   	pop    %ebp
 24c:	c3                   	ret    
 24d:	8d 76 00             	lea    0x0(%esi),%esi
 250:	be ff ff ff ff       	mov    $0xffffffff,%esi
 255:	eb ed                	jmp    244 <stat+0x34>
 257:	90                   	nop

00000258 <atoi>:
 258:	55                   	push   %ebp
 259:	89 e5                	mov    %esp,%ebp
 25b:	53                   	push   %ebx
 25c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 25f:	0f be 01             	movsbl (%ecx),%eax
 262:	8d 50 d0             	lea    -0x30(%eax),%edx
 265:	80 fa 09             	cmp    $0x9,%dl
 268:	ba 00 00 00 00       	mov    $0x0,%edx
 26d:	77 16                	ja     285 <atoi+0x2d>
 26f:	90                   	nop
 270:	41                   	inc    %ecx
 271:	8d 14 92             	lea    (%edx,%edx,4),%edx
 274:	01 d2                	add    %edx,%edx
 276:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 27a:	0f be 01             	movsbl (%ecx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x18>
 285:	89 d0                	mov    %edx,%eax
 287:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28a:	c9                   	leave  
 28b:	c3                   	ret    

0000028c <memmove>:
 28c:	55                   	push   %ebp
 28d:	89 e5                	mov    %esp,%ebp
 28f:	57                   	push   %edi
 290:	56                   	push   %esi
 291:	8b 55 08             	mov    0x8(%ebp),%edx
 294:	8b 75 0c             	mov    0xc(%ebp),%esi
 297:	8b 45 10             	mov    0x10(%ebp),%eax
 29a:	85 c0                	test   %eax,%eax
 29c:	7e 0b                	jle    2a9 <memmove+0x1d>
 29e:	01 d0                	add    %edx,%eax
 2a0:	89 d7                	mov    %edx,%edi
 2a2:	66 90                	xchg   %ax,%ax
 2a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 2a5:	39 f8                	cmp    %edi,%eax
 2a7:	75 fb                	jne    2a4 <memmove+0x18>
 2a9:	89 d0                	mov    %edx,%eax
 2ab:	5e                   	pop    %esi
 2ac:	5f                   	pop    %edi
 2ad:	5d                   	pop    %ebp
 2ae:	c3                   	ret    

000002af <fork>:
 2af:	b8 01 00 00 00       	mov    $0x1,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <exit>:
 2b7:	b8 02 00 00 00       	mov    $0x2,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <wait>:
 2bf:	b8 03 00 00 00       	mov    $0x3,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <pipe>:
 2c7:	b8 04 00 00 00       	mov    $0x4,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <read>:
 2cf:	b8 05 00 00 00       	mov    $0x5,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <write>:
 2d7:	b8 10 00 00 00       	mov    $0x10,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <close>:
 2df:	b8 15 00 00 00       	mov    $0x15,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <kill>:
 2e7:	b8 06 00 00 00       	mov    $0x6,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <exec>:
 2ef:	b8 07 00 00 00       	mov    $0x7,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <open>:
 2f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <mknod>:
 2ff:	b8 11 00 00 00       	mov    $0x11,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <unlink>:
 307:	b8 12 00 00 00       	mov    $0x12,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <fstat>:
 30f:	b8 08 00 00 00       	mov    $0x8,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <link>:
 317:	b8 13 00 00 00       	mov    $0x13,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <mkdir>:
 31f:	b8 14 00 00 00       	mov    $0x14,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <chdir>:
 327:	b8 09 00 00 00       	mov    $0x9,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <dup>:
 32f:	b8 0a 00 00 00       	mov    $0xa,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <getpid>:
 337:	b8 0b 00 00 00       	mov    $0xb,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <sbrk>:
 33f:	b8 0c 00 00 00       	mov    $0xc,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sleep>:
 347:	b8 0d 00 00 00       	mov    $0xd,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <uptime>:
 34f:	b8 0e 00 00 00       	mov    $0xe,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <getreadcount>:
 357:	b8 16 00 00 00       	mov    $0x16,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    
 35f:	90                   	nop

00000360 <printint>:
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	56                   	push   %esi
 365:	53                   	push   %ebx
 366:	83 ec 3c             	sub    $0x3c,%esp
 369:	89 45 c0             	mov    %eax,-0x40(%ebp)
 36c:	89 cb                	mov    %ecx,%ebx
 36e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 371:	85 c9                	test   %ecx,%ecx
 373:	74 04                	je     379 <printint+0x19>
 375:	85 d2                	test   %edx,%edx
 377:	78 6b                	js     3e4 <printint+0x84>
 379:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 37c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 383:	31 c9                	xor    %ecx,%ecx
 385:	8d 75 d7             	lea    -0x29(%ebp),%esi
 388:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 38b:	31 d2                	xor    %edx,%edx
 38d:	f7 f3                	div    %ebx
 38f:	89 cf                	mov    %ecx,%edi
 391:	8d 49 01             	lea    0x1(%ecx),%ecx
 394:	8a 92 68 07 00 00    	mov    0x768(%edx),%dl
 39a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 39e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 3a1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3a4:	39 da                	cmp    %ebx,%edx
 3a6:	73 e0                	jae    388 <printint+0x28>
 3a8:	8b 55 08             	mov    0x8(%ebp),%edx
 3ab:	85 d2                	test   %edx,%edx
 3ad:	74 07                	je     3b6 <printint+0x56>
 3af:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3b4:	89 cf                	mov    %ecx,%edi
 3b6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 3b9:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	8a 07                	mov    (%edi),%al
 3c2:	88 45 d7             	mov    %al,-0x29(%ebp)
 3c5:	50                   	push   %eax
 3c6:	6a 01                	push   $0x1
 3c8:	56                   	push   %esi
 3c9:	ff 75 c0             	pushl  -0x40(%ebp)
 3cc:	e8 06 ff ff ff       	call   2d7 <write>
 3d1:	89 f8                	mov    %edi,%eax
 3d3:	4f                   	dec    %edi
 3d4:	83 c4 10             	add    $0x10,%esp
 3d7:	39 d8                	cmp    %ebx,%eax
 3d9:	75 e5                	jne    3c0 <printint+0x60>
 3db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3de:	5b                   	pop    %ebx
 3df:	5e                   	pop    %esi
 3e0:	5f                   	pop    %edi
 3e1:	5d                   	pop    %ebp
 3e2:	c3                   	ret    
 3e3:	90                   	nop
 3e4:	f7 da                	neg    %edx
 3e6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 3e9:	eb 98                	jmp    383 <printint+0x23>
 3eb:	90                   	nop

000003ec <printf>:
 3ec:	55                   	push   %ebp
 3ed:	89 e5                	mov    %esp,%ebp
 3ef:	57                   	push   %edi
 3f0:	56                   	push   %esi
 3f1:	53                   	push   %ebx
 3f2:	83 ec 2c             	sub    $0x2c,%esp
 3f5:	8b 75 08             	mov    0x8(%ebp),%esi
 3f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 3fb:	8a 13                	mov    (%ebx),%dl
 3fd:	84 d2                	test   %dl,%dl
 3ff:	74 5c                	je     45d <printf+0x71>
 401:	43                   	inc    %ebx
 402:	8d 45 10             	lea    0x10(%ebp),%eax
 405:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 408:	31 ff                	xor    %edi,%edi
 40a:	eb 20                	jmp    42c <printf+0x40>
 40c:	83 f8 25             	cmp    $0x25,%eax
 40f:	74 3f                	je     450 <printf+0x64>
 411:	88 55 e7             	mov    %dl,-0x19(%ebp)
 414:	50                   	push   %eax
 415:	6a 01                	push   $0x1
 417:	8d 45 e7             	lea    -0x19(%ebp),%eax
 41a:	50                   	push   %eax
 41b:	56                   	push   %esi
 41c:	e8 b6 fe ff ff       	call   2d7 <write>
 421:	83 c4 10             	add    $0x10,%esp
 424:	43                   	inc    %ebx
 425:	8a 53 ff             	mov    -0x1(%ebx),%dl
 428:	84 d2                	test   %dl,%dl
 42a:	74 31                	je     45d <printf+0x71>
 42c:	0f b6 c2             	movzbl %dl,%eax
 42f:	85 ff                	test   %edi,%edi
 431:	74 d9                	je     40c <printf+0x20>
 433:	83 ff 25             	cmp    $0x25,%edi
 436:	75 ec                	jne    424 <printf+0x38>
 438:	83 f8 25             	cmp    $0x25,%eax
 43b:	0f 84 03 01 00 00    	je     544 <printf+0x158>
 441:	83 e8 63             	sub    $0x63,%eax
 444:	83 f8 15             	cmp    $0x15,%eax
 447:	77 1f                	ja     468 <printf+0x7c>
 449:	ff 24 85 10 07 00 00 	jmp    *0x710(,%eax,4)
 450:	bf 25 00 00 00       	mov    $0x25,%edi
 455:	43                   	inc    %ebx
 456:	8a 53 ff             	mov    -0x1(%ebx),%dl
 459:	84 d2                	test   %dl,%dl
 45b:	75 cf                	jne    42c <printf+0x40>
 45d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 460:	5b                   	pop    %ebx
 461:	5e                   	pop    %esi
 462:	5f                   	pop    %edi
 463:	5d                   	pop    %ebp
 464:	c3                   	ret    
 465:	8d 76 00             	lea    0x0(%esi),%esi
 468:	88 55 d0             	mov    %dl,-0x30(%ebp)
 46b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 46f:	50                   	push   %eax
 470:	6a 01                	push   $0x1
 472:	8d 7d e7             	lea    -0x19(%ebp),%edi
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	e8 5b fe ff ff       	call   2d7 <write>
 47c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 47f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 482:	83 c4 0c             	add    $0xc,%esp
 485:	6a 01                	push   $0x1
 487:	57                   	push   %edi
 488:	56                   	push   %esi
 489:	e8 49 fe ff ff       	call   2d7 <write>
 48e:	83 c4 10             	add    $0x10,%esp
 491:	31 ff                	xor    %edi,%edi
 493:	eb 8f                	jmp    424 <printf+0x38>
 495:	8d 76 00             	lea    0x0(%esi),%esi
 498:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 49b:	8b 17                	mov    (%edi),%edx
 49d:	83 ec 0c             	sub    $0xc,%esp
 4a0:	6a 00                	push   $0x0
 4a2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a7:	89 f0                	mov    %esi,%eax
 4a9:	e8 b2 fe ff ff       	call   360 <printint>
 4ae:	83 c7 04             	add    $0x4,%edi
 4b1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4b4:	83 c4 10             	add    $0x10,%esp
 4b7:	31 ff                	xor    %edi,%edi
 4b9:	e9 66 ff ff ff       	jmp    424 <printf+0x38>
 4be:	66 90                	xchg   %ax,%ax
 4c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4c3:	8b 10                	mov    (%eax),%edx
 4c5:	83 c0 04             	add    $0x4,%eax
 4c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4cb:	85 d2                	test   %edx,%edx
 4cd:	0f 84 81 00 00 00    	je     554 <printf+0x168>
 4d3:	8a 02                	mov    (%edx),%al
 4d5:	84 c0                	test   %al,%al
 4d7:	0f 84 80 00 00 00    	je     55d <printf+0x171>
 4dd:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4e0:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4e3:	89 d3                	mov    %edx,%ebx
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
 4e8:	88 45 e7             	mov    %al,-0x19(%ebp)
 4eb:	50                   	push   %eax
 4ec:	6a 01                	push   $0x1
 4ee:	57                   	push   %edi
 4ef:	56                   	push   %esi
 4f0:	e8 e2 fd ff ff       	call   2d7 <write>
 4f5:	43                   	inc    %ebx
 4f6:	8a 03                	mov    (%ebx),%al
 4f8:	83 c4 10             	add    $0x10,%esp
 4fb:	84 c0                	test   %al,%al
 4fd:	75 e9                	jne    4e8 <printf+0xfc>
 4ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 502:	31 ff                	xor    %edi,%edi
 504:	e9 1b ff ff ff       	jmp    424 <printf+0x38>
 509:	8d 76 00             	lea    0x0(%esi),%esi
 50c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 50f:	8b 17                	mov    (%edi),%edx
 511:	83 ec 0c             	sub    $0xc,%esp
 514:	6a 01                	push   $0x1
 516:	b9 0a 00 00 00       	mov    $0xa,%ecx
 51b:	eb 8a                	jmp    4a7 <printf+0xbb>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 523:	8b 00                	mov    (%eax),%eax
 525:	88 45 e7             	mov    %al,-0x19(%ebp)
 528:	51                   	push   %ecx
 529:	6a 01                	push   $0x1
 52b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 52e:	57                   	push   %edi
 52f:	56                   	push   %esi
 530:	e8 a2 fd ff ff       	call   2d7 <write>
 535:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	31 ff                	xor    %edi,%edi
 53e:	e9 e1 fe ff ff       	jmp    424 <printf+0x38>
 543:	90                   	nop
 544:	88 55 e7             	mov    %dl,-0x19(%ebp)
 547:	52                   	push   %edx
 548:	6a 01                	push   $0x1
 54a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 54d:	e9 35 ff ff ff       	jmp    487 <printf+0x9b>
 552:	66 90                	xchg   %ax,%ax
 554:	b0 28                	mov    $0x28,%al
 556:	ba 08 07 00 00       	mov    $0x708,%edx
 55b:	eb 80                	jmp    4dd <printf+0xf1>
 55d:	31 ff                	xor    %edi,%edi
 55f:	e9 c0 fe ff ff       	jmp    424 <printf+0x38>

00000564 <free>:
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 56d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 570:	a1 80 09 00 00       	mov    0x980,%eax
 575:	8d 76 00             	lea    0x0(%esi),%esi
 578:	89 c2                	mov    %eax,%edx
 57a:	8b 00                	mov    (%eax),%eax
 57c:	39 ca                	cmp    %ecx,%edx
 57e:	73 2c                	jae    5ac <free+0x48>
 580:	39 c1                	cmp    %eax,%ecx
 582:	72 04                	jb     588 <free+0x24>
 584:	39 c2                	cmp    %eax,%edx
 586:	72 f0                	jb     578 <free+0x14>
 588:	8b 73 fc             	mov    -0x4(%ebx),%esi
 58b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 58e:	39 f8                	cmp    %edi,%eax
 590:	74 2c                	je     5be <free+0x5a>
 592:	89 43 f8             	mov    %eax,-0x8(%ebx)
 595:	8b 42 04             	mov    0x4(%edx),%eax
 598:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 59b:	39 f1                	cmp    %esi,%ecx
 59d:	74 36                	je     5d5 <free+0x71>
 59f:	89 0a                	mov    %ecx,(%edx)
 5a1:	89 15 80 09 00 00    	mov    %edx,0x980
 5a7:	5b                   	pop    %ebx
 5a8:	5e                   	pop    %esi
 5a9:	5f                   	pop    %edi
 5aa:	5d                   	pop    %ebp
 5ab:	c3                   	ret    
 5ac:	39 c2                	cmp    %eax,%edx
 5ae:	72 c8                	jb     578 <free+0x14>
 5b0:	39 c1                	cmp    %eax,%ecx
 5b2:	73 c4                	jae    578 <free+0x14>
 5b4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5b7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ba:	39 f8                	cmp    %edi,%eax
 5bc:	75 d4                	jne    592 <free+0x2e>
 5be:	03 70 04             	add    0x4(%eax),%esi
 5c1:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5c4:	8b 02                	mov    (%edx),%eax
 5c6:	8b 00                	mov    (%eax),%eax
 5c8:	89 43 f8             	mov    %eax,-0x8(%ebx)
 5cb:	8b 42 04             	mov    0x4(%edx),%eax
 5ce:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 5d1:	39 f1                	cmp    %esi,%ecx
 5d3:	75 ca                	jne    59f <free+0x3b>
 5d5:	03 43 fc             	add    -0x4(%ebx),%eax
 5d8:	89 42 04             	mov    %eax,0x4(%edx)
 5db:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 5de:	89 0a                	mov    %ecx,(%edx)
 5e0:	89 15 80 09 00 00    	mov    %edx,0x980
 5e6:	5b                   	pop    %ebx
 5e7:	5e                   	pop    %esi
 5e8:	5f                   	pop    %edi
 5e9:	5d                   	pop    %ebp
 5ea:	c3                   	ret    
 5eb:	90                   	nop

000005ec <malloc>:
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	53                   	push   %ebx
 5f2:	83 ec 0c             	sub    $0xc,%esp
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	8d 78 07             	lea    0x7(%eax),%edi
 5fb:	c1 ef 03             	shr    $0x3,%edi
 5fe:	47                   	inc    %edi
 5ff:	8b 15 80 09 00 00    	mov    0x980,%edx
 605:	85 d2                	test   %edx,%edx
 607:	0f 84 93 00 00 00    	je     6a0 <malloc+0xb4>
 60d:	8b 02                	mov    (%edx),%eax
 60f:	8b 48 04             	mov    0x4(%eax),%ecx
 612:	39 f9                	cmp    %edi,%ecx
 614:	73 62                	jae    678 <malloc+0x8c>
 616:	89 fb                	mov    %edi,%ebx
 618:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 61e:	72 78                	jb     698 <malloc+0xac>
 620:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 627:	eb 0e                	jmp    637 <malloc+0x4b>
 629:	8d 76 00             	lea    0x0(%esi),%esi
 62c:	89 c2                	mov    %eax,%edx
 62e:	8b 02                	mov    (%edx),%eax
 630:	8b 48 04             	mov    0x4(%eax),%ecx
 633:	39 f9                	cmp    %edi,%ecx
 635:	73 41                	jae    678 <malloc+0x8c>
 637:	39 05 80 09 00 00    	cmp    %eax,0x980
 63d:	75 ed                	jne    62c <malloc+0x40>
 63f:	83 ec 0c             	sub    $0xc,%esp
 642:	56                   	push   %esi
 643:	e8 f7 fc ff ff       	call   33f <sbrk>
 648:	83 c4 10             	add    $0x10,%esp
 64b:	83 f8 ff             	cmp    $0xffffffff,%eax
 64e:	74 1c                	je     66c <malloc+0x80>
 650:	89 58 04             	mov    %ebx,0x4(%eax)
 653:	83 ec 0c             	sub    $0xc,%esp
 656:	83 c0 08             	add    $0x8,%eax
 659:	50                   	push   %eax
 65a:	e8 05 ff ff ff       	call   564 <free>
 65f:	8b 15 80 09 00 00    	mov    0x980,%edx
 665:	83 c4 10             	add    $0x10,%esp
 668:	85 d2                	test   %edx,%edx
 66a:	75 c2                	jne    62e <malloc+0x42>
 66c:	31 c0                	xor    %eax,%eax
 66e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 671:	5b                   	pop    %ebx
 672:	5e                   	pop    %esi
 673:	5f                   	pop    %edi
 674:	5d                   	pop    %ebp
 675:	c3                   	ret    
 676:	66 90                	xchg   %ax,%ax
 678:	39 cf                	cmp    %ecx,%edi
 67a:	74 4c                	je     6c8 <malloc+0xdc>
 67c:	29 f9                	sub    %edi,%ecx
 67e:	89 48 04             	mov    %ecx,0x4(%eax)
 681:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 684:	89 78 04             	mov    %edi,0x4(%eax)
 687:	89 15 80 09 00 00    	mov    %edx,0x980
 68d:	83 c0 08             	add    $0x8,%eax
 690:	8d 65 f4             	lea    -0xc(%ebp),%esp
 693:	5b                   	pop    %ebx
 694:	5e                   	pop    %esi
 695:	5f                   	pop    %edi
 696:	5d                   	pop    %ebp
 697:	c3                   	ret    
 698:	bb 00 10 00 00       	mov    $0x1000,%ebx
 69d:	eb 81                	jmp    620 <malloc+0x34>
 69f:	90                   	nop
 6a0:	c7 05 80 09 00 00 84 	movl   $0x984,0x980
 6a7:	09 00 00 
 6aa:	c7 05 84 09 00 00 84 	movl   $0x984,0x984
 6b1:	09 00 00 
 6b4:	c7 05 88 09 00 00 00 	movl   $0x0,0x988
 6bb:	00 00 00 
 6be:	b8 84 09 00 00       	mov    $0x984,%eax
 6c3:	e9 4e ff ff ff       	jmp    616 <malloc+0x2a>
 6c8:	8b 08                	mov    (%eax),%ecx
 6ca:	89 0a                	mov    %ecx,(%edx)
 6cc:	eb b9                	jmp    687 <malloc+0x9b>
