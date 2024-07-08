
_echo:     file format elf32-i386


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
  1c:	7e 41                	jle    5f <main+0x5f>
  1e:	8b 47 04             	mov    0x4(%edi),%eax
  21:	83 fe 02             	cmp    $0x2,%esi
  24:	74 24                	je     4a <main+0x4a>
  26:	bb 02 00 00 00       	mov    $0x2,%ebx
  2b:	90                   	nop
  2c:	68 40 06 00 00       	push   $0x640
  31:	50                   	push   %eax
  32:	68 42 06 00 00       	push   $0x642
  37:	6a 01                	push   $0x1
  39:	e8 1e 03 00 00       	call   35c <printf>
  3e:	43                   	inc    %ebx
  3f:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  43:	83 c4 10             	add    $0x10,%esp
  46:	39 f3                	cmp    %esi,%ebx
  48:	75 e2                	jne    2c <main+0x2c>
  4a:	68 47 06 00 00       	push   $0x647
  4f:	50                   	push   %eax
  50:	68 42 06 00 00       	push   $0x642
  55:	6a 01                	push   $0x1
  57:	e8 00 03 00 00       	call   35c <printf>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	e8 c3 01 00 00       	call   227 <exit>

00000064 <strcpy>:
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	53                   	push   %ebx
  68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6e:	31 c0                	xor    %eax,%eax
  70:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  73:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  76:	40                   	inc    %eax
  77:	84 d2                	test   %dl,%dl
  79:	75 f5                	jne    70 <strcpy+0xc>
  7b:	89 c8                	mov    %ecx,%eax
  7d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80:	c9                   	leave  
  81:	c3                   	ret    
  82:	66 90                	xchg   %ax,%ax

00000084 <strcmp>:
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	53                   	push   %ebx
  88:	8b 55 08             	mov    0x8(%ebp),%edx
  8b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8e:	0f b6 02             	movzbl (%edx),%eax
  91:	84 c0                	test   %al,%al
  93:	75 10                	jne    a5 <strcmp+0x21>
  95:	eb 2a                	jmp    c1 <strcmp+0x3d>
  97:	90                   	nop
  98:	42                   	inc    %edx
  99:	8d 4b 01             	lea    0x1(%ebx),%ecx
  9c:	0f b6 02             	movzbl (%edx),%eax
  9f:	84 c0                	test   %al,%al
  a1:	74 11                	je     b4 <strcmp+0x30>
  a3:	89 cb                	mov    %ecx,%ebx
  a5:	0f b6 0b             	movzbl (%ebx),%ecx
  a8:	38 c1                	cmp    %al,%cl
  aa:	74 ec                	je     98 <strcmp+0x14>
  ac:	29 c8                	sub    %ecx,%eax
  ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b1:	c9                   	leave  
  b2:	c3                   	ret    
  b3:	90                   	nop
  b4:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  b8:	31 c0                	xor    %eax,%eax
  ba:	29 c8                	sub    %ecx,%eax
  bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  bf:	c9                   	leave  
  c0:	c3                   	ret    
  c1:	0f b6 0b             	movzbl (%ebx),%ecx
  c4:	31 c0                	xor    %eax,%eax
  c6:	eb e4                	jmp    ac <strcmp+0x28>

000000c8 <strlen>:
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  cb:	8b 55 08             	mov    0x8(%ebp),%edx
  ce:	80 3a 00             	cmpb   $0x0,(%edx)
  d1:	74 15                	je     e8 <strlen+0x20>
  d3:	31 c0                	xor    %eax,%eax
  d5:	8d 76 00             	lea    0x0(%esi),%esi
  d8:	40                   	inc    %eax
  d9:	89 c1                	mov    %eax,%ecx
  db:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  df:	75 f7                	jne    d8 <strlen+0x10>
  e1:	89 c8                	mov    %ecx,%eax
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    
  e5:	8d 76 00             	lea    0x0(%esi),%esi
  e8:	31 c9                	xor    %ecx,%ecx
  ea:	89 c8                	mov    %ecx,%eax
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax

000000f0 <memset>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 7d 08             	mov    0x8(%ebp),%edi
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	fc                   	cld    
  fe:	f3 aa                	rep stos %al,%es:(%edi)
 100:	8b 45 08             	mov    0x8(%ebp),%eax
 103:	8b 7d fc             	mov    -0x4(%ebp),%edi
 106:	c9                   	leave  
 107:	c3                   	ret    

00000108 <strchr>:
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 111:	8a 10                	mov    (%eax),%dl
 113:	84 d2                	test   %dl,%dl
 115:	75 0c                	jne    123 <strchr+0x1b>
 117:	eb 13                	jmp    12c <strchr+0x24>
 119:	8d 76 00             	lea    0x0(%esi),%esi
 11c:	40                   	inc    %eax
 11d:	8a 10                	mov    (%eax),%dl
 11f:	84 d2                	test   %dl,%dl
 121:	74 09                	je     12c <strchr+0x24>
 123:	38 d1                	cmp    %dl,%cl
 125:	75 f5                	jne    11c <strchr+0x14>
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d 76 00             	lea    0x0(%esi),%esi
 12c:	31 c0                	xor    %eax,%eax
 12e:	5d                   	pop    %ebp
 12f:	c3                   	ret    

00000130 <gets>:
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	56                   	push   %esi
 135:	53                   	push   %ebx
 136:	83 ec 1c             	sub    $0x1c,%esp
 139:	31 db                	xor    %ebx,%ebx
 13b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 13e:	eb 24                	jmp    164 <gets+0x34>
 140:	50                   	push   %eax
 141:	6a 01                	push   $0x1
 143:	56                   	push   %esi
 144:	6a 00                	push   $0x0
 146:	e8 f4 00 00 00       	call   23f <read>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	7e 1a                	jle    16c <gets+0x3c>
 152:	8a 45 e7             	mov    -0x19(%ebp),%al
 155:	8b 55 08             	mov    0x8(%ebp),%edx
 158:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 15c:	3c 0a                	cmp    $0xa,%al
 15e:	74 0e                	je     16e <gets+0x3e>
 160:	3c 0d                	cmp    $0xd,%al
 162:	74 0a                	je     16e <gets+0x3e>
 164:	89 df                	mov    %ebx,%edi
 166:	43                   	inc    %ebx
 167:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 16a:	7c d4                	jl     140 <gets+0x10>
 16c:	89 fb                	mov    %edi,%ebx
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 175:	8d 65 f4             	lea    -0xc(%ebp),%esp
 178:	5b                   	pop    %ebx
 179:	5e                   	pop    %esi
 17a:	5f                   	pop    %edi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret    
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <stat>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	83 ec 08             	sub    $0x8,%esp
 188:	6a 00                	push   $0x0
 18a:	ff 75 08             	pushl  0x8(%ebp)
 18d:	e8 d5 00 00 00       	call   267 <open>
 192:	83 c4 10             	add    $0x10,%esp
 195:	85 c0                	test   %eax,%eax
 197:	78 27                	js     1c0 <stat+0x40>
 199:	89 c3                	mov    %eax,%ebx
 19b:	83 ec 08             	sub    $0x8,%esp
 19e:	ff 75 0c             	pushl  0xc(%ebp)
 1a1:	50                   	push   %eax
 1a2:	e8 d8 00 00 00       	call   27f <fstat>
 1a7:	89 c6                	mov    %eax,%esi
 1a9:	89 1c 24             	mov    %ebx,(%esp)
 1ac:	e8 9e 00 00 00       	call   24f <close>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	89 f0                	mov    %esi,%eax
 1b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c5:	eb ed                	jmp    1b4 <stat+0x34>
 1c7:	90                   	nop

000001c8 <atoi>:
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	53                   	push   %ebx
 1cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cf:	0f be 01             	movsbl (%ecx),%eax
 1d2:	8d 50 d0             	lea    -0x30(%eax),%edx
 1d5:	80 fa 09             	cmp    $0x9,%dl
 1d8:	ba 00 00 00 00       	mov    $0x0,%edx
 1dd:	77 16                	ja     1f5 <atoi+0x2d>
 1df:	90                   	nop
 1e0:	41                   	inc    %ecx
 1e1:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1e4:	01 d2                	add    %edx,%edx
 1e6:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1ea:	0f be 01             	movsbl (%ecx),%eax
 1ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1f0:	80 fb 09             	cmp    $0x9,%bl
 1f3:	76 eb                	jbe    1e0 <atoi+0x18>
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <memmove>:
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	57                   	push   %edi
 200:	56                   	push   %esi
 201:	8b 55 08             	mov    0x8(%ebp),%edx
 204:	8b 75 0c             	mov    0xc(%ebp),%esi
 207:	8b 45 10             	mov    0x10(%ebp),%eax
 20a:	85 c0                	test   %eax,%eax
 20c:	7e 0b                	jle    219 <memmove+0x1d>
 20e:	01 d0                	add    %edx,%eax
 210:	89 d7                	mov    %edx,%edi
 212:	66 90                	xchg   %ax,%ax
 214:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 215:	39 f8                	cmp    %edi,%eax
 217:	75 fb                	jne    214 <memmove+0x18>
 219:	89 d0                	mov    %edx,%eax
 21b:	5e                   	pop    %esi
 21c:	5f                   	pop    %edi
 21d:	5d                   	pop    %ebp
 21e:	c3                   	ret    

0000021f <fork>:
 21f:	b8 01 00 00 00       	mov    $0x1,%eax
 224:	cd 40                	int    $0x40
 226:	c3                   	ret    

00000227 <exit>:
 227:	b8 02 00 00 00       	mov    $0x2,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <wait>:
 22f:	b8 03 00 00 00       	mov    $0x3,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <pipe>:
 237:	b8 04 00 00 00       	mov    $0x4,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <read>:
 23f:	b8 05 00 00 00       	mov    $0x5,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <write>:
 247:	b8 10 00 00 00       	mov    $0x10,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <close>:
 24f:	b8 15 00 00 00       	mov    $0x15,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <kill>:
 257:	b8 06 00 00 00       	mov    $0x6,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <exec>:
 25f:	b8 07 00 00 00       	mov    $0x7,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <open>:
 267:	b8 0f 00 00 00       	mov    $0xf,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <mknod>:
 26f:	b8 11 00 00 00       	mov    $0x11,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <unlink>:
 277:	b8 12 00 00 00       	mov    $0x12,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <fstat>:
 27f:	b8 08 00 00 00       	mov    $0x8,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <link>:
 287:	b8 13 00 00 00       	mov    $0x13,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <mkdir>:
 28f:	b8 14 00 00 00       	mov    $0x14,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <chdir>:
 297:	b8 09 00 00 00       	mov    $0x9,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <dup>:
 29f:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <getpid>:
 2a7:	b8 0b 00 00 00       	mov    $0xb,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <sbrk>:
 2af:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <sleep>:
 2b7:	b8 0d 00 00 00       	mov    $0xd,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <uptime>:
 2bf:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <getreadcount>:
 2c7:	b8 16 00 00 00       	mov    $0x16,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    
 2cf:	90                   	nop

000002d0 <printint>:
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	57                   	push   %edi
 2d4:	56                   	push   %esi
 2d5:	53                   	push   %ebx
 2d6:	83 ec 3c             	sub    $0x3c,%esp
 2d9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2dc:	89 cb                	mov    %ecx,%ebx
 2de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e1:	85 c9                	test   %ecx,%ecx
 2e3:	74 04                	je     2e9 <printint+0x19>
 2e5:	85 d2                	test   %edx,%edx
 2e7:	78 6b                	js     354 <printint+0x84>
 2e9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2ec:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2f3:	31 c9                	xor    %ecx,%ecx
 2f5:	8d 75 d7             	lea    -0x29(%ebp),%esi
 2f8:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 2fb:	31 d2                	xor    %edx,%edx
 2fd:	f7 f3                	div    %ebx
 2ff:	89 cf                	mov    %ecx,%edi
 301:	8d 49 01             	lea    0x1(%ecx),%ecx
 304:	8a 92 a8 06 00 00    	mov    0x6a8(%edx),%dl
 30a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 30e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 311:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 314:	39 da                	cmp    %ebx,%edx
 316:	73 e0                	jae    2f8 <printint+0x28>
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	85 d2                	test   %edx,%edx
 31d:	74 07                	je     326 <printint+0x56>
 31f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 324:	89 cf                	mov    %ecx,%edi
 326:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 329:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
 330:	8a 07                	mov    (%edi),%al
 332:	88 45 d7             	mov    %al,-0x29(%ebp)
 335:	50                   	push   %eax
 336:	6a 01                	push   $0x1
 338:	56                   	push   %esi
 339:	ff 75 c0             	pushl  -0x40(%ebp)
 33c:	e8 06 ff ff ff       	call   247 <write>
 341:	89 f8                	mov    %edi,%eax
 343:	4f                   	dec    %edi
 344:	83 c4 10             	add    $0x10,%esp
 347:	39 d8                	cmp    %ebx,%eax
 349:	75 e5                	jne    330 <printint+0x60>
 34b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 34e:	5b                   	pop    %ebx
 34f:	5e                   	pop    %esi
 350:	5f                   	pop    %edi
 351:	5d                   	pop    %ebp
 352:	c3                   	ret    
 353:	90                   	nop
 354:	f7 da                	neg    %edx
 356:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 359:	eb 98                	jmp    2f3 <printint+0x23>
 35b:	90                   	nop

0000035c <printf>:
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	57                   	push   %edi
 360:	56                   	push   %esi
 361:	53                   	push   %ebx
 362:	83 ec 2c             	sub    $0x2c,%esp
 365:	8b 75 08             	mov    0x8(%ebp),%esi
 368:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 36b:	8a 13                	mov    (%ebx),%dl
 36d:	84 d2                	test   %dl,%dl
 36f:	74 5c                	je     3cd <printf+0x71>
 371:	43                   	inc    %ebx
 372:	8d 45 10             	lea    0x10(%ebp),%eax
 375:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 378:	31 ff                	xor    %edi,%edi
 37a:	eb 20                	jmp    39c <printf+0x40>
 37c:	83 f8 25             	cmp    $0x25,%eax
 37f:	74 3f                	je     3c0 <printf+0x64>
 381:	88 55 e7             	mov    %dl,-0x19(%ebp)
 384:	50                   	push   %eax
 385:	6a 01                	push   $0x1
 387:	8d 45 e7             	lea    -0x19(%ebp),%eax
 38a:	50                   	push   %eax
 38b:	56                   	push   %esi
 38c:	e8 b6 fe ff ff       	call   247 <write>
 391:	83 c4 10             	add    $0x10,%esp
 394:	43                   	inc    %ebx
 395:	8a 53 ff             	mov    -0x1(%ebx),%dl
 398:	84 d2                	test   %dl,%dl
 39a:	74 31                	je     3cd <printf+0x71>
 39c:	0f b6 c2             	movzbl %dl,%eax
 39f:	85 ff                	test   %edi,%edi
 3a1:	74 d9                	je     37c <printf+0x20>
 3a3:	83 ff 25             	cmp    $0x25,%edi
 3a6:	75 ec                	jne    394 <printf+0x38>
 3a8:	83 f8 25             	cmp    $0x25,%eax
 3ab:	0f 84 03 01 00 00    	je     4b4 <printf+0x158>
 3b1:	83 e8 63             	sub    $0x63,%eax
 3b4:	83 f8 15             	cmp    $0x15,%eax
 3b7:	77 1f                	ja     3d8 <printf+0x7c>
 3b9:	ff 24 85 50 06 00 00 	jmp    *0x650(,%eax,4)
 3c0:	bf 25 00 00 00       	mov    $0x25,%edi
 3c5:	43                   	inc    %ebx
 3c6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3c9:	84 d2                	test   %dl,%dl
 3cb:	75 cf                	jne    39c <printf+0x40>
 3cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d0:	5b                   	pop    %ebx
 3d1:	5e                   	pop    %esi
 3d2:	5f                   	pop    %edi
 3d3:	5d                   	pop    %ebp
 3d4:	c3                   	ret    
 3d5:	8d 76 00             	lea    0x0(%esi),%esi
 3d8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3db:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3df:	50                   	push   %eax
 3e0:	6a 01                	push   $0x1
 3e2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3e5:	57                   	push   %edi
 3e6:	56                   	push   %esi
 3e7:	e8 5b fe ff ff       	call   247 <write>
 3ec:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3ef:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3f2:	83 c4 0c             	add    $0xc,%esp
 3f5:	6a 01                	push   $0x1
 3f7:	57                   	push   %edi
 3f8:	56                   	push   %esi
 3f9:	e8 49 fe ff ff       	call   247 <write>
 3fe:	83 c4 10             	add    $0x10,%esp
 401:	31 ff                	xor    %edi,%edi
 403:	eb 8f                	jmp    394 <printf+0x38>
 405:	8d 76 00             	lea    0x0(%esi),%esi
 408:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 40b:	8b 17                	mov    (%edi),%edx
 40d:	83 ec 0c             	sub    $0xc,%esp
 410:	6a 00                	push   $0x0
 412:	b9 10 00 00 00       	mov    $0x10,%ecx
 417:	89 f0                	mov    %esi,%eax
 419:	e8 b2 fe ff ff       	call   2d0 <printint>
 41e:	83 c7 04             	add    $0x4,%edi
 421:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 424:	83 c4 10             	add    $0x10,%esp
 427:	31 ff                	xor    %edi,%edi
 429:	e9 66 ff ff ff       	jmp    394 <printf+0x38>
 42e:	66 90                	xchg   %ax,%ax
 430:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 433:	8b 10                	mov    (%eax),%edx
 435:	83 c0 04             	add    $0x4,%eax
 438:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 43b:	85 d2                	test   %edx,%edx
 43d:	0f 84 81 00 00 00    	je     4c4 <printf+0x168>
 443:	8a 02                	mov    (%edx),%al
 445:	84 c0                	test   %al,%al
 447:	0f 84 80 00 00 00    	je     4cd <printf+0x171>
 44d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 450:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 453:	89 d3                	mov    %edx,%ebx
 455:	8d 76 00             	lea    0x0(%esi),%esi
 458:	88 45 e7             	mov    %al,-0x19(%ebp)
 45b:	50                   	push   %eax
 45c:	6a 01                	push   $0x1
 45e:	57                   	push   %edi
 45f:	56                   	push   %esi
 460:	e8 e2 fd ff ff       	call   247 <write>
 465:	43                   	inc    %ebx
 466:	8a 03                	mov    (%ebx),%al
 468:	83 c4 10             	add    $0x10,%esp
 46b:	84 c0                	test   %al,%al
 46d:	75 e9                	jne    458 <printf+0xfc>
 46f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 472:	31 ff                	xor    %edi,%edi
 474:	e9 1b ff ff ff       	jmp    394 <printf+0x38>
 479:	8d 76 00             	lea    0x0(%esi),%esi
 47c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 47f:	8b 17                	mov    (%edi),%edx
 481:	83 ec 0c             	sub    $0xc,%esp
 484:	6a 01                	push   $0x1
 486:	b9 0a 00 00 00       	mov    $0xa,%ecx
 48b:	eb 8a                	jmp    417 <printf+0xbb>
 48d:	8d 76 00             	lea    0x0(%esi),%esi
 490:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 493:	8b 00                	mov    (%eax),%eax
 495:	88 45 e7             	mov    %al,-0x19(%ebp)
 498:	51                   	push   %ecx
 499:	6a 01                	push   $0x1
 49b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 49e:	57                   	push   %edi
 49f:	56                   	push   %esi
 4a0:	e8 a2 fd ff ff       	call   247 <write>
 4a5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4a9:	83 c4 10             	add    $0x10,%esp
 4ac:	31 ff                	xor    %edi,%edi
 4ae:	e9 e1 fe ff ff       	jmp    394 <printf+0x38>
 4b3:	90                   	nop
 4b4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4b7:	52                   	push   %edx
 4b8:	6a 01                	push   $0x1
 4ba:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4bd:	e9 35 ff ff ff       	jmp    3f7 <printf+0x9b>
 4c2:	66 90                	xchg   %ax,%ax
 4c4:	b0 28                	mov    $0x28,%al
 4c6:	ba 49 06 00 00       	mov    $0x649,%edx
 4cb:	eb 80                	jmp    44d <printf+0xf1>
 4cd:	31 ff                	xor    %edi,%edi
 4cf:	e9 c0 fe ff ff       	jmp    394 <printf+0x38>

000004d4 <free>:
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	57                   	push   %edi
 4d8:	56                   	push   %esi
 4d9:	53                   	push   %ebx
 4da:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4dd:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4e0:	a1 bc 06 00 00       	mov    0x6bc,%eax
 4e5:	8d 76 00             	lea    0x0(%esi),%esi
 4e8:	89 c2                	mov    %eax,%edx
 4ea:	8b 00                	mov    (%eax),%eax
 4ec:	39 ca                	cmp    %ecx,%edx
 4ee:	73 2c                	jae    51c <free+0x48>
 4f0:	39 c1                	cmp    %eax,%ecx
 4f2:	72 04                	jb     4f8 <free+0x24>
 4f4:	39 c2                	cmp    %eax,%edx
 4f6:	72 f0                	jb     4e8 <free+0x14>
 4f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4fe:	39 f8                	cmp    %edi,%eax
 500:	74 2c                	je     52e <free+0x5a>
 502:	89 43 f8             	mov    %eax,-0x8(%ebx)
 505:	8b 42 04             	mov    0x4(%edx),%eax
 508:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 50b:	39 f1                	cmp    %esi,%ecx
 50d:	74 36                	je     545 <free+0x71>
 50f:	89 0a                	mov    %ecx,(%edx)
 511:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 517:	5b                   	pop    %ebx
 518:	5e                   	pop    %esi
 519:	5f                   	pop    %edi
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    
 51c:	39 c2                	cmp    %eax,%edx
 51e:	72 c8                	jb     4e8 <free+0x14>
 520:	39 c1                	cmp    %eax,%ecx
 522:	73 c4                	jae    4e8 <free+0x14>
 524:	8b 73 fc             	mov    -0x4(%ebx),%esi
 527:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 52a:	39 f8                	cmp    %edi,%eax
 52c:	75 d4                	jne    502 <free+0x2e>
 52e:	03 70 04             	add    0x4(%eax),%esi
 531:	89 73 fc             	mov    %esi,-0x4(%ebx)
 534:	8b 02                	mov    (%edx),%eax
 536:	8b 00                	mov    (%eax),%eax
 538:	89 43 f8             	mov    %eax,-0x8(%ebx)
 53b:	8b 42 04             	mov    0x4(%edx),%eax
 53e:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 541:	39 f1                	cmp    %esi,%ecx
 543:	75 ca                	jne    50f <free+0x3b>
 545:	03 43 fc             	add    -0x4(%ebx),%eax
 548:	89 42 04             	mov    %eax,0x4(%edx)
 54b:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 54e:	89 0a                	mov    %ecx,(%edx)
 550:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 556:	5b                   	pop    %ebx
 557:	5e                   	pop    %esi
 558:	5f                   	pop    %edi
 559:	5d                   	pop    %ebp
 55a:	c3                   	ret    
 55b:	90                   	nop

0000055c <malloc>:
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	53                   	push   %ebx
 562:	83 ec 0c             	sub    $0xc,%esp
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	8d 78 07             	lea    0x7(%eax),%edi
 56b:	c1 ef 03             	shr    $0x3,%edi
 56e:	47                   	inc    %edi
 56f:	8b 15 bc 06 00 00    	mov    0x6bc,%edx
 575:	85 d2                	test   %edx,%edx
 577:	0f 84 93 00 00 00    	je     610 <malloc+0xb4>
 57d:	8b 02                	mov    (%edx),%eax
 57f:	8b 48 04             	mov    0x4(%eax),%ecx
 582:	39 f9                	cmp    %edi,%ecx
 584:	73 62                	jae    5e8 <malloc+0x8c>
 586:	89 fb                	mov    %edi,%ebx
 588:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 58e:	72 78                	jb     608 <malloc+0xac>
 590:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 597:	eb 0e                	jmp    5a7 <malloc+0x4b>
 599:	8d 76 00             	lea    0x0(%esi),%esi
 59c:	89 c2                	mov    %eax,%edx
 59e:	8b 02                	mov    (%edx),%eax
 5a0:	8b 48 04             	mov    0x4(%eax),%ecx
 5a3:	39 f9                	cmp    %edi,%ecx
 5a5:	73 41                	jae    5e8 <malloc+0x8c>
 5a7:	39 05 bc 06 00 00    	cmp    %eax,0x6bc
 5ad:	75 ed                	jne    59c <malloc+0x40>
 5af:	83 ec 0c             	sub    $0xc,%esp
 5b2:	56                   	push   %esi
 5b3:	e8 f7 fc ff ff       	call   2af <sbrk>
 5b8:	83 c4 10             	add    $0x10,%esp
 5bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5be:	74 1c                	je     5dc <malloc+0x80>
 5c0:	89 58 04             	mov    %ebx,0x4(%eax)
 5c3:	83 ec 0c             	sub    $0xc,%esp
 5c6:	83 c0 08             	add    $0x8,%eax
 5c9:	50                   	push   %eax
 5ca:	e8 05 ff ff ff       	call   4d4 <free>
 5cf:	8b 15 bc 06 00 00    	mov    0x6bc,%edx
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	85 d2                	test   %edx,%edx
 5da:	75 c2                	jne    59e <malloc+0x42>
 5dc:	31 c0                	xor    %eax,%eax
 5de:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e1:	5b                   	pop    %ebx
 5e2:	5e                   	pop    %esi
 5e3:	5f                   	pop    %edi
 5e4:	5d                   	pop    %ebp
 5e5:	c3                   	ret    
 5e6:	66 90                	xchg   %ax,%ax
 5e8:	39 cf                	cmp    %ecx,%edi
 5ea:	74 4c                	je     638 <malloc+0xdc>
 5ec:	29 f9                	sub    %edi,%ecx
 5ee:	89 48 04             	mov    %ecx,0x4(%eax)
 5f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5f4:	89 78 04             	mov    %edi,0x4(%eax)
 5f7:	89 15 bc 06 00 00    	mov    %edx,0x6bc
 5fd:	83 c0 08             	add    $0x8,%eax
 600:	8d 65 f4             	lea    -0xc(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
 608:	bb 00 10 00 00       	mov    $0x1000,%ebx
 60d:	eb 81                	jmp    590 <malloc+0x34>
 60f:	90                   	nop
 610:	c7 05 bc 06 00 00 c0 	movl   $0x6c0,0x6bc
 617:	06 00 00 
 61a:	c7 05 c0 06 00 00 c0 	movl   $0x6c0,0x6c0
 621:	06 00 00 
 624:	c7 05 c4 06 00 00 00 	movl   $0x0,0x6c4
 62b:	00 00 00 
 62e:	b8 c0 06 00 00       	mov    $0x6c0,%eax
 633:	e9 4e ff ff ff       	jmp    586 <malloc+0x2a>
 638:	8b 08                	mov    (%eax),%ecx
 63a:	89 0a                	mov    %ecx,(%edx)
 63c:	eb b9                	jmp    5f7 <malloc+0x9b>
