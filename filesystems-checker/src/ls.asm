
_ls:     file format elf32-i386


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
  1c:	7e 1e                	jle    3c <main+0x3c>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	90                   	nop
  24:	83 ec 0c             	sub    $0xc,%esp
  27:	ff 34 9f             	pushl  (%edi,%ebx,4)
  2a:	e8 b1 00 00 00       	call   e0 <ls>
  2f:	43                   	inc    %ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	39 de                	cmp    %ebx,%esi
  35:	75 ed                	jne    24 <main+0x24>
  37:	e8 7b 04 00 00       	call   4b7 <exit>
  3c:	83 ec 0c             	sub    $0xc,%esp
  3f:	68 18 09 00 00       	push   $0x918
  44:	e8 97 00 00 00       	call   e0 <ls>
  49:	e8 69 04 00 00       	call   4b7 <exit>
  4e:	66 90                	xchg   %ax,%ax

00000050 <fmtname>:
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	56                   	push   %esi
  54:	53                   	push   %ebx
  55:	8b 75 08             	mov    0x8(%ebp),%esi
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	56                   	push   %esi
  5c:	e8 f7 02 00 00       	call   358 <strlen>
  61:	83 c4 10             	add    $0x10,%esp
  64:	01 f0                	add    %esi,%eax
  66:	89 c3                	mov    %eax,%ebx
  68:	73 0b                	jae    75 <fmtname+0x25>
  6a:	eb 0e                	jmp    7a <fmtname+0x2a>
  6c:	8d 43 ff             	lea    -0x1(%ebx),%eax
  6f:	39 f0                	cmp    %esi,%eax
  71:	72 08                	jb     7b <fmtname+0x2b>
  73:	89 c3                	mov    %eax,%ebx
  75:	80 3b 2f             	cmpb   $0x2f,(%ebx)
  78:	75 f2                	jne    6c <fmtname+0x1c>
  7a:	43                   	inc    %ebx
  7b:	83 ec 0c             	sub    $0xc,%esp
  7e:	53                   	push   %ebx
  7f:	e8 d4 02 00 00       	call   358 <strlen>
  84:	83 c4 10             	add    $0x10,%esp
  87:	83 f8 0d             	cmp    $0xd,%eax
  8a:	77 4a                	ja     d6 <fmtname+0x86>
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	53                   	push   %ebx
  90:	e8 c3 02 00 00       	call   358 <strlen>
  95:	83 c4 0c             	add    $0xc,%esp
  98:	50                   	push   %eax
  99:	53                   	push   %ebx
  9a:	68 90 09 00 00       	push   $0x990
  9f:	e8 e8 03 00 00       	call   48c <memmove>
  a4:	89 1c 24             	mov    %ebx,(%esp)
  a7:	e8 ac 02 00 00       	call   358 <strlen>
  ac:	89 c6                	mov    %eax,%esi
  ae:	89 1c 24             	mov    %ebx,(%esp)
  b1:	e8 a2 02 00 00       	call   358 <strlen>
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	ba 0e 00 00 00       	mov    $0xe,%edx
  be:	29 f2                	sub    %esi,%edx
  c0:	52                   	push   %edx
  c1:	6a 20                	push   $0x20
  c3:	05 90 09 00 00       	add    $0x990,%eax
  c8:	50                   	push   %eax
  c9:	e8 b2 02 00 00       	call   380 <memset>
  ce:	83 c4 10             	add    $0x10,%esp
  d1:	bb 90 09 00 00       	mov    $0x990,%ebx
  d6:	89 d8                	mov    %ebx,%eax
  d8:	8d 65 f8             	lea    -0x8(%ebp),%esp
  db:	5b                   	pop    %ebx
  dc:	5e                   	pop    %esi
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop

000000e0 <ls>:
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	81 ec 64 02 00 00    	sub    $0x264,%esp
  ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  ef:	6a 00                	push   $0x0
  f1:	57                   	push   %edi
  f2:	e8 00 04 00 00       	call   4f7 <open>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	85 c0                	test   %eax,%eax
  fc:	0f 88 82 01 00 00    	js     284 <ls+0x1a4>
 102:	89 c3                	mov    %eax,%ebx
 104:	83 ec 08             	sub    $0x8,%esp
 107:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
 10d:	56                   	push   %esi
 10e:	50                   	push   %eax
 10f:	e8 fb 03 00 00       	call   50f <fstat>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	0f 88 99 01 00 00    	js     2b8 <ls+0x1d8>
 11f:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 125:	66 83 f8 01          	cmp    $0x1,%ax
 129:	74 59                	je     184 <ls+0xa4>
 12b:	66 83 f8 02          	cmp    $0x2,%ax
 12f:	74 17                	je     148 <ls+0x68>
 131:	83 ec 0c             	sub    $0xc,%esp
 134:	53                   	push   %ebx
 135:	e8 a5 03 00 00       	call   4df <close>
 13a:	83 c4 10             	add    $0x10,%esp
 13d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 140:	5b                   	pop    %ebx
 141:	5e                   	pop    %esi
 142:	5f                   	pop    %edi
 143:	5d                   	pop    %ebp
 144:	c3                   	ret    
 145:	8d 76 00             	lea    0x0(%esi),%esi
 148:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
 14e:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
 154:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
 15a:	83 ec 0c             	sub    $0xc,%esp
 15d:	57                   	push   %edi
 15e:	e8 ed fe ff ff       	call   50 <fmtname>
 163:	59                   	pop    %ecx
 164:	5f                   	pop    %edi
 165:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
 16b:	52                   	push   %edx
 16c:	56                   	push   %esi
 16d:	6a 02                	push   $0x2
 16f:	50                   	push   %eax
 170:	68 f8 08 00 00       	push   $0x8f8
 175:	6a 01                	push   $0x1
 177:	e8 70 04 00 00       	call   5ec <printf>
 17c:	83 c4 20             	add    $0x20,%esp
 17f:	eb b0                	jmp    131 <ls+0x51>
 181:	8d 76 00             	lea    0x0(%esi),%esi
 184:	83 ec 0c             	sub    $0xc,%esp
 187:	57                   	push   %edi
 188:	e8 cb 01 00 00       	call   358 <strlen>
 18d:	83 c0 10             	add    $0x10,%eax
 190:	83 c4 10             	add    $0x10,%esp
 193:	3d 00 02 00 00       	cmp    $0x200,%eax
 198:	0f 87 02 01 00 00    	ja     2a0 <ls+0x1c0>
 19e:	83 ec 08             	sub    $0x8,%esp
 1a1:	57                   	push   %edi
 1a2:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 1a8:	57                   	push   %edi
 1a9:	e8 46 01 00 00       	call   2f4 <strcpy>
 1ae:	89 3c 24             	mov    %edi,(%esp)
 1b1:	e8 a2 01 00 00       	call   358 <strlen>
 1b6:	8d 0c 07             	lea    (%edi,%eax,1),%ecx
 1b9:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
 1bf:	8d 44 07 01          	lea    0x1(%edi,%eax,1),%eax
 1c3:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
 1c9:	c6 01 2f             	movb   $0x2f,(%ecx)
 1cc:	83 c4 10             	add    $0x10,%esp
 1cf:	90                   	nop
 1d0:	50                   	push   %eax
 1d1:	6a 10                	push   $0x10
 1d3:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 1d9:	50                   	push   %eax
 1da:	53                   	push   %ebx
 1db:	e8 ef 02 00 00       	call   4cf <read>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	83 f8 10             	cmp    $0x10,%eax
 1e6:	0f 85 45 ff ff ff    	jne    131 <ls+0x51>
 1ec:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
 1f3:	00 
 1f4:	74 da                	je     1d0 <ls+0xf0>
 1f6:	50                   	push   %eax
 1f7:	6a 0e                	push   $0xe
 1f9:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
 1ff:	50                   	push   %eax
 200:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
 206:	e8 81 02 00 00       	call   48c <memmove>
 20b:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
 211:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
 215:	58                   	pop    %eax
 216:	5a                   	pop    %edx
 217:	56                   	push   %esi
 218:	57                   	push   %edi
 219:	e8 f2 01 00 00       	call   410 <stat>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	85 c0                	test   %eax,%eax
 223:	0f 88 b3 00 00 00    	js     2dc <ls+0x1fc>
 229:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
 22f:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 235:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
 23b:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 241:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
 248:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 24e:	83 ec 0c             	sub    $0xc,%esp
 251:	57                   	push   %edi
 252:	e8 f9 fd ff ff       	call   50 <fmtname>
 257:	5a                   	pop    %edx
 258:	59                   	pop    %ecx
 259:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
 25f:	51                   	push   %ecx
 260:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
 266:	52                   	push   %edx
 267:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
 26d:	50                   	push   %eax
 26e:	68 f8 08 00 00       	push   $0x8f8
 273:	6a 01                	push   $0x1
 275:	e8 72 03 00 00       	call   5ec <printf>
 27a:	83 c4 20             	add    $0x20,%esp
 27d:	e9 4e ff ff ff       	jmp    1d0 <ls+0xf0>
 282:	66 90                	xchg   %ax,%ax
 284:	50                   	push   %eax
 285:	57                   	push   %edi
 286:	68 d0 08 00 00       	push   $0x8d0
 28b:	6a 02                	push   $0x2
 28d:	e8 5a 03 00 00       	call   5ec <printf>
 292:	83 c4 10             	add    $0x10,%esp
 295:	8d 65 f4             	lea    -0xc(%ebp),%esp
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5f                   	pop    %edi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret    
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	83 ec 08             	sub    $0x8,%esp
 2a3:	68 05 09 00 00       	push   $0x905
 2a8:	6a 01                	push   $0x1
 2aa:	e8 3d 03 00 00       	call   5ec <printf>
 2af:	83 c4 10             	add    $0x10,%esp
 2b2:	e9 7a fe ff ff       	jmp    131 <ls+0x51>
 2b7:	90                   	nop
 2b8:	50                   	push   %eax
 2b9:	57                   	push   %edi
 2ba:	68 e4 08 00 00       	push   $0x8e4
 2bf:	6a 02                	push   $0x2
 2c1:	e8 26 03 00 00       	call   5ec <printf>
 2c6:	89 1c 24             	mov    %ebx,(%esp)
 2c9:	e8 11 02 00 00       	call   4df <close>
 2ce:	83 c4 10             	add    $0x10,%esp
 2d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2d4:	5b                   	pop    %ebx
 2d5:	5e                   	pop    %esi
 2d6:	5f                   	pop    %edi
 2d7:	5d                   	pop    %ebp
 2d8:	c3                   	ret    
 2d9:	8d 76 00             	lea    0x0(%esi),%esi
 2dc:	50                   	push   %eax
 2dd:	57                   	push   %edi
 2de:	68 e4 08 00 00       	push   $0x8e4
 2e3:	6a 01                	push   $0x1
 2e5:	e8 02 03 00 00       	call   5ec <printf>
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	e9 de fe ff ff       	jmp    1d0 <ls+0xf0>
 2f2:	66 90                	xchg   %ax,%ax

000002f4 <strcpy>:
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	53                   	push   %ebx
 2f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2fe:	31 c0                	xor    %eax,%eax
 300:	8a 14 03             	mov    (%ebx,%eax,1),%dl
 303:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 306:	40                   	inc    %eax
 307:	84 d2                	test   %dl,%dl
 309:	75 f5                	jne    300 <strcpy+0xc>
 30b:	89 c8                	mov    %ecx,%eax
 30d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 310:	c9                   	leave  
 311:	c3                   	ret    
 312:	66 90                	xchg   %ax,%ax

00000314 <strcmp>:
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	53                   	push   %ebx
 318:	8b 55 08             	mov    0x8(%ebp),%edx
 31b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 31e:	0f b6 02             	movzbl (%edx),%eax
 321:	84 c0                	test   %al,%al
 323:	75 10                	jne    335 <strcmp+0x21>
 325:	eb 2a                	jmp    351 <strcmp+0x3d>
 327:	90                   	nop
 328:	42                   	inc    %edx
 329:	8d 4b 01             	lea    0x1(%ebx),%ecx
 32c:	0f b6 02             	movzbl (%edx),%eax
 32f:	84 c0                	test   %al,%al
 331:	74 11                	je     344 <strcmp+0x30>
 333:	89 cb                	mov    %ecx,%ebx
 335:	0f b6 0b             	movzbl (%ebx),%ecx
 338:	38 c1                	cmp    %al,%cl
 33a:	74 ec                	je     328 <strcmp+0x14>
 33c:	29 c8                	sub    %ecx,%eax
 33e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 341:	c9                   	leave  
 342:	c3                   	ret    
 343:	90                   	nop
 344:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
 348:	31 c0                	xor    %eax,%eax
 34a:	29 c8                	sub    %ecx,%eax
 34c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 34f:	c9                   	leave  
 350:	c3                   	ret    
 351:	0f b6 0b             	movzbl (%ebx),%ecx
 354:	31 c0                	xor    %eax,%eax
 356:	eb e4                	jmp    33c <strcmp+0x28>

00000358 <strlen>:
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
 35b:	8b 55 08             	mov    0x8(%ebp),%edx
 35e:	80 3a 00             	cmpb   $0x0,(%edx)
 361:	74 15                	je     378 <strlen+0x20>
 363:	31 c0                	xor    %eax,%eax
 365:	8d 76 00             	lea    0x0(%esi),%esi
 368:	40                   	inc    %eax
 369:	89 c1                	mov    %eax,%ecx
 36b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 36f:	75 f7                	jne    368 <strlen+0x10>
 371:	89 c8                	mov    %ecx,%eax
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    
 375:	8d 76 00             	lea    0x0(%esi),%esi
 378:	31 c9                	xor    %ecx,%ecx
 37a:	89 c8                	mov    %ecx,%eax
 37c:	5d                   	pop    %ebp
 37d:	c3                   	ret    
 37e:	66 90                	xchg   %ax,%ax

00000380 <memset>:
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	8b 7d 08             	mov    0x8(%ebp),%edi
 387:	8b 4d 10             	mov    0x10(%ebp),%ecx
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	fc                   	cld    
 38e:	f3 aa                	rep stos %al,%es:(%edi)
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	8b 7d fc             	mov    -0x4(%ebp),%edi
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <strchr>:
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	8a 4d 0c             	mov    0xc(%ebp),%cl
 3a1:	8a 10                	mov    (%eax),%dl
 3a3:	84 d2                	test   %dl,%dl
 3a5:	75 0c                	jne    3b3 <strchr+0x1b>
 3a7:	eb 13                	jmp    3bc <strchr+0x24>
 3a9:	8d 76 00             	lea    0x0(%esi),%esi
 3ac:	40                   	inc    %eax
 3ad:	8a 10                	mov    (%eax),%dl
 3af:	84 d2                	test   %dl,%dl
 3b1:	74 09                	je     3bc <strchr+0x24>
 3b3:	38 d1                	cmp    %dl,%cl
 3b5:	75 f5                	jne    3ac <strchr+0x14>
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d 76 00             	lea    0x0(%esi),%esi
 3bc:	31 c0                	xor    %eax,%eax
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <gets>:
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 1c             	sub    $0x1c,%esp
 3c9:	31 db                	xor    %ebx,%ebx
 3cb:	8d 75 e7             	lea    -0x19(%ebp),%esi
 3ce:	eb 24                	jmp    3f4 <gets+0x34>
 3d0:	50                   	push   %eax
 3d1:	6a 01                	push   $0x1
 3d3:	56                   	push   %esi
 3d4:	6a 00                	push   $0x0
 3d6:	e8 f4 00 00 00       	call   4cf <read>
 3db:	83 c4 10             	add    $0x10,%esp
 3de:	85 c0                	test   %eax,%eax
 3e0:	7e 1a                	jle    3fc <gets+0x3c>
 3e2:	8a 45 e7             	mov    -0x19(%ebp),%al
 3e5:	8b 55 08             	mov    0x8(%ebp),%edx
 3e8:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 3ec:	3c 0a                	cmp    $0xa,%al
 3ee:	74 0e                	je     3fe <gets+0x3e>
 3f0:	3c 0d                	cmp    $0xd,%al
 3f2:	74 0a                	je     3fe <gets+0x3e>
 3f4:	89 df                	mov    %ebx,%edi
 3f6:	43                   	inc    %ebx
 3f7:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3fa:	7c d4                	jl     3d0 <gets+0x10>
 3fc:	89 fb                	mov    %edi,%ebx
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
 405:	8d 65 f4             	lea    -0xc(%ebp),%esp
 408:	5b                   	pop    %ebx
 409:	5e                   	pop    %esi
 40a:	5f                   	pop    %edi
 40b:	5d                   	pop    %ebp
 40c:	c3                   	ret    
 40d:	8d 76 00             	lea    0x0(%esi),%esi

00000410 <stat>:
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	56                   	push   %esi
 414:	53                   	push   %ebx
 415:	83 ec 08             	sub    $0x8,%esp
 418:	6a 00                	push   $0x0
 41a:	ff 75 08             	pushl  0x8(%ebp)
 41d:	e8 d5 00 00 00       	call   4f7 <open>
 422:	83 c4 10             	add    $0x10,%esp
 425:	85 c0                	test   %eax,%eax
 427:	78 27                	js     450 <stat+0x40>
 429:	89 c3                	mov    %eax,%ebx
 42b:	83 ec 08             	sub    $0x8,%esp
 42e:	ff 75 0c             	pushl  0xc(%ebp)
 431:	50                   	push   %eax
 432:	e8 d8 00 00 00       	call   50f <fstat>
 437:	89 c6                	mov    %eax,%esi
 439:	89 1c 24             	mov    %ebx,(%esp)
 43c:	e8 9e 00 00 00       	call   4df <close>
 441:	83 c4 10             	add    $0x10,%esp
 444:	89 f0                	mov    %esi,%eax
 446:	8d 65 f8             	lea    -0x8(%ebp),%esp
 449:	5b                   	pop    %ebx
 44a:	5e                   	pop    %esi
 44b:	5d                   	pop    %ebp
 44c:	c3                   	ret    
 44d:	8d 76 00             	lea    0x0(%esi),%esi
 450:	be ff ff ff ff       	mov    $0xffffffff,%esi
 455:	eb ed                	jmp    444 <stat+0x34>
 457:	90                   	nop

00000458 <atoi>:
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	53                   	push   %ebx
 45c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 45f:	0f be 01             	movsbl (%ecx),%eax
 462:	8d 50 d0             	lea    -0x30(%eax),%edx
 465:	80 fa 09             	cmp    $0x9,%dl
 468:	ba 00 00 00 00       	mov    $0x0,%edx
 46d:	77 16                	ja     485 <atoi+0x2d>
 46f:	90                   	nop
 470:	41                   	inc    %ecx
 471:	8d 14 92             	lea    (%edx,%edx,4),%edx
 474:	01 d2                	add    %edx,%edx
 476:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
 47a:	0f be 01             	movsbl (%ecx),%eax
 47d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 480:	80 fb 09             	cmp    $0x9,%bl
 483:	76 eb                	jbe    470 <atoi+0x18>
 485:	89 d0                	mov    %edx,%eax
 487:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 48a:	c9                   	leave  
 48b:	c3                   	ret    

0000048c <memmove>:
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
 48f:	57                   	push   %edi
 490:	56                   	push   %esi
 491:	8b 55 08             	mov    0x8(%ebp),%edx
 494:	8b 75 0c             	mov    0xc(%ebp),%esi
 497:	8b 45 10             	mov    0x10(%ebp),%eax
 49a:	85 c0                	test   %eax,%eax
 49c:	7e 0b                	jle    4a9 <memmove+0x1d>
 49e:	01 d0                	add    %edx,%eax
 4a0:	89 d7                	mov    %edx,%edi
 4a2:	66 90                	xchg   %ax,%ax
 4a4:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 4a5:	39 f8                	cmp    %edi,%eax
 4a7:	75 fb                	jne    4a4 <memmove+0x18>
 4a9:	89 d0                	mov    %edx,%eax
 4ab:	5e                   	pop    %esi
 4ac:	5f                   	pop    %edi
 4ad:	5d                   	pop    %ebp
 4ae:	c3                   	ret    

000004af <fork>:
 4af:	b8 01 00 00 00       	mov    $0x1,%eax
 4b4:	cd 40                	int    $0x40
 4b6:	c3                   	ret    

000004b7 <exit>:
 4b7:	b8 02 00 00 00       	mov    $0x2,%eax
 4bc:	cd 40                	int    $0x40
 4be:	c3                   	ret    

000004bf <wait>:
 4bf:	b8 03 00 00 00       	mov    $0x3,%eax
 4c4:	cd 40                	int    $0x40
 4c6:	c3                   	ret    

000004c7 <pipe>:
 4c7:	b8 04 00 00 00       	mov    $0x4,%eax
 4cc:	cd 40                	int    $0x40
 4ce:	c3                   	ret    

000004cf <read>:
 4cf:	b8 05 00 00 00       	mov    $0x5,%eax
 4d4:	cd 40                	int    $0x40
 4d6:	c3                   	ret    

000004d7 <write>:
 4d7:	b8 10 00 00 00       	mov    $0x10,%eax
 4dc:	cd 40                	int    $0x40
 4de:	c3                   	ret    

000004df <close>:
 4df:	b8 15 00 00 00       	mov    $0x15,%eax
 4e4:	cd 40                	int    $0x40
 4e6:	c3                   	ret    

000004e7 <kill>:
 4e7:	b8 06 00 00 00       	mov    $0x6,%eax
 4ec:	cd 40                	int    $0x40
 4ee:	c3                   	ret    

000004ef <exec>:
 4ef:	b8 07 00 00 00       	mov    $0x7,%eax
 4f4:	cd 40                	int    $0x40
 4f6:	c3                   	ret    

000004f7 <open>:
 4f7:	b8 0f 00 00 00       	mov    $0xf,%eax
 4fc:	cd 40                	int    $0x40
 4fe:	c3                   	ret    

000004ff <mknod>:
 4ff:	b8 11 00 00 00       	mov    $0x11,%eax
 504:	cd 40                	int    $0x40
 506:	c3                   	ret    

00000507 <unlink>:
 507:	b8 12 00 00 00       	mov    $0x12,%eax
 50c:	cd 40                	int    $0x40
 50e:	c3                   	ret    

0000050f <fstat>:
 50f:	b8 08 00 00 00       	mov    $0x8,%eax
 514:	cd 40                	int    $0x40
 516:	c3                   	ret    

00000517 <link>:
 517:	b8 13 00 00 00       	mov    $0x13,%eax
 51c:	cd 40                	int    $0x40
 51e:	c3                   	ret    

0000051f <mkdir>:
 51f:	b8 14 00 00 00       	mov    $0x14,%eax
 524:	cd 40                	int    $0x40
 526:	c3                   	ret    

00000527 <chdir>:
 527:	b8 09 00 00 00       	mov    $0x9,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <dup>:
 52f:	b8 0a 00 00 00       	mov    $0xa,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <getpid>:
 537:	b8 0b 00 00 00       	mov    $0xb,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <sbrk>:
 53f:	b8 0c 00 00 00       	mov    $0xc,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <sleep>:
 547:	b8 0d 00 00 00       	mov    $0xd,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <uptime>:
 54f:	b8 0e 00 00 00       	mov    $0xe,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <getreadcount>:
 557:	b8 16 00 00 00       	mov    $0x16,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    
 55f:	90                   	nop

00000560 <printint>:
 560:	55                   	push   %ebp
 561:	89 e5                	mov    %esp,%ebp
 563:	57                   	push   %edi
 564:	56                   	push   %esi
 565:	53                   	push   %ebx
 566:	83 ec 3c             	sub    $0x3c,%esp
 569:	89 45 c0             	mov    %eax,-0x40(%ebp)
 56c:	89 cb                	mov    %ecx,%ebx
 56e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 571:	85 c9                	test   %ecx,%ecx
 573:	74 04                	je     579 <printint+0x19>
 575:	85 d2                	test   %edx,%edx
 577:	78 6b                	js     5e4 <printint+0x84>
 579:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 57c:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
 583:	31 c9                	xor    %ecx,%ecx
 585:	8d 75 d7             	lea    -0x29(%ebp),%esi
 588:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 58b:	31 d2                	xor    %edx,%edx
 58d:	f7 f3                	div    %ebx
 58f:	89 cf                	mov    %ecx,%edi
 591:	8d 49 01             	lea    0x1(%ecx),%ecx
 594:	8a 92 7c 09 00 00    	mov    0x97c(%edx),%dl
 59a:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
 59e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 5a1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 5a4:	39 da                	cmp    %ebx,%edx
 5a6:	73 e0                	jae    588 <printint+0x28>
 5a8:	8b 55 08             	mov    0x8(%ebp),%edx
 5ab:	85 d2                	test   %edx,%edx
 5ad:	74 07                	je     5b6 <printint+0x56>
 5af:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 5b4:	89 cf                	mov    %ecx,%edi
 5b6:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 5b9:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
 5c0:	8a 07                	mov    (%edi),%al
 5c2:	88 45 d7             	mov    %al,-0x29(%ebp)
 5c5:	50                   	push   %eax
 5c6:	6a 01                	push   $0x1
 5c8:	56                   	push   %esi
 5c9:	ff 75 c0             	pushl  -0x40(%ebp)
 5cc:	e8 06 ff ff ff       	call   4d7 <write>
 5d1:	89 f8                	mov    %edi,%eax
 5d3:	4f                   	dec    %edi
 5d4:	83 c4 10             	add    $0x10,%esp
 5d7:	39 d8                	cmp    %ebx,%eax
 5d9:	75 e5                	jne    5c0 <printint+0x60>
 5db:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5de:	5b                   	pop    %ebx
 5df:	5e                   	pop    %esi
 5e0:	5f                   	pop    %edi
 5e1:	5d                   	pop    %ebp
 5e2:	c3                   	ret    
 5e3:	90                   	nop
 5e4:	f7 da                	neg    %edx
 5e6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
 5e9:	eb 98                	jmp    583 <printint+0x23>
 5eb:	90                   	nop

000005ec <printf>:
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	53                   	push   %ebx
 5f2:	83 ec 2c             	sub    $0x2c,%esp
 5f5:	8b 75 08             	mov    0x8(%ebp),%esi
 5f8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 5fb:	8a 13                	mov    (%ebx),%dl
 5fd:	84 d2                	test   %dl,%dl
 5ff:	74 5c                	je     65d <printf+0x71>
 601:	43                   	inc    %ebx
 602:	8d 45 10             	lea    0x10(%ebp),%eax
 605:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 608:	31 ff                	xor    %edi,%edi
 60a:	eb 20                	jmp    62c <printf+0x40>
 60c:	83 f8 25             	cmp    $0x25,%eax
 60f:	74 3f                	je     650 <printf+0x64>
 611:	88 55 e7             	mov    %dl,-0x19(%ebp)
 614:	50                   	push   %eax
 615:	6a 01                	push   $0x1
 617:	8d 45 e7             	lea    -0x19(%ebp),%eax
 61a:	50                   	push   %eax
 61b:	56                   	push   %esi
 61c:	e8 b6 fe ff ff       	call   4d7 <write>
 621:	83 c4 10             	add    $0x10,%esp
 624:	43                   	inc    %ebx
 625:	8a 53 ff             	mov    -0x1(%ebx),%dl
 628:	84 d2                	test   %dl,%dl
 62a:	74 31                	je     65d <printf+0x71>
 62c:	0f b6 c2             	movzbl %dl,%eax
 62f:	85 ff                	test   %edi,%edi
 631:	74 d9                	je     60c <printf+0x20>
 633:	83 ff 25             	cmp    $0x25,%edi
 636:	75 ec                	jne    624 <printf+0x38>
 638:	83 f8 25             	cmp    $0x25,%eax
 63b:	0f 84 03 01 00 00    	je     744 <printf+0x158>
 641:	83 e8 63             	sub    $0x63,%eax
 644:	83 f8 15             	cmp    $0x15,%eax
 647:	77 1f                	ja     668 <printf+0x7c>
 649:	ff 24 85 24 09 00 00 	jmp    *0x924(,%eax,4)
 650:	bf 25 00 00 00       	mov    $0x25,%edi
 655:	43                   	inc    %ebx
 656:	8a 53 ff             	mov    -0x1(%ebx),%dl
 659:	84 d2                	test   %dl,%dl
 65b:	75 cf                	jne    62c <printf+0x40>
 65d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 660:	5b                   	pop    %ebx
 661:	5e                   	pop    %esi
 662:	5f                   	pop    %edi
 663:	5d                   	pop    %ebp
 664:	c3                   	ret    
 665:	8d 76 00             	lea    0x0(%esi),%esi
 668:	88 55 d0             	mov    %dl,-0x30(%ebp)
 66b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 66f:	50                   	push   %eax
 670:	6a 01                	push   $0x1
 672:	8d 7d e7             	lea    -0x19(%ebp),%edi
 675:	57                   	push   %edi
 676:	56                   	push   %esi
 677:	e8 5b fe ff ff       	call   4d7 <write>
 67c:	8a 55 d0             	mov    -0x30(%ebp),%dl
 67f:	88 55 e7             	mov    %dl,-0x19(%ebp)
 682:	83 c4 0c             	add    $0xc,%esp
 685:	6a 01                	push   $0x1
 687:	57                   	push   %edi
 688:	56                   	push   %esi
 689:	e8 49 fe ff ff       	call   4d7 <write>
 68e:	83 c4 10             	add    $0x10,%esp
 691:	31 ff                	xor    %edi,%edi
 693:	eb 8f                	jmp    624 <printf+0x38>
 695:	8d 76 00             	lea    0x0(%esi),%esi
 698:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 69b:	8b 17                	mov    (%edi),%edx
 69d:	83 ec 0c             	sub    $0xc,%esp
 6a0:	6a 00                	push   $0x0
 6a2:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a7:	89 f0                	mov    %esi,%eax
 6a9:	e8 b2 fe ff ff       	call   560 <printint>
 6ae:	83 c7 04             	add    $0x4,%edi
 6b1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6b4:	83 c4 10             	add    $0x10,%esp
 6b7:	31 ff                	xor    %edi,%edi
 6b9:	e9 66 ff ff ff       	jmp    624 <printf+0x38>
 6be:	66 90                	xchg   %ax,%ax
 6c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6c3:	8b 10                	mov    (%eax),%edx
 6c5:	83 c0 04             	add    $0x4,%eax
 6c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6cb:	85 d2                	test   %edx,%edx
 6cd:	0f 84 81 00 00 00    	je     754 <printf+0x168>
 6d3:	8a 02                	mov    (%edx),%al
 6d5:	84 c0                	test   %al,%al
 6d7:	0f 84 80 00 00 00    	je     75d <printf+0x171>
 6dd:	8d 7d e7             	lea    -0x19(%ebp),%edi
 6e0:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6e3:	89 d3                	mov    %edx,%ebx
 6e5:	8d 76 00             	lea    0x0(%esi),%esi
 6e8:	88 45 e7             	mov    %al,-0x19(%ebp)
 6eb:	50                   	push   %eax
 6ec:	6a 01                	push   $0x1
 6ee:	57                   	push   %edi
 6ef:	56                   	push   %esi
 6f0:	e8 e2 fd ff ff       	call   4d7 <write>
 6f5:	43                   	inc    %ebx
 6f6:	8a 03                	mov    (%ebx),%al
 6f8:	83 c4 10             	add    $0x10,%esp
 6fb:	84 c0                	test   %al,%al
 6fd:	75 e9                	jne    6e8 <printf+0xfc>
 6ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 702:	31 ff                	xor    %edi,%edi
 704:	e9 1b ff ff ff       	jmp    624 <printf+0x38>
 709:	8d 76 00             	lea    0x0(%esi),%esi
 70c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 70f:	8b 17                	mov    (%edi),%edx
 711:	83 ec 0c             	sub    $0xc,%esp
 714:	6a 01                	push   $0x1
 716:	b9 0a 00 00 00       	mov    $0xa,%ecx
 71b:	eb 8a                	jmp    6a7 <printf+0xbb>
 71d:	8d 76 00             	lea    0x0(%esi),%esi
 720:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	88 45 e7             	mov    %al,-0x19(%ebp)
 728:	51                   	push   %ecx
 729:	6a 01                	push   $0x1
 72b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 72e:	57                   	push   %edi
 72f:	56                   	push   %esi
 730:	e8 a2 fd ff ff       	call   4d7 <write>
 735:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 739:	83 c4 10             	add    $0x10,%esp
 73c:	31 ff                	xor    %edi,%edi
 73e:	e9 e1 fe ff ff       	jmp    624 <printf+0x38>
 743:	90                   	nop
 744:	88 55 e7             	mov    %dl,-0x19(%ebp)
 747:	52                   	push   %edx
 748:	6a 01                	push   $0x1
 74a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 74d:	e9 35 ff ff ff       	jmp    687 <printf+0x9b>
 752:	66 90                	xchg   %ax,%ax
 754:	b0 28                	mov    $0x28,%al
 756:	ba 1a 09 00 00       	mov    $0x91a,%edx
 75b:	eb 80                	jmp    6dd <printf+0xf1>
 75d:	31 ff                	xor    %edi,%edi
 75f:	e9 c0 fe ff ff       	jmp    624 <printf+0x38>

00000764 <free>:
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	57                   	push   %edi
 768:	56                   	push   %esi
 769:	53                   	push   %ebx
 76a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 76d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 770:	a1 a0 09 00 00       	mov    0x9a0,%eax
 775:	8d 76 00             	lea    0x0(%esi),%esi
 778:	89 c2                	mov    %eax,%edx
 77a:	8b 00                	mov    (%eax),%eax
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	73 2c                	jae    7ac <free+0x48>
 780:	39 c1                	cmp    %eax,%ecx
 782:	72 04                	jb     788 <free+0x24>
 784:	39 c2                	cmp    %eax,%edx
 786:	72 f0                	jb     778 <free+0x14>
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	74 2c                	je     7be <free+0x5a>
 792:	89 43 f8             	mov    %eax,-0x8(%ebx)
 795:	8b 42 04             	mov    0x4(%edx),%eax
 798:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 36                	je     7d5 <free+0x71>
 79f:	89 0a                	mov    %ecx,(%edx)
 7a1:	89 15 a0 09 00 00    	mov    %edx,0x9a0
 7a7:	5b                   	pop    %ebx
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	39 c2                	cmp    %eax,%edx
 7ae:	72 c8                	jb     778 <free+0x14>
 7b0:	39 c1                	cmp    %eax,%ecx
 7b2:	73 c4                	jae    778 <free+0x14>
 7b4:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7b7:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ba:	39 f8                	cmp    %edi,%eax
 7bc:	75 d4                	jne    792 <free+0x2e>
 7be:	03 70 04             	add    0x4(%eax),%esi
 7c1:	89 73 fc             	mov    %esi,-0x4(%ebx)
 7c4:	8b 02                	mov    (%edx),%eax
 7c6:	8b 00                	mov    (%eax),%eax
 7c8:	89 43 f8             	mov    %eax,-0x8(%ebx)
 7cb:	8b 42 04             	mov    0x4(%edx),%eax
 7ce:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d1:	39 f1                	cmp    %esi,%ecx
 7d3:	75 ca                	jne    79f <free+0x3b>
 7d5:	03 43 fc             	add    -0x4(%ebx),%eax
 7d8:	89 42 04             	mov    %eax,0x4(%edx)
 7db:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7de:	89 0a                	mov    %ecx,(%edx)
 7e0:	89 15 a0 09 00 00    	mov    %edx,0x9a0
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret    
 7eb:	90                   	nop

000007ec <malloc>:
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	57                   	push   %edi
 7f0:	56                   	push   %esi
 7f1:	53                   	push   %ebx
 7f2:	83 ec 0c             	sub    $0xc,%esp
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	8d 78 07             	lea    0x7(%eax),%edi
 7fb:	c1 ef 03             	shr    $0x3,%edi
 7fe:	47                   	inc    %edi
 7ff:	8b 15 a0 09 00 00    	mov    0x9a0,%edx
 805:	85 d2                	test   %edx,%edx
 807:	0f 84 93 00 00 00    	je     8a0 <malloc+0xb4>
 80d:	8b 02                	mov    (%edx),%eax
 80f:	8b 48 04             	mov    0x4(%eax),%ecx
 812:	39 f9                	cmp    %edi,%ecx
 814:	73 62                	jae    878 <malloc+0x8c>
 816:	89 fb                	mov    %edi,%ebx
 818:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 81e:	72 78                	jb     898 <malloc+0xac>
 820:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 827:	eb 0e                	jmp    837 <malloc+0x4b>
 829:	8d 76 00             	lea    0x0(%esi),%esi
 82c:	89 c2                	mov    %eax,%edx
 82e:	8b 02                	mov    (%edx),%eax
 830:	8b 48 04             	mov    0x4(%eax),%ecx
 833:	39 f9                	cmp    %edi,%ecx
 835:	73 41                	jae    878 <malloc+0x8c>
 837:	39 05 a0 09 00 00    	cmp    %eax,0x9a0
 83d:	75 ed                	jne    82c <malloc+0x40>
 83f:	83 ec 0c             	sub    $0xc,%esp
 842:	56                   	push   %esi
 843:	e8 f7 fc ff ff       	call   53f <sbrk>
 848:	83 c4 10             	add    $0x10,%esp
 84b:	83 f8 ff             	cmp    $0xffffffff,%eax
 84e:	74 1c                	je     86c <malloc+0x80>
 850:	89 58 04             	mov    %ebx,0x4(%eax)
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	83 c0 08             	add    $0x8,%eax
 859:	50                   	push   %eax
 85a:	e8 05 ff ff ff       	call   764 <free>
 85f:	8b 15 a0 09 00 00    	mov    0x9a0,%edx
 865:	83 c4 10             	add    $0x10,%esp
 868:	85 d2                	test   %edx,%edx
 86a:	75 c2                	jne    82e <malloc+0x42>
 86c:	31 c0                	xor    %eax,%eax
 86e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 871:	5b                   	pop    %ebx
 872:	5e                   	pop    %esi
 873:	5f                   	pop    %edi
 874:	5d                   	pop    %ebp
 875:	c3                   	ret    
 876:	66 90                	xchg   %ax,%ax
 878:	39 cf                	cmp    %ecx,%edi
 87a:	74 4c                	je     8c8 <malloc+0xdc>
 87c:	29 f9                	sub    %edi,%ecx
 87e:	89 48 04             	mov    %ecx,0x4(%eax)
 881:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 884:	89 78 04             	mov    %edi,0x4(%eax)
 887:	89 15 a0 09 00 00    	mov    %edx,0x9a0
 88d:	83 c0 08             	add    $0x8,%eax
 890:	8d 65 f4             	lea    -0xc(%ebp),%esp
 893:	5b                   	pop    %ebx
 894:	5e                   	pop    %esi
 895:	5f                   	pop    %edi
 896:	5d                   	pop    %ebp
 897:	c3                   	ret    
 898:	bb 00 10 00 00       	mov    $0x1000,%ebx
 89d:	eb 81                	jmp    820 <malloc+0x34>
 89f:	90                   	nop
 8a0:	c7 05 a0 09 00 00 a4 	movl   $0x9a4,0x9a0
 8a7:	09 00 00 
 8aa:	c7 05 a4 09 00 00 a4 	movl   $0x9a4,0x9a4
 8b1:	09 00 00 
 8b4:	c7 05 a8 09 00 00 00 	movl   $0x0,0x9a8
 8bb:	00 00 00 
 8be:	b8 a4 09 00 00       	mov    $0x9a4,%eax
 8c3:	e9 4e ff ff ff       	jmp    816 <malloc+0x2a>
 8c8:	8b 08                	mov    (%eax),%ecx
 8ca:	89 0a                	mov    %ecx,(%edx)
 8cc:	eb b9                	jmp    887 <malloc+0x9b>
