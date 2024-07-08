
_mkdir:     file format elf32-i386


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
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 3a                	jle    58 <main+0x58>
  1e:	83 c3 04             	add    $0x4,%ebx
  21:	bf 01 00 00 00       	mov    $0x1,%edi
  26:	eb 08                	jmp    30 <main+0x30>
  28:	47                   	inc    %edi
  29:	83 c3 04             	add    $0x4,%ebx
  2c:	39 fe                	cmp    %edi,%esi
  2e:	74 23                	je     53 <main+0x53>
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 5d 02 00 00       	call   297 <mkdir>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	79 e7                	jns    28 <main+0x28>
  41:	50                   	push   %eax
  42:	ff 33                	pushl  (%ebx)
  44:	68 5f 06 00 00       	push   $0x65f
  49:	6a 02                	push   $0x2
  4b:	e8 14 03 00 00       	call   364 <printf>
  50:	83 c4 10             	add    $0x10,%esp
  53:	e8 d7 01 00 00       	call   22f <exit>
  58:	52                   	push   %edx
  59:	52                   	push   %edx
  5a:	68 48 06 00 00       	push   $0x648
  5f:	6a 02                	push   $0x2
  61:	e8 fe 02 00 00       	call   364 <printf>
  66:	e8 c4 01 00 00       	call   22f <exit>
  6b:	90                   	nop

0000006c <strcpy>:
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	53                   	push   %ebx
  70:	8b 4d 08             	mov    0x8(%ebp),%ecx
  73:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  76:	31 c0                	xor    %eax,%eax
  78:	8a 14 03             	mov    (%ebx,%eax,1),%dl
  7b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  7e:	40                   	inc    %eax
  7f:	84 d2                	test   %dl,%dl
  81:	75 f5                	jne    78 <strcpy+0xc>
  83:	89 c8                	mov    %ecx,%eax
  85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  88:	c9                   	leave  
  89:	c3                   	ret    
  8a:	66 90                	xchg   %ax,%ax

0000008c <strcmp>:
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	53                   	push   %ebx
  90:	8b 55 08             	mov    0x8(%ebp),%edx
  93:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  96:	0f b6 02             	movzbl (%edx),%eax
  99:	84 c0                	test   %al,%al
  9b:	75 10                	jne    ad <strcmp+0x21>
  9d:	eb 2a                	jmp    c9 <strcmp+0x3d>
  9f:	90                   	nop
  a0:	42                   	inc    %edx
  a1:	8d 4b 01             	lea    0x1(%ebx),%ecx
  a4:	0f b6 02             	movzbl (%edx),%eax
  a7:	84 c0                	test   %al,%al
  a9:	74 11                	je     bc <strcmp+0x30>
  ab:	89 cb                	mov    %ecx,%ebx
  ad:	0f b6 0b             	movzbl (%ebx),%ecx
  b0:	38 c1                	cmp    %al,%cl
  b2:	74 ec                	je     a0 <strcmp+0x14>
  b4:	29 c8                	sub    %ecx,%eax
  b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b9:	c9                   	leave  
  ba:	c3                   	ret    
  bb:	90                   	nop
  bc:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
  c0:	31 c0                	xor    %eax,%eax
  c2:	29 c8                	sub    %ecx,%eax
  c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c7:	c9                   	leave  
  c8:	c3                   	ret    
  c9:	0f b6 0b             	movzbl (%ebx),%ecx
  cc:	31 c0                	xor    %eax,%eax
  ce:	eb e4                	jmp    b4 <strcmp+0x28>

000000d0 <strlen>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 55 08             	mov    0x8(%ebp),%edx
  d6:	80 3a 00             	cmpb   $0x0,(%edx)
  d9:	74 15                	je     f0 <strlen+0x20>
  db:	31 c0                	xor    %eax,%eax
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	40                   	inc    %eax
  e1:	89 c1                	mov    %eax,%ecx
  e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  e7:	75 f7                	jne    e0 <strlen+0x10>
  e9:	89 c8                	mov    %ecx,%eax
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	31 c9                	xor    %ecx,%ecx
  f2:	89 c8                	mov    %ecx,%eax
  f4:	5d                   	pop    %ebp
  f5:	c3                   	ret    
  f6:	66 90                	xchg   %ax,%ax

000000f8 <memset>:
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	57                   	push   %edi
  fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  ff:	8b 4d 10             	mov    0x10(%ebp),%ecx
 102:	8b 45 0c             	mov    0xc(%ebp),%eax
 105:	fc                   	cld    
 106:	f3 aa                	rep stos %al,%es:(%edi)
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	8b 7d fc             	mov    -0x4(%ebp),%edi
 10e:	c9                   	leave  
 10f:	c3                   	ret    

00000110 <strchr>:
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	8a 4d 0c             	mov    0xc(%ebp),%cl
 119:	8a 10                	mov    (%eax),%dl
 11b:	84 d2                	test   %dl,%dl
 11d:	75 0c                	jne    12b <strchr+0x1b>
 11f:	eb 13                	jmp    134 <strchr+0x24>
 121:	8d 76 00             	lea    0x0(%esi),%esi
 124:	40                   	inc    %eax
 125:	8a 10                	mov    (%eax),%dl
 127:	84 d2                	test   %dl,%dl
 129:	74 09                	je     134 <strchr+0x24>
 12b:	38 d1                	cmp    %dl,%cl
 12d:	75 f5                	jne    124 <strchr+0x14>
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	8d 76 00             	lea    0x0(%esi),%esi
 134:	31 c0                	xor    %eax,%eax
 136:	5d                   	pop    %ebp
 137:	c3                   	ret    

00000138 <gets>:
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	56                   	push   %esi
 13d:	53                   	push   %ebx
 13e:	83 ec 1c             	sub    $0x1c,%esp
 141:	31 db                	xor    %ebx,%ebx
 143:	8d 75 e7             	lea    -0x19(%ebp),%esi
 146:	eb 24                	jmp    16c <gets+0x34>
 148:	50                   	push   %eax
 149:	6a 01                	push   $0x1
 14b:	56                   	push   %esi
 14c:	6a 00                	push   $0x0
 14e:	e8 f4 00 00 00       	call   247 <read>
 153:	83 c4 10             	add    $0x10,%esp
 156:	85 c0                	test   %eax,%eax
 158:	7e 1a                	jle    174 <gets+0x3c>
 15a:	8a 45 e7             	mov    -0x19(%ebp),%al
 15d:	8b 55 08             	mov    0x8(%ebp),%edx
 160:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 164:	3c 0a                	cmp    $0xa,%al
 166:	74 0e                	je     176 <gets+0x3e>
 168:	3c 0d                	cmp    $0xd,%al
 16a:	74 0a                	je     176 <gets+0x3e>
 16c:	89 df                	mov    %ebx,%edi
 16e:	43                   	inc    %ebx
 16f:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 172:	7c d4                	jl     148 <gets+0x10>
 174:	89 fb                	mov    %edi,%ebx
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 17d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 180:	5b                   	pop    %ebx
 181:	5e                   	pop    %esi
 182:	5f                   	pop    %edi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 76 00             	lea    0x0(%esi),%esi

00000188 <stat>:
 188:	55                   	push   %ebp
 189:	89 e5                	mov    %esp,%ebp
 18b:	56                   	push   %esi
 18c:	53                   	push   %ebx
 18d:	83 ec 08             	sub    $0x8,%esp
 190:	6a 00                	push   $0x0
 192:	ff 75 08             	pushl  0x8(%ebp)
 195:	e8 d5 00 00 00       	call   26f <open>
 19a:	83 c4 10             	add    $0x10,%esp
 19d:	85 c0                	test   %eax,%eax
 19f:	78 27                	js     1c8 <stat+0x40>
 1a1:	89 c3                	mov    %eax,%ebx
 1a3:	83 ec 08             	sub    $0x8,%esp
 1a6:	ff 75 0c             	pushl  0xc(%ebp)
 1a9:	50                   	push   %eax
 1aa:	e8 d8 00 00 00       	call   287 <fstat>
 1af:	89 c6                	mov    %eax,%esi
 1b1:	89 1c 24             	mov    %ebx,(%esp)
 1b4:	e8 9e 00 00 00       	call   257 <close>
 1b9:	83 c4 10             	add    $0x10,%esp
 1bc:	89 f0                	mov    %esi,%eax
 1be:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c1:	5b                   	pop    %ebx
 1c2:	5e                   	pop    %esi
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    
 1c5:	8d 76 00             	lea    0x0(%esi),%esi
 1c8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1cd:	eb ed                	jmp    1bc <stat+0x34>
 1cf:	90                   	nop

000001d0 <atoi>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d7:	0f be 01             	movsbl (%ecx),%eax
 1da:	8d 50 d0             	lea    -0x30(%eax),%edx
 1dd:	80 fa 09             	cmp    $0x9,%dl
 1e0:	ba 00 00 00 00       	mov    $0x0,%edx
 1e5:	77 16                	ja     1fd <atoi+0x2d>
 1e7:	90                   	nop
 1e8:	41                   	inc    %ecx
 1e9:	8d 14 92             	lea    (%edx,%edx,4),%edx
 1ec:	01 d2                	add    %edx,%edx
 1ee:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 1f2:	0f be 01             	movsbl (%ecx),%eax
 1f5:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1f8:	80 fb 09             	cmp    $0x9,%bl
 1fb:	76 eb                	jbe    1e8 <atoi+0x18>
 1fd:	89 d0                	mov    %edx,%eax
 1ff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 202:	c9                   	leave  
 203:	c3                   	ret    

00000204 <memmove>:
 204:	55                   	push   %ebp
 205:	89 e5                	mov    %esp,%ebp
 207:	57                   	push   %edi
 208:	56                   	push   %esi
 209:	8b 55 08             	mov    0x8(%ebp),%edx
 20c:	8b 75 0c             	mov    0xc(%ebp),%esi
 20f:	8b 45 10             	mov    0x10(%ebp),%eax
 212:	85 c0                	test   %eax,%eax
 214:	7e 0b                	jle    221 <memmove+0x1d>
 216:	01 d0                	add    %edx,%eax
 218:	89 d7                	mov    %edx,%edi
 21a:	66 90                	xchg   %ax,%ax
 21c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 21d:	39 f8                	cmp    %edi,%eax
 21f:	75 fb                	jne    21c <memmove+0x18>
 221:	89 d0                	mov    %edx,%eax
 223:	5e                   	pop    %esi
 224:	5f                   	pop    %edi
 225:	5d                   	pop    %ebp
 226:	c3                   	ret    

00000227 <fork>:
 227:	b8 01 00 00 00       	mov    $0x1,%eax
 22c:	cd 40                	int    $0x40
 22e:	c3                   	ret    

0000022f <exit>:
 22f:	b8 02 00 00 00       	mov    $0x2,%eax
 234:	cd 40                	int    $0x40
 236:	c3                   	ret    

00000237 <wait>:
 237:	b8 03 00 00 00       	mov    $0x3,%eax
 23c:	cd 40                	int    $0x40
 23e:	c3                   	ret    

0000023f <pipe>:
 23f:	b8 04 00 00 00       	mov    $0x4,%eax
 244:	cd 40                	int    $0x40
 246:	c3                   	ret    

00000247 <read>:
 247:	b8 05 00 00 00       	mov    $0x5,%eax
 24c:	cd 40                	int    $0x40
 24e:	c3                   	ret    

0000024f <write>:
 24f:	b8 10 00 00 00       	mov    $0x10,%eax
 254:	cd 40                	int    $0x40
 256:	c3                   	ret    

00000257 <close>:
 257:	b8 15 00 00 00       	mov    $0x15,%eax
 25c:	cd 40                	int    $0x40
 25e:	c3                   	ret    

0000025f <kill>:
 25f:	b8 06 00 00 00       	mov    $0x6,%eax
 264:	cd 40                	int    $0x40
 266:	c3                   	ret    

00000267 <exec>:
 267:	b8 07 00 00 00       	mov    $0x7,%eax
 26c:	cd 40                	int    $0x40
 26e:	c3                   	ret    

0000026f <open>:
 26f:	b8 0f 00 00 00       	mov    $0xf,%eax
 274:	cd 40                	int    $0x40
 276:	c3                   	ret    

00000277 <mknod>:
 277:	b8 11 00 00 00       	mov    $0x11,%eax
 27c:	cd 40                	int    $0x40
 27e:	c3                   	ret    

0000027f <unlink>:
 27f:	b8 12 00 00 00       	mov    $0x12,%eax
 284:	cd 40                	int    $0x40
 286:	c3                   	ret    

00000287 <fstat>:
 287:	b8 08 00 00 00       	mov    $0x8,%eax
 28c:	cd 40                	int    $0x40
 28e:	c3                   	ret    

0000028f <link>:
 28f:	b8 13 00 00 00       	mov    $0x13,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <mkdir>:
 297:	b8 14 00 00 00       	mov    $0x14,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <chdir>:
 29f:	b8 09 00 00 00       	mov    $0x9,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <dup>:
 2a7:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <getpid>:
 2af:	b8 0b 00 00 00       	mov    $0xb,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <sbrk>:
 2b7:	b8 0c 00 00 00       	mov    $0xc,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <sleep>:
 2bf:	b8 0d 00 00 00       	mov    $0xd,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <uptime>:
 2c7:	b8 0e 00 00 00       	mov    $0xe,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <getreadcount>:
 2cf:	b8 16 00 00 00       	mov    $0x16,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    
 2d7:	90                   	nop

000002d8 <printint>:
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	57                   	push   %edi
 2dc:	56                   	push   %esi
 2dd:	53                   	push   %ebx
 2de:	83 ec 3c             	sub    $0x3c,%esp
 2e1:	89 45 c0             	mov    %eax,-0x40(%ebp)
 2e4:	89 cb                	mov    %ecx,%ebx
 2e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e9:	85 c9                	test   %ecx,%ecx
 2eb:	74 04                	je     2f1 <printint+0x19>
 2ed:	85 d2                	test   %edx,%edx
 2ef:	78 6b                	js     35c <printint+0x84>
 2f1:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 2f4:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 2fb:	31 c9                	xor    %ecx,%ecx
 2fd:	8d 75 d7             	lea    -0x29(%ebp),%esi
 300:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 303:	31 d2                	xor    %edx,%edx
 305:	f7 f3                	div    %ebx
 307:	89 cf                	mov    %ecx,%edi
 309:	8d 49 01             	lea    0x1(%ecx),%ecx
 30c:	8a 92 dc 06 00 00    	mov    0x6dc(%edx),%dl
 312:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 316:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 319:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 31c:	39 da                	cmp    %ebx,%edx
 31e:	73 e0                	jae    300 <printint+0x28>
 320:	8b 55 08             	mov    0x8(%ebp),%edx
 323:	85 d2                	test   %edx,%edx
 325:	74 07                	je     32e <printint+0x56>
 327:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 32c:	89 cf                	mov    %ecx,%edi
 32e:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 331:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 335:	8d 76 00             	lea    0x0(%esi),%esi
 338:	8a 07                	mov    (%edi),%al
 33a:	88 45 d7             	mov    %al,-0x29(%ebp)
 33d:	50                   	push   %eax
 33e:	6a 01                	push   $0x1
 340:	56                   	push   %esi
 341:	ff 75 c0             	pushl  -0x40(%ebp)
 344:	e8 06 ff ff ff       	call   24f <write>
 349:	89 f8                	mov    %edi,%eax
 34b:	4f                   	dec    %edi
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	39 d8                	cmp    %ebx,%eax
 351:	75 e5                	jne    338 <printint+0x60>
 353:	8d 65 f4             	lea    -0xc(%ebp),%esp
 356:	5b                   	pop    %ebx
 357:	5e                   	pop    %esi
 358:	5f                   	pop    %edi
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    
 35b:	90                   	nop
 35c:	f7 da                	neg    %edx
 35e:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 361:	eb 98                	jmp    2fb <printint+0x23>
 363:	90                   	nop

00000364 <printf>:
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	56                   	push   %esi
 369:	53                   	push   %ebx
 36a:	83 ec 2c             	sub    $0x2c,%esp
 36d:	8b 75 08             	mov    0x8(%ebp),%esi
 370:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 373:	8a 13                	mov    (%ebx),%dl
 375:	84 d2                	test   %dl,%dl
 377:	74 5c                	je     3d5 <printf+0x71>
 379:	43                   	inc    %ebx
 37a:	8d 45 10             	lea    0x10(%ebp),%eax
 37d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 380:	31 ff                	xor    %edi,%edi
 382:	eb 20                	jmp    3a4 <printf+0x40>
 384:	83 f8 25             	cmp    $0x25,%eax
 387:	74 3f                	je     3c8 <printf+0x64>
 389:	88 55 e7             	mov    %dl,-0x19(%ebp)
 38c:	50                   	push   %eax
 38d:	6a 01                	push   $0x1
 38f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 392:	50                   	push   %eax
 393:	56                   	push   %esi
 394:	e8 b6 fe ff ff       	call   24f <write>
 399:	83 c4 10             	add    $0x10,%esp
 39c:	43                   	inc    %ebx
 39d:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3a0:	84 d2                	test   %dl,%dl
 3a2:	74 31                	je     3d5 <printf+0x71>
 3a4:	0f b6 c2             	movzbl %dl,%eax
 3a7:	85 ff                	test   %edi,%edi
 3a9:	74 d9                	je     384 <printf+0x20>
 3ab:	83 ff 25             	cmp    $0x25,%edi
 3ae:	75 ec                	jne    39c <printf+0x38>
 3b0:	83 f8 25             	cmp    $0x25,%eax
 3b3:	0f 84 03 01 00 00    	je     4bc <printf+0x158>
 3b9:	83 e8 63             	sub    $0x63,%eax
 3bc:	83 f8 15             	cmp    $0x15,%eax
 3bf:	77 1f                	ja     3e0 <printf+0x7c>
 3c1:	ff 24 85 84 06 00 00 	jmp    *0x684(,%eax,4)
 3c8:	bf 25 00 00 00       	mov    $0x25,%edi
 3cd:	43                   	inc    %ebx
 3ce:	8a 53 ff             	mov    -0x1(%ebx),%dl
 3d1:	84 d2                	test   %dl,%dl
 3d3:	75 cf                	jne    3a4 <printf+0x40>
 3d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d8:	5b                   	pop    %ebx
 3d9:	5e                   	pop    %esi
 3da:	5f                   	pop    %edi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	88 55 d0             	mov    %dl,-0x30(%ebp)
 3e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 3e7:	50                   	push   %eax
 3e8:	6a 01                	push   $0x1
 3ea:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3ed:	57                   	push   %edi
 3ee:	56                   	push   %esi
 3ef:	e8 5b fe ff ff       	call   24f <write>
 3f4:	8a 55 d0             	mov    -0x30(%ebp),%dl
 3f7:	88 55 e7             	mov    %dl,-0x19(%ebp)
 3fa:	83 c4 0c             	add    $0xc,%esp
 3fd:	6a 01                	push   $0x1
 3ff:	57                   	push   %edi
 400:	56                   	push   %esi
 401:	e8 49 fe ff ff       	call   24f <write>
 406:	83 c4 10             	add    $0x10,%esp
 409:	31 ff                	xor    %edi,%edi
 40b:	eb 8f                	jmp    39c <printf+0x38>
 40d:	8d 76 00             	lea    0x0(%esi),%esi
 410:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 413:	8b 17                	mov    (%edi),%edx
 415:	83 ec 0c             	sub    $0xc,%esp
 418:	6a 00                	push   $0x0
 41a:	b9 10 00 00 00       	mov    $0x10,%ecx
 41f:	89 f0                	mov    %esi,%eax
 421:	e8 b2 fe ff ff       	call   2d8 <printint>
 426:	83 c7 04             	add    $0x4,%edi
 429:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 42c:	83 c4 10             	add    $0x10,%esp
 42f:	31 ff                	xor    %edi,%edi
 431:	e9 66 ff ff ff       	jmp    39c <printf+0x38>
 436:	66 90                	xchg   %ax,%ax
 438:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 43b:	8b 10                	mov    (%eax),%edx
 43d:	83 c0 04             	add    $0x4,%eax
 440:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 443:	85 d2                	test   %edx,%edx
 445:	0f 84 81 00 00 00    	je     4cc <printf+0x168>
 44b:	8a 02                	mov    (%edx),%al
 44d:	84 c0                	test   %al,%al
 44f:	0f 84 80 00 00 00    	je     4d5 <printf+0x171>
 455:	8d 7d e7             	lea    -0x19(%ebp),%edi
 458:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 45b:	89 d3                	mov    %edx,%ebx
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	88 45 e7             	mov    %al,-0x19(%ebp)
 463:	50                   	push   %eax
 464:	6a 01                	push   $0x1
 466:	57                   	push   %edi
 467:	56                   	push   %esi
 468:	e8 e2 fd ff ff       	call   24f <write>
 46d:	43                   	inc    %ebx
 46e:	8a 03                	mov    (%ebx),%al
 470:	83 c4 10             	add    $0x10,%esp
 473:	84 c0                	test   %al,%al
 475:	75 e9                	jne    460 <printf+0xfc>
 477:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 47a:	31 ff                	xor    %edi,%edi
 47c:	e9 1b ff ff ff       	jmp    39c <printf+0x38>
 481:	8d 76 00             	lea    0x0(%esi),%esi
 484:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 487:	8b 17                	mov    (%edi),%edx
 489:	83 ec 0c             	sub    $0xc,%esp
 48c:	6a 01                	push   $0x1
 48e:	b9 0a 00 00 00       	mov    $0xa,%ecx
 493:	eb 8a                	jmp    41f <printf+0xbb>
 495:	8d 76 00             	lea    0x0(%esi),%esi
 498:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 49b:	8b 00                	mov    (%eax),%eax
 49d:	88 45 e7             	mov    %al,-0x19(%ebp)
 4a0:	51                   	push   %ecx
 4a1:	6a 01                	push   $0x1
 4a3:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4a6:	57                   	push   %edi
 4a7:	56                   	push   %esi
 4a8:	e8 a2 fd ff ff       	call   24f <write>
 4ad:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 4b1:	83 c4 10             	add    $0x10,%esp
 4b4:	31 ff                	xor    %edi,%edi
 4b6:	e9 e1 fe ff ff       	jmp    39c <printf+0x38>
 4bb:	90                   	nop
 4bc:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4bf:	52                   	push   %edx
 4c0:	6a 01                	push   $0x1
 4c2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4c5:	e9 35 ff ff ff       	jmp    3ff <printf+0x9b>
 4ca:	66 90                	xchg   %ax,%ax
 4cc:	b0 28                	mov    $0x28,%al
 4ce:	ba 7b 06 00 00       	mov    $0x67b,%edx
 4d3:	eb 80                	jmp    455 <printf+0xf1>
 4d5:	31 ff                	xor    %edi,%edi
 4d7:	e9 c0 fe ff ff       	jmp    39c <printf+0x38>

000004dc <free>:
 4dc:	55                   	push   %ebp
 4dd:	89 e5                	mov    %esp,%ebp
 4df:	57                   	push   %edi
 4e0:	56                   	push   %esi
 4e1:	53                   	push   %ebx
 4e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4e5:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4e8:	a1 f0 06 00 00       	mov    0x6f0,%eax
 4ed:	8d 76 00             	lea    0x0(%esi),%esi
 4f0:	89 c2                	mov    %eax,%edx
 4f2:	8b 00                	mov    (%eax),%eax
 4f4:	39 ca                	cmp    %ecx,%edx
 4f6:	73 2c                	jae    524 <free+0x48>
 4f8:	39 c1                	cmp    %eax,%ecx
 4fa:	72 04                	jb     500 <free+0x24>
 4fc:	39 c2                	cmp    %eax,%edx
 4fe:	72 f0                	jb     4f0 <free+0x14>
 500:	8b 73 fc             	mov    -0x4(%ebx),%esi
 503:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 506:	39 f8                	cmp    %edi,%eax
 508:	74 2c                	je     536 <free+0x5a>
 50a:	89 43 f8             	mov    %eax,-0x8(%ebx)
 50d:	8b 42 04             	mov    0x4(%edx),%eax
 510:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 513:	39 f1                	cmp    %esi,%ecx
 515:	74 36                	je     54d <free+0x71>
 517:	89 0a                	mov    %ecx,(%edx)
 519:	89 15 f0 06 00 00    	mov    %edx,0x6f0
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	39 c2                	cmp    %eax,%edx
 526:	72 c8                	jb     4f0 <free+0x14>
 528:	39 c1                	cmp    %eax,%ecx
 52a:	73 c4                	jae    4f0 <free+0x14>
 52c:	8b 73 fc             	mov    -0x4(%ebx),%esi
 52f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 532:	39 f8                	cmp    %edi,%eax
 534:	75 d4                	jne    50a <free+0x2e>
 536:	03 70 04             	add    0x4(%eax),%esi
 539:	89 73 fc             	mov    %esi,-0x4(%ebx)
 53c:	8b 02                	mov    (%edx),%eax
 53e:	8b 00                	mov    (%eax),%eax
 540:	89 43 f8             	mov    %eax,-0x8(%ebx)
 543:	8b 42 04             	mov    0x4(%edx),%eax
 546:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 549:	39 f1                	cmp    %esi,%ecx
 54b:	75 ca                	jne    517 <free+0x3b>
 54d:	03 43 fc             	add    -0x4(%ebx),%eax
 550:	89 42 04             	mov    %eax,0x4(%edx)
 553:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 556:	89 0a                	mov    %ecx,(%edx)
 558:	89 15 f0 06 00 00    	mov    %edx,0x6f0
 55e:	5b                   	pop    %ebx
 55f:	5e                   	pop    %esi
 560:	5f                   	pop    %edi
 561:	5d                   	pop    %ebp
 562:	c3                   	ret    
 563:	90                   	nop

00000564 <malloc>:
 564:	55                   	push   %ebp
 565:	89 e5                	mov    %esp,%ebp
 567:	57                   	push   %edi
 568:	56                   	push   %esi
 569:	53                   	push   %ebx
 56a:	83 ec 0c             	sub    $0xc,%esp
 56d:	8b 45 08             	mov    0x8(%ebp),%eax
 570:	8d 78 07             	lea    0x7(%eax),%edi
 573:	c1 ef 03             	shr    $0x3,%edi
 576:	47                   	inc    %edi
 577:	8b 15 f0 06 00 00    	mov    0x6f0,%edx
 57d:	85 d2                	test   %edx,%edx
 57f:	0f 84 93 00 00 00    	je     618 <malloc+0xb4>
 585:	8b 02                	mov    (%edx),%eax
 587:	8b 48 04             	mov    0x4(%eax),%ecx
 58a:	39 f9                	cmp    %edi,%ecx
 58c:	73 62                	jae    5f0 <malloc+0x8c>
 58e:	89 fb                	mov    %edi,%ebx
 590:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 596:	72 78                	jb     610 <malloc+0xac>
 598:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 59f:	eb 0e                	jmp    5af <malloc+0x4b>
 5a1:	8d 76 00             	lea    0x0(%esi),%esi
 5a4:	89 c2                	mov    %eax,%edx
 5a6:	8b 02                	mov    (%edx),%eax
 5a8:	8b 48 04             	mov    0x4(%eax),%ecx
 5ab:	39 f9                	cmp    %edi,%ecx
 5ad:	73 41                	jae    5f0 <malloc+0x8c>
 5af:	39 05 f0 06 00 00    	cmp    %eax,0x6f0
 5b5:	75 ed                	jne    5a4 <malloc+0x40>
 5b7:	83 ec 0c             	sub    $0xc,%esp
 5ba:	56                   	push   %esi
 5bb:	e8 f7 fc ff ff       	call   2b7 <sbrk>
 5c0:	83 c4 10             	add    $0x10,%esp
 5c3:	83 f8 ff             	cmp    $0xffffffff,%eax
 5c6:	74 1c                	je     5e4 <malloc+0x80>
 5c8:	89 58 04             	mov    %ebx,0x4(%eax)
 5cb:	83 ec 0c             	sub    $0xc,%esp
 5ce:	83 c0 08             	add    $0x8,%eax
 5d1:	50                   	push   %eax
 5d2:	e8 05 ff ff ff       	call   4dc <free>
 5d7:	8b 15 f0 06 00 00    	mov    0x6f0,%edx
 5dd:	83 c4 10             	add    $0x10,%esp
 5e0:	85 d2                	test   %edx,%edx
 5e2:	75 c2                	jne    5a6 <malloc+0x42>
 5e4:	31 c0                	xor    %eax,%eax
 5e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5e9:	5b                   	pop    %ebx
 5ea:	5e                   	pop    %esi
 5eb:	5f                   	pop    %edi
 5ec:	5d                   	pop    %ebp
 5ed:	c3                   	ret    
 5ee:	66 90                	xchg   %ax,%ax
 5f0:	39 cf                	cmp    %ecx,%edi
 5f2:	74 4c                	je     640 <malloc+0xdc>
 5f4:	29 f9                	sub    %edi,%ecx
 5f6:	89 48 04             	mov    %ecx,0x4(%eax)
 5f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5fc:	89 78 04             	mov    %edi,0x4(%eax)
 5ff:	89 15 f0 06 00 00    	mov    %edx,0x6f0
 605:	83 c0 08             	add    $0x8,%eax
 608:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60b:	5b                   	pop    %ebx
 60c:	5e                   	pop    %esi
 60d:	5f                   	pop    %edi
 60e:	5d                   	pop    %ebp
 60f:	c3                   	ret    
 610:	bb 00 10 00 00       	mov    $0x1000,%ebx
 615:	eb 81                	jmp    598 <malloc+0x34>
 617:	90                   	nop
 618:	c7 05 f0 06 00 00 f4 	movl   $0x6f4,0x6f0
 61f:	06 00 00 
 622:	c7 05 f4 06 00 00 f4 	movl   $0x6f4,0x6f4
 629:	06 00 00 
 62c:	c7 05 f8 06 00 00 00 	movl   $0x0,0x6f8
 633:	00 00 00 
 636:	b8 f4 06 00 00       	mov    $0x6f4,%eax
 63b:	e9 4e ff ff ff       	jmp    58e <malloc+0x2a>
 640:	8b 08                	mov    (%eax),%ecx
 642:	89 0a                	mov    %ecx,(%edx)
 644:	eb b9                	jmp    5ff <malloc+0x9b>
