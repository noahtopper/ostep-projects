
_test_2:     file format elf32-i386


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
  17:	e8 bb 02 00 00       	call   2d7 <getreadcount>
  1c:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
  22:	e8 08 02 00 00       	call   22f <fork>
  27:	89 c7                	mov    %eax,%edi
  29:	bb a0 86 01 00       	mov    $0x186a0,%ebx
  2e:	8d 75 84             	lea    -0x7c(%ebp),%esi
  31:	8d 76 00             	lea    0x0(%esi),%esi
  34:	51                   	push   %ecx
  35:	6a 01                	push   $0x1
  37:	56                   	push   %esi
  38:	6a 04                	push   $0x4
  3a:	e8 10 02 00 00       	call   24f <read>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	4b                   	dec    %ebx
  43:	75 ef                	jne    34 <main+0x34>
  45:	85 ff                	test   %edi,%edi
  47:	7e 23                	jle    6c <main+0x6c>
  49:	e8 f1 01 00 00       	call   23f <wait>
  4e:	e8 84 02 00 00       	call   2d7 <getreadcount>
  53:	52                   	push   %edx
  54:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
  5a:	29 d0                	sub    %edx,%eax
  5c:	50                   	push   %eax
  5d:	68 50 06 00 00       	push   $0x650
  62:	6a 01                	push   $0x1
  64:	e8 03 03 00 00       	call   36c <printf>
  69:	83 c4 10             	add    $0x10,%esp
  6c:	e8 c6 01 00 00       	call   237 <exit>
  71:	66 90                	xchg   %ax,%ax
  73:	90                   	nop

00000074 <strcpy>:
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	53                   	push   %ebx
  78:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7e:	31 c0                	xor    %eax,%eax
  80:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  83:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  86:	40                   	inc    %eax
  87:	84 d2                	test   %dl,%dl
  89:	75 f5                	jne    80 <strcpy+0xc>
  8b:	89 c8                	mov    %ecx,%eax
  8d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  90:	c9                   	leave  
  91:	c3                   	ret    
  92:	66 90                	xchg   %ax,%ax

00000094 <strcmp>:
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	53                   	push   %ebx
  98:	8b 55 08             	mov    0x8(%ebp),%edx
  9b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  9e:	0f b6 02             	movzbl (%edx),%eax
  a1:	84 c0                	test   %al,%al
  a3:	75 10                	jne    b5 <strcmp+0x21>
  a5:	eb 2a                	jmp    d1 <strcmp+0x3d>
  a7:	90                   	nop
  a8:	42                   	inc    %edx
  a9:	8d 4b 01             	lea    0x1(%ebx),%ecx
  ac:	0f b6 02             	movzbl (%edx),%eax
  af:	84 c0                	test   %al,%al
  b1:	74 11                	je     c4 <strcmp+0x30>
  b3:	89 cb                	mov    %ecx,%ebx
  b5:	0f b6 0b             	movzbl (%ebx),%ecx
  b8:	38 c1                	cmp    %al,%cl
  ba:	74 ec                	je     a8 <strcmp+0x14>
  bc:	29 c8                	sub    %ecx,%eax
  be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c1:	c9                   	leave  
  c2:	c3                   	ret    
  c3:	90                   	nop
  c4:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  c8:	31 c0                	xor    %eax,%eax
  ca:	29 c8                	sub    %ecx,%eax
  cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cf:	c9                   	leave  
  d0:	c3                   	ret    
  d1:	0f b6 0b             	movzbl (%ebx),%ecx
  d4:	31 c0                	xor    %eax,%eax
  d6:	eb e4                	jmp    bc <strcmp+0x28>

000000d8 <strlen>:
  d8:	55                   	push   %ebp
  d9:	89 e5                	mov    %esp,%ebp
  db:	8b 55 08             	mov    0x8(%ebp),%edx
  de:	80 3a 00             	cmpb   $0x0,(%edx)
  e1:	74 15                	je     f8 <strlen+0x20>
  e3:	31 c0                	xor    %eax,%eax
  e5:	8d 76 00             	lea    0x0(%esi),%esi
  e8:	40                   	inc    %eax
  e9:	89 c1                	mov    %eax,%ecx
  eb:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ef:	75 f7                	jne    e8 <strlen+0x10>
  f1:	89 c8                	mov    %ecx,%eax
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    
  f5:	8d 76 00             	lea    0x0(%esi),%esi
  f8:	31 c9                	xor    %ecx,%ecx
  fa:	89 c8                	mov    %ecx,%eax
  fc:	5d                   	pop    %ebp
  fd:	c3                   	ret    
  fe:	66 90                	xchg   %ax,%ax

00000100 <memset>:
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	57                   	push   %edi
 104:	8b 7d 08             	mov    0x8(%ebp),%edi
 107:	8b 4d 10             	mov    0x10(%ebp),%ecx
 10a:	8b 45 0c             	mov    0xc(%ebp),%eax
 10d:	fc                   	cld    
 10e:	f3 aa                	rep stos %al,%es:(%edi)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	8b 7d fc             	mov    -0x4(%ebp),%edi
 116:	c9                   	leave  
 117:	c3                   	ret    

00000118 <strchr>:
 118:	55                   	push   %ebp
 119:	89 e5                	mov    %esp,%ebp
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 121:	8a 10                	mov    (%eax),%dl
 123:	84 d2                	test   %dl,%dl
 125:	75 0c                	jne    133 <strchr+0x1b>
 127:	eb 13                	jmp    13c <strchr+0x24>
 129:	8d 76 00             	lea    0x0(%esi),%esi
 12c:	40                   	inc    %eax
 12d:	8a 10                	mov    (%eax),%dl
 12f:	84 d2                	test   %dl,%dl
 131:	74 09                	je     13c <strchr+0x24>
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f5                	jne    12c <strchr+0x14>
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d 76 00             	lea    0x0(%esi),%esi
 13c:	31 c0                	xor    %eax,%eax
 13e:	5d                   	pop    %ebp
 13f:	c3                   	ret    

00000140 <gets>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	83 ec 1c             	sub    $0x1c,%esp
 149:	31 db                	xor    %ebx,%ebx
 14b:	8d 75 e7             	lea    -0x19(%ebp),%esi
 14e:	eb 24                	jmp    174 <gets+0x34>
 150:	50                   	push   %eax
 151:	6a 01                	push   $0x1
 153:	56                   	push   %esi
 154:	6a 00                	push   $0x0
 156:	e8 f4 00 00 00       	call   24f <read>
 15b:	83 c4 10             	add    $0x10,%esp
 15e:	85 c0                	test   %eax,%eax
 160:	7e 1a                	jle    17c <gets+0x3c>
 162:	8a 45 e7             	mov    -0x19(%ebp),%al
 165:	8b 55 08             	mov    0x8(%ebp),%edx
 168:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 16c:	3c 0a                	cmp    $0xa,%al
 16e:	74 0e                	je     17e <gets+0x3e>
 170:	3c 0d                	cmp    $0xd,%al
 172:	74 0a                	je     17e <gets+0x3e>
 174:	89 df                	mov    %ebx,%edi
 176:	43                   	inc    %ebx
 177:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 17a:	7c d4                	jl     150 <gets+0x10>
 17c:	89 fb                	mov    %edi,%ebx
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 185:	8d 65 f4             	lea    -0xc(%ebp),%esp
 188:	5b                   	pop    %ebx
 189:	5e                   	pop    %esi
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    
 18d:	8d 76 00             	lea    0x0(%esi),%esi

00000190 <stat>:
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	pushl  0x8(%ebp)
 19d:	e8 d5 00 00 00       	call   277 <open>
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
 1a7:	78 27                	js     1d0 <stat+0x40>
 1a9:	89 c3                	mov    %eax,%ebx
 1ab:	83 ec 08             	sub    $0x8,%esp
 1ae:	ff 75 0c             	pushl  0xc(%ebp)
 1b1:	50                   	push   %eax
 1b2:	e8 d8 00 00 00       	call   28f <fstat>
 1b7:	89 c6                	mov    %eax,%esi
 1b9:	89 1c 24             	mov    %ebx,(%esp)
 1bc:	e8 9e 00 00 00       	call   25f <close>
 1c1:	83 c4 10             	add    $0x10,%esp
 1c4:	89 f0                	mov    %esi,%eax
 1c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1d5:	eb ed                	jmp    1c4 <stat+0x34>
 1d7:	90                   	nop

000001d8 <atoi>:
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	53                   	push   %ebx
 1dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1df:	0f be 01             	movsbl (%ecx),%eax
 1e2:	8d 50 d0             	lea    -0x30(%eax),%edx
 1e5:	80 fa 09             	cmp    $0x9,%dl
 1e8:	ba 00 00 00 00       	mov    $0x0,%edx
 1ed:	77 16                	ja     205 <atoi+0x2d>
 1ef:	90                   	nop
 1f0:	41                   	inc    %ecx
 1f1:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1f4:	01 d2                	add    %edx,%edx
 1f6:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1fa:	0f be 01             	movsbl (%ecx),%eax
 1fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 200:	80 fb 09             	cmp    $0x9,%bl
 203:	76 eb                	jbe    1f0 <atoi+0x18>
 205:	89 d0                	mov    %edx,%eax
 207:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 20a:	c9                   	leave  
 20b:	c3                   	ret    

0000020c <memmove>:
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	57                   	push   %edi
 210:	56                   	push   %esi
 211:	8b 55 08             	mov    0x8(%ebp),%edx
 214:	8b 75 0c             	mov    0xc(%ebp),%esi
 217:	8b 45 10             	mov    0x10(%ebp),%eax
 21a:	85 c0                	test   %eax,%eax
 21c:	7e 0b                	jle    229 <memmove+0x1d>
 21e:	01 d0                	add    %edx,%eax
 220:	89 d7                	mov    %edx,%edi
 222:	66 90                	xchg   %ax,%ax
 224:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 225:	39 f8                	cmp    %edi,%eax
 227:	75 fb                	jne    224 <memmove+0x18>
 229:	89 d0                	mov    %edx,%eax
 22b:	5e                   	pop    %esi
 22c:	5f                   	pop    %edi
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    

0000022f <fork>:
 22f:	b8 01 00 00 00       	mov    $0x1,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <exit>:
 237:	b8 02 00 00 00       	mov    $0x2,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <wait>:
 23f:	b8 03 00 00 00       	mov    $0x3,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <pipe>:
 247:	b8 04 00 00 00       	mov    $0x4,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <read>:
 24f:	b8 05 00 00 00       	mov    $0x5,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <write>:
 257:	b8 10 00 00 00       	mov    $0x10,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <close>:
 25f:	b8 15 00 00 00       	mov    $0x15,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <kill>:
 267:	b8 06 00 00 00       	mov    $0x6,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <exec>:
 26f:	b8 07 00 00 00       	mov    $0x7,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <open>:
 277:	b8 0f 00 00 00       	mov    $0xf,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <mknod>:
 27f:	b8 11 00 00 00       	mov    $0x11,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <unlink>:
 287:	b8 12 00 00 00       	mov    $0x12,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <fstat>:
 28f:	b8 08 00 00 00       	mov    $0x8,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <link>:
 297:	b8 13 00 00 00       	mov    $0x13,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <mkdir>:
 29f:	b8 14 00 00 00       	mov    $0x14,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <chdir>:
 2a7:	b8 09 00 00 00       	mov    $0x9,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <dup>:
 2af:	b8 0a 00 00 00       	mov    $0xa,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <getpid>:
 2b7:	b8 0b 00 00 00       	mov    $0xb,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <sbrk>:
 2bf:	b8 0c 00 00 00       	mov    $0xc,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <sleep>:
 2c7:	b8 0d 00 00 00       	mov    $0xd,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <uptime>:
 2cf:	b8 0e 00 00 00       	mov    $0xe,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <getreadcount>:
 2d7:	b8 16 00 00 00       	mov    $0x16,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    
 2df:	90                   	nop

000002e0 <printint>:
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
 2e6:	83 ec 3c             	sub    $0x3c,%esp
 2e9:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2ec:	89 cb                	mov    %ecx,%ebx
 2ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2f1:	85 c9                	test   %ecx,%ecx
 2f3:	74 04                	je     2f9 <printint+0x19>
 2f5:	85 d2                	test   %edx,%edx
 2f7:	78 6b                	js     364 <printint+0x84>
 2f9:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2fc:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 303:	31 c9                	xor    %ecx,%ecx
 305:	8d 75 d7             	lea    -0x29(%ebp),%esi
 308:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 30b:	31 d2                	xor    %edx,%edx
 30d:	f7 f3                	div    %ebx
 30f:	89 cf                	mov    %ecx,%edi
 311:	8d 49 01             	lea    0x1(%ecx),%ecx
 314:	8a 92 c4 06 00 00    	mov    0x6c4(%edx),%dl
 31a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 31e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 321:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 324:	39 da                	cmp    %ebx,%edx
 326:	73 e0                	jae    308 <printint+0x28>
 328:	8b 55 08             	mov    0x8(%ebp),%edx
 32b:	85 d2                	test   %edx,%edx
 32d:	74 07                	je     336 <printint+0x56>
 32f:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 334:	89 cf                	mov    %ecx,%edi
 336:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 339:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 33d:	8d 76 00             	lea    0x0(%esi),%esi
 340:	8a 07                	mov    (%edi),%al
 342:	88 45 d7             	mov    %al,-0x29(%ebp)
 345:	50                   	push   %eax
 346:	6a 01                	push   $0x1
 348:	56                   	push   %esi
 349:	ff 75 c0             	pushl  -0x40(%ebp)
 34c:	e8 06 ff ff ff       	call   257 <write>
 351:	89 f8                	mov    %edi,%eax
 353:	4f                   	dec    %edi
 354:	83 c4 10             	add    $0x10,%esp
 357:	39 d8                	cmp    %ebx,%eax
 359:	75 e5                	jne    340 <printint+0x60>
 35b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35e:	5b                   	pop    %ebx
 35f:	5e                   	pop    %esi
 360:	5f                   	pop    %edi
 361:	5d                   	pop    %ebp
 362:	c3                   	ret    
 363:	90                   	nop
 364:	f7 da                	neg    %edx
 366:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 369:	eb 98                	jmp    303 <printint+0x23>
 36b:	90                   	nop

0000036c <printf>:
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	57                   	push   %edi
 370:	56                   	push   %esi
 371:	53                   	push   %ebx
 372:	83 ec 2c             	sub    $0x2c,%esp
 375:	8b 75 08             	mov    0x8(%ebp),%esi
 378:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 37b:	8a 13                	mov    (%ebx),%dl
 37d:	84 d2                	test   %dl,%dl
 37f:	74 5c                	je     3dd <printf+0x71>
 381:	43                   	inc    %ebx
 382:	8d 45 10             	lea    0x10(%ebp),%eax
 385:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 388:	31 ff                	xor    %edi,%edi
 38a:	eb 20                	jmp    3ac <printf+0x40>
 38c:	83 f8 25             	cmp    $0x25,%eax
 38f:	74 3f                	je     3d0 <printf+0x64>
 391:	88 55 e7             	mov    %dl,-0x19(%ebp)
 394:	50                   	push   %eax
 395:	6a 01                	push   $0x1
 397:	8d 45 e7             	lea    -0x19(%ebp),%eax
 39a:	50                   	push   %eax
 39b:	56                   	push   %esi
 39c:	e8 b6 fe ff ff       	call   257 <write>
 3a1:	83 c4 10             	add    $0x10,%esp
 3a4:	43                   	inc    %ebx
 3a5:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3a8:	84 d2                	test   %dl,%dl
 3aa:	74 31                	je     3dd <printf+0x71>
 3ac:	0f b6 c2             	movzbl %dl,%eax
 3af:	85 ff                	test   %edi,%edi
 3b1:	74 d9                	je     38c <printf+0x20>
 3b3:	83 ff 25             	cmp    $0x25,%edi
 3b6:	75 ec                	jne    3a4 <printf+0x38>
 3b8:	83 f8 25             	cmp    $0x25,%eax
 3bb:	0f 84 03 01 00 00    	je     4c4 <printf+0x158>
 3c1:	83 e8 63             	sub    $0x63,%eax
 3c4:	83 f8 15             	cmp    $0x15,%eax
 3c7:	77 1f                	ja     3e8 <printf+0x7c>
 3c9:	ff 24 85 6c 06 00 00 	jmp    *0x66c(,%eax,4)
 3d0:	bf 25 00 00 00       	mov    $0x25,%edi
 3d5:	43                   	inc    %ebx
 3d6:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3d9:	84 d2                	test   %dl,%dl
 3db:	75 cf                	jne    3ac <printf+0x40>
 3dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5f                   	pop    %edi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret    
 3e5:	8d 76 00             	lea    0x0(%esi),%esi
 3e8:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3eb:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3ef:	50                   	push   %eax
 3f0:	6a 01                	push   $0x1
 3f2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	e8 5b fe ff ff       	call   257 <write>
 3fc:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3ff:	88 55 e7             	mov    %dl,-0x19(%ebp)
 402:	83 c4 0c             	add    $0xc,%esp
 405:	6a 01                	push   $0x1
 407:	57                   	push   %edi
 408:	56                   	push   %esi
 409:	e8 49 fe ff ff       	call   257 <write>
 40e:	83 c4 10             	add    $0x10,%esp
 411:	31 ff                	xor    %edi,%edi
 413:	eb 8f                	jmp    3a4 <printf+0x38>
 415:	8d 76 00             	lea    0x0(%esi),%esi
 418:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 41b:	8b 17                	mov    (%edi),%edx
 41d:	83 ec 0c             	sub    $0xc,%esp
 420:	6a 00                	push   $0x0
 422:	b9 10 00 00 00       	mov    $0x10,%ecx
 427:	89 f0                	mov    %esi,%eax
 429:	e8 b2 fe ff ff       	call   2e0 <printint>
 42e:	83 c7 04             	add    $0x4,%edi
 431:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 434:	83 c4 10             	add    $0x10,%esp
 437:	31 ff                	xor    %edi,%edi
 439:	e9 66 ff ff ff       	jmp    3a4 <printf+0x38>
 43e:	66 90                	xchg   %ax,%ax
 440:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 443:	8b 10                	mov    (%eax),%edx
 445:	83 c0 04             	add    $0x4,%eax
 448:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 44b:	85 d2                	test   %edx,%edx
 44d:	0f 84 81 00 00 00    	je     4d4 <printf+0x168>
 453:	8a 02                	mov    (%edx),%al
 455:	84 c0                	test   %al,%al
 457:	0f 84 80 00 00 00    	je     4dd <printf+0x171>
 45d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 460:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 463:	89 d3                	mov    %edx,%ebx
 465:	8d 76 00             	lea    0x0(%esi),%esi
 468:	88 45 e7             	mov    %al,-0x19(%ebp)
 46b:	50                   	push   %eax
 46c:	6a 01                	push   $0x1
 46e:	57                   	push   %edi
 46f:	56                   	push   %esi
 470:	e8 e2 fd ff ff       	call   257 <write>
 475:	43                   	inc    %ebx
 476:	8a 03                	mov    (%ebx),%al
 478:	83 c4 10             	add    $0x10,%esp
 47b:	84 c0                	test   %al,%al
 47d:	75 e9                	jne    468 <printf+0xfc>
 47f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 482:	31 ff                	xor    %edi,%edi
 484:	e9 1b ff ff ff       	jmp    3a4 <printf+0x38>
 489:	8d 76 00             	lea    0x0(%esi),%esi
 48c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 48f:	8b 17                	mov    (%edi),%edx
 491:	83 ec 0c             	sub    $0xc,%esp
 494:	6a 01                	push   $0x1
 496:	b9 0a 00 00 00       	mov    $0xa,%ecx
 49b:	eb 8a                	jmp    427 <printf+0xbb>
 49d:	8d 76 00             	lea    0x0(%esi),%esi
 4a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4a3:	8b 00                	mov    (%eax),%eax
 4a5:	88 45 e7             	mov    %al,-0x19(%ebp)
 4a8:	51                   	push   %ecx
 4a9:	6a 01                	push   $0x1
 4ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ae:	57                   	push   %edi
 4af:	56                   	push   %esi
 4b0:	e8 a2 fd ff ff       	call   257 <write>
 4b5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4b9:	83 c4 10             	add    $0x10,%esp
 4bc:	31 ff                	xor    %edi,%edi
 4be:	e9 e1 fe ff ff       	jmp    3a4 <printf+0x38>
 4c3:	90                   	nop
 4c4:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4c7:	52                   	push   %edx
 4c8:	6a 01                	push   $0x1
 4ca:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4cd:	e9 35 ff ff ff       	jmp    407 <printf+0x9b>
 4d2:	66 90                	xchg   %ax,%ax
 4d4:	b0 28                	mov    $0x28,%al
 4d6:	ba 64 06 00 00       	mov    $0x664,%edx
 4db:	eb 80                	jmp    45d <printf+0xf1>
 4dd:	31 ff                	xor    %edi,%edi
 4df:	e9 c0 fe ff ff       	jmp    3a4 <printf+0x38>

000004e4 <free>:
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	57                   	push   %edi
 4e8:	56                   	push   %esi
 4e9:	53                   	push   %ebx
 4ea:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4ed:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4f0:	a1 d8 06 00 00       	mov    0x6d8,%eax
 4f5:	8d 76 00             	lea    0x0(%esi),%esi
 4f8:	89 c2                	mov    %eax,%edx
 4fa:	8b 00                	mov    (%eax),%eax
 4fc:	39 ca                	cmp    %ecx,%edx
 4fe:	73 2c                	jae    52c <free+0x48>
 500:	39 c1                	cmp    %eax,%ecx
 502:	72 04                	jb     508 <free+0x24>
 504:	39 c2                	cmp    %eax,%edx
 506:	72 f0                	jb     4f8 <free+0x14>
 508:	8b 73 fc             	mov    -0x4(%ebx),%esi
 50b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 50e:	39 f8                	cmp    %edi,%eax
 510:	74 2c                	je     53e <free+0x5a>
 512:	89 43 f8             	mov    %eax,-0x8(%ebx)
 515:	8b 42 04             	mov    0x4(%edx),%eax
 518:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 51b:	39 f1                	cmp    %esi,%ecx
 51d:	74 36                	je     555 <free+0x71>
 51f:	89 0a                	mov    %ecx,(%edx)
 521:	89 15 d8 06 00 00    	mov    %edx,0x6d8
 527:	5b                   	pop    %ebx
 528:	5e                   	pop    %esi
 529:	5f                   	pop    %edi
 52a:	5d                   	pop    %ebp
 52b:	c3                   	ret    
 52c:	39 c2                	cmp    %eax,%edx
 52e:	72 c8                	jb     4f8 <free+0x14>
 530:	39 c1                	cmp    %eax,%ecx
 532:	73 c4                	jae    4f8 <free+0x14>
 534:	8b 73 fc             	mov    -0x4(%ebx),%esi
 537:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 53a:	39 f8                	cmp    %edi,%eax
 53c:	75 d4                	jne    512 <free+0x2e>
 53e:	03 70 04             	add    0x4(%eax),%esi
 541:	89 73 fc             	mov    %esi,-0x4(%ebx)
 544:	8b 02                	mov    (%edx),%eax
 546:	8b 00                	mov    (%eax),%eax
 548:	89 43 f8             	mov    %eax,-0x8(%ebx)
 54b:	8b 42 04             	mov    0x4(%edx),%eax
 54e:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 551:	39 f1                	cmp    %esi,%ecx
 553:	75 ca                	jne    51f <free+0x3b>
 555:	03 43 fc             	add    -0x4(%ebx),%eax
 558:	89 42 04             	mov    %eax,0x4(%edx)
 55b:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 55e:	89 0a                	mov    %ecx,(%edx)
 560:	89 15 d8 06 00 00    	mov    %edx,0x6d8
 566:	5b                   	pop    %ebx
 567:	5e                   	pop    %esi
 568:	5f                   	pop    %edi
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret    
 56b:	90                   	nop

0000056c <malloc>:
 56c:	55                   	push   %ebp
 56d:	89 e5                	mov    %esp,%ebp
 56f:	57                   	push   %edi
 570:	56                   	push   %esi
 571:	53                   	push   %ebx
 572:	83 ec 0c             	sub    $0xc,%esp
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	8d 78 07             	lea    0x7(%eax),%edi
 57b:	c1 ef 03             	shr    $0x3,%edi
 57e:	47                   	inc    %edi
 57f:	8b 15 d8 06 00 00    	mov    0x6d8,%edx
 585:	85 d2                	test   %edx,%edx
 587:	0f 84 93 00 00 00    	je     620 <malloc+0xb4>
 58d:	8b 02                	mov    (%edx),%eax
 58f:	8b 48 04             	mov    0x4(%eax),%ecx
 592:	39 f9                	cmp    %edi,%ecx
 594:	73 62                	jae    5f8 <malloc+0x8c>
 596:	89 fb                	mov    %edi,%ebx
 598:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 59e:	72 78                	jb     618 <malloc+0xac>
 5a0:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 5a7:	eb 0e                	jmp    5b7 <malloc+0x4b>
 5a9:	8d 76 00             	lea    0x0(%esi),%esi
 5ac:	89 c2                	mov    %eax,%edx
 5ae:	8b 02                	mov    (%edx),%eax
 5b0:	8b 48 04             	mov    0x4(%eax),%ecx
 5b3:	39 f9                	cmp    %edi,%ecx
 5b5:	73 41                	jae    5f8 <malloc+0x8c>
 5b7:	39 05 d8 06 00 00    	cmp    %eax,0x6d8
 5bd:	75 ed                	jne    5ac <malloc+0x40>
 5bf:	83 ec 0c             	sub    $0xc,%esp
 5c2:	56                   	push   %esi
 5c3:	e8 f7 fc ff ff       	call   2bf <sbrk>
 5c8:	83 c4 10             	add    $0x10,%esp
 5cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 5ce:	74 1c                	je     5ec <malloc+0x80>
 5d0:	89 58 04             	mov    %ebx,0x4(%eax)
 5d3:	83 ec 0c             	sub    $0xc,%esp
 5d6:	83 c0 08             	add    $0x8,%eax
 5d9:	50                   	push   %eax
 5da:	e8 05 ff ff ff       	call   4e4 <free>
 5df:	8b 15 d8 06 00 00    	mov    0x6d8,%edx
 5e5:	83 c4 10             	add    $0x10,%esp
 5e8:	85 d2                	test   %edx,%edx
 5ea:	75 c2                	jne    5ae <malloc+0x42>
 5ec:	31 c0                	xor    %eax,%eax
 5ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5f1:	5b                   	pop    %ebx
 5f2:	5e                   	pop    %esi
 5f3:	5f                   	pop    %edi
 5f4:	5d                   	pop    %ebp
 5f5:	c3                   	ret    
 5f6:	66 90                	xchg   %ax,%ax
 5f8:	39 cf                	cmp    %ecx,%edi
 5fa:	74 4c                	je     648 <malloc+0xdc>
 5fc:	29 f9                	sub    %edi,%ecx
 5fe:	89 48 04             	mov    %ecx,0x4(%eax)
 601:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 604:	89 78 04             	mov    %edi,0x4(%eax)
 607:	89 15 d8 06 00 00    	mov    %edx,0x6d8
 60d:	83 c0 08             	add    $0x8,%eax
 610:	8d 65 f4             	lea    -0xc(%ebp),%esp
 613:	5b                   	pop    %ebx
 614:	5e                   	pop    %esi
 615:	5f                   	pop    %edi
 616:	5d                   	pop    %ebp
 617:	c3                   	ret    
 618:	bb 00 10 00 00       	mov    $0x1000,%ebx
 61d:	eb 81                	jmp    5a0 <malloc+0x34>
 61f:	90                   	nop
 620:	c7 05 d8 06 00 00 dc 	movl   $0x6dc,0x6d8
 627:	06 00 00 
 62a:	c7 05 dc 06 00 00 dc 	movl   $0x6dc,0x6dc
 631:	06 00 00 
 634:	c7 05 e0 06 00 00 00 	movl   $0x0,0x6e0
 63b:	00 00 00 
 63e:	b8 dc 06 00 00       	mov    $0x6dc,%eax
 643:	e9 4e ff ff ff       	jmp    596 <malloc+0x2a>
 648:	8b 08                	mov    (%eax),%ecx
 64a:	89 0a                	mov    %ecx,(%edx)
 64c:	eb b9                	jmp    607 <malloc+0x9b>
