
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 55 11 80       	mov    $0x801155d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 80 2c 10 80       	mov    $0x80102c80,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	53                   	push   %ebx
80100038:	83 ec 0c             	sub    $0xc,%esp
8010003b:	68 c0 68 10 80       	push   $0x801068c0
80100040:	68 20 a5 10 80       	push   $0x8010a520
80100045:	e8 8e 3e 00 00       	call   80103ed8 <initlock>
8010004a:	c7 05 6c ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec6c
80100051:	ec 10 80 
80100054:	c7 05 70 ec 10 80 1c 	movl   $0x8010ec1c,0x8010ec70
8010005b:	ec 10 80 
8010005e:	83 c4 10             	add    $0x10,%esp
80100061:	b8 1c ec 10 80       	mov    $0x8010ec1c,%eax
80100066:	bb 54 a5 10 80       	mov    $0x8010a554,%ebx
8010006b:	eb 05                	jmp    80100072 <binit+0x3e>
8010006d:	8d 76 00             	lea    0x0(%esi),%esi
80100070:	89 d3                	mov    %edx,%ebx
80100072:	89 43 54             	mov    %eax,0x54(%ebx)
80100075:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
8010007c:	83 ec 08             	sub    $0x8,%esp
8010007f:	68 c7 68 10 80       	push   $0x801068c7
80100084:	8d 43 0c             	lea    0xc(%ebx),%eax
80100087:	50                   	push   %eax
80100088:	e8 3f 3d 00 00       	call   80103dcc <initsleeplock>
8010008d:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
80100092:	89 58 50             	mov    %ebx,0x50(%eax)
80100095:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
8010009b:	8d 93 5c 02 00 00    	lea    0x25c(%ebx),%edx
801000a1:	89 d8                	mov    %ebx,%eax
801000a3:	83 c4 10             	add    $0x10,%esp
801000a6:	81 fb c0 e9 10 80    	cmp    $0x8010e9c0,%ebx
801000ac:	75 c2                	jne    80100070 <binit+0x3c>
801000ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000b1:	c9                   	leave  
801000b2:	c3                   	ret    
801000b3:	90                   	nop

801000b4 <bread>:
801000b4:	55                   	push   %ebp
801000b5:	89 e5                	mov    %esp,%ebp
801000b7:	57                   	push   %edi
801000b8:	56                   	push   %esi
801000b9:	53                   	push   %ebx
801000ba:	83 ec 18             	sub    $0x18,%esp
801000bd:	8b 75 08             	mov    0x8(%ebp),%esi
801000c0:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000c3:	68 20 a5 10 80       	push   $0x8010a520
801000c8:	e8 cb 3f 00 00       	call   80104098 <acquire>
801000cd:	8b 1d 70 ec 10 80    	mov    0x8010ec70,%ebx
801000d3:	83 c4 10             	add    $0x10,%esp
801000d6:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000dc:	75 0d                	jne    801000eb <bread+0x37>
801000de:	eb 1c                	jmp    801000fc <bread+0x48>
801000e0:	8b 5b 54             	mov    0x54(%ebx),%ebx
801000e3:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
801000e9:	74 11                	je     801000fc <bread+0x48>
801000eb:	3b 73 04             	cmp    0x4(%ebx),%esi
801000ee:	75 f0                	jne    801000e0 <bread+0x2c>
801000f0:	3b 7b 08             	cmp    0x8(%ebx),%edi
801000f3:	75 eb                	jne    801000e0 <bread+0x2c>
801000f5:	ff 43 4c             	incl   0x4c(%ebx)
801000f8:	eb 3c                	jmp    80100136 <bread+0x82>
801000fa:	66 90                	xchg   %ax,%ax
801000fc:	8b 1d 6c ec 10 80    	mov    0x8010ec6c,%ebx
80100102:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100108:	75 0d                	jne    80100117 <bread+0x63>
8010010a:	eb 6a                	jmp    80100176 <bread+0xc2>
8010010c:	8b 5b 50             	mov    0x50(%ebx),%ebx
8010010f:	81 fb 1c ec 10 80    	cmp    $0x8010ec1c,%ebx
80100115:	74 5f                	je     80100176 <bread+0xc2>
80100117:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010011a:	85 c0                	test   %eax,%eax
8010011c:	75 ee                	jne    8010010c <bread+0x58>
8010011e:	f6 03 04             	testb  $0x4,(%ebx)
80100121:	75 e9                	jne    8010010c <bread+0x58>
80100123:	89 73 04             	mov    %esi,0x4(%ebx)
80100126:	89 7b 08             	mov    %edi,0x8(%ebx)
80100129:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010012f:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80100136:	83 ec 0c             	sub    $0xc,%esp
80100139:	68 20 a5 10 80       	push   $0x8010a520
8010013e:	e8 f5 3e 00 00       	call   80104038 <release>
80100143:	8d 43 0c             	lea    0xc(%ebx),%eax
80100146:	89 04 24             	mov    %eax,(%esp)
80100149:	e8 b2 3c 00 00       	call   80103e00 <acquiresleep>
8010014e:	83 c4 10             	add    $0x10,%esp
80100151:	f6 03 02             	testb  $0x2,(%ebx)
80100154:	74 0a                	je     80100160 <bread+0xac>
80100156:	89 d8                	mov    %ebx,%eax
80100158:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010015b:	5b                   	pop    %ebx
8010015c:	5e                   	pop    %esi
8010015d:	5f                   	pop    %edi
8010015e:	5d                   	pop    %ebp
8010015f:	c3                   	ret    
80100160:	83 ec 0c             	sub    $0xc,%esp
80100163:	53                   	push   %ebx
80100164:	e8 1b 1f 00 00       	call   80102084 <iderw>
80100169:	83 c4 10             	add    $0x10,%esp
8010016c:	89 d8                	mov    %ebx,%eax
8010016e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100171:	5b                   	pop    %ebx
80100172:	5e                   	pop    %esi
80100173:	5f                   	pop    %edi
80100174:	5d                   	pop    %ebp
80100175:	c3                   	ret    
80100176:	83 ec 0c             	sub    $0xc,%esp
80100179:	68 ce 68 10 80       	push   $0x801068ce
8010017e:	e8 b5 01 00 00       	call   80100338 <panic>
80100183:	90                   	nop

80100184 <bwrite>:
80100184:	55                   	push   %ebp
80100185:	89 e5                	mov    %esp,%ebp
80100187:	53                   	push   %ebx
80100188:	83 ec 10             	sub    $0x10,%esp
8010018b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010018e:	8d 43 0c             	lea    0xc(%ebx),%eax
80100191:	50                   	push   %eax
80100192:	e8 f9 3c 00 00       	call   80103e90 <holdingsleep>
80100197:	83 c4 10             	add    $0x10,%esp
8010019a:	85 c0                	test   %eax,%eax
8010019c:	74 0f                	je     801001ad <bwrite+0x29>
8010019e:	83 0b 04             	orl    $0x4,(%ebx)
801001a1:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001a7:	c9                   	leave  
801001a8:	e9 d7 1e 00 00       	jmp    80102084 <iderw>
801001ad:	83 ec 0c             	sub    $0xc,%esp
801001b0:	68 df 68 10 80       	push   $0x801068df
801001b5:	e8 7e 01 00 00       	call   80100338 <panic>
801001ba:	66 90                	xchg   %ax,%ax

801001bc <brelse>:
801001bc:	55                   	push   %ebp
801001bd:	89 e5                	mov    %esp,%ebp
801001bf:	56                   	push   %esi
801001c0:	53                   	push   %ebx
801001c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001c4:	8d 73 0c             	lea    0xc(%ebx),%esi
801001c7:	83 ec 0c             	sub    $0xc,%esp
801001ca:	56                   	push   %esi
801001cb:	e8 c0 3c 00 00       	call   80103e90 <holdingsleep>
801001d0:	83 c4 10             	add    $0x10,%esp
801001d3:	85 c0                	test   %eax,%eax
801001d5:	74 61                	je     80100238 <brelse+0x7c>
801001d7:	83 ec 0c             	sub    $0xc,%esp
801001da:	56                   	push   %esi
801001db:	e8 74 3c 00 00       	call   80103e54 <releasesleep>
801001e0:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
801001e7:	e8 ac 3e 00 00       	call   80104098 <acquire>
801001ec:	8b 43 4c             	mov    0x4c(%ebx),%eax
801001ef:	48                   	dec    %eax
801001f0:	89 43 4c             	mov    %eax,0x4c(%ebx)
801001f3:	83 c4 10             	add    $0x10,%esp
801001f6:	85 c0                	test   %eax,%eax
801001f8:	75 2c                	jne    80100226 <brelse+0x6a>
801001fa:	8b 53 54             	mov    0x54(%ebx),%edx
801001fd:	8b 43 50             	mov    0x50(%ebx),%eax
80100200:	89 42 50             	mov    %eax,0x50(%edx)
80100203:	8b 53 54             	mov    0x54(%ebx),%edx
80100206:	89 50 54             	mov    %edx,0x54(%eax)
80100209:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010020e:	89 43 54             	mov    %eax,0x54(%ebx)
80100211:	c7 43 50 1c ec 10 80 	movl   $0x8010ec1c,0x50(%ebx)
80100218:	a1 70 ec 10 80       	mov    0x8010ec70,%eax
8010021d:	89 58 50             	mov    %ebx,0x50(%eax)
80100220:	89 1d 70 ec 10 80    	mov    %ebx,0x8010ec70
80100226:	c7 45 08 20 a5 10 80 	movl   $0x8010a520,0x8(%ebp)
8010022d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100230:	5b                   	pop    %ebx
80100231:	5e                   	pop    %esi
80100232:	5d                   	pop    %ebp
80100233:	e9 00 3e 00 00       	jmp    80104038 <release>
80100238:	83 ec 0c             	sub    $0xc,%esp
8010023b:	68 e6 68 10 80       	push   $0x801068e6
80100240:	e8 f3 00 00 00       	call   80100338 <panic>
80100245:	66 90                	xchg   %ax,%ax
80100247:	90                   	nop

80100248 <consoleread>:
80100248:	55                   	push   %ebp
80100249:	89 e5                	mov    %esp,%ebp
8010024b:	57                   	push   %edi
8010024c:	56                   	push   %esi
8010024d:	53                   	push   %ebx
8010024e:	83 ec 18             	sub    $0x18,%esp
80100251:	8b 7d 08             	mov    0x8(%ebp),%edi
80100254:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100257:	57                   	push   %edi
80100258:	e8 7f 14 00 00       	call   801016dc <iunlock>
8010025d:	89 de                	mov    %ebx,%esi
8010025f:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
80100266:	e8 2d 3e 00 00       	call   80104098 <acquire>
8010026b:	83 c4 10             	add    $0x10,%esp
8010026e:	85 db                	test   %ebx,%ebx
80100270:	0f 8e 93 00 00 00    	jle    80100309 <consoleread+0xc1>
80100276:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010027b:	39 05 04 ef 10 80    	cmp    %eax,0x8010ef04
80100281:	74 27                	je     801002aa <consoleread+0x62>
80100283:	eb 57                	jmp    801002dc <consoleread+0x94>
80100285:	8d 76 00             	lea    0x0(%esi),%esi
80100288:	83 ec 08             	sub    $0x8,%esp
8010028b:	68 20 ef 10 80       	push   $0x8010ef20
80100290:	68 00 ef 10 80       	push   $0x8010ef00
80100295:	e8 ba 38 00 00       	call   80103b54 <sleep>
8010029a:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
8010029f:	83 c4 10             	add    $0x10,%esp
801002a2:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801002a8:	75 32                	jne    801002dc <consoleread+0x94>
801002aa:	e8 65 32 00 00       	call   80103514 <myproc>
801002af:	8b 40 24             	mov    0x24(%eax),%eax
801002b2:	85 c0                	test   %eax,%eax
801002b4:	74 d2                	je     80100288 <consoleread+0x40>
801002b6:	83 ec 0c             	sub    $0xc,%esp
801002b9:	68 20 ef 10 80       	push   $0x8010ef20
801002be:	e8 75 3d 00 00       	call   80104038 <release>
801002c3:	89 3c 24             	mov    %edi,(%esp)
801002c6:	e8 49 13 00 00       	call   80101614 <ilock>
801002cb:	83 c4 10             	add    $0x10,%esp
801002ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002d6:	5b                   	pop    %ebx
801002d7:	5e                   	pop    %esi
801002d8:	5f                   	pop    %edi
801002d9:	5d                   	pop    %ebp
801002da:	c3                   	ret    
801002db:	90                   	nop
801002dc:	8d 50 01             	lea    0x1(%eax),%edx
801002df:	89 15 00 ef 10 80    	mov    %edx,0x8010ef00
801002e5:	89 c2                	mov    %eax,%edx
801002e7:	83 e2 7f             	and    $0x7f,%edx
801002ea:	0f be 8a 80 ee 10 80 	movsbl -0x7fef1180(%edx),%ecx
801002f1:	80 f9 04             	cmp    $0x4,%cl
801002f4:	74 37                	je     8010032d <consoleread+0xe5>
801002f6:	ff 45 0c             	incl   0xc(%ebp)
801002f9:	8b 45 0c             	mov    0xc(%ebp),%eax
801002fc:	88 48 ff             	mov    %cl,-0x1(%eax)
801002ff:	4b                   	dec    %ebx
80100300:	83 f9 0a             	cmp    $0xa,%ecx
80100303:	0f 85 65 ff ff ff    	jne    8010026e <consoleread+0x26>
80100309:	83 ec 0c             	sub    $0xc,%esp
8010030c:	68 20 ef 10 80       	push   $0x8010ef20
80100311:	e8 22 3d 00 00       	call   80104038 <release>
80100316:	89 3c 24             	mov    %edi,(%esp)
80100319:	e8 f6 12 00 00       	call   80101614 <ilock>
8010031e:	89 f0                	mov    %esi,%eax
80100320:	29 d8                	sub    %ebx,%eax
80100322:	83 c4 10             	add    $0x10,%esp
80100325:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100328:	5b                   	pop    %ebx
80100329:	5e                   	pop    %esi
8010032a:	5f                   	pop    %edi
8010032b:	5d                   	pop    %ebp
8010032c:	c3                   	ret    
8010032d:	39 f3                	cmp    %esi,%ebx
8010032f:	73 d8                	jae    80100309 <consoleread+0xc1>
80100331:	a3 00 ef 10 80       	mov    %eax,0x8010ef00
80100336:	eb d1                	jmp    80100309 <consoleread+0xc1>

80100338 <panic>:
80100338:	55                   	push   %ebp
80100339:	89 e5                	mov    %esp,%ebp
8010033b:	56                   	push   %esi
8010033c:	53                   	push   %ebx
8010033d:	83 ec 30             	sub    $0x30,%esp
80100340:	fa                   	cli    
80100341:	c7 05 54 ef 10 80 00 	movl   $0x0,0x8010ef54
80100348:	00 00 00 
8010034b:	e8 9c 22 00 00       	call   801025ec <lapicid>
80100350:	83 ec 08             	sub    $0x8,%esp
80100353:	50                   	push   %eax
80100354:	68 ed 68 10 80       	push   $0x801068ed
80100359:	e8 ca 02 00 00       	call   80100628 <cprintf>
8010035e:	58                   	pop    %eax
8010035f:	ff 75 08             	pushl  0x8(%ebp)
80100362:	e8 c1 02 00 00       	call   80100628 <cprintf>
80100367:	c7 04 24 1b 72 10 80 	movl   $0x8010721b,(%esp)
8010036e:	e8 b5 02 00 00       	call   80100628 <cprintf>
80100373:	5a                   	pop    %edx
80100374:	59                   	pop    %ecx
80100375:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100378:	53                   	push   %ebx
80100379:	8d 45 08             	lea    0x8(%ebp),%eax
8010037c:	50                   	push   %eax
8010037d:	e8 72 3b 00 00       	call   80103ef4 <getcallerpcs>
80100382:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100385:	83 c4 10             	add    $0x10,%esp
80100388:	83 ec 08             	sub    $0x8,%esp
8010038b:	ff 33                	pushl  (%ebx)
8010038d:	68 01 69 10 80       	push   $0x80106901
80100392:	e8 91 02 00 00       	call   80100628 <cprintf>
80100397:	83 c3 04             	add    $0x4,%ebx
8010039a:	83 c4 10             	add    $0x10,%esp
8010039d:	39 f3                	cmp    %esi,%ebx
8010039f:	75 e7                	jne    80100388 <panic+0x50>
801003a1:	c7 05 58 ef 10 80 01 	movl   $0x1,0x8010ef58
801003a8:	00 00 00 
801003ab:	eb fe                	jmp    801003ab <panic+0x73>
801003ad:	8d 76 00             	lea    0x0(%esi),%esi

801003b0 <consputc.part.0>:
801003b0:	55                   	push   %ebp
801003b1:	89 e5                	mov    %esp,%ebp
801003b3:	57                   	push   %edi
801003b4:	56                   	push   %esi
801003b5:	53                   	push   %ebx
801003b6:	83 ec 1c             	sub    $0x1c,%esp
801003b9:	3d 00 01 00 00       	cmp    $0x100,%eax
801003be:	0f 84 b4 00 00 00    	je     80100478 <consputc.part.0+0xc8>
801003c4:	89 c6                	mov    %eax,%esi
801003c6:	83 ec 0c             	sub    $0xc,%esp
801003c9:	50                   	push   %eax
801003ca:	e8 35 51 00 00       	call   80105504 <uartputc>
801003cf:	bf d4 03 00 00       	mov    $0x3d4,%edi
801003d4:	b0 0e                	mov    $0xe,%al
801003d6:	89 fa                	mov    %edi,%edx
801003d8:	ee                   	out    %al,(%dx)
801003d9:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801003de:	89 ca                	mov    %ecx,%edx
801003e0:	ec                   	in     (%dx),%al
801003e1:	0f b6 d8             	movzbl %al,%ebx
801003e4:	c1 e3 08             	shl    $0x8,%ebx
801003e7:	b0 0f                	mov    $0xf,%al
801003e9:	89 fa                	mov    %edi,%edx
801003eb:	ee                   	out    %al,(%dx)
801003ec:	89 ca                	mov    %ecx,%edx
801003ee:	ec                   	in     (%dx),%al
801003ef:	0f b6 c8             	movzbl %al,%ecx
801003f2:	09 d9                	or     %ebx,%ecx
801003f4:	83 c4 10             	add    $0x10,%esp
801003f7:	83 fe 0a             	cmp    $0xa,%esi
801003fa:	75 64                	jne    80100460 <consputc.part.0+0xb0>
801003fc:	bb 50 00 00 00       	mov    $0x50,%ebx
80100401:	89 c8                	mov    %ecx,%eax
80100403:	99                   	cltd   
80100404:	f7 fb                	idiv   %ebx
80100406:	29 d3                	sub    %edx,%ebx
80100408:	01 cb                	add    %ecx,%ebx
8010040a:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
80100410:	0f 8f 0e 01 00 00    	jg     80100524 <consputc.part.0+0x174>
80100416:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
8010041c:	0f 8f aa 00 00 00    	jg     801004cc <consputc.part.0+0x11c>
80100422:	0f b6 c7             	movzbl %bh,%eax
80100425:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100428:	88 d9                	mov    %bl,%cl
8010042a:	01 db                	add    %ebx,%ebx
8010042c:	8d bb 00 80 0b 80    	lea    -0x7ff48000(%ebx),%edi
80100432:	be d4 03 00 00       	mov    $0x3d4,%esi
80100437:	b0 0e                	mov    $0xe,%al
80100439:	89 f2                	mov    %esi,%edx
8010043b:	ee                   	out    %al,(%dx)
8010043c:	bb d5 03 00 00       	mov    $0x3d5,%ebx
80100441:	8a 45 e4             	mov    -0x1c(%ebp),%al
80100444:	89 da                	mov    %ebx,%edx
80100446:	ee                   	out    %al,(%dx)
80100447:	b0 0f                	mov    $0xf,%al
80100449:	89 f2                	mov    %esi,%edx
8010044b:	ee                   	out    %al,(%dx)
8010044c:	88 c8                	mov    %cl,%al
8010044e:	89 da                	mov    %ebx,%edx
80100450:	ee                   	out    %al,(%dx)
80100451:	66 c7 07 20 07       	movw   $0x720,(%edi)
80100456:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100459:	5b                   	pop    %ebx
8010045a:	5e                   	pop    %esi
8010045b:	5f                   	pop    %edi
8010045c:	5d                   	pop    %ebp
8010045d:	c3                   	ret    
8010045e:	66 90                	xchg   %ax,%ax
80100460:	8d 59 01             	lea    0x1(%ecx),%ebx
80100463:	89 f0                	mov    %esi,%eax
80100465:	0f b6 f0             	movzbl %al,%esi
80100468:	81 ce 00 07 00 00    	or     $0x700,%esi
8010046e:	66 89 b4 09 00 80 0b 	mov    %si,-0x7ff48000(%ecx,%ecx,1)
80100475:	80 
80100476:	eb 92                	jmp    8010040a <consputc.part.0+0x5a>
80100478:	83 ec 0c             	sub    $0xc,%esp
8010047b:	6a 08                	push   $0x8
8010047d:	e8 82 50 00 00       	call   80105504 <uartputc>
80100482:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
80100489:	e8 76 50 00 00       	call   80105504 <uartputc>
8010048e:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100495:	e8 6a 50 00 00       	call   80105504 <uartputc>
8010049a:	be d4 03 00 00       	mov    $0x3d4,%esi
8010049f:	b0 0e                	mov    $0xe,%al
801004a1:	89 f2                	mov    %esi,%edx
801004a3:	ee                   	out    %al,(%dx)
801004a4:	bb d5 03 00 00       	mov    $0x3d5,%ebx
801004a9:	89 da                	mov    %ebx,%edx
801004ab:	ec                   	in     (%dx),%al
801004ac:	0f b6 c8             	movzbl %al,%ecx
801004af:	c1 e1 08             	shl    $0x8,%ecx
801004b2:	b0 0f                	mov    $0xf,%al
801004b4:	89 f2                	mov    %esi,%edx
801004b6:	ee                   	out    %al,(%dx)
801004b7:	89 da                	mov    %ebx,%edx
801004b9:	ec                   	in     (%dx),%al
801004ba:	0f b6 d8             	movzbl %al,%ebx
801004bd:	83 c4 10             	add    $0x10,%esp
801004c0:	09 cb                	or     %ecx,%ebx
801004c2:	74 50                	je     80100514 <consputc.part.0+0x164>
801004c4:	4b                   	dec    %ebx
801004c5:	e9 40 ff ff ff       	jmp    8010040a <consputc.part.0+0x5a>
801004ca:	66 90                	xchg   %ax,%ax
801004cc:	50                   	push   %eax
801004cd:	68 60 0e 00 00       	push   $0xe60
801004d2:	68 a0 80 0b 80       	push   $0x800b80a0
801004d7:	68 00 80 0b 80       	push   $0x800b8000
801004dc:	e8 f3 3c 00 00       	call   801041d4 <memmove>
801004e1:	8d 73 b0             	lea    -0x50(%ebx),%esi
801004e4:	8d 84 1b 60 ff ff ff 	lea    -0xa0(%ebx,%ebx,1),%eax
801004eb:	8d b8 00 80 0b 80    	lea    -0x7ff48000(%eax),%edi
801004f1:	83 c4 0c             	add    $0xc,%esp
801004f4:	b8 80 07 00 00       	mov    $0x780,%eax
801004f9:	29 f0                	sub    %esi,%eax
801004fb:	01 c0                	add    %eax,%eax
801004fd:	50                   	push   %eax
801004fe:	6a 00                	push   $0x0
80100500:	57                   	push   %edi
80100501:	e8 52 3c 00 00       	call   80104158 <memset>
80100506:	89 f1                	mov    %esi,%ecx
80100508:	83 c4 10             	add    $0x10,%esp
8010050b:	c6 45 e4 07          	movb   $0x7,-0x1c(%ebp)
8010050f:	e9 1e ff ff ff       	jmp    80100432 <consputc.part.0+0x82>
80100514:	bf 00 80 0b 80       	mov    $0x800b8000,%edi
80100519:	31 c9                	xor    %ecx,%ecx
8010051b:	c6 45 e4 00          	movb   $0x0,-0x1c(%ebp)
8010051f:	e9 0e ff ff ff       	jmp    80100432 <consputc.part.0+0x82>
80100524:	83 ec 0c             	sub    $0xc,%esp
80100527:	68 05 69 10 80       	push   $0x80106905
8010052c:	e8 07 fe ff ff       	call   80100338 <panic>
80100531:	8d 76 00             	lea    0x0(%esi),%esi

80100534 <consolewrite>:
80100534:	55                   	push   %ebp
80100535:	89 e5                	mov    %esp,%ebp
80100537:	57                   	push   %edi
80100538:	56                   	push   %esi
80100539:	53                   	push   %ebx
8010053a:	83 ec 18             	sub    $0x18,%esp
8010053d:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100540:	ff 75 08             	pushl  0x8(%ebp)
80100543:	e8 94 11 00 00       	call   801016dc <iunlock>
80100548:	c7 04 24 20 ef 10 80 	movl   $0x8010ef20,(%esp)
8010054f:	e8 44 3b 00 00       	call   80104098 <acquire>
80100554:	83 c4 10             	add    $0x10,%esp
80100557:	85 db                	test   %ebx,%ebx
80100559:	7e 23                	jle    8010057e <consolewrite+0x4a>
8010055b:	8b 75 0c             	mov    0xc(%ebp),%esi
8010055e:	8d 3c 1e             	lea    (%esi,%ebx,1),%edi
80100561:	0f b6 06             	movzbl (%esi),%eax
80100564:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010056a:	85 d2                	test   %edx,%edx
8010056c:	74 06                	je     80100574 <consolewrite+0x40>
8010056e:	fa                   	cli    
8010056f:	eb fe                	jmp    8010056f <consolewrite+0x3b>
80100571:	8d 76 00             	lea    0x0(%esi),%esi
80100574:	e8 37 fe ff ff       	call   801003b0 <consputc.part.0>
80100579:	46                   	inc    %esi
8010057a:	39 f7                	cmp    %esi,%edi
8010057c:	75 e3                	jne    80100561 <consolewrite+0x2d>
8010057e:	83 ec 0c             	sub    $0xc,%esp
80100581:	68 20 ef 10 80       	push   $0x8010ef20
80100586:	e8 ad 3a 00 00       	call   80104038 <release>
8010058b:	58                   	pop    %eax
8010058c:	ff 75 08             	pushl  0x8(%ebp)
8010058f:	e8 80 10 00 00       	call   80101614 <ilock>
80100594:	89 d8                	mov    %ebx,%eax
80100596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100599:	5b                   	pop    %ebx
8010059a:	5e                   	pop    %esi
8010059b:	5f                   	pop    %edi
8010059c:	5d                   	pop    %ebp
8010059d:	c3                   	ret    
8010059e:	66 90                	xchg   %ax,%ax

801005a0 <printint>:
801005a0:	55                   	push   %ebp
801005a1:	89 e5                	mov    %esp,%ebp
801005a3:	57                   	push   %edi
801005a4:	56                   	push   %esi
801005a5:	53                   	push   %ebx
801005a6:	83 ec 2c             	sub    $0x2c,%esp
801005a9:	89 c6                	mov    %eax,%esi
801005ab:	89 d3                	mov    %edx,%ebx
801005ad:	85 c9                	test   %ecx,%ecx
801005af:	74 04                	je     801005b5 <printint+0x15>
801005b1:	85 c0                	test   %eax,%eax
801005b3:	78 63                	js     80100618 <printint+0x78>
801005b5:	89 f1                	mov    %esi,%ecx
801005b7:	31 c0                	xor    %eax,%eax
801005b9:	31 f6                	xor    %esi,%esi
801005bb:	89 45 d0             	mov    %eax,-0x30(%ebp)
801005be:	66 90                	xchg   %ax,%ax
801005c0:	89 c8                	mov    %ecx,%eax
801005c2:	31 d2                	xor    %edx,%edx
801005c4:	f7 f3                	div    %ebx
801005c6:	89 f7                	mov    %esi,%edi
801005c8:	8d 76 01             	lea    0x1(%esi),%esi
801005cb:	8a 92 30 69 10 80    	mov    -0x7fef96d0(%edx),%dl
801005d1:	88 55 d7             	mov    %dl,-0x29(%ebp)
801005d4:	88 54 3d d8          	mov    %dl,-0x28(%ebp,%edi,1)
801005d8:	89 ca                	mov    %ecx,%edx
801005da:	89 c1                	mov    %eax,%ecx
801005dc:	39 da                	cmp    %ebx,%edx
801005de:	73 e0                	jae    801005c0 <printint+0x20>
801005e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
801005e3:	85 c0                	test   %eax,%eax
801005e5:	74 07                	je     801005ee <printint+0x4e>
801005e7:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
801005ec:	89 f7                	mov    %esi,%edi
801005ee:	8d 75 d8             	lea    -0x28(%ebp),%esi
801005f1:	8d 5c 3d d8          	lea    -0x28(%ebp,%edi,1),%ebx
801005f5:	0f be 03             	movsbl (%ebx),%eax
801005f8:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801005fe:	85 d2                	test   %edx,%edx
80100600:	74 06                	je     80100608 <printint+0x68>
80100602:	fa                   	cli    
80100603:	eb fe                	jmp    80100603 <printint+0x63>
80100605:	8d 76 00             	lea    0x0(%esi),%esi
80100608:	e8 a3 fd ff ff       	call   801003b0 <consputc.part.0>
8010060d:	8d 43 ff             	lea    -0x1(%ebx),%eax
80100610:	39 f3                	cmp    %esi,%ebx
80100612:	74 0c                	je     80100620 <printint+0x80>
80100614:	89 c3                	mov    %eax,%ebx
80100616:	eb dd                	jmp    801005f5 <printint+0x55>
80100618:	89 c8                	mov    %ecx,%eax
8010061a:	f7 de                	neg    %esi
8010061c:	89 f1                	mov    %esi,%ecx
8010061e:	eb 99                	jmp    801005b9 <printint+0x19>
80100620:	83 c4 2c             	add    $0x2c,%esp
80100623:	5b                   	pop    %ebx
80100624:	5e                   	pop    %esi
80100625:	5f                   	pop    %edi
80100626:	5d                   	pop    %ebp
80100627:	c3                   	ret    

80100628 <cprintf>:
80100628:	55                   	push   %ebp
80100629:	89 e5                	mov    %esp,%ebp
8010062b:	57                   	push   %edi
8010062c:	56                   	push   %esi
8010062d:	53                   	push   %ebx
8010062e:	83 ec 1c             	sub    $0x1c,%esp
80100631:	8b 3d 54 ef 10 80    	mov    0x8010ef54,%edi
80100637:	8b 75 08             	mov    0x8(%ebp),%esi
8010063a:	85 ff                	test   %edi,%edi
8010063c:	0f 85 1e 01 00 00    	jne    80100760 <cprintf+0x138>
80100642:	85 f6                	test   %esi,%esi
80100644:	0f 84 bc 01 00 00    	je     80100806 <cprintf+0x1de>
8010064a:	0f b6 06             	movzbl (%esi),%eax
8010064d:	85 c0                	test   %eax,%eax
8010064f:	74 67                	je     801006b8 <cprintf+0x90>
80100651:	8d 55 0c             	lea    0xc(%ebp),%edx
80100654:	31 db                	xor    %ebx,%ebx
80100656:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80100659:	89 d7                	mov    %edx,%edi
8010065b:	83 f8 25             	cmp    $0x25,%eax
8010065e:	0f 85 c4 00 00 00    	jne    80100728 <cprintf+0x100>
80100664:	43                   	inc    %ebx
80100665:	0f b6 0c 1e          	movzbl (%esi,%ebx,1),%ecx
80100669:	85 c9                	test   %ecx,%ecx
8010066b:	74 40                	je     801006ad <cprintf+0x85>
8010066d:	83 f9 70             	cmp    $0x70,%ecx
80100670:	0f 84 8b 00 00 00    	je     80100701 <cprintf+0xd9>
80100676:	7f 48                	jg     801006c0 <cprintf+0x98>
80100678:	83 f9 25             	cmp    $0x25,%ecx
8010067b:	0f 84 b7 00 00 00    	je     80100738 <cprintf+0x110>
80100681:	83 f9 64             	cmp    $0x64,%ecx
80100684:	0f 85 0e 01 00 00    	jne    80100798 <cprintf+0x170>
8010068a:	8d 47 04             	lea    0x4(%edi),%eax
8010068d:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100690:	8b 07                	mov    (%edi),%eax
80100692:	b9 01 00 00 00       	mov    $0x1,%ecx
80100697:	ba 0a 00 00 00       	mov    $0xa,%edx
8010069c:	e8 ff fe ff ff       	call   801005a0 <printint>
801006a1:	8b 7d e0             	mov    -0x20(%ebp),%edi
801006a4:	43                   	inc    %ebx
801006a5:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
801006a9:	85 c0                	test   %eax,%eax
801006ab:	75 ae                	jne    8010065b <cprintf+0x33>
801006ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801006b0:	85 ff                	test   %edi,%edi
801006b2:	0f 85 cb 00 00 00    	jne    80100783 <cprintf+0x15b>
801006b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801006bb:	5b                   	pop    %ebx
801006bc:	5e                   	pop    %esi
801006bd:	5f                   	pop    %edi
801006be:	5d                   	pop    %ebp
801006bf:	c3                   	ret    
801006c0:	83 f9 73             	cmp    $0x73,%ecx
801006c3:	75 33                	jne    801006f8 <cprintf+0xd0>
801006c5:	8d 47 04             	lea    0x4(%edi),%eax
801006c8:	8b 17                	mov    (%edi),%edx
801006ca:	85 d2                	test   %edx,%edx
801006cc:	0f 85 f6 00 00 00    	jne    801007c8 <cprintf+0x1a0>
801006d2:	b1 28                	mov    $0x28,%cl
801006d4:	bf 18 69 10 80       	mov    $0x80106918,%edi
801006d9:	89 5d e0             	mov    %ebx,-0x20(%ebp)
801006dc:	89 fb                	mov    %edi,%ebx
801006de:	89 f7                	mov    %esi,%edi
801006e0:	89 c6                	mov    %eax,%esi
801006e2:	0f be c1             	movsbl %cl,%eax
801006e5:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
801006eb:	85 d2                	test   %edx,%edx
801006ed:	0f 84 e8 00 00 00    	je     801007db <cprintf+0x1b3>
801006f3:	fa                   	cli    
801006f4:	eb fe                	jmp    801006f4 <cprintf+0xcc>
801006f6:	66 90                	xchg   %ax,%ax
801006f8:	83 f9 78             	cmp    $0x78,%ecx
801006fb:	0f 85 97 00 00 00    	jne    80100798 <cprintf+0x170>
80100701:	8d 47 04             	lea    0x4(%edi),%eax
80100704:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100707:	8b 07                	mov    (%edi),%eax
80100709:	31 c9                	xor    %ecx,%ecx
8010070b:	ba 10 00 00 00       	mov    $0x10,%edx
80100710:	e8 8b fe ff ff       	call   801005a0 <printint>
80100715:	8b 7d e0             	mov    -0x20(%ebp),%edi
80100718:	43                   	inc    %ebx
80100719:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
8010071d:	85 c0                	test   %eax,%eax
8010071f:	0f 85 36 ff ff ff    	jne    8010065b <cprintf+0x33>
80100725:	eb 86                	jmp    801006ad <cprintf+0x85>
80100727:	90                   	nop
80100728:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
8010072e:	85 c9                	test   %ecx,%ecx
80100730:	74 15                	je     80100747 <cprintf+0x11f>
80100732:	fa                   	cli    
80100733:	eb fe                	jmp    80100733 <cprintf+0x10b>
80100735:	8d 76 00             	lea    0x0(%esi),%esi
80100738:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
8010073e:	85 c9                	test   %ecx,%ecx
80100740:	75 7e                	jne    801007c0 <cprintf+0x198>
80100742:	b8 25 00 00 00       	mov    $0x25,%eax
80100747:	e8 64 fc ff ff       	call   801003b0 <consputc.part.0>
8010074c:	43                   	inc    %ebx
8010074d:	0f b6 04 1e          	movzbl (%esi,%ebx,1),%eax
80100751:	85 c0                	test   %eax,%eax
80100753:	0f 85 02 ff ff ff    	jne    8010065b <cprintf+0x33>
80100759:	e9 4f ff ff ff       	jmp    801006ad <cprintf+0x85>
8010075e:	66 90                	xchg   %ax,%ax
80100760:	83 ec 0c             	sub    $0xc,%esp
80100763:	68 20 ef 10 80       	push   $0x8010ef20
80100768:	e8 2b 39 00 00       	call   80104098 <acquire>
8010076d:	83 c4 10             	add    $0x10,%esp
80100770:	85 f6                	test   %esi,%esi
80100772:	0f 84 8e 00 00 00    	je     80100806 <cprintf+0x1de>
80100778:	0f b6 06             	movzbl (%esi),%eax
8010077b:	85 c0                	test   %eax,%eax
8010077d:	0f 85 ce fe ff ff    	jne    80100651 <cprintf+0x29>
80100783:	83 ec 0c             	sub    $0xc,%esp
80100786:	68 20 ef 10 80       	push   $0x8010ef20
8010078b:	e8 a8 38 00 00       	call   80104038 <release>
80100790:	83 c4 10             	add    $0x10,%esp
80100793:	e9 20 ff ff ff       	jmp    801006b8 <cprintf+0x90>
80100798:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010079e:	85 d2                	test   %edx,%edx
801007a0:	75 22                	jne    801007c4 <cprintf+0x19c>
801007a2:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801007a5:	b8 25 00 00 00       	mov    $0x25,%eax
801007aa:	e8 01 fc ff ff       	call   801003b0 <consputc.part.0>
801007af:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
801007b4:	85 c0                	test   %eax,%eax
801007b6:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801007b9:	74 3f                	je     801007fa <cprintf+0x1d2>
801007bb:	fa                   	cli    
801007bc:	eb fe                	jmp    801007bc <cprintf+0x194>
801007be:	66 90                	xchg   %ax,%ax
801007c0:	fa                   	cli    
801007c1:	eb fe                	jmp    801007c1 <cprintf+0x199>
801007c3:	90                   	nop
801007c4:	fa                   	cli    
801007c5:	eb fe                	jmp    801007c5 <cprintf+0x19d>
801007c7:	90                   	nop
801007c8:	89 d7                	mov    %edx,%edi
801007ca:	8a 0a                	mov    (%edx),%cl
801007cc:	84 c9                	test   %cl,%cl
801007ce:	0f 85 05 ff ff ff    	jne    801006d9 <cprintf+0xb1>
801007d4:	89 c7                	mov    %eax,%edi
801007d6:	e9 c9 fe ff ff       	jmp    801006a4 <cprintf+0x7c>
801007db:	e8 d0 fb ff ff       	call   801003b0 <consputc.part.0>
801007e0:	43                   	inc    %ebx
801007e1:	0f be 03             	movsbl (%ebx),%eax
801007e4:	84 c0                	test   %al,%al
801007e6:	0f 85 f9 fe ff ff    	jne    801006e5 <cprintf+0xbd>
801007ec:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801007ef:	89 f0                	mov    %esi,%eax
801007f1:	89 fe                	mov    %edi,%esi
801007f3:	89 c7                	mov    %eax,%edi
801007f5:	e9 aa fe ff ff       	jmp    801006a4 <cprintf+0x7c>
801007fa:	89 c8                	mov    %ecx,%eax
801007fc:	e8 af fb ff ff       	call   801003b0 <consputc.part.0>
80100801:	e9 9e fe ff ff       	jmp    801006a4 <cprintf+0x7c>
80100806:	83 ec 0c             	sub    $0xc,%esp
80100809:	68 1f 69 10 80       	push   $0x8010691f
8010080e:	e8 25 fb ff ff       	call   80100338 <panic>
80100813:	90                   	nop

80100814 <consoleintr>:
80100814:	55                   	push   %ebp
80100815:	89 e5                	mov    %esp,%ebp
80100817:	57                   	push   %edi
80100818:	56                   	push   %esi
80100819:	53                   	push   %ebx
8010081a:	83 ec 28             	sub    $0x28,%esp
8010081d:	8b 7d 08             	mov    0x8(%ebp),%edi
80100820:	68 20 ef 10 80       	push   $0x8010ef20
80100825:	e8 6e 38 00 00       	call   80104098 <acquire>
8010082a:	83 c4 10             	add    $0x10,%esp
8010082d:	31 f6                	xor    %esi,%esi
8010082f:	eb 1a                	jmp    8010084b <consoleintr+0x37>
80100831:	8d 76 00             	lea    0x0(%esi),%esi
80100834:	83 f8 08             	cmp    $0x8,%eax
80100837:	0f 84 e7 00 00 00    	je     80100924 <consoleintr+0x110>
8010083d:	83 f8 10             	cmp    $0x10,%eax
80100840:	0f 85 39 01 00 00    	jne    8010097f <consoleintr+0x16b>
80100846:	be 01 00 00 00       	mov    $0x1,%esi
8010084b:	ff d7                	call   *%edi
8010084d:	85 c0                	test   %eax,%eax
8010084f:	0f 88 f3 00 00 00    	js     80100948 <consoleintr+0x134>
80100855:	83 f8 15             	cmp    $0x15,%eax
80100858:	0f 84 8d 00 00 00    	je     801008eb <consoleintr+0xd7>
8010085e:	7e d4                	jle    80100834 <consoleintr+0x20>
80100860:	83 f8 7f             	cmp    $0x7f,%eax
80100863:	0f 84 bb 00 00 00    	je     80100924 <consoleintr+0x110>
80100869:	8b 1d 08 ef 10 80    	mov    0x8010ef08,%ebx
8010086f:	89 da                	mov    %ebx,%edx
80100871:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
80100877:	83 fa 7f             	cmp    $0x7f,%edx
8010087a:	77 cf                	ja     8010084b <consoleintr+0x37>
8010087c:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
80100882:	89 da                	mov    %ebx,%edx
80100884:	83 e2 7f             	and    $0x7f,%edx
80100887:	43                   	inc    %ebx
80100888:	89 1d 08 ef 10 80    	mov    %ebx,0x8010ef08
8010088e:	88 82 80 ee 10 80    	mov    %al,-0x7fef1180(%edx)
80100894:	85 c9                	test   %ecx,%ecx
80100896:	0f 85 3d 01 00 00    	jne    801009d9 <consoleintr+0x1c5>
8010089c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010089f:	e8 0c fb ff ff       	call   801003b0 <consputc.part.0>
801008a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801008a7:	8b 0d 08 ef 10 80    	mov    0x8010ef08,%ecx
801008ad:	83 f8 0a             	cmp    $0xa,%eax
801008b0:	74 14                	je     801008c6 <consoleintr+0xb2>
801008b2:	83 f8 04             	cmp    $0x4,%eax
801008b5:	74 0f                	je     801008c6 <consoleintr+0xb2>
801008b7:	a1 00 ef 10 80       	mov    0x8010ef00,%eax
801008bc:	8d 90 80 00 00 00    	lea    0x80(%eax),%edx
801008c2:	39 ca                	cmp    %ecx,%edx
801008c4:	75 85                	jne    8010084b <consoleintr+0x37>
801008c6:	89 0d 04 ef 10 80    	mov    %ecx,0x8010ef04
801008cc:	83 ec 0c             	sub    $0xc,%esp
801008cf:	68 00 ef 10 80       	push   $0x8010ef00
801008d4:	e8 37 33 00 00       	call   80103c10 <wakeup>
801008d9:	83 c4 10             	add    $0x10,%esp
801008dc:	e9 6a ff ff ff       	jmp    8010084b <consoleintr+0x37>
801008e1:	b8 00 01 00 00       	mov    $0x100,%eax
801008e6:	e8 c5 fa ff ff       	call   801003b0 <consputc.part.0>
801008eb:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
801008f0:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
801008f6:	0f 84 4f ff ff ff    	je     8010084b <consoleintr+0x37>
801008fc:	48                   	dec    %eax
801008fd:	89 c2                	mov    %eax,%edx
801008ff:	83 e2 7f             	and    $0x7f,%edx
80100902:	80 ba 80 ee 10 80 0a 	cmpb   $0xa,-0x7fef1180(%edx)
80100909:	0f 84 3c ff ff ff    	je     8010084b <consoleintr+0x37>
8010090f:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
80100914:	8b 15 58 ef 10 80    	mov    0x8010ef58,%edx
8010091a:	85 d2                	test   %edx,%edx
8010091c:	74 c3                	je     801008e1 <consoleintr+0xcd>
8010091e:	fa                   	cli    
8010091f:	eb fe                	jmp    8010091f <consoleintr+0x10b>
80100921:	8d 76 00             	lea    0x0(%esi),%esi
80100924:	a1 08 ef 10 80       	mov    0x8010ef08,%eax
80100929:	3b 05 04 ef 10 80    	cmp    0x8010ef04,%eax
8010092f:	0f 84 16 ff ff ff    	je     8010084b <consoleintr+0x37>
80100935:	48                   	dec    %eax
80100936:	a3 08 ef 10 80       	mov    %eax,0x8010ef08
8010093b:	a1 58 ef 10 80       	mov    0x8010ef58,%eax
80100940:	85 c0                	test   %eax,%eax
80100942:	74 20                	je     80100964 <consoleintr+0x150>
80100944:	fa                   	cli    
80100945:	eb fe                	jmp    80100945 <consoleintr+0x131>
80100947:	90                   	nop
80100948:	83 ec 0c             	sub    $0xc,%esp
8010094b:	68 20 ef 10 80       	push   $0x8010ef20
80100950:	e8 e3 36 00 00       	call   80104038 <release>
80100955:	83 c4 10             	add    $0x10,%esp
80100958:	85 f6                	test   %esi,%esi
8010095a:	75 17                	jne    80100973 <consoleintr+0x15f>
8010095c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010095f:	5b                   	pop    %ebx
80100960:	5e                   	pop    %esi
80100961:	5f                   	pop    %edi
80100962:	5d                   	pop    %ebp
80100963:	c3                   	ret    
80100964:	b8 00 01 00 00       	mov    $0x100,%eax
80100969:	e8 42 fa ff ff       	call   801003b0 <consputc.part.0>
8010096e:	e9 d8 fe ff ff       	jmp    8010084b <consoleintr+0x37>
80100973:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100976:	5b                   	pop    %ebx
80100977:	5e                   	pop    %esi
80100978:	5f                   	pop    %edi
80100979:	5d                   	pop    %ebp
8010097a:	e9 61 33 00 00       	jmp    80103ce0 <procdump>
8010097f:	85 c0                	test   %eax,%eax
80100981:	0f 84 c4 fe ff ff    	je     8010084b <consoleintr+0x37>
80100987:	8b 1d 08 ef 10 80    	mov    0x8010ef08,%ebx
8010098d:	89 da                	mov    %ebx,%edx
8010098f:	2b 15 00 ef 10 80    	sub    0x8010ef00,%edx
80100995:	83 fa 7f             	cmp    $0x7f,%edx
80100998:	0f 87 ad fe ff ff    	ja     8010084b <consoleintr+0x37>
8010099e:	8b 0d 58 ef 10 80    	mov    0x8010ef58,%ecx
801009a4:	89 da                	mov    %ebx,%edx
801009a6:	83 e2 7f             	and    $0x7f,%edx
801009a9:	43                   	inc    %ebx
801009aa:	83 f8 0d             	cmp    $0xd,%eax
801009ad:	0f 85 d5 fe ff ff    	jne    80100888 <consoleintr+0x74>
801009b3:	89 1d 08 ef 10 80    	mov    %ebx,0x8010ef08
801009b9:	c6 82 80 ee 10 80 0a 	movb   $0xa,-0x7fef1180(%edx)
801009c0:	85 c9                	test   %ecx,%ecx
801009c2:	75 15                	jne    801009d9 <consoleintr+0x1c5>
801009c4:	b8 0a 00 00 00       	mov    $0xa,%eax
801009c9:	e8 e2 f9 ff ff       	call   801003b0 <consputc.part.0>
801009ce:	8b 0d 08 ef 10 80    	mov    0x8010ef08,%ecx
801009d4:	e9 ed fe ff ff       	jmp    801008c6 <consoleintr+0xb2>
801009d9:	fa                   	cli    
801009da:	eb fe                	jmp    801009da <consoleintr+0x1c6>

801009dc <consoleinit>:
801009dc:	55                   	push   %ebp
801009dd:	89 e5                	mov    %esp,%ebp
801009df:	83 ec 10             	sub    $0x10,%esp
801009e2:	68 28 69 10 80       	push   $0x80106928
801009e7:	68 20 ef 10 80       	push   $0x8010ef20
801009ec:	e8 e7 34 00 00       	call   80103ed8 <initlock>
801009f1:	c7 05 0c f9 10 80 34 	movl   $0x80100534,0x8010f90c
801009f8:	05 10 80 
801009fb:	c7 05 08 f9 10 80 48 	movl   $0x80100248,0x8010f908
80100a02:	02 10 80 
80100a05:	c7 05 54 ef 10 80 01 	movl   $0x1,0x8010ef54
80100a0c:	00 00 00 
80100a0f:	58                   	pop    %eax
80100a10:	5a                   	pop    %edx
80100a11:	6a 00                	push   $0x0
80100a13:	6a 01                	push   $0x1
80100a15:	e8 ea 17 00 00       	call   80102204 <ioapicenable>
80100a1a:	83 c4 10             	add    $0x10,%esp
80100a1d:	c9                   	leave  
80100a1e:	c3                   	ret    
80100a1f:	90                   	nop

80100a20 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
80100a20:	55                   	push   %ebp
80100a21:	89 e5                	mov    %esp,%ebp
80100a23:	57                   	push   %edi
80100a24:	56                   	push   %esi
80100a25:	53                   	push   %ebx
80100a26:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
80100a2c:	e8 e3 2a 00 00       	call   80103514 <myproc>
80100a31:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)

  begin_op();
80100a37:	e8 90 1f 00 00       	call   801029cc <begin_op>

  if((ip = namei(path)) == 0){
80100a3c:	83 ec 0c             	sub    $0xc,%esp
80100a3f:	ff 75 08             	pushl  0x8(%ebp)
80100a42:	e8 59 14 00 00       	call   80101ea0 <namei>
80100a47:	83 c4 10             	add    $0x10,%esp
80100a4a:	85 c0                	test   %eax,%eax
80100a4c:	0f 84 10 03 00 00    	je     80100d62 <exec+0x342>
80100a52:	89 c7                	mov    %eax,%edi
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a54:	83 ec 0c             	sub    $0xc,%esp
80100a57:	50                   	push   %eax
80100a58:	e8 b7 0b 00 00       	call   80101614 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a5d:	6a 34                	push   $0x34
80100a5f:	6a 00                	push   $0x0
80100a61:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a67:	50                   	push   %eax
80100a68:	57                   	push   %edi
80100a69:	e8 76 0e 00 00       	call   801018e4 <readi>
80100a6e:	83 c4 20             	add    $0x20,%esp
80100a71:	83 f8 34             	cmp    $0x34,%eax
80100a74:	0f 85 f9 00 00 00    	jne    80100b73 <exec+0x153>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a7a:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a81:	45 4c 46 
80100a84:	0f 85 e9 00 00 00    	jne    80100b73 <exec+0x153>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a8a:	e8 31 5b 00 00       	call   801065c0 <setupkvm>
80100a8f:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a95:	85 c0                	test   %eax,%eax
80100a97:	0f 84 d6 00 00 00    	je     80100b73 <exec+0x153>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a9d:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100aa3:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aaa:	00 
80100aab:	0f 84 81 02 00 00    	je     80100d32 <exec+0x312>
  sz = 0;
80100ab1:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100ab8:	00 00 00 
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100abb:	31 db                	xor    %ebx,%ebx
80100abd:	e9 84 00 00 00       	jmp    80100b46 <exec+0x126>
80100ac2:	66 90                	xchg   %ax,%ax
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ac4:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acb:	75 6a                	jne    80100b37 <exec+0x117>
      continue;
    if(ph.memsz < ph.filesz)
80100acd:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad3:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ad9:	0f 82 83 00 00 00    	jb     80100b62 <exec+0x142>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100adf:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae5:	72 7b                	jb     80100b62 <exec+0x142>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100ae7:	51                   	push   %ecx
80100ae8:	50                   	push   %eax
80100ae9:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100aef:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100af5:	e8 3a 59 00 00       	call   80106434 <allocuvm>
80100afa:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b00:	83 c4 10             	add    $0x10,%esp
80100b03:	85 c0                	test   %eax,%eax
80100b05:	74 5b                	je     80100b62 <exec+0x142>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b07:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0d:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b12:	75 4e                	jne    80100b62 <exec+0x142>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b14:	83 ec 0c             	sub    $0xc,%esp
80100b17:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1d:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b23:	57                   	push   %edi
80100b24:	50                   	push   %eax
80100b25:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b2b:	e8 40 58 00 00       	call   80106370 <loaduvm>
80100b30:	83 c4 20             	add    $0x20,%esp
80100b33:	85 c0                	test   %eax,%eax
80100b35:	78 2b                	js     80100b62 <exec+0x142>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b37:	43                   	inc    %ebx
80100b38:	83 c6 20             	add    $0x20,%esi
80100b3b:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b42:	39 d8                	cmp    %ebx,%eax
80100b44:	7e 4e                	jle    80100b94 <exec+0x174>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100b46:	6a 20                	push   $0x20
80100b48:	56                   	push   %esi
80100b49:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	57                   	push   %edi
80100b51:	e8 8e 0d 00 00       	call   801018e4 <readi>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	83 f8 20             	cmp    $0x20,%eax
80100b5c:	0f 84 62 ff ff ff    	je     80100ac4 <exec+0xa4>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b62:	83 ec 0c             	sub    $0xc,%esp
80100b65:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b6b:	e8 e0 59 00 00       	call   80106550 <freevm>
  if(ip){
80100b70:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
80100b73:	83 ec 0c             	sub    $0xc,%esp
80100b76:	57                   	push   %edi
80100b77:	e8 ec 0c 00 00       	call   80101868 <iunlockput>
    end_op();
80100b7c:	e8 b3 1e 00 00       	call   80102a34 <end_op>
80100b81:	83 c4 10             	add    $0x10,%esp
    return -1;
80100b84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return -1;
}
80100b89:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b8c:	5b                   	pop    %ebx
80100b8d:	5e                   	pop    %esi
80100b8e:	5f                   	pop    %edi
80100b8f:	5d                   	pop    %ebp
80100b90:	c3                   	ret    
80100b91:	8d 76 00             	lea    0x0(%esi),%esi
  sz = PGROUNDUP(sz);
80100b94:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b9a:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100ba0:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100ba6:	8d 9e 00 20 00 00    	lea    0x2000(%esi),%ebx
  iunlockput(ip);
80100bac:	83 ec 0c             	sub    $0xc,%esp
80100baf:	57                   	push   %edi
80100bb0:	e8 b3 0c 00 00       	call   80101868 <iunlockput>
  end_op();
80100bb5:	e8 7a 1e 00 00       	call   80102a34 <end_op>
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100bba:	83 c4 0c             	add    $0xc,%esp
80100bbd:	53                   	push   %ebx
80100bbe:	56                   	push   %esi
80100bbf:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100bc5:	56                   	push   %esi
80100bc6:	e8 69 58 00 00       	call   80106434 <allocuvm>
80100bcb:	89 c7                	mov    %eax,%edi
80100bcd:	83 c4 10             	add    $0x10,%esp
80100bd0:	85 c0                	test   %eax,%eax
80100bd2:	74 7e                	je     80100c52 <exec+0x232>
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bd4:	83 ec 08             	sub    $0x8,%esp
80100bd7:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bdd:	50                   	push   %eax
80100bde:	56                   	push   %esi
80100bdf:	e8 6c 5a 00 00       	call   80106650 <clearpteu>
  for(argc = 0; argv[argc]; argc++) {
80100be4:	8b 45 0c             	mov    0xc(%ebp),%eax
80100be7:	8b 10                	mov    (%eax),%edx
80100be9:	83 c4 10             	add    $0x10,%esp
80100bec:	89 fb                	mov    %edi,%ebx
80100bee:	85 d2                	test   %edx,%edx
80100bf0:	0f 84 48 01 00 00    	je     80100d3e <exec+0x31e>
80100bf6:	31 f6                	xor    %esi,%esi
80100bf8:	89 bd f0 fe ff ff    	mov    %edi,-0x110(%ebp)
80100bfe:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100c01:	eb 1f                	jmp    80100c22 <exec+0x202>
80100c03:	90                   	nop
    ustack[3+argc] = sp;
80100c04:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100c0a:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
  for(argc = 0; argv[argc]; argc++) {
80100c11:	8d 46 01             	lea    0x1(%esi),%eax
80100c14:	8b 14 87             	mov    (%edi,%eax,4),%edx
80100c17:	85 d2                	test   %edx,%edx
80100c19:	74 4d                	je     80100c68 <exec+0x248>
    if(argc >= MAXARG)
80100c1b:	83 f8 20             	cmp    $0x20,%eax
80100c1e:	74 32                	je     80100c52 <exec+0x232>
  for(argc = 0; argv[argc]; argc++) {
80100c20:	89 c6                	mov    %eax,%esi
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c22:	83 ec 0c             	sub    $0xc,%esp
80100c25:	52                   	push   %edx
80100c26:	e8 a9 36 00 00       	call   801042d4 <strlen>
80100c2b:	29 c3                	sub    %eax,%ebx
80100c2d:	4b                   	dec    %ebx
80100c2e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c31:	5a                   	pop    %edx
80100c32:	ff 34 b7             	pushl  (%edi,%esi,4)
80100c35:	e8 9a 36 00 00       	call   801042d4 <strlen>
80100c3a:	40                   	inc    %eax
80100c3b:	50                   	push   %eax
80100c3c:	ff 34 b7             	pushl  (%edi,%esi,4)
80100c3f:	53                   	push   %ebx
80100c40:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c46:	e8 a9 5b 00 00       	call   801067f4 <copyout>
80100c4b:	83 c4 20             	add    $0x20,%esp
80100c4e:	85 c0                	test   %eax,%eax
80100c50:	79 b2                	jns    80100c04 <exec+0x1e4>
    freevm(pgdir);
80100c52:	83 ec 0c             	sub    $0xc,%esp
80100c55:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100c5b:	e8 f0 58 00 00       	call   80106550 <freevm>
80100c60:	83 c4 10             	add    $0x10,%esp
80100c63:	e9 1c ff ff ff       	jmp    80100b84 <exec+0x164>
  ustack[3+argc] = 0;
80100c68:	8b bd f0 fe ff ff    	mov    -0x110(%ebp),%edi
80100c6e:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100c74:	8d 46 04             	lea    0x4(%esi),%eax
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c77:	8d 14 b5 08 00 00 00 	lea    0x8(,%esi,4),%edx
  sp -= (3+argc+1) * 4;
80100c7e:	8d 72 0c             	lea    0xc(%edx),%esi
  ustack[3+argc] = 0;
80100c81:	c7 84 85 58 ff ff ff 	movl   $0x0,-0xa8(%ebp,%eax,4)
80100c88:	00 00 00 00 
  ustack[0] = 0xffffffff;  // fake return PC
80100c8c:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c93:	ff ff ff 
  ustack[1] = argc;
80100c96:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100c9c:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca2:	89 d8                	mov    %ebx,%eax
80100ca4:	29 d0                	sub    %edx,%eax
80100ca6:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
  sp -= (3+argc+1) * 4;
80100cac:	29 f3                	sub    %esi,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cae:	56                   	push   %esi
80100caf:	51                   	push   %ecx
80100cb0:	53                   	push   %ebx
80100cb1:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100cb7:	e8 38 5b 00 00       	call   801067f4 <copyout>
80100cbc:	83 c4 10             	add    $0x10,%esp
80100cbf:	85 c0                	test   %eax,%eax
80100cc1:	78 8f                	js     80100c52 <exec+0x232>
  for(last=s=path; *s; s++)
80100cc3:	8b 45 08             	mov    0x8(%ebp),%eax
80100cc6:	8a 00                	mov    (%eax),%al
80100cc8:	8b 55 08             	mov    0x8(%ebp),%edx
80100ccb:	84 c0                	test   %al,%al
80100ccd:	74 12                	je     80100ce1 <exec+0x2c1>
80100ccf:	89 d1                	mov    %edx,%ecx
80100cd1:	8d 76 00             	lea    0x0(%esi),%esi
      last = s+1;
80100cd4:	41                   	inc    %ecx
    if(*s == '/')
80100cd5:	3c 2f                	cmp    $0x2f,%al
80100cd7:	75 02                	jne    80100cdb <exec+0x2bb>
      last = s+1;
80100cd9:	89 ca                	mov    %ecx,%edx
  for(last=s=path; *s; s++)
80100cdb:	8a 01                	mov    (%ecx),%al
80100cdd:	84 c0                	test   %al,%al
80100cdf:	75 f3                	jne    80100cd4 <exec+0x2b4>
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100ce1:	50                   	push   %eax
80100ce2:	6a 10                	push   $0x10
80100ce4:	52                   	push   %edx
80100ce5:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100ceb:	8d 46 6c             	lea    0x6c(%esi),%eax
80100cee:	50                   	push   %eax
80100cef:	e8 ac 35 00 00       	call   801042a0 <safestrcpy>
  oldpgdir = curproc->pgdir;
80100cf4:	89 f0                	mov    %esi,%eax
80100cf6:	8b 76 04             	mov    0x4(%esi),%esi
  curproc->pgdir = pgdir;
80100cf9:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100cff:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
80100d02:	89 38                	mov    %edi,(%eax)
  curproc->tf->eip = elf.entry;  // main
80100d04:	89 c1                	mov    %eax,%ecx
80100d06:	8b 40 18             	mov    0x18(%eax),%eax
80100d09:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d0f:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d12:	8b 41 18             	mov    0x18(%ecx),%eax
80100d15:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d18:	89 0c 24             	mov    %ecx,(%esp)
80100d1b:	e8 e0 54 00 00       	call   80106200 <switchuvm>
  freevm(oldpgdir);
80100d20:	89 34 24             	mov    %esi,(%esp)
80100d23:	e8 28 58 00 00       	call   80106550 <freevm>
  return 0;
80100d28:	83 c4 10             	add    $0x10,%esp
80100d2b:	31 c0                	xor    %eax,%eax
80100d2d:	e9 57 fe ff ff       	jmp    80100b89 <exec+0x169>
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d32:	bb 00 20 00 00       	mov    $0x2000,%ebx
80100d37:	31 f6                	xor    %esi,%esi
80100d39:	e9 6e fe ff ff       	jmp    80100bac <exec+0x18c>
  for(argc = 0; argv[argc]; argc++) {
80100d3e:	be 10 00 00 00       	mov    $0x10,%esi
80100d43:	ba 04 00 00 00       	mov    $0x4,%edx
80100d48:	b8 03 00 00 00       	mov    $0x3,%eax
80100d4d:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100d54:	00 00 00 
80100d57:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
80100d5d:	e9 1f ff ff ff       	jmp    80100c81 <exec+0x261>
    end_op();
80100d62:	e8 cd 1c 00 00       	call   80102a34 <end_op>
    cprintf("exec: fail\n");
80100d67:	83 ec 0c             	sub    $0xc,%esp
80100d6a:	68 41 69 10 80       	push   $0x80106941
80100d6f:	e8 b4 f8 ff ff       	call   80100628 <cprintf>
    return -1;
80100d74:	83 c4 10             	add    $0x10,%esp
80100d77:	e9 08 fe ff ff       	jmp    80100b84 <exec+0x164>

80100d7c <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d7c:	55                   	push   %ebp
80100d7d:	89 e5                	mov    %esp,%ebp
80100d7f:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d82:	68 4d 69 10 80       	push   $0x8010694d
80100d87:	68 60 ef 10 80       	push   $0x8010ef60
80100d8c:	e8 47 31 00 00       	call   80103ed8 <initlock>
}
80100d91:	83 c4 10             	add    $0x10,%esp
80100d94:	c9                   	leave  
80100d95:	c3                   	ret    
80100d96:	66 90                	xchg   %ax,%ax

80100d98 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100d98:	55                   	push   %ebp
80100d99:	89 e5                	mov    %esp,%ebp
80100d9b:	53                   	push   %ebx
80100d9c:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100d9f:	68 60 ef 10 80       	push   $0x8010ef60
80100da4:	e8 ef 32 00 00       	call   80104098 <acquire>
80100da9:	83 c4 10             	add    $0x10,%esp
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100dac:	bb 94 ef 10 80       	mov    $0x8010ef94,%ebx
80100db1:	eb 0c                	jmp    80100dbf <filealloc+0x27>
80100db3:	90                   	nop
80100db4:	83 c3 18             	add    $0x18,%ebx
80100db7:	81 fb f4 f8 10 80    	cmp    $0x8010f8f4,%ebx
80100dbd:	74 25                	je     80100de4 <filealloc+0x4c>
    if(f->ref == 0){
80100dbf:	8b 43 04             	mov    0x4(%ebx),%eax
80100dc2:	85 c0                	test   %eax,%eax
80100dc4:	75 ee                	jne    80100db4 <filealloc+0x1c>
      f->ref = 1;
80100dc6:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100dcd:	83 ec 0c             	sub    $0xc,%esp
80100dd0:	68 60 ef 10 80       	push   $0x8010ef60
80100dd5:	e8 5e 32 00 00       	call   80104038 <release>
      return f;
80100dda:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100ddd:	89 d8                	mov    %ebx,%eax
80100ddf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de2:	c9                   	leave  
80100de3:	c3                   	ret    
  release(&ftable.lock);
80100de4:	83 ec 0c             	sub    $0xc,%esp
80100de7:	68 60 ef 10 80       	push   $0x8010ef60
80100dec:	e8 47 32 00 00       	call   80104038 <release>
  return 0;
80100df1:	83 c4 10             	add    $0x10,%esp
80100df4:	31 db                	xor    %ebx,%ebx
}
80100df6:	89 d8                	mov    %ebx,%eax
80100df8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dfb:	c9                   	leave  
80100dfc:	c3                   	ret    
80100dfd:	8d 76 00             	lea    0x0(%esi),%esi

80100e00 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e00:	55                   	push   %ebp
80100e01:	89 e5                	mov    %esp,%ebp
80100e03:	53                   	push   %ebx
80100e04:	83 ec 10             	sub    $0x10,%esp
80100e07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e0a:	68 60 ef 10 80       	push   $0x8010ef60
80100e0f:	e8 84 32 00 00       	call   80104098 <acquire>
  if(f->ref < 1)
80100e14:	8b 43 04             	mov    0x4(%ebx),%eax
80100e17:	83 c4 10             	add    $0x10,%esp
80100e1a:	85 c0                	test   %eax,%eax
80100e1c:	7e 18                	jle    80100e36 <filedup+0x36>
    panic("filedup");
  f->ref++;
80100e1e:	40                   	inc    %eax
80100e1f:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e22:	83 ec 0c             	sub    $0xc,%esp
80100e25:	68 60 ef 10 80       	push   $0x8010ef60
80100e2a:	e8 09 32 00 00       	call   80104038 <release>
  return f;
}
80100e2f:	89 d8                	mov    %ebx,%eax
80100e31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e34:	c9                   	leave  
80100e35:	c3                   	ret    
    panic("filedup");
80100e36:	83 ec 0c             	sub    $0xc,%esp
80100e39:	68 54 69 10 80       	push   $0x80106954
80100e3e:	e8 f5 f4 ff ff       	call   80100338 <panic>
80100e43:	90                   	nop

80100e44 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e44:	55                   	push   %ebp
80100e45:	89 e5                	mov    %esp,%ebp
80100e47:	57                   	push   %edi
80100e48:	56                   	push   %esi
80100e49:	53                   	push   %ebx
80100e4a:	83 ec 28             	sub    $0x28,%esp
80100e4d:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e50:	68 60 ef 10 80       	push   $0x8010ef60
80100e55:	e8 3e 32 00 00       	call   80104098 <acquire>
  if(f->ref < 1)
80100e5a:	8b 57 04             	mov    0x4(%edi),%edx
80100e5d:	83 c4 10             	add    $0x10,%esp
80100e60:	85 d2                	test   %edx,%edx
80100e62:	0f 8e 8d 00 00 00    	jle    80100ef5 <fileclose+0xb1>
    panic("fileclose");
  if(--f->ref > 0){
80100e68:	4a                   	dec    %edx
80100e69:	89 57 04             	mov    %edx,0x4(%edi)
80100e6c:	75 3a                	jne    80100ea8 <fileclose+0x64>
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100e6e:	8b 1f                	mov    (%edi),%ebx
80100e70:	8a 47 09             	mov    0x9(%edi),%al
80100e73:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e76:	8b 77 0c             	mov    0xc(%edi),%esi
80100e79:	8b 47 10             	mov    0x10(%edi),%eax
80100e7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
80100e7f:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  release(&ftable.lock);
80100e85:	83 ec 0c             	sub    $0xc,%esp
80100e88:	68 60 ef 10 80       	push   $0x8010ef60
80100e8d:	e8 a6 31 00 00       	call   80104038 <release>

  if(ff.type == FD_PIPE)
80100e92:	83 c4 10             	add    $0x10,%esp
80100e95:	83 fb 01             	cmp    $0x1,%ebx
80100e98:	74 42                	je     80100edc <fileclose+0x98>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100e9a:	83 fb 02             	cmp    $0x2,%ebx
80100e9d:	74 1d                	je     80100ebc <fileclose+0x78>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ea2:	5b                   	pop    %ebx
80100ea3:	5e                   	pop    %esi
80100ea4:	5f                   	pop    %edi
80100ea5:	5d                   	pop    %ebp
80100ea6:	c3                   	ret    
80100ea7:	90                   	nop
    release(&ftable.lock);
80100ea8:	c7 45 08 60 ef 10 80 	movl   $0x8010ef60,0x8(%ebp)
}
80100eaf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eb2:	5b                   	pop    %ebx
80100eb3:	5e                   	pop    %esi
80100eb4:	5f                   	pop    %edi
80100eb5:	5d                   	pop    %ebp
    release(&ftable.lock);
80100eb6:	e9 7d 31 00 00       	jmp    80104038 <release>
80100ebb:	90                   	nop
    begin_op();
80100ebc:	e8 0b 1b 00 00       	call   801029cc <begin_op>
    iput(ff.ip);
80100ec1:	83 ec 0c             	sub    $0xc,%esp
80100ec4:	ff 75 e0             	pushl  -0x20(%ebp)
80100ec7:	e8 54 08 00 00       	call   80101720 <iput>
    end_op();
80100ecc:	83 c4 10             	add    $0x10,%esp
}
80100ecf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ed2:	5b                   	pop    %ebx
80100ed3:	5e                   	pop    %esi
80100ed4:	5f                   	pop    %edi
80100ed5:	5d                   	pop    %ebp
    end_op();
80100ed6:	e9 59 1b 00 00       	jmp    80102a34 <end_op>
80100edb:	90                   	nop
    pipeclose(ff.pipe, ff.writable);
80100edc:	83 ec 08             	sub    $0x8,%esp
80100edf:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80100ee3:	50                   	push   %eax
80100ee4:	56                   	push   %esi
80100ee5:	e8 ea 21 00 00       	call   801030d4 <pipeclose>
80100eea:	83 c4 10             	add    $0x10,%esp
}
80100eed:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef0:	5b                   	pop    %ebx
80100ef1:	5e                   	pop    %esi
80100ef2:	5f                   	pop    %edi
80100ef3:	5d                   	pop    %ebp
80100ef4:	c3                   	ret    
    panic("fileclose");
80100ef5:	83 ec 0c             	sub    $0xc,%esp
80100ef8:	68 5c 69 10 80       	push   $0x8010695c
80100efd:	e8 36 f4 ff ff       	call   80100338 <panic>
80100f02:	66 90                	xchg   %ax,%ax

80100f04 <filestat>:

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f04:	55                   	push   %ebp
80100f05:	89 e5                	mov    %esp,%ebp
80100f07:	53                   	push   %ebx
80100f08:	53                   	push   %ebx
80100f09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f0c:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0f:	75 2b                	jne    80100f3c <filestat+0x38>
    ilock(f->ip);
80100f11:	83 ec 0c             	sub    $0xc,%esp
80100f14:	ff 73 10             	pushl  0x10(%ebx)
80100f17:	e8 f8 06 00 00       	call   80101614 <ilock>
    stati(f->ip, st);
80100f1c:	58                   	pop    %eax
80100f1d:	5a                   	pop    %edx
80100f1e:	ff 75 0c             	pushl  0xc(%ebp)
80100f21:	ff 73 10             	pushl  0x10(%ebx)
80100f24:	e8 8f 09 00 00       	call   801018b8 <stati>
    iunlock(f->ip);
80100f29:	59                   	pop    %ecx
80100f2a:	ff 73 10             	pushl  0x10(%ebx)
80100f2d:	e8 aa 07 00 00       	call   801016dc <iunlock>
    return 0;
80100f32:	83 c4 10             	add    $0x10,%esp
80100f35:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f3a:	c9                   	leave  
80100f3b:	c3                   	ret    
  return -1;
80100f3c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f44:	c9                   	leave  
80100f45:	c3                   	ret    
80100f46:	66 90                	xchg   %ax,%ax

80100f48 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f48:	55                   	push   %ebp
80100f49:	89 e5                	mov    %esp,%ebp
80100f4b:	57                   	push   %edi
80100f4c:	56                   	push   %esi
80100f4d:	53                   	push   %ebx
80100f4e:	83 ec 1c             	sub    $0x1c,%esp
80100f51:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f54:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f57:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f5a:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f5e:	74 60                	je     80100fc0 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f60:	8b 03                	mov    (%ebx),%eax
80100f62:	83 f8 01             	cmp    $0x1,%eax
80100f65:	74 45                	je     80100fac <fileread+0x64>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f67:	83 f8 02             	cmp    $0x2,%eax
80100f6a:	75 5b                	jne    80100fc7 <fileread+0x7f>
    ilock(f->ip);
80100f6c:	83 ec 0c             	sub    $0xc,%esp
80100f6f:	ff 73 10             	pushl  0x10(%ebx)
80100f72:	e8 9d 06 00 00       	call   80101614 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100f77:	57                   	push   %edi
80100f78:	ff 73 14             	pushl  0x14(%ebx)
80100f7b:	56                   	push   %esi
80100f7c:	ff 73 10             	pushl  0x10(%ebx)
80100f7f:	e8 60 09 00 00       	call   801018e4 <readi>
80100f84:	83 c4 20             	add    $0x20,%esp
80100f87:	85 c0                	test   %eax,%eax
80100f89:	7e 03                	jle    80100f8e <fileread+0x46>
      f->off += r;
80100f8b:	01 43 14             	add    %eax,0x14(%ebx)
80100f8e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    iunlock(f->ip);
80100f91:	83 ec 0c             	sub    $0xc,%esp
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 40 07 00 00       	call   801016dc <iunlock>
    return r;
80100f9c:	83 c4 10             	add    $0x10,%esp
80100f9f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  }
  panic("fileread");
}
80100fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa5:	5b                   	pop    %ebx
80100fa6:	5e                   	pop    %esi
80100fa7:	5f                   	pop    %edi
80100fa8:	5d                   	pop    %ebp
80100fa9:	c3                   	ret    
80100faa:	66 90                	xchg   %ax,%ax
    return piperead(f->pipe, addr, n);
80100fac:	8b 43 0c             	mov    0xc(%ebx),%eax
80100faf:	89 45 08             	mov    %eax,0x8(%ebp)
}
80100fb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb5:	5b                   	pop    %ebx
80100fb6:	5e                   	pop    %esi
80100fb7:	5f                   	pop    %edi
80100fb8:	5d                   	pop    %ebp
    return piperead(f->pipe, addr, n);
80100fb9:	e9 b6 22 00 00       	jmp    80103274 <piperead>
80100fbe:	66 90                	xchg   %ax,%ax
    return -1;
80100fc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fc5:	eb db                	jmp    80100fa2 <fileread+0x5a>
  panic("fileread");
80100fc7:	83 ec 0c             	sub    $0xc,%esp
80100fca:	68 66 69 10 80       	push   $0x80106966
80100fcf:	e8 64 f3 ff ff       	call   80100338 <panic>

80100fd4 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80100fd4:	55                   	push   %ebp
80100fd5:	89 e5                	mov    %esp,%ebp
80100fd7:	57                   	push   %edi
80100fd8:	56                   	push   %esi
80100fd9:	53                   	push   %ebx
80100fda:	83 ec 1c             	sub    $0x1c,%esp
80100fdd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100fe0:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100fe6:	8b 45 10             	mov    0x10(%ebp),%eax
80100fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
80100fec:	80 7b 09 00          	cmpb   $0x0,0x9(%ebx)
80100ff0:	0f 84 b3 00 00 00    	je     801010a9 <filewrite+0xd5>
    return -1;
  if(f->type == FD_PIPE)
80100ff6:	8b 03                	mov    (%ebx),%eax
80100ff8:	83 f8 01             	cmp    $0x1,%eax
80100ffb:	0f 84 b7 00 00 00    	je     801010b8 <filewrite+0xe4>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
80101001:	83 f8 02             	cmp    $0x2,%eax
80101004:	0f 85 c0 00 00 00    	jne    801010ca <filewrite+0xf6>
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * 512;
    int i = 0;
8010100a:	31 f6                	xor    %esi,%esi
    while(i < n){
8010100c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010100f:	85 c0                	test   %eax,%eax
80101011:	7f 2c                	jg     8010103f <filewrite+0x6b>
80101013:	e9 8c 00 00 00       	jmp    801010a4 <filewrite+0xd0>
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101018:	01 43 14             	add    %eax,0x14(%ebx)
8010101b:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
8010101e:	83 ec 0c             	sub    $0xc,%esp
80101021:	ff 73 10             	pushl  0x10(%ebx)
80101024:	e8 b3 06 00 00       	call   801016dc <iunlock>
      end_op();
80101029:	e8 06 1a 00 00       	call   80102a34 <end_op>

      if(r < 0)
        break;
      if(r != n1)
8010102e:	83 c4 10             	add    $0x10,%esp
80101031:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101034:	39 c7                	cmp    %eax,%edi
80101036:	75 5f                	jne    80101097 <filewrite+0xc3>
        panic("short filewrite");
      i += r;
80101038:	01 fe                	add    %edi,%esi
    while(i < n){
8010103a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
8010103d:	7e 65                	jle    801010a4 <filewrite+0xd0>
      int n1 = n - i;
8010103f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101042:	29 f7                	sub    %esi,%edi
      if(n1 > max)
80101044:	81 ff 00 06 00 00    	cmp    $0x600,%edi
8010104a:	7e 05                	jle    80101051 <filewrite+0x7d>
8010104c:	bf 00 06 00 00       	mov    $0x600,%edi
      begin_op();
80101051:	e8 76 19 00 00       	call   801029cc <begin_op>
      ilock(f->ip);
80101056:	83 ec 0c             	sub    $0xc,%esp
80101059:	ff 73 10             	pushl  0x10(%ebx)
8010105c:	e8 b3 05 00 00       	call   80101614 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
80101061:	57                   	push   %edi
80101062:	ff 73 14             	pushl  0x14(%ebx)
80101065:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101068:	01 f0                	add    %esi,%eax
8010106a:	50                   	push   %eax
8010106b:	ff 73 10             	pushl  0x10(%ebx)
8010106e:	e8 71 09 00 00       	call   801019e4 <writei>
80101073:	83 c4 20             	add    $0x20,%esp
80101076:	85 c0                	test   %eax,%eax
80101078:	7f 9e                	jg     80101018 <filewrite+0x44>
8010107a:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
8010107d:	83 ec 0c             	sub    $0xc,%esp
80101080:	ff 73 10             	pushl  0x10(%ebx)
80101083:	e8 54 06 00 00       	call   801016dc <iunlock>
      end_op();
80101088:	e8 a7 19 00 00       	call   80102a34 <end_op>
      if(r < 0)
8010108d:	83 c4 10             	add    $0x10,%esp
80101090:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101093:	85 c0                	test   %eax,%eax
80101095:	75 0d                	jne    801010a4 <filewrite+0xd0>
        panic("short filewrite");
80101097:	83 ec 0c             	sub    $0xc,%esp
8010109a:	68 6f 69 10 80       	push   $0x8010696f
8010109f:	e8 94 f2 ff ff       	call   80100338 <panic>
    }
    return i == n ? n : -1;
801010a4:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
801010a7:	74 05                	je     801010ae <filewrite+0xda>
    return -1;
801010a9:	be ff ff ff ff       	mov    $0xffffffff,%esi
  }
  panic("filewrite");
}
801010ae:	89 f0                	mov    %esi,%eax
801010b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010b3:	5b                   	pop    %ebx
801010b4:	5e                   	pop    %esi
801010b5:	5f                   	pop    %edi
801010b6:	5d                   	pop    %ebp
801010b7:	c3                   	ret    
    return pipewrite(f->pipe, addr, n);
801010b8:	8b 43 0c             	mov    0xc(%ebx),%eax
801010bb:	89 45 08             	mov    %eax,0x8(%ebp)
}
801010be:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c1:	5b                   	pop    %ebx
801010c2:	5e                   	pop    %esi
801010c3:	5f                   	pop    %edi
801010c4:	5d                   	pop    %ebp
    return pipewrite(f->pipe, addr, n);
801010c5:	e9 a2 20 00 00       	jmp    8010316c <pipewrite>
  panic("filewrite");
801010ca:	83 ec 0c             	sub    $0xc,%esp
801010cd:	68 75 69 10 80       	push   $0x80106975
801010d2:	e8 61 f2 ff ff       	call   80100338 <panic>
801010d7:	90                   	nop

801010d8 <balloc>:
801010d8:	55                   	push   %ebp
801010d9:	89 e5                	mov    %esp,%ebp
801010db:	57                   	push   %edi
801010dc:	56                   	push   %esi
801010dd:	53                   	push   %ebx
801010de:	83 ec 1c             	sub    $0x1c,%esp
801010e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
801010e4:	8b 0d b4 15 11 80    	mov    0x801115b4,%ecx
801010ea:	85 c9                	test   %ecx,%ecx
801010ec:	74 7f                	je     8010116d <balloc+0x95>
801010ee:	31 ff                	xor    %edi,%edi
801010f0:	83 ec 08             	sub    $0x8,%esp
801010f3:	89 f8                	mov    %edi,%eax
801010f5:	c1 f8 0c             	sar    $0xc,%eax
801010f8:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801010fe:	50                   	push   %eax
801010ff:	ff 75 dc             	pushl  -0x24(%ebp)
80101102:	e8 ad ef ff ff       	call   801000b4 <bread>
80101107:	89 c3                	mov    %eax,%ebx
80101109:	a1 b4 15 11 80       	mov    0x801115b4,%eax
8010110e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101111:	89 fe                	mov    %edi,%esi
80101113:	83 c4 10             	add    $0x10,%esp
80101116:	31 c0                	xor    %eax,%eax
80101118:	89 7d d8             	mov    %edi,-0x28(%ebp)
8010111b:	eb 2c                	jmp    80101149 <balloc+0x71>
8010111d:	8d 76 00             	lea    0x0(%esi),%esi
80101120:	89 c1                	mov    %eax,%ecx
80101122:	83 e1 07             	and    $0x7,%ecx
80101125:	ba 01 00 00 00       	mov    $0x1,%edx
8010112a:	d3 e2                	shl    %cl,%edx
8010112c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010112f:	89 c1                	mov    %eax,%ecx
80101131:	c1 f9 03             	sar    $0x3,%ecx
80101134:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101139:	89 fa                	mov    %edi,%edx
8010113b:	85 7d e4             	test   %edi,-0x1c(%ebp)
8010113e:	74 3c                	je     8010117c <balloc+0xa4>
80101140:	40                   	inc    %eax
80101141:	46                   	inc    %esi
80101142:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101147:	74 07                	je     80101150 <balloc+0x78>
80101149:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010114c:	39 fe                	cmp    %edi,%esi
8010114e:	72 d0                	jb     80101120 <balloc+0x48>
80101150:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101153:	83 ec 0c             	sub    $0xc,%esp
80101156:	53                   	push   %ebx
80101157:	e8 60 f0 ff ff       	call   801001bc <brelse>
8010115c:	81 c7 00 10 00 00    	add    $0x1000,%edi
80101162:	83 c4 10             	add    $0x10,%esp
80101165:	3b 3d b4 15 11 80    	cmp    0x801115b4,%edi
8010116b:	72 83                	jb     801010f0 <balloc+0x18>
8010116d:	83 ec 0c             	sub    $0xc,%esp
80101170:	68 7f 69 10 80       	push   $0x8010697f
80101175:	e8 be f1 ff ff       	call   80100338 <panic>
8010117a:	66 90                	xchg   %ax,%ax
8010117c:	0b 55 e4             	or     -0x1c(%ebp),%edx
8010117f:	88 54 0b 5c          	mov    %dl,0x5c(%ebx,%ecx,1)
80101183:	83 ec 0c             	sub    $0xc,%esp
80101186:	53                   	push   %ebx
80101187:	e8 fc 19 00 00       	call   80102b88 <log_write>
8010118c:	89 1c 24             	mov    %ebx,(%esp)
8010118f:	e8 28 f0 ff ff       	call   801001bc <brelse>
80101194:	58                   	pop    %eax
80101195:	5a                   	pop    %edx
80101196:	56                   	push   %esi
80101197:	ff 75 dc             	pushl  -0x24(%ebp)
8010119a:	e8 15 ef ff ff       	call   801000b4 <bread>
8010119f:	89 c3                	mov    %eax,%ebx
801011a1:	83 c4 0c             	add    $0xc,%esp
801011a4:	68 00 02 00 00       	push   $0x200
801011a9:	6a 00                	push   $0x0
801011ab:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ae:	50                   	push   %eax
801011af:	e8 a4 2f 00 00       	call   80104158 <memset>
801011b4:	89 1c 24             	mov    %ebx,(%esp)
801011b7:	e8 cc 19 00 00       	call   80102b88 <log_write>
801011bc:	89 1c 24             	mov    %ebx,(%esp)
801011bf:	e8 f8 ef ff ff       	call   801001bc <brelse>
801011c4:	89 f0                	mov    %esi,%eax
801011c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011c9:	5b                   	pop    %ebx
801011ca:	5e                   	pop    %esi
801011cb:	5f                   	pop    %edi
801011cc:	5d                   	pop    %ebp
801011cd:	c3                   	ret    
801011ce:	66 90                	xchg   %ax,%ax

801011d0 <iget>:
801011d0:	55                   	push   %ebp
801011d1:	89 e5                	mov    %esp,%ebp
801011d3:	57                   	push   %edi
801011d4:	56                   	push   %esi
801011d5:	53                   	push   %ebx
801011d6:	83 ec 28             	sub    $0x28,%esp
801011d9:	89 c6                	mov    %eax,%esi
801011db:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801011de:	68 60 f9 10 80       	push   $0x8010f960
801011e3:	e8 b0 2e 00 00       	call   80104098 <acquire>
801011e8:	83 c4 10             	add    $0x10,%esp
801011eb:	31 ff                	xor    %edi,%edi
801011ed:	bb 94 f9 10 80       	mov    $0x8010f994,%ebx
801011f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801011f5:	eb 13                	jmp    8010120a <iget+0x3a>
801011f7:	90                   	nop
801011f8:	39 33                	cmp    %esi,(%ebx)
801011fa:	74 64                	je     80101260 <iget+0x90>
801011fc:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101202:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101208:	74 22                	je     8010122c <iget+0x5c>
8010120a:	8b 43 08             	mov    0x8(%ebx),%eax
8010120d:	85 c0                	test   %eax,%eax
8010120f:	7f e7                	jg     801011f8 <iget+0x28>
80101211:	85 ff                	test   %edi,%edi
80101213:	75 e7                	jne    801011fc <iget+0x2c>
80101215:	85 c0                	test   %eax,%eax
80101217:	75 6c                	jne    80101285 <iget+0xb5>
80101219:	89 df                	mov    %ebx,%edi
8010121b:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101221:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101227:	75 e1                	jne    8010120a <iget+0x3a>
80101229:	8d 76 00             	lea    0x0(%esi),%esi
8010122c:	85 ff                	test   %edi,%edi
8010122e:	74 73                	je     801012a3 <iget+0xd3>
80101230:	89 37                	mov    %esi,(%edi)
80101232:	89 57 04             	mov    %edx,0x4(%edi)
80101235:	c7 47 08 01 00 00 00 	movl   $0x1,0x8(%edi)
8010123c:	c7 47 4c 00 00 00 00 	movl   $0x0,0x4c(%edi)
80101243:	83 ec 0c             	sub    $0xc,%esp
80101246:	68 60 f9 10 80       	push   $0x8010f960
8010124b:	e8 e8 2d 00 00       	call   80104038 <release>
80101250:	83 c4 10             	add    $0x10,%esp
80101253:	89 f8                	mov    %edi,%eax
80101255:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101258:	5b                   	pop    %ebx
80101259:	5e                   	pop    %esi
8010125a:	5f                   	pop    %edi
8010125b:	5d                   	pop    %ebp
8010125c:	c3                   	ret    
8010125d:	8d 76 00             	lea    0x0(%esi),%esi
80101260:	39 53 04             	cmp    %edx,0x4(%ebx)
80101263:	75 97                	jne    801011fc <iget+0x2c>
80101265:	40                   	inc    %eax
80101266:	89 43 08             	mov    %eax,0x8(%ebx)
80101269:	83 ec 0c             	sub    $0xc,%esp
8010126c:	68 60 f9 10 80       	push   $0x8010f960
80101271:	e8 c2 2d 00 00       	call   80104038 <release>
80101276:	83 c4 10             	add    $0x10,%esp
80101279:	89 df                	mov    %ebx,%edi
8010127b:	89 f8                	mov    %edi,%eax
8010127d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101280:	5b                   	pop    %ebx
80101281:	5e                   	pop    %esi
80101282:	5f                   	pop    %edi
80101283:	5d                   	pop    %ebp
80101284:	c3                   	ret    
80101285:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010128b:	81 fb b4 15 11 80    	cmp    $0x801115b4,%ebx
80101291:	74 10                	je     801012a3 <iget+0xd3>
80101293:	8b 43 08             	mov    0x8(%ebx),%eax
80101296:	85 c0                	test   %eax,%eax
80101298:	0f 8f 5a ff ff ff    	jg     801011f8 <iget+0x28>
8010129e:	e9 72 ff ff ff       	jmp    80101215 <iget+0x45>
801012a3:	83 ec 0c             	sub    $0xc,%esp
801012a6:	68 95 69 10 80       	push   $0x80106995
801012ab:	e8 88 f0 ff ff       	call   80100338 <panic>

801012b0 <bfree>:
801012b0:	55                   	push   %ebp
801012b1:	89 e5                	mov    %esp,%ebp
801012b3:	56                   	push   %esi
801012b4:	53                   	push   %ebx
801012b5:	89 c1                	mov    %eax,%ecx
801012b7:	89 d3                	mov    %edx,%ebx
801012b9:	83 ec 08             	sub    $0x8,%esp
801012bc:	89 d0                	mov    %edx,%eax
801012be:	c1 e8 0c             	shr    $0xc,%eax
801012c1:	03 05 cc 15 11 80    	add    0x801115cc,%eax
801012c7:	50                   	push   %eax
801012c8:	51                   	push   %ecx
801012c9:	e8 e6 ed ff ff       	call   801000b4 <bread>
801012ce:	89 c6                	mov    %eax,%esi
801012d0:	89 d9                	mov    %ebx,%ecx
801012d2:	83 e1 07             	and    $0x7,%ecx
801012d5:	b8 01 00 00 00       	mov    $0x1,%eax
801012da:	d3 e0                	shl    %cl,%eax
801012dc:	c1 fb 03             	sar    $0x3,%ebx
801012df:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
801012e5:	0f b6 4c 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%ecx
801012ea:	83 c4 10             	add    $0x10,%esp
801012ed:	85 c1                	test   %eax,%ecx
801012ef:	74 23                	je     80101314 <bfree+0x64>
801012f1:	f7 d0                	not    %eax
801012f3:	21 c8                	and    %ecx,%eax
801012f5:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
801012f9:	83 ec 0c             	sub    $0xc,%esp
801012fc:	56                   	push   %esi
801012fd:	e8 86 18 00 00       	call   80102b88 <log_write>
80101302:	89 34 24             	mov    %esi,(%esp)
80101305:	e8 b2 ee ff ff       	call   801001bc <brelse>
8010130a:	83 c4 10             	add    $0x10,%esp
8010130d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101310:	5b                   	pop    %ebx
80101311:	5e                   	pop    %esi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	83 ec 0c             	sub    $0xc,%esp
80101317:	68 a5 69 10 80       	push   $0x801069a5
8010131c:	e8 17 f0 ff ff       	call   80100338 <panic>
80101321:	8d 76 00             	lea    0x0(%esi),%esi

80101324 <bmap>:
80101324:	55                   	push   %ebp
80101325:	89 e5                	mov    %esp,%ebp
80101327:	57                   	push   %edi
80101328:	56                   	push   %esi
80101329:	53                   	push   %ebx
8010132a:	83 ec 1c             	sub    $0x1c,%esp
8010132d:	89 c6                	mov    %eax,%esi
8010132f:	83 fa 0b             	cmp    $0xb,%edx
80101332:	76 7c                	jbe    801013b0 <bmap+0x8c>
80101334:	8d 5a f4             	lea    -0xc(%edx),%ebx
80101337:	83 fb 7f             	cmp    $0x7f,%ebx
8010133a:	0f 87 8e 00 00 00    	ja     801013ce <bmap+0xaa>
80101340:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101346:	85 c0                	test   %eax,%eax
80101348:	74 56                	je     801013a0 <bmap+0x7c>
8010134a:	83 ec 08             	sub    $0x8,%esp
8010134d:	50                   	push   %eax
8010134e:	ff 36                	pushl  (%esi)
80101350:	e8 5f ed ff ff       	call   801000b4 <bread>
80101355:	89 c7                	mov    %eax,%edi
80101357:	8d 5c 98 5c          	lea    0x5c(%eax,%ebx,4),%ebx
8010135b:	8b 03                	mov    (%ebx),%eax
8010135d:	83 c4 10             	add    $0x10,%esp
80101360:	85 c0                	test   %eax,%eax
80101362:	74 1c                	je     80101380 <bmap+0x5c>
80101364:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101367:	83 ec 0c             	sub    $0xc,%esp
8010136a:	57                   	push   %edi
8010136b:	e8 4c ee ff ff       	call   801001bc <brelse>
80101370:	83 c4 10             	add    $0x10,%esp
80101373:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101376:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101379:	5b                   	pop    %ebx
8010137a:	5e                   	pop    %esi
8010137b:	5f                   	pop    %edi
8010137c:	5d                   	pop    %ebp
8010137d:	c3                   	ret    
8010137e:	66 90                	xchg   %ax,%ax
80101380:	8b 06                	mov    (%esi),%eax
80101382:	e8 51 fd ff ff       	call   801010d8 <balloc>
80101387:	89 03                	mov    %eax,(%ebx)
80101389:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010138c:	83 ec 0c             	sub    $0xc,%esp
8010138f:	57                   	push   %edi
80101390:	e8 f3 17 00 00       	call   80102b88 <log_write>
80101395:	83 c4 10             	add    $0x10,%esp
80101398:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010139b:	eb c7                	jmp    80101364 <bmap+0x40>
8010139d:	8d 76 00             	lea    0x0(%esi),%esi
801013a0:	8b 06                	mov    (%esi),%eax
801013a2:	e8 31 fd ff ff       	call   801010d8 <balloc>
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	eb 9b                	jmp    8010134a <bmap+0x26>
801013af:	90                   	nop
801013b0:	8d 5a 14             	lea    0x14(%edx),%ebx
801013b3:	8b 44 98 0c          	mov    0xc(%eax,%ebx,4),%eax
801013b7:	85 c0                	test   %eax,%eax
801013b9:	75 bb                	jne    80101376 <bmap+0x52>
801013bb:	8b 06                	mov    (%esi),%eax
801013bd:	e8 16 fd ff ff       	call   801010d8 <balloc>
801013c2:	89 44 9e 0c          	mov    %eax,0xc(%esi,%ebx,4)
801013c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013c9:	5b                   	pop    %ebx
801013ca:	5e                   	pop    %esi
801013cb:	5f                   	pop    %edi
801013cc:	5d                   	pop    %ebp
801013cd:	c3                   	ret    
801013ce:	83 ec 0c             	sub    $0xc,%esp
801013d1:	68 b8 69 10 80       	push   $0x801069b8
801013d6:	e8 5d ef ff ff       	call   80100338 <panic>
801013db:	90                   	nop

801013dc <readsb>:
801013dc:	55                   	push   %ebp
801013dd:	89 e5                	mov    %esp,%ebp
801013df:	56                   	push   %esi
801013e0:	53                   	push   %ebx
801013e1:	8b 75 0c             	mov    0xc(%ebp),%esi
801013e4:	83 ec 08             	sub    $0x8,%esp
801013e7:	6a 01                	push   $0x1
801013e9:	ff 75 08             	pushl  0x8(%ebp)
801013ec:	e8 c3 ec ff ff       	call   801000b4 <bread>
801013f1:	89 c3                	mov    %eax,%ebx
801013f3:	83 c4 0c             	add    $0xc,%esp
801013f6:	6a 1c                	push   $0x1c
801013f8:	8d 40 5c             	lea    0x5c(%eax),%eax
801013fb:	50                   	push   %eax
801013fc:	56                   	push   %esi
801013fd:	e8 d2 2d 00 00       	call   801041d4 <memmove>
80101402:	83 c4 10             	add    $0x10,%esp
80101405:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101408:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010140b:	5b                   	pop    %ebx
8010140c:	5e                   	pop    %esi
8010140d:	5d                   	pop    %ebp
8010140e:	e9 a9 ed ff ff       	jmp    801001bc <brelse>
80101413:	90                   	nop

80101414 <iinit>:
80101414:	55                   	push   %ebp
80101415:	89 e5                	mov    %esp,%ebp
80101417:	53                   	push   %ebx
80101418:	83 ec 0c             	sub    $0xc,%esp
8010141b:	68 cb 69 10 80       	push   $0x801069cb
80101420:	68 60 f9 10 80       	push   $0x8010f960
80101425:	e8 ae 2a 00 00       	call   80103ed8 <initlock>
8010142a:	bb a0 f9 10 80       	mov    $0x8010f9a0,%ebx
8010142f:	83 c4 10             	add    $0x10,%esp
80101432:	66 90                	xchg   %ax,%ax
80101434:	83 ec 08             	sub    $0x8,%esp
80101437:	68 d2 69 10 80       	push   $0x801069d2
8010143c:	53                   	push   %ebx
8010143d:	e8 8a 29 00 00       	call   80103dcc <initsleeplock>
80101442:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101448:	83 c4 10             	add    $0x10,%esp
8010144b:	81 fb c0 15 11 80    	cmp    $0x801115c0,%ebx
80101451:	75 e1                	jne    80101434 <iinit+0x20>
80101453:	83 ec 08             	sub    $0x8,%esp
80101456:	6a 01                	push   $0x1
80101458:	ff 75 08             	pushl  0x8(%ebp)
8010145b:	e8 54 ec ff ff       	call   801000b4 <bread>
80101460:	89 c3                	mov    %eax,%ebx
80101462:	83 c4 0c             	add    $0xc,%esp
80101465:	6a 1c                	push   $0x1c
80101467:	8d 40 5c             	lea    0x5c(%eax),%eax
8010146a:	50                   	push   %eax
8010146b:	68 b4 15 11 80       	push   $0x801115b4
80101470:	e8 5f 2d 00 00       	call   801041d4 <memmove>
80101475:	89 1c 24             	mov    %ebx,(%esp)
80101478:	e8 3f ed ff ff       	call   801001bc <brelse>
8010147d:	ff 35 cc 15 11 80    	pushl  0x801115cc
80101483:	ff 35 c8 15 11 80    	pushl  0x801115c8
80101489:	ff 35 c4 15 11 80    	pushl  0x801115c4
8010148f:	ff 35 c0 15 11 80    	pushl  0x801115c0
80101495:	ff 35 bc 15 11 80    	pushl  0x801115bc
8010149b:	ff 35 b8 15 11 80    	pushl  0x801115b8
801014a1:	ff 35 b4 15 11 80    	pushl  0x801115b4
801014a7:	68 38 6a 10 80       	push   $0x80106a38
801014ac:	e8 77 f1 ff ff       	call   80100628 <cprintf>
801014b1:	83 c4 30             	add    $0x30,%esp
801014b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014b7:	c9                   	leave  
801014b8:	c3                   	ret    
801014b9:	8d 76 00             	lea    0x0(%esi),%esi

801014bc <ialloc>:
801014bc:	55                   	push   %ebp
801014bd:	89 e5                	mov    %esp,%ebp
801014bf:	57                   	push   %edi
801014c0:	56                   	push   %esi
801014c1:	53                   	push   %ebx
801014c2:	83 ec 1c             	sub    $0x1c,%esp
801014c5:	8b 75 08             	mov    0x8(%ebp),%esi
801014c8:	8b 45 0c             	mov    0xc(%ebp),%eax
801014cb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801014ce:	83 3d bc 15 11 80 01 	cmpl   $0x1,0x801115bc
801014d5:	0f 86 84 00 00 00    	jbe    8010155f <ialloc+0xa3>
801014db:	bf 01 00 00 00       	mov    $0x1,%edi
801014e0:	eb 17                	jmp    801014f9 <ialloc+0x3d>
801014e2:	66 90                	xchg   %ax,%ax
801014e4:	83 ec 0c             	sub    $0xc,%esp
801014e7:	53                   	push   %ebx
801014e8:	e8 cf ec ff ff       	call   801001bc <brelse>
801014ed:	47                   	inc    %edi
801014ee:	83 c4 10             	add    $0x10,%esp
801014f1:	3b 3d bc 15 11 80    	cmp    0x801115bc,%edi
801014f7:	73 66                	jae    8010155f <ialloc+0xa3>
801014f9:	83 ec 08             	sub    $0x8,%esp
801014fc:	89 f8                	mov    %edi,%eax
801014fe:	c1 e8 03             	shr    $0x3,%eax
80101501:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101507:	50                   	push   %eax
80101508:	56                   	push   %esi
80101509:	e8 a6 eb ff ff       	call   801000b4 <bread>
8010150e:	89 c3                	mov    %eax,%ebx
80101510:	89 f8                	mov    %edi,%eax
80101512:	83 e0 07             	and    $0x7,%eax
80101515:	c1 e0 06             	shl    $0x6,%eax
80101518:	8d 4c 03 5c          	lea    0x5c(%ebx,%eax,1),%ecx
8010151c:	83 c4 10             	add    $0x10,%esp
8010151f:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101523:	75 bf                	jne    801014e4 <ialloc+0x28>
80101525:	50                   	push   %eax
80101526:	6a 40                	push   $0x40
80101528:	6a 00                	push   $0x0
8010152a:	51                   	push   %ecx
8010152b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010152e:	e8 25 2c 00 00       	call   80104158 <memset>
80101533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101536:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101539:	66 89 01             	mov    %ax,(%ecx)
8010153c:	89 1c 24             	mov    %ebx,(%esp)
8010153f:	e8 44 16 00 00       	call   80102b88 <log_write>
80101544:	89 1c 24             	mov    %ebx,(%esp)
80101547:	e8 70 ec ff ff       	call   801001bc <brelse>
8010154c:	83 c4 10             	add    $0x10,%esp
8010154f:	89 fa                	mov    %edi,%edx
80101551:	89 f0                	mov    %esi,%eax
80101553:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101556:	5b                   	pop    %ebx
80101557:	5e                   	pop    %esi
80101558:	5f                   	pop    %edi
80101559:	5d                   	pop    %ebp
8010155a:	e9 71 fc ff ff       	jmp    801011d0 <iget>
8010155f:	83 ec 0c             	sub    $0xc,%esp
80101562:	68 d8 69 10 80       	push   $0x801069d8
80101567:	e8 cc ed ff ff       	call   80100338 <panic>

8010156c <iupdate>:
8010156c:	55                   	push   %ebp
8010156d:	89 e5                	mov    %esp,%ebp
8010156f:	56                   	push   %esi
80101570:	53                   	push   %ebx
80101571:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101574:	83 ec 08             	sub    $0x8,%esp
80101577:	8b 43 04             	mov    0x4(%ebx),%eax
8010157a:	c1 e8 03             	shr    $0x3,%eax
8010157d:	03 05 c8 15 11 80    	add    0x801115c8,%eax
80101583:	50                   	push   %eax
80101584:	ff 33                	pushl  (%ebx)
80101586:	e8 29 eb ff ff       	call   801000b4 <bread>
8010158b:	89 c6                	mov    %eax,%esi
8010158d:	8b 43 04             	mov    0x4(%ebx),%eax
80101590:	83 e0 07             	and    $0x7,%eax
80101593:	c1 e0 06             	shl    $0x6,%eax
80101596:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
8010159a:	8b 53 50             	mov    0x50(%ebx),%edx
8010159d:	66 89 10             	mov    %dx,(%eax)
801015a0:	66 8b 53 52          	mov    0x52(%ebx),%dx
801015a4:	66 89 50 02          	mov    %dx,0x2(%eax)
801015a8:	8b 53 54             	mov    0x54(%ebx),%edx
801015ab:	66 89 50 04          	mov    %dx,0x4(%eax)
801015af:	66 8b 53 56          	mov    0x56(%ebx),%dx
801015b3:	66 89 50 06          	mov    %dx,0x6(%eax)
801015b7:	8b 53 58             	mov    0x58(%ebx),%edx
801015ba:	89 50 08             	mov    %edx,0x8(%eax)
801015bd:	83 c4 0c             	add    $0xc,%esp
801015c0:	6a 34                	push   $0x34
801015c2:	83 c3 5c             	add    $0x5c,%ebx
801015c5:	53                   	push   %ebx
801015c6:	83 c0 0c             	add    $0xc,%eax
801015c9:	50                   	push   %eax
801015ca:	e8 05 2c 00 00       	call   801041d4 <memmove>
801015cf:	89 34 24             	mov    %esi,(%esp)
801015d2:	e8 b1 15 00 00       	call   80102b88 <log_write>
801015d7:	83 c4 10             	add    $0x10,%esp
801015da:	89 75 08             	mov    %esi,0x8(%ebp)
801015dd:	8d 65 f8             	lea    -0x8(%ebp),%esp
801015e0:	5b                   	pop    %ebx
801015e1:	5e                   	pop    %esi
801015e2:	5d                   	pop    %ebp
801015e3:	e9 d4 eb ff ff       	jmp    801001bc <brelse>

801015e8 <idup>:
801015e8:	55                   	push   %ebp
801015e9:	89 e5                	mov    %esp,%ebp
801015eb:	53                   	push   %ebx
801015ec:	83 ec 10             	sub    $0x10,%esp
801015ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015f2:	68 60 f9 10 80       	push   $0x8010f960
801015f7:	e8 9c 2a 00 00       	call   80104098 <acquire>
801015fc:	ff 43 08             	incl   0x8(%ebx)
801015ff:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101606:	e8 2d 2a 00 00       	call   80104038 <release>
8010160b:	89 d8                	mov    %ebx,%eax
8010160d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101610:	c9                   	leave  
80101611:	c3                   	ret    
80101612:	66 90                	xchg   %ax,%ax

80101614 <ilock>:
80101614:	55                   	push   %ebp
80101615:	89 e5                	mov    %esp,%ebp
80101617:	56                   	push   %esi
80101618:	53                   	push   %ebx
80101619:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010161c:	85 db                	test   %ebx,%ebx
8010161e:	0f 84 a9 00 00 00    	je     801016cd <ilock+0xb9>
80101624:	8b 53 08             	mov    0x8(%ebx),%edx
80101627:	85 d2                	test   %edx,%edx
80101629:	0f 8e 9e 00 00 00    	jle    801016cd <ilock+0xb9>
8010162f:	83 ec 0c             	sub    $0xc,%esp
80101632:	8d 43 0c             	lea    0xc(%ebx),%eax
80101635:	50                   	push   %eax
80101636:	e8 c5 27 00 00       	call   80103e00 <acquiresleep>
8010163b:	83 c4 10             	add    $0x10,%esp
8010163e:	8b 43 4c             	mov    0x4c(%ebx),%eax
80101641:	85 c0                	test   %eax,%eax
80101643:	74 07                	je     8010164c <ilock+0x38>
80101645:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101648:	5b                   	pop    %ebx
80101649:	5e                   	pop    %esi
8010164a:	5d                   	pop    %ebp
8010164b:	c3                   	ret    
8010164c:	83 ec 08             	sub    $0x8,%esp
8010164f:	8b 43 04             	mov    0x4(%ebx),%eax
80101652:	c1 e8 03             	shr    $0x3,%eax
80101655:	03 05 c8 15 11 80    	add    0x801115c8,%eax
8010165b:	50                   	push   %eax
8010165c:	ff 33                	pushl  (%ebx)
8010165e:	e8 51 ea ff ff       	call   801000b4 <bread>
80101663:	89 c6                	mov    %eax,%esi
80101665:	8b 43 04             	mov    0x4(%ebx),%eax
80101668:	83 e0 07             	and    $0x7,%eax
8010166b:	c1 e0 06             	shl    $0x6,%eax
8010166e:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101672:	8b 10                	mov    (%eax),%edx
80101674:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101678:	66 8b 50 02          	mov    0x2(%eax),%dx
8010167c:	66 89 53 52          	mov    %dx,0x52(%ebx)
80101680:	8b 50 04             	mov    0x4(%eax),%edx
80101683:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101687:	66 8b 50 06          	mov    0x6(%eax),%dx
8010168b:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010168f:	8b 50 08             	mov    0x8(%eax),%edx
80101692:	89 53 58             	mov    %edx,0x58(%ebx)
80101695:	83 c4 0c             	add    $0xc,%esp
80101698:	6a 34                	push   $0x34
8010169a:	83 c0 0c             	add    $0xc,%eax
8010169d:	50                   	push   %eax
8010169e:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016a1:	50                   	push   %eax
801016a2:	e8 2d 2b 00 00       	call   801041d4 <memmove>
801016a7:	89 34 24             	mov    %esi,(%esp)
801016aa:	e8 0d eb ff ff       	call   801001bc <brelse>
801016af:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
801016b6:	83 c4 10             	add    $0x10,%esp
801016b9:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
801016be:	75 85                	jne    80101645 <ilock+0x31>
801016c0:	83 ec 0c             	sub    $0xc,%esp
801016c3:	68 f0 69 10 80       	push   $0x801069f0
801016c8:	e8 6b ec ff ff       	call   80100338 <panic>
801016cd:	83 ec 0c             	sub    $0xc,%esp
801016d0:	68 ea 69 10 80       	push   $0x801069ea
801016d5:	e8 5e ec ff ff       	call   80100338 <panic>
801016da:	66 90                	xchg   %ax,%ax

801016dc <iunlock>:
801016dc:	55                   	push   %ebp
801016dd:	89 e5                	mov    %esp,%ebp
801016df:	56                   	push   %esi
801016e0:	53                   	push   %ebx
801016e1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016e4:	85 db                	test   %ebx,%ebx
801016e6:	74 28                	je     80101710 <iunlock+0x34>
801016e8:	8d 73 0c             	lea    0xc(%ebx),%esi
801016eb:	83 ec 0c             	sub    $0xc,%esp
801016ee:	56                   	push   %esi
801016ef:	e8 9c 27 00 00       	call   80103e90 <holdingsleep>
801016f4:	83 c4 10             	add    $0x10,%esp
801016f7:	85 c0                	test   %eax,%eax
801016f9:	74 15                	je     80101710 <iunlock+0x34>
801016fb:	8b 43 08             	mov    0x8(%ebx),%eax
801016fe:	85 c0                	test   %eax,%eax
80101700:	7e 0e                	jle    80101710 <iunlock+0x34>
80101702:	89 75 08             	mov    %esi,0x8(%ebp)
80101705:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101708:	5b                   	pop    %ebx
80101709:	5e                   	pop    %esi
8010170a:	5d                   	pop    %ebp
8010170b:	e9 44 27 00 00       	jmp    80103e54 <releasesleep>
80101710:	83 ec 0c             	sub    $0xc,%esp
80101713:	68 ff 69 10 80       	push   $0x801069ff
80101718:	e8 1b ec ff ff       	call   80100338 <panic>
8010171d:	8d 76 00             	lea    0x0(%esi),%esi

80101720 <iput>:
80101720:	55                   	push   %ebp
80101721:	89 e5                	mov    %esp,%ebp
80101723:	57                   	push   %edi
80101724:	56                   	push   %esi
80101725:	53                   	push   %ebx
80101726:	83 ec 28             	sub    $0x28,%esp
80101729:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010172c:	8d 7b 0c             	lea    0xc(%ebx),%edi
8010172f:	57                   	push   %edi
80101730:	e8 cb 26 00 00       	call   80103e00 <acquiresleep>
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010173b:	85 c0                	test   %eax,%eax
8010173d:	74 07                	je     80101746 <iput+0x26>
8010173f:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80101744:	74 2e                	je     80101774 <iput+0x54>
80101746:	83 ec 0c             	sub    $0xc,%esp
80101749:	57                   	push   %edi
8010174a:	e8 05 27 00 00       	call   80103e54 <releasesleep>
8010174f:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101756:	e8 3d 29 00 00       	call   80104098 <acquire>
8010175b:	ff 4b 08             	decl   0x8(%ebx)
8010175e:	83 c4 10             	add    $0x10,%esp
80101761:	c7 45 08 60 f9 10 80 	movl   $0x8010f960,0x8(%ebp)
80101768:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010176b:	5b                   	pop    %ebx
8010176c:	5e                   	pop    %esi
8010176d:	5f                   	pop    %edi
8010176e:	5d                   	pop    %ebp
8010176f:	e9 c4 28 00 00       	jmp    80104038 <release>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 60 f9 10 80       	push   $0x8010f960
8010177c:	e8 17 29 00 00       	call   80104098 <acquire>
80101781:	8b 73 08             	mov    0x8(%ebx),%esi
80101784:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
8010178b:	e8 a8 28 00 00       	call   80104038 <release>
80101790:	83 c4 10             	add    $0x10,%esp
80101793:	4e                   	dec    %esi
80101794:	75 b0                	jne    80101746 <iput+0x26>
80101796:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101799:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
8010179f:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801017a2:	89 df                	mov    %ebx,%edi
801017a4:	89 cb                	mov    %ecx,%ebx
801017a6:	eb 07                	jmp    801017af <iput+0x8f>
801017a8:	83 c6 04             	add    $0x4,%esi
801017ab:	39 de                	cmp    %ebx,%esi
801017ad:	74 15                	je     801017c4 <iput+0xa4>
801017af:	8b 16                	mov    (%esi),%edx
801017b1:	85 d2                	test   %edx,%edx
801017b3:	74 f3                	je     801017a8 <iput+0x88>
801017b5:	8b 07                	mov    (%edi),%eax
801017b7:	e8 f4 fa ff ff       	call   801012b0 <bfree>
801017bc:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801017c2:	eb e4                	jmp    801017a8 <iput+0x88>
801017c4:	89 fb                	mov    %edi,%ebx
801017c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801017c9:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
801017cf:	85 c0                	test   %eax,%eax
801017d1:	75 2d                	jne    80101800 <iput+0xe0>
801017d3:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801017da:	83 ec 0c             	sub    $0xc,%esp
801017dd:	53                   	push   %ebx
801017de:	e8 89 fd ff ff       	call   8010156c <iupdate>
801017e3:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
801017e9:	89 1c 24             	mov    %ebx,(%esp)
801017ec:	e8 7b fd ff ff       	call   8010156c <iupdate>
801017f1:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801017f8:	83 c4 10             	add    $0x10,%esp
801017fb:	e9 46 ff ff ff       	jmp    80101746 <iput+0x26>
80101800:	83 ec 08             	sub    $0x8,%esp
80101803:	50                   	push   %eax
80101804:	ff 33                	pushl  (%ebx)
80101806:	e8 a9 e8 ff ff       	call   801000b4 <bread>
8010180b:	8d 70 5c             	lea    0x5c(%eax),%esi
8010180e:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010181a:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010181d:	89 cf                	mov    %ecx,%edi
8010181f:	eb 0a                	jmp    8010182b <iput+0x10b>
80101821:	8d 76 00             	lea    0x0(%esi),%esi
80101824:	83 c6 04             	add    $0x4,%esi
80101827:	39 fe                	cmp    %edi,%esi
80101829:	74 0f                	je     8010183a <iput+0x11a>
8010182b:	8b 16                	mov    (%esi),%edx
8010182d:	85 d2                	test   %edx,%edx
8010182f:	74 f3                	je     80101824 <iput+0x104>
80101831:	8b 03                	mov    (%ebx),%eax
80101833:	e8 78 fa ff ff       	call   801012b0 <bfree>
80101838:	eb ea                	jmp    80101824 <iput+0x104>
8010183a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010183d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101840:	83 ec 0c             	sub    $0xc,%esp
80101843:	50                   	push   %eax
80101844:	e8 73 e9 ff ff       	call   801001bc <brelse>
80101849:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
8010184f:	8b 03                	mov    (%ebx),%eax
80101851:	e8 5a fa ff ff       	call   801012b0 <bfree>
80101856:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
8010185d:	00 00 00 
80101860:	83 c4 10             	add    $0x10,%esp
80101863:	e9 6b ff ff ff       	jmp    801017d3 <iput+0xb3>

80101868 <iunlockput>:
80101868:	55                   	push   %ebp
80101869:	89 e5                	mov    %esp,%ebp
8010186b:	56                   	push   %esi
8010186c:	53                   	push   %ebx
8010186d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101870:	85 db                	test   %ebx,%ebx
80101872:	74 34                	je     801018a8 <iunlockput+0x40>
80101874:	8d 73 0c             	lea    0xc(%ebx),%esi
80101877:	83 ec 0c             	sub    $0xc,%esp
8010187a:	56                   	push   %esi
8010187b:	e8 10 26 00 00       	call   80103e90 <holdingsleep>
80101880:	83 c4 10             	add    $0x10,%esp
80101883:	85 c0                	test   %eax,%eax
80101885:	74 21                	je     801018a8 <iunlockput+0x40>
80101887:	8b 43 08             	mov    0x8(%ebx),%eax
8010188a:	85 c0                	test   %eax,%eax
8010188c:	7e 1a                	jle    801018a8 <iunlockput+0x40>
8010188e:	83 ec 0c             	sub    $0xc,%esp
80101891:	56                   	push   %esi
80101892:	e8 bd 25 00 00       	call   80103e54 <releasesleep>
80101897:	83 c4 10             	add    $0x10,%esp
8010189a:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010189d:	8d 65 f8             	lea    -0x8(%ebp),%esp
801018a0:	5b                   	pop    %ebx
801018a1:	5e                   	pop    %esi
801018a2:	5d                   	pop    %ebp
801018a3:	e9 78 fe ff ff       	jmp    80101720 <iput>
801018a8:	83 ec 0c             	sub    $0xc,%esp
801018ab:	68 ff 69 10 80       	push   $0x801069ff
801018b0:	e8 83 ea ff ff       	call   80100338 <panic>
801018b5:	8d 76 00             	lea    0x0(%esi),%esi

801018b8 <stati>:
801018b8:	55                   	push   %ebp
801018b9:	89 e5                	mov    %esp,%ebp
801018bb:	8b 55 08             	mov    0x8(%ebp),%edx
801018be:	8b 45 0c             	mov    0xc(%ebp),%eax
801018c1:	8b 0a                	mov    (%edx),%ecx
801018c3:	89 48 04             	mov    %ecx,0x4(%eax)
801018c6:	8b 4a 04             	mov    0x4(%edx),%ecx
801018c9:	89 48 08             	mov    %ecx,0x8(%eax)
801018cc:	8b 4a 50             	mov    0x50(%edx),%ecx
801018cf:	66 89 08             	mov    %cx,(%eax)
801018d2:	66 8b 4a 56          	mov    0x56(%edx),%cx
801018d6:	66 89 48 0c          	mov    %cx,0xc(%eax)
801018da:	8b 52 58             	mov    0x58(%edx),%edx
801018dd:	89 50 10             	mov    %edx,0x10(%eax)
801018e0:	5d                   	pop    %ebp
801018e1:	c3                   	ret    
801018e2:	66 90                	xchg   %ax,%ax

801018e4 <readi>:
801018e4:	55                   	push   %ebp
801018e5:	89 e5                	mov    %esp,%ebp
801018e7:	57                   	push   %edi
801018e8:	56                   	push   %esi
801018e9:	53                   	push   %ebx
801018ea:	83 ec 1c             	sub    $0x1c,%esp
801018ed:	8b 45 08             	mov    0x8(%ebp),%eax
801018f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
801018f3:	8b 75 0c             	mov    0xc(%ebp),%esi
801018f6:	89 75 e0             	mov    %esi,-0x20(%ebp)
801018f9:	8b 7d 10             	mov    0x10(%ebp),%edi
801018fc:	8b 75 14             	mov    0x14(%ebp),%esi
801018ff:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80101902:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101907:	0f 84 af 00 00 00    	je     801019bc <readi+0xd8>
8010190d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101910:	8b 50 58             	mov    0x58(%eax),%edx
80101913:	39 fa                	cmp    %edi,%edx
80101915:	0f 82 c2 00 00 00    	jb     801019dd <readi+0xf9>
8010191b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010191e:	31 c0                	xor    %eax,%eax
80101920:	01 f9                	add    %edi,%ecx
80101922:	0f 92 c0             	setb   %al
80101925:	89 c3                	mov    %eax,%ebx
80101927:	0f 82 b0 00 00 00    	jb     801019dd <readi+0xf9>
8010192d:	39 ca                	cmp    %ecx,%edx
8010192f:	72 7f                	jb     801019b0 <readi+0xcc>
80101931:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101934:	85 f6                	test   %esi,%esi
80101936:	74 6a                	je     801019a2 <readi+0xbe>
80101938:	89 de                	mov    %ebx,%esi
8010193a:	66 90                	xchg   %ax,%ax
8010193c:	89 fa                	mov    %edi,%edx
8010193e:	c1 ea 09             	shr    $0x9,%edx
80101941:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101944:	89 d8                	mov    %ebx,%eax
80101946:	e8 d9 f9 ff ff       	call   80101324 <bmap>
8010194b:	83 ec 08             	sub    $0x8,%esp
8010194e:	50                   	push   %eax
8010194f:	ff 33                	pushl  (%ebx)
80101951:	e8 5e e7 ff ff       	call   801000b4 <bread>
80101956:	89 c2                	mov    %eax,%edx
80101958:	89 f8                	mov    %edi,%eax
8010195a:	25 ff 01 00 00       	and    $0x1ff,%eax
8010195f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101962:	29 f1                	sub    %esi,%ecx
80101964:	bb 00 02 00 00       	mov    $0x200,%ebx
80101969:	29 c3                	sub    %eax,%ebx
8010196b:	83 c4 10             	add    $0x10,%esp
8010196e:	39 d9                	cmp    %ebx,%ecx
80101970:	73 02                	jae    80101974 <readi+0x90>
80101972:	89 cb                	mov    %ecx,%ebx
80101974:	51                   	push   %ecx
80101975:	53                   	push   %ebx
80101976:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
8010197a:	89 55 dc             	mov    %edx,-0x24(%ebp)
8010197d:	50                   	push   %eax
8010197e:	ff 75 e0             	pushl  -0x20(%ebp)
80101981:	e8 4e 28 00 00       	call   801041d4 <memmove>
80101986:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101989:	89 14 24             	mov    %edx,(%esp)
8010198c:	e8 2b e8 ff ff       	call   801001bc <brelse>
80101991:	01 de                	add    %ebx,%esi
80101993:	01 df                	add    %ebx,%edi
80101995:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101998:	83 c4 10             	add    $0x10,%esp
8010199b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010199e:	39 c6                	cmp    %eax,%esi
801019a0:	72 9a                	jb     8010193c <readi+0x58>
801019a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019a8:	5b                   	pop    %ebx
801019a9:	5e                   	pop    %esi
801019aa:	5f                   	pop    %edi
801019ab:	5d                   	pop    %ebp
801019ac:	c3                   	ret    
801019ad:	8d 76 00             	lea    0x0(%esi),%esi
801019b0:	29 fa                	sub    %edi,%edx
801019b2:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019b5:	e9 77 ff ff ff       	jmp    80101931 <readi+0x4d>
801019ba:	66 90                	xchg   %ax,%ax
801019bc:	0f bf 40 52          	movswl 0x52(%eax),%eax
801019c0:	66 83 f8 09          	cmp    $0x9,%ax
801019c4:	77 17                	ja     801019dd <readi+0xf9>
801019c6:	8b 04 c5 00 f9 10 80 	mov    -0x7fef0700(,%eax,8),%eax
801019cd:	85 c0                	test   %eax,%eax
801019cf:	74 0c                	je     801019dd <readi+0xf9>
801019d1:	89 75 10             	mov    %esi,0x10(%ebp)
801019d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019d7:	5b                   	pop    %ebx
801019d8:	5e                   	pop    %esi
801019d9:	5f                   	pop    %edi
801019da:	5d                   	pop    %ebp
801019db:	ff e0                	jmp    *%eax
801019dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801019e2:	eb c1                	jmp    801019a5 <readi+0xc1>

801019e4 <writei>:
801019e4:	55                   	push   %ebp
801019e5:	89 e5                	mov    %esp,%ebp
801019e7:	57                   	push   %edi
801019e8:	56                   	push   %esi
801019e9:	53                   	push   %ebx
801019ea:	83 ec 1c             	sub    $0x1c,%esp
801019ed:	8b 45 08             	mov    0x8(%ebp),%eax
801019f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019f3:	8b 75 0c             	mov    0xc(%ebp),%esi
801019f6:	89 75 dc             	mov    %esi,-0x24(%ebp)
801019f9:	8b 7d 10             	mov    0x10(%ebp),%edi
801019fc:	8b 75 14             	mov    0x14(%ebp),%esi
801019ff:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80101a02:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a07:	0f 84 b7 00 00 00    	je     80101ac4 <writei+0xe0>
80101a0d:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a10:	39 78 58             	cmp    %edi,0x58(%eax)
80101a13:	0f 82 e0 00 00 00    	jb     80101af9 <writei+0x115>
80101a19:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80101a1c:	89 f2                	mov    %esi,%edx
80101a1e:	31 c0                	xor    %eax,%eax
80101a20:	01 fa                	add    %edi,%edx
80101a22:	0f 92 c0             	setb   %al
80101a25:	0f 82 ce 00 00 00    	jb     80101af9 <writei+0x115>
80101a2b:	81 fa 00 18 01 00    	cmp    $0x11800,%edx
80101a31:	0f 87 c2 00 00 00    	ja     80101af9 <writei+0x115>
80101a37:	85 f6                	test   %esi,%esi
80101a39:	74 7c                	je     80101ab7 <writei+0xd3>
80101a3b:	89 c6                	mov    %eax,%esi
80101a3d:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a40:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101a43:	89 da                	mov    %ebx,%edx
80101a45:	c1 ea 09             	shr    $0x9,%edx
80101a48:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101a4b:	89 f8                	mov    %edi,%eax
80101a4d:	e8 d2 f8 ff ff       	call   80101324 <bmap>
80101a52:	83 ec 08             	sub    $0x8,%esp
80101a55:	50                   	push   %eax
80101a56:	ff 37                	pushl  (%edi)
80101a58:	e8 57 e6 ff ff       	call   801000b4 <bread>
80101a5d:	89 c7                	mov    %eax,%edi
80101a5f:	89 d8                	mov    %ebx,%eax
80101a61:	25 ff 01 00 00       	and    $0x1ff,%eax
80101a66:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101a69:	29 f1                	sub    %esi,%ecx
80101a6b:	bb 00 02 00 00       	mov    $0x200,%ebx
80101a70:	29 c3                	sub    %eax,%ebx
80101a72:	83 c4 10             	add    $0x10,%esp
80101a75:	39 d9                	cmp    %ebx,%ecx
80101a77:	73 02                	jae    80101a7b <writei+0x97>
80101a79:	89 cb                	mov    %ecx,%ebx
80101a7b:	52                   	push   %edx
80101a7c:	53                   	push   %ebx
80101a7d:	ff 75 dc             	pushl  -0x24(%ebp)
80101a80:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101a84:	50                   	push   %eax
80101a85:	e8 4a 27 00 00       	call   801041d4 <memmove>
80101a8a:	89 3c 24             	mov    %edi,(%esp)
80101a8d:	e8 f6 10 00 00       	call   80102b88 <log_write>
80101a92:	89 3c 24             	mov    %edi,(%esp)
80101a95:	e8 22 e7 ff ff       	call   801001bc <brelse>
80101a9a:	01 de                	add    %ebx,%esi
80101a9c:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a9f:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101aa2:	83 c4 10             	add    $0x10,%esp
80101aa5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aa8:	39 c6                	cmp    %eax,%esi
80101aaa:	72 94                	jb     80101a40 <writei+0x5c>
80101aac:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aaf:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101ab2:	39 78 58             	cmp    %edi,0x58(%eax)
80101ab5:	72 31                	jb     80101ae8 <writei+0x104>
80101ab7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101aba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101abd:	5b                   	pop    %ebx
80101abe:	5e                   	pop    %esi
80101abf:	5f                   	pop    %edi
80101ac0:	5d                   	pop    %ebp
80101ac1:	c3                   	ret    
80101ac2:	66 90                	xchg   %ax,%ax
80101ac4:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101ac8:	66 83 f8 09          	cmp    $0x9,%ax
80101acc:	77 2b                	ja     80101af9 <writei+0x115>
80101ace:	8b 04 c5 04 f9 10 80 	mov    -0x7fef06fc(,%eax,8),%eax
80101ad5:	85 c0                	test   %eax,%eax
80101ad7:	74 20                	je     80101af9 <writei+0x115>
80101ad9:	89 75 10             	mov    %esi,0x10(%ebp)
80101adc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101adf:	5b                   	pop    %ebx
80101ae0:	5e                   	pop    %esi
80101ae1:	5f                   	pop    %edi
80101ae2:	5d                   	pop    %ebp
80101ae3:	ff e0                	jmp    *%eax
80101ae5:	8d 76 00             	lea    0x0(%esi),%esi
80101ae8:	89 78 58             	mov    %edi,0x58(%eax)
80101aeb:	83 ec 0c             	sub    $0xc,%esp
80101aee:	50                   	push   %eax
80101aef:	e8 78 fa ff ff       	call   8010156c <iupdate>
80101af4:	83 c4 10             	add    $0x10,%esp
80101af7:	eb be                	jmp    80101ab7 <writei+0xd3>
80101af9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101afe:	eb ba                	jmp    80101aba <writei+0xd6>

80101b00 <namecmp>:
80101b00:	55                   	push   %ebp
80101b01:	89 e5                	mov    %esp,%ebp
80101b03:	83 ec 0c             	sub    $0xc,%esp
80101b06:	6a 0e                	push   $0xe
80101b08:	ff 75 0c             	pushl  0xc(%ebp)
80101b0b:	ff 75 08             	pushl  0x8(%ebp)
80101b0e:	e8 0d 27 00 00       	call   80104220 <strncmp>
80101b13:	c9                   	leave  
80101b14:	c3                   	ret    
80101b15:	8d 76 00             	lea    0x0(%esi),%esi

80101b18 <dirlookup>:
80101b18:	55                   	push   %ebp
80101b19:	89 e5                	mov    %esp,%ebp
80101b1b:	57                   	push   %edi
80101b1c:	56                   	push   %esi
80101b1d:	53                   	push   %ebx
80101b1e:	83 ec 1c             	sub    $0x1c,%esp
80101b21:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b24:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101b29:	75 7d                	jne    80101ba8 <dirlookup+0x90>
80101b2b:	8b 4b 58             	mov    0x58(%ebx),%ecx
80101b2e:	85 c9                	test   %ecx,%ecx
80101b30:	74 3d                	je     80101b6f <dirlookup+0x57>
80101b32:	31 ff                	xor    %edi,%edi
80101b34:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101b37:	90                   	nop
80101b38:	6a 10                	push   $0x10
80101b3a:	57                   	push   %edi
80101b3b:	56                   	push   %esi
80101b3c:	53                   	push   %ebx
80101b3d:	e8 a2 fd ff ff       	call   801018e4 <readi>
80101b42:	83 c4 10             	add    $0x10,%esp
80101b45:	83 f8 10             	cmp    $0x10,%eax
80101b48:	75 51                	jne    80101b9b <dirlookup+0x83>
80101b4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101b4f:	74 16                	je     80101b67 <dirlookup+0x4f>
80101b51:	52                   	push   %edx
80101b52:	6a 0e                	push   $0xe
80101b54:	8d 45 da             	lea    -0x26(%ebp),%eax
80101b57:	50                   	push   %eax
80101b58:	ff 75 0c             	pushl  0xc(%ebp)
80101b5b:	e8 c0 26 00 00       	call   80104220 <strncmp>
80101b60:	83 c4 10             	add    $0x10,%esp
80101b63:	85 c0                	test   %eax,%eax
80101b65:	74 15                	je     80101b7c <dirlookup+0x64>
80101b67:	83 c7 10             	add    $0x10,%edi
80101b6a:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101b6d:	72 c9                	jb     80101b38 <dirlookup+0x20>
80101b6f:	31 c0                	xor    %eax,%eax
80101b71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b74:	5b                   	pop    %ebx
80101b75:	5e                   	pop    %esi
80101b76:	5f                   	pop    %edi
80101b77:	5d                   	pop    %ebp
80101b78:	c3                   	ret    
80101b79:	8d 76 00             	lea    0x0(%esi),%esi
80101b7c:	8b 45 10             	mov    0x10(%ebp),%eax
80101b7f:	85 c0                	test   %eax,%eax
80101b81:	74 05                	je     80101b88 <dirlookup+0x70>
80101b83:	8b 45 10             	mov    0x10(%ebp),%eax
80101b86:	89 38                	mov    %edi,(%eax)
80101b88:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101b8c:	8b 03                	mov    (%ebx),%eax
80101b8e:	e8 3d f6 ff ff       	call   801011d0 <iget>
80101b93:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b96:	5b                   	pop    %ebx
80101b97:	5e                   	pop    %esi
80101b98:	5f                   	pop    %edi
80101b99:	5d                   	pop    %ebp
80101b9a:	c3                   	ret    
80101b9b:	83 ec 0c             	sub    $0xc,%esp
80101b9e:	68 19 6a 10 80       	push   $0x80106a19
80101ba3:	e8 90 e7 ff ff       	call   80100338 <panic>
80101ba8:	83 ec 0c             	sub    $0xc,%esp
80101bab:	68 07 6a 10 80       	push   $0x80106a07
80101bb0:	e8 83 e7 ff ff       	call   80100338 <panic>
80101bb5:	8d 76 00             	lea    0x0(%esi),%esi

80101bb8 <namex>:
80101bb8:	55                   	push   %ebp
80101bb9:	89 e5                	mov    %esp,%ebp
80101bbb:	57                   	push   %edi
80101bbc:	56                   	push   %esi
80101bbd:	53                   	push   %ebx
80101bbe:	83 ec 1c             	sub    $0x1c,%esp
80101bc1:	89 c3                	mov    %eax,%ebx
80101bc3:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101bc6:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101bc9:	80 38 2f             	cmpb   $0x2f,(%eax)
80101bcc:	0f 84 42 01 00 00    	je     80101d14 <namex+0x15c>
80101bd2:	e8 3d 19 00 00       	call   80103514 <myproc>
80101bd7:	8b 70 68             	mov    0x68(%eax),%esi
80101bda:	83 ec 0c             	sub    $0xc,%esp
80101bdd:	68 60 f9 10 80       	push   $0x8010f960
80101be2:	e8 b1 24 00 00       	call   80104098 <acquire>
80101be7:	ff 46 08             	incl   0x8(%esi)
80101bea:	c7 04 24 60 f9 10 80 	movl   $0x8010f960,(%esp)
80101bf1:	e8 42 24 00 00       	call   80104038 <release>
80101bf6:	83 c4 10             	add    $0x10,%esp
80101bf9:	eb 02                	jmp    80101bfd <namex+0x45>
80101bfb:	90                   	nop
80101bfc:	43                   	inc    %ebx
80101bfd:	8a 03                	mov    (%ebx),%al
80101bff:	3c 2f                	cmp    $0x2f,%al
80101c01:	74 f9                	je     80101bfc <namex+0x44>
80101c03:	84 c0                	test   %al,%al
80101c05:	0f 84 ed 00 00 00    	je     80101cf8 <namex+0x140>
80101c0b:	8a 03                	mov    (%ebx),%al
80101c0d:	89 df                	mov    %ebx,%edi
80101c0f:	3c 2f                	cmp    $0x2f,%al
80101c11:	75 0c                	jne    80101c1f <namex+0x67>
80101c13:	e9 f5 00 00 00       	jmp    80101d0d <namex+0x155>
80101c18:	47                   	inc    %edi
80101c19:	8a 07                	mov    (%edi),%al
80101c1b:	3c 2f                	cmp    $0x2f,%al
80101c1d:	74 04                	je     80101c23 <namex+0x6b>
80101c1f:	84 c0                	test   %al,%al
80101c21:	75 f5                	jne    80101c18 <namex+0x60>
80101c23:	89 f8                	mov    %edi,%eax
80101c25:	29 d8                	sub    %ebx,%eax
80101c27:	83 f8 0d             	cmp    $0xd,%eax
80101c2a:	0f 8e a4 00 00 00    	jle    80101cd4 <namex+0x11c>
80101c30:	51                   	push   %ecx
80101c31:	6a 0e                	push   $0xe
80101c33:	53                   	push   %ebx
80101c34:	ff 75 e4             	pushl  -0x1c(%ebp)
80101c37:	e8 98 25 00 00       	call   801041d4 <memmove>
80101c3c:	83 c4 10             	add    $0x10,%esp
80101c3f:	89 fb                	mov    %edi,%ebx
80101c41:	80 3f 2f             	cmpb   $0x2f,(%edi)
80101c44:	75 08                	jne    80101c4e <namex+0x96>
80101c46:	66 90                	xchg   %ax,%ax
80101c48:	43                   	inc    %ebx
80101c49:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101c4c:	74 fa                	je     80101c48 <namex+0x90>
80101c4e:	83 ec 0c             	sub    $0xc,%esp
80101c51:	56                   	push   %esi
80101c52:	e8 bd f9 ff ff       	call   80101614 <ilock>
80101c57:	83 c4 10             	add    $0x10,%esp
80101c5a:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101c5f:	0f 85 c5 00 00 00    	jne    80101d2a <namex+0x172>
80101c65:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101c68:	85 c0                	test   %eax,%eax
80101c6a:	74 09                	je     80101c75 <namex+0xbd>
80101c6c:	80 3b 00             	cmpb   $0x0,(%ebx)
80101c6f:	0f 84 2c 01 00 00    	je     80101da1 <namex+0x1e9>
80101c75:	50                   	push   %eax
80101c76:	6a 00                	push   $0x0
80101c78:	ff 75 e4             	pushl  -0x1c(%ebp)
80101c7b:	56                   	push   %esi
80101c7c:	e8 97 fe ff ff       	call   80101b18 <dirlookup>
80101c81:	89 c7                	mov    %eax,%edi
80101c83:	8d 56 0c             	lea    0xc(%esi),%edx
80101c86:	83 c4 10             	add    $0x10,%esp
80101c89:	85 c0                	test   %eax,%eax
80101c8b:	0f 84 db 00 00 00    	je     80101d6c <namex+0x1b4>
80101c91:	83 ec 0c             	sub    $0xc,%esp
80101c94:	52                   	push   %edx
80101c95:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c98:	e8 f3 21 00 00       	call   80103e90 <holdingsleep>
80101c9d:	83 c4 10             	add    $0x10,%esp
80101ca0:	85 c0                	test   %eax,%eax
80101ca2:	0f 84 39 01 00 00    	je     80101de1 <namex+0x229>
80101ca8:	8b 46 08             	mov    0x8(%esi),%eax
80101cab:	85 c0                	test   %eax,%eax
80101cad:	0f 8e 2e 01 00 00    	jle    80101de1 <namex+0x229>
80101cb3:	83 ec 0c             	sub    $0xc,%esp
80101cb6:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101cb9:	52                   	push   %edx
80101cba:	e8 95 21 00 00       	call   80103e54 <releasesleep>
80101cbf:	89 34 24             	mov    %esi,(%esp)
80101cc2:	e8 59 fa ff ff       	call   80101720 <iput>
80101cc7:	83 c4 10             	add    $0x10,%esp
80101cca:	89 fe                	mov    %edi,%esi
80101ccc:	e9 2c ff ff ff       	jmp    80101bfd <namex+0x45>
80101cd1:	8d 76 00             	lea    0x0(%esi),%esi
80101cd4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101cd7:	8d 14 01             	lea    (%ecx,%eax,1),%edx
80101cda:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101cdd:	52                   	push   %edx
80101cde:	50                   	push   %eax
80101cdf:	53                   	push   %ebx
80101ce0:	ff 75 e4             	pushl  -0x1c(%ebp)
80101ce3:	e8 ec 24 00 00       	call   801041d4 <memmove>
80101ce8:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101ceb:	c6 02 00             	movb   $0x0,(%edx)
80101cee:	83 c4 10             	add    $0x10,%esp
80101cf1:	89 fb                	mov    %edi,%ebx
80101cf3:	e9 49 ff ff ff       	jmp    80101c41 <namex+0x89>
80101cf8:	8b 5d dc             	mov    -0x24(%ebp),%ebx
80101cfb:	85 db                	test   %ebx,%ebx
80101cfd:	0f 85 ce 00 00 00    	jne    80101dd1 <namex+0x219>
80101d03:	89 f0                	mov    %esi,%eax
80101d05:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d08:	5b                   	pop    %ebx
80101d09:	5e                   	pop    %esi
80101d0a:	5f                   	pop    %edi
80101d0b:	5d                   	pop    %ebp
80101d0c:	c3                   	ret    
80101d0d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d10:	31 c0                	xor    %eax,%eax
80101d12:	eb c6                	jmp    80101cda <namex+0x122>
80101d14:	ba 01 00 00 00       	mov    $0x1,%edx
80101d19:	b8 01 00 00 00       	mov    $0x1,%eax
80101d1e:	e8 ad f4 ff ff       	call   801011d0 <iget>
80101d23:	89 c6                	mov    %eax,%esi
80101d25:	e9 d3 fe ff ff       	jmp    80101bfd <namex+0x45>
80101d2a:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101d2d:	83 ec 0c             	sub    $0xc,%esp
80101d30:	53                   	push   %ebx
80101d31:	e8 5a 21 00 00       	call   80103e90 <holdingsleep>
80101d36:	83 c4 10             	add    $0x10,%esp
80101d39:	85 c0                	test   %eax,%eax
80101d3b:	0f 84 a0 00 00 00    	je     80101de1 <namex+0x229>
80101d41:	8b 56 08             	mov    0x8(%esi),%edx
80101d44:	85 d2                	test   %edx,%edx
80101d46:	0f 8e 95 00 00 00    	jle    80101de1 <namex+0x229>
80101d4c:	83 ec 0c             	sub    $0xc,%esp
80101d4f:	53                   	push   %ebx
80101d50:	e8 ff 20 00 00       	call   80103e54 <releasesleep>
80101d55:	89 34 24             	mov    %esi,(%esp)
80101d58:	e8 c3 f9 ff ff       	call   80101720 <iput>
80101d5d:	83 c4 10             	add    $0x10,%esp
80101d60:	31 f6                	xor    %esi,%esi
80101d62:	89 f0                	mov    %esi,%eax
80101d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d67:	5b                   	pop    %ebx
80101d68:	5e                   	pop    %esi
80101d69:	5f                   	pop    %edi
80101d6a:	5d                   	pop    %ebp
80101d6b:	c3                   	ret    
80101d6c:	83 ec 0c             	sub    $0xc,%esp
80101d6f:	52                   	push   %edx
80101d70:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d73:	e8 18 21 00 00       	call   80103e90 <holdingsleep>
80101d78:	83 c4 10             	add    $0x10,%esp
80101d7b:	85 c0                	test   %eax,%eax
80101d7d:	74 62                	je     80101de1 <namex+0x229>
80101d7f:	8b 46 08             	mov    0x8(%esi),%eax
80101d82:	85 c0                	test   %eax,%eax
80101d84:	7e 5b                	jle    80101de1 <namex+0x229>
80101d86:	83 ec 0c             	sub    $0xc,%esp
80101d89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d8c:	52                   	push   %edx
80101d8d:	e8 c2 20 00 00       	call   80103e54 <releasesleep>
80101d92:	89 34 24             	mov    %esi,(%esp)
80101d95:	e8 86 f9 ff ff       	call   80101720 <iput>
80101d9a:	83 c4 10             	add    $0x10,%esp
80101d9d:	31 f6                	xor    %esi,%esi
80101d9f:	eb c1                	jmp    80101d62 <namex+0x1aa>
80101da1:	8d 5e 0c             	lea    0xc(%esi),%ebx
80101da4:	83 ec 0c             	sub    $0xc,%esp
80101da7:	53                   	push   %ebx
80101da8:	e8 e3 20 00 00       	call   80103e90 <holdingsleep>
80101dad:	83 c4 10             	add    $0x10,%esp
80101db0:	85 c0                	test   %eax,%eax
80101db2:	74 2d                	je     80101de1 <namex+0x229>
80101db4:	8b 46 08             	mov    0x8(%esi),%eax
80101db7:	85 c0                	test   %eax,%eax
80101db9:	7e 26                	jle    80101de1 <namex+0x229>
80101dbb:	83 ec 0c             	sub    $0xc,%esp
80101dbe:	53                   	push   %ebx
80101dbf:	e8 90 20 00 00       	call   80103e54 <releasesleep>
80101dc4:	83 c4 10             	add    $0x10,%esp
80101dc7:	89 f0                	mov    %esi,%eax
80101dc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dcc:	5b                   	pop    %ebx
80101dcd:	5e                   	pop    %esi
80101dce:	5f                   	pop    %edi
80101dcf:	5d                   	pop    %ebp
80101dd0:	c3                   	ret    
80101dd1:	83 ec 0c             	sub    $0xc,%esp
80101dd4:	56                   	push   %esi
80101dd5:	e8 46 f9 ff ff       	call   80101720 <iput>
80101dda:	83 c4 10             	add    $0x10,%esp
80101ddd:	31 f6                	xor    %esi,%esi
80101ddf:	eb 81                	jmp    80101d62 <namex+0x1aa>
80101de1:	83 ec 0c             	sub    $0xc,%esp
80101de4:	68 ff 69 10 80       	push   $0x801069ff
80101de9:	e8 4a e5 ff ff       	call   80100338 <panic>
80101dee:	66 90                	xchg   %ax,%ax

80101df0 <dirlink>:
80101df0:	55                   	push   %ebp
80101df1:	89 e5                	mov    %esp,%ebp
80101df3:	57                   	push   %edi
80101df4:	56                   	push   %esi
80101df5:	53                   	push   %ebx
80101df6:	83 ec 20             	sub    $0x20,%esp
80101df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dfc:	6a 00                	push   $0x0
80101dfe:	ff 75 0c             	pushl  0xc(%ebp)
80101e01:	53                   	push   %ebx
80101e02:	e8 11 fd ff ff       	call   80101b18 <dirlookup>
80101e07:	83 c4 10             	add    $0x10,%esp
80101e0a:	85 c0                	test   %eax,%eax
80101e0c:	75 65                	jne    80101e73 <dirlink+0x83>
80101e0e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e11:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e14:	85 ff                	test   %edi,%edi
80101e16:	74 29                	je     80101e41 <dirlink+0x51>
80101e18:	31 ff                	xor    %edi,%edi
80101e1a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e1d:	eb 09                	jmp    80101e28 <dirlink+0x38>
80101e1f:	90                   	nop
80101e20:	83 c7 10             	add    $0x10,%edi
80101e23:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e26:	73 19                	jae    80101e41 <dirlink+0x51>
80101e28:	6a 10                	push   $0x10
80101e2a:	57                   	push   %edi
80101e2b:	56                   	push   %esi
80101e2c:	53                   	push   %ebx
80101e2d:	e8 b2 fa ff ff       	call   801018e4 <readi>
80101e32:	83 c4 10             	add    $0x10,%esp
80101e35:	83 f8 10             	cmp    $0x10,%eax
80101e38:	75 4c                	jne    80101e86 <dirlink+0x96>
80101e3a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e3f:	75 df                	jne    80101e20 <dirlink+0x30>
80101e41:	50                   	push   %eax
80101e42:	6a 0e                	push   $0xe
80101e44:	ff 75 0c             	pushl  0xc(%ebp)
80101e47:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e4a:	50                   	push   %eax
80101e4b:	e8 08 24 00 00       	call   80104258 <strncpy>
80101e50:	8b 45 10             	mov    0x10(%ebp),%eax
80101e53:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e57:	6a 10                	push   $0x10
80101e59:	57                   	push   %edi
80101e5a:	56                   	push   %esi
80101e5b:	53                   	push   %ebx
80101e5c:	e8 83 fb ff ff       	call   801019e4 <writei>
80101e61:	83 c4 20             	add    $0x20,%esp
80101e64:	83 f8 10             	cmp    $0x10,%eax
80101e67:	75 2a                	jne    80101e93 <dirlink+0xa3>
80101e69:	31 c0                	xor    %eax,%eax
80101e6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e6e:	5b                   	pop    %ebx
80101e6f:	5e                   	pop    %esi
80101e70:	5f                   	pop    %edi
80101e71:	5d                   	pop    %ebp
80101e72:	c3                   	ret    
80101e73:	83 ec 0c             	sub    $0xc,%esp
80101e76:	50                   	push   %eax
80101e77:	e8 a4 f8 ff ff       	call   80101720 <iput>
80101e7c:	83 c4 10             	add    $0x10,%esp
80101e7f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e84:	eb e5                	jmp    80101e6b <dirlink+0x7b>
80101e86:	83 ec 0c             	sub    $0xc,%esp
80101e89:	68 28 6a 10 80       	push   $0x80106a28
80101e8e:	e8 a5 e4 ff ff       	call   80100338 <panic>
80101e93:	83 ec 0c             	sub    $0xc,%esp
80101e96:	68 02 70 10 80       	push   $0x80107002
80101e9b:	e8 98 e4 ff ff       	call   80100338 <panic>

80101ea0 <namei>:
80101ea0:	55                   	push   %ebp
80101ea1:	89 e5                	mov    %esp,%ebp
80101ea3:	83 ec 18             	sub    $0x18,%esp
80101ea6:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ea9:	31 d2                	xor    %edx,%edx
80101eab:	8b 45 08             	mov    0x8(%ebp),%eax
80101eae:	e8 05 fd ff ff       	call   80101bb8 <namex>
80101eb3:	c9                   	leave  
80101eb4:	c3                   	ret    
80101eb5:	8d 76 00             	lea    0x0(%esi),%esi

80101eb8 <nameiparent>:
80101eb8:	55                   	push   %ebp
80101eb9:	89 e5                	mov    %esp,%ebp
80101ebb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101ebe:	ba 01 00 00 00       	mov    $0x1,%edx
80101ec3:	8b 45 08             	mov    0x8(%ebp),%eax
80101ec6:	5d                   	pop    %ebp
80101ec7:	e9 ec fc ff ff       	jmp    80101bb8 <namex>

80101ecc <idestart>:
80101ecc:	55                   	push   %ebp
80101ecd:	89 e5                	mov    %esp,%ebp
80101ecf:	57                   	push   %edi
80101ed0:	56                   	push   %esi
80101ed1:	53                   	push   %ebx
80101ed2:	83 ec 0c             	sub    $0xc,%esp
80101ed5:	85 c0                	test   %eax,%eax
80101ed7:	0f 84 99 00 00 00    	je     80101f76 <idestart+0xaa>
80101edd:	89 c3                	mov    %eax,%ebx
80101edf:	8b 70 08             	mov    0x8(%eax),%esi
80101ee2:	81 fe e7 03 00 00    	cmp    $0x3e7,%esi
80101ee8:	77 7f                	ja     80101f69 <idestart+0x9d>
80101eea:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101eef:	90                   	nop
80101ef0:	89 ca                	mov    %ecx,%edx
80101ef2:	ec                   	in     (%dx),%al
80101ef3:	83 e0 c0             	and    $0xffffffc0,%eax
80101ef6:	3c 40                	cmp    $0x40,%al
80101ef8:	75 f6                	jne    80101ef0 <idestart+0x24>
80101efa:	31 ff                	xor    %edi,%edi
80101efc:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f01:	89 f8                	mov    %edi,%eax
80101f03:	ee                   	out    %al,(%dx)
80101f04:	b0 01                	mov    $0x1,%al
80101f06:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f0b:	ee                   	out    %al,(%dx)
80101f0c:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f11:	89 f0                	mov    %esi,%eax
80101f13:	ee                   	out    %al,(%dx)
80101f14:	89 f0                	mov    %esi,%eax
80101f16:	c1 f8 08             	sar    $0x8,%eax
80101f19:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f1e:	ee                   	out    %al,(%dx)
80101f1f:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f24:	89 f8                	mov    %edi,%eax
80101f26:	ee                   	out    %al,(%dx)
80101f27:	8a 43 04             	mov    0x4(%ebx),%al
80101f2a:	c1 e0 04             	shl    $0x4,%eax
80101f2d:	83 e0 10             	and    $0x10,%eax
80101f30:	83 c8 e0             	or     $0xffffffe0,%eax
80101f33:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f38:	ee                   	out    %al,(%dx)
80101f39:	f6 03 04             	testb  $0x4,(%ebx)
80101f3c:	75 0e                	jne    80101f4c <idestart+0x80>
80101f3e:	b0 20                	mov    $0x20,%al
80101f40:	89 ca                	mov    %ecx,%edx
80101f42:	ee                   	out    %al,(%dx)
80101f43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f46:	5b                   	pop    %ebx
80101f47:	5e                   	pop    %esi
80101f48:	5f                   	pop    %edi
80101f49:	5d                   	pop    %ebp
80101f4a:	c3                   	ret    
80101f4b:	90                   	nop
80101f4c:	b0 30                	mov    $0x30,%al
80101f4e:	89 ca                	mov    %ecx,%edx
80101f50:	ee                   	out    %al,(%dx)
80101f51:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101f54:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f59:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f5e:	fc                   	cld    
80101f5f:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f64:	5b                   	pop    %ebx
80101f65:	5e                   	pop    %esi
80101f66:	5f                   	pop    %edi
80101f67:	5d                   	pop    %ebp
80101f68:	c3                   	ret    
80101f69:	83 ec 0c             	sub    $0xc,%esp
80101f6c:	68 94 6a 10 80       	push   $0x80106a94
80101f71:	e8 c2 e3 ff ff       	call   80100338 <panic>
80101f76:	83 ec 0c             	sub    $0xc,%esp
80101f79:	68 8b 6a 10 80       	push   $0x80106a8b
80101f7e:	e8 b5 e3 ff ff       	call   80100338 <panic>
80101f83:	90                   	nop

80101f84 <ideinit>:
80101f84:	55                   	push   %ebp
80101f85:	89 e5                	mov    %esp,%ebp
80101f87:	83 ec 10             	sub    $0x10,%esp
80101f8a:	68 a6 6a 10 80       	push   $0x80106aa6
80101f8f:	68 00 16 11 80       	push   $0x80111600
80101f94:	e8 3f 1f 00 00       	call   80103ed8 <initlock>
80101f99:	58                   	pop    %eax
80101f9a:	5a                   	pop    %edx
80101f9b:	a1 84 17 11 80       	mov    0x80111784,%eax
80101fa0:	48                   	dec    %eax
80101fa1:	50                   	push   %eax
80101fa2:	6a 0e                	push   $0xe
80101fa4:	e8 5b 02 00 00       	call   80102204 <ioapicenable>
80101fa9:	83 c4 10             	add    $0x10,%esp
80101fac:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101fb1:	8d 76 00             	lea    0x0(%esi),%esi
80101fb4:	89 ca                	mov    %ecx,%edx
80101fb6:	ec                   	in     (%dx),%al
80101fb7:	83 e0 c0             	and    $0xffffffc0,%eax
80101fba:	3c 40                	cmp    $0x40,%al
80101fbc:	75 f6                	jne    80101fb4 <ideinit+0x30>
80101fbe:	b0 f0                	mov    $0xf0,%al
80101fc0:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fc5:	ee                   	out    %al,(%dx)
80101fc6:	89 ca                	mov    %ecx,%edx
80101fc8:	ec                   	in     (%dx),%al
80101fc9:	84 c0                	test   %al,%al
80101fcb:	75 13                	jne    80101fe0 <ideinit+0x5c>
80101fcd:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101fd2:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fd7:	90                   	nop
80101fd8:	49                   	dec    %ecx
80101fd9:	74 0f                	je     80101fea <ideinit+0x66>
80101fdb:	ec                   	in     (%dx),%al
80101fdc:	84 c0                	test   %al,%al
80101fde:	74 f8                	je     80101fd8 <ideinit+0x54>
80101fe0:	c7 05 e0 15 11 80 01 	movl   $0x1,0x801115e0
80101fe7:	00 00 00 
80101fea:	b0 e0                	mov    $0xe0,%al
80101fec:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101ff1:	ee                   	out    %al,(%dx)
80101ff2:	c9                   	leave  
80101ff3:	c3                   	ret    

80101ff4 <ideintr>:
80101ff4:	55                   	push   %ebp
80101ff5:	89 e5                	mov    %esp,%ebp
80101ff7:	57                   	push   %edi
80101ff8:	56                   	push   %esi
80101ff9:	53                   	push   %ebx
80101ffa:	83 ec 18             	sub    $0x18,%esp
80101ffd:	68 00 16 11 80       	push   $0x80111600
80102002:	e8 91 20 00 00       	call   80104098 <acquire>
80102007:	8b 1d e4 15 11 80    	mov    0x801115e4,%ebx
8010200d:	83 c4 10             	add    $0x10,%esp
80102010:	85 db                	test   %ebx,%ebx
80102012:	74 5b                	je     8010206f <ideintr+0x7b>
80102014:	8b 43 58             	mov    0x58(%ebx),%eax
80102017:	a3 e4 15 11 80       	mov    %eax,0x801115e4
8010201c:	8b 33                	mov    (%ebx),%esi
8010201e:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102024:	75 27                	jne    8010204d <ideintr+0x59>
80102026:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010202b:	90                   	nop
8010202c:	ec                   	in     (%dx),%al
8010202d:	88 c1                	mov    %al,%cl
8010202f:	83 e1 c0             	and    $0xffffffc0,%ecx
80102032:	80 f9 40             	cmp    $0x40,%cl
80102035:	75 f5                	jne    8010202c <ideintr+0x38>
80102037:	a8 21                	test   $0x21,%al
80102039:	75 12                	jne    8010204d <ideintr+0x59>
8010203b:	8d 7b 5c             	lea    0x5c(%ebx),%edi
8010203e:	b9 80 00 00 00       	mov    $0x80,%ecx
80102043:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102048:	fc                   	cld    
80102049:	f3 6d                	rep insl (%dx),%es:(%edi)
8010204b:	8b 33                	mov    (%ebx),%esi
8010204d:	83 e6 fb             	and    $0xfffffffb,%esi
80102050:	83 ce 02             	or     $0x2,%esi
80102053:	89 33                	mov    %esi,(%ebx)
80102055:	83 ec 0c             	sub    $0xc,%esp
80102058:	53                   	push   %ebx
80102059:	e8 b2 1b 00 00       	call   80103c10 <wakeup>
8010205e:	a1 e4 15 11 80       	mov    0x801115e4,%eax
80102063:	83 c4 10             	add    $0x10,%esp
80102066:	85 c0                	test   %eax,%eax
80102068:	74 05                	je     8010206f <ideintr+0x7b>
8010206a:	e8 5d fe ff ff       	call   80101ecc <idestart>
8010206f:	83 ec 0c             	sub    $0xc,%esp
80102072:	68 00 16 11 80       	push   $0x80111600
80102077:	e8 bc 1f 00 00       	call   80104038 <release>
8010207c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010207f:	5b                   	pop    %ebx
80102080:	5e                   	pop    %esi
80102081:	5f                   	pop    %edi
80102082:	5d                   	pop    %ebp
80102083:	c3                   	ret    

80102084 <iderw>:
80102084:	55                   	push   %ebp
80102085:	89 e5                	mov    %esp,%ebp
80102087:	53                   	push   %ebx
80102088:	83 ec 10             	sub    $0x10,%esp
8010208b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010208e:	8d 43 0c             	lea    0xc(%ebx),%eax
80102091:	50                   	push   %eax
80102092:	e8 f9 1d 00 00       	call   80103e90 <holdingsleep>
80102097:	83 c4 10             	add    $0x10,%esp
8010209a:	85 c0                	test   %eax,%eax
8010209c:	0f 84 b7 00 00 00    	je     80102159 <iderw+0xd5>
801020a2:	8b 03                	mov    (%ebx),%eax
801020a4:	83 e0 06             	and    $0x6,%eax
801020a7:	83 f8 02             	cmp    $0x2,%eax
801020aa:	0f 84 9c 00 00 00    	je     8010214c <iderw+0xc8>
801020b0:	8b 53 04             	mov    0x4(%ebx),%edx
801020b3:	85 d2                	test   %edx,%edx
801020b5:	74 09                	je     801020c0 <iderw+0x3c>
801020b7:	a1 e0 15 11 80       	mov    0x801115e0,%eax
801020bc:	85 c0                	test   %eax,%eax
801020be:	74 7f                	je     8010213f <iderw+0xbb>
801020c0:	83 ec 0c             	sub    $0xc,%esp
801020c3:	68 00 16 11 80       	push   $0x80111600
801020c8:	e8 cb 1f 00 00       	call   80104098 <acquire>
801020cd:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
801020d4:	a1 e4 15 11 80       	mov    0x801115e4,%eax
801020d9:	83 c4 10             	add    $0x10,%esp
801020dc:	85 c0                	test   %eax,%eax
801020de:	74 58                	je     80102138 <iderw+0xb4>
801020e0:	89 c2                	mov    %eax,%edx
801020e2:	8b 40 58             	mov    0x58(%eax),%eax
801020e5:	85 c0                	test   %eax,%eax
801020e7:	75 f7                	jne    801020e0 <iderw+0x5c>
801020e9:	83 c2 58             	add    $0x58,%edx
801020ec:	89 1a                	mov    %ebx,(%edx)
801020ee:	39 1d e4 15 11 80    	cmp    %ebx,0x801115e4
801020f4:	74 36                	je     8010212c <iderw+0xa8>
801020f6:	8b 03                	mov    (%ebx),%eax
801020f8:	83 e0 06             	and    $0x6,%eax
801020fb:	83 f8 02             	cmp    $0x2,%eax
801020fe:	74 1b                	je     8010211b <iderw+0x97>
80102100:	83 ec 08             	sub    $0x8,%esp
80102103:	68 00 16 11 80       	push   $0x80111600
80102108:	53                   	push   %ebx
80102109:	e8 46 1a 00 00       	call   80103b54 <sleep>
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 c4 10             	add    $0x10,%esp
80102116:	83 f8 02             	cmp    $0x2,%eax
80102119:	75 e5                	jne    80102100 <iderw+0x7c>
8010211b:	c7 45 08 00 16 11 80 	movl   $0x80111600,0x8(%ebp)
80102122:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102125:	c9                   	leave  
80102126:	e9 0d 1f 00 00       	jmp    80104038 <release>
8010212b:	90                   	nop
8010212c:	89 d8                	mov    %ebx,%eax
8010212e:	e8 99 fd ff ff       	call   80101ecc <idestart>
80102133:	eb c1                	jmp    801020f6 <iderw+0x72>
80102135:	8d 76 00             	lea    0x0(%esi),%esi
80102138:	ba e4 15 11 80       	mov    $0x801115e4,%edx
8010213d:	eb ad                	jmp    801020ec <iderw+0x68>
8010213f:	83 ec 0c             	sub    $0xc,%esp
80102142:	68 d5 6a 10 80       	push   $0x80106ad5
80102147:	e8 ec e1 ff ff       	call   80100338 <panic>
8010214c:	83 ec 0c             	sub    $0xc,%esp
8010214f:	68 c0 6a 10 80       	push   $0x80106ac0
80102154:	e8 df e1 ff ff       	call   80100338 <panic>
80102159:	83 ec 0c             	sub    $0xc,%esp
8010215c:	68 aa 6a 10 80       	push   $0x80106aaa
80102161:	e8 d2 e1 ff ff       	call   80100338 <panic>
80102166:	66 90                	xchg   %ax,%ax

80102168 <ioapicinit>:
80102168:	55                   	push   %ebp
80102169:	89 e5                	mov    %esp,%ebp
8010216b:	56                   	push   %esi
8010216c:	53                   	push   %ebx
8010216d:	c7 05 34 16 11 80 00 	movl   $0xfec00000,0x80111634
80102174:	00 c0 fe 
80102177:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
8010217e:	00 00 00 
80102181:	8b 15 34 16 11 80    	mov    0x80111634,%edx
80102187:	8b 72 10             	mov    0x10(%edx),%esi
8010218a:	c1 ee 10             	shr    $0x10,%esi
8010218d:	89 f0                	mov    %esi,%eax
8010218f:	0f b6 f0             	movzbl %al,%esi
80102192:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102198:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
8010219e:	8b 43 10             	mov    0x10(%ebx),%eax
801021a1:	0f b6 15 80 17 11 80 	movzbl 0x80111780,%edx
801021a8:	c1 e8 18             	shr    $0x18,%eax
801021ab:	39 c2                	cmp    %eax,%edx
801021ad:	74 16                	je     801021c5 <ioapicinit+0x5d>
801021af:	83 ec 0c             	sub    $0xc,%esp
801021b2:	68 f4 6a 10 80       	push   $0x80106af4
801021b7:	e8 6c e4 ff ff       	call   80100628 <cprintf>
801021bc:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021c2:	83 c4 10             	add    $0x10,%esp
801021c5:	ba 10 00 00 00       	mov    $0x10,%edx
801021ca:	31 c0                	xor    %eax,%eax
801021cc:	8d 48 20             	lea    0x20(%eax),%ecx
801021cf:	81 c9 00 00 01 00    	or     $0x10000,%ecx
801021d5:	89 13                	mov    %edx,(%ebx)
801021d7:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021dd:	89 4b 10             	mov    %ecx,0x10(%ebx)
801021e0:	8d 4a 01             	lea    0x1(%edx),%ecx
801021e3:	89 0b                	mov    %ecx,(%ebx)
801021e5:	8b 1d 34 16 11 80    	mov    0x80111634,%ebx
801021eb:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
801021f2:	40                   	inc    %eax
801021f3:	83 c2 02             	add    $0x2,%edx
801021f6:	39 c6                	cmp    %eax,%esi
801021f8:	7d d2                	jge    801021cc <ioapicinit+0x64>
801021fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801021fd:	5b                   	pop    %ebx
801021fe:	5e                   	pop    %esi
801021ff:	5d                   	pop    %ebp
80102200:	c3                   	ret    
80102201:	8d 76 00             	lea    0x0(%esi),%esi

80102204 <ioapicenable>:
80102204:	55                   	push   %ebp
80102205:	89 e5                	mov    %esp,%ebp
80102207:	8b 45 08             	mov    0x8(%ebp),%eax
8010220a:	8d 50 20             	lea    0x20(%eax),%edx
8010220d:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102211:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
80102217:	89 01                	mov    %eax,(%ecx)
80102219:	8b 0d 34 16 11 80    	mov    0x80111634,%ecx
8010221f:	89 51 10             	mov    %edx,0x10(%ecx)
80102222:	8b 55 0c             	mov    0xc(%ebp),%edx
80102225:	c1 e2 18             	shl    $0x18,%edx
80102228:	40                   	inc    %eax
80102229:	89 01                	mov    %eax,(%ecx)
8010222b:	a1 34 16 11 80       	mov    0x80111634,%eax
80102230:	89 50 10             	mov    %edx,0x10(%eax)
80102233:	5d                   	pop    %ebp
80102234:	c3                   	ret    
80102235:	66 90                	xchg   %ax,%ax
80102237:	90                   	nop

80102238 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102238:	55                   	push   %ebp
80102239:	89 e5                	mov    %esp,%ebp
8010223b:	53                   	push   %ebx
8010223c:	53                   	push   %ebx
8010223d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
80102240:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102246:	75 70                	jne    801022b8 <kfree+0x80>
80102248:	81 fb d0 55 11 80    	cmp    $0x801155d0,%ebx
8010224e:	72 68                	jb     801022b8 <kfree+0x80>
80102250:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102256:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
8010225b:	77 5b                	ja     801022b8 <kfree+0x80>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
8010225d:	52                   	push   %edx
8010225e:	68 00 10 00 00       	push   $0x1000
80102263:	6a 01                	push   $0x1
80102265:	53                   	push   %ebx
80102266:	e8 ed 1e 00 00       	call   80104158 <memset>

  if(kmem.use_lock)
8010226b:	83 c4 10             	add    $0x10,%esp
8010226e:	8b 0d 74 16 11 80    	mov    0x80111674,%ecx
80102274:	85 c9                	test   %ecx,%ecx
80102276:	75 1c                	jne    80102294 <kfree+0x5c>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102278:	a1 78 16 11 80       	mov    0x80111678,%eax
8010227d:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
8010227f:	89 1d 78 16 11 80    	mov    %ebx,0x80111678
  if(kmem.use_lock)
80102285:	a1 74 16 11 80       	mov    0x80111674,%eax
8010228a:	85 c0                	test   %eax,%eax
8010228c:	75 1a                	jne    801022a8 <kfree+0x70>
    release(&kmem.lock);
}
8010228e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102291:	c9                   	leave  
80102292:	c3                   	ret    
80102293:	90                   	nop
    acquire(&kmem.lock);
80102294:	83 ec 0c             	sub    $0xc,%esp
80102297:	68 40 16 11 80       	push   $0x80111640
8010229c:	e8 f7 1d 00 00       	call   80104098 <acquire>
801022a1:	83 c4 10             	add    $0x10,%esp
801022a4:	eb d2                	jmp    80102278 <kfree+0x40>
801022a6:	66 90                	xchg   %ax,%ax
    release(&kmem.lock);
801022a8:	c7 45 08 40 16 11 80 	movl   $0x80111640,0x8(%ebp)
}
801022af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801022b2:	c9                   	leave  
    release(&kmem.lock);
801022b3:	e9 80 1d 00 00       	jmp    80104038 <release>
    panic("kfree");
801022b8:	83 ec 0c             	sub    $0xc,%esp
801022bb:	68 26 6b 10 80       	push   $0x80106b26
801022c0:	e8 73 e0 ff ff       	call   80100338 <panic>
801022c5:	8d 76 00             	lea    0x0(%esi),%esi

801022c8 <freerange>:
{
801022c8:	55                   	push   %ebp
801022c9:	89 e5                	mov    %esp,%ebp
801022cb:	56                   	push   %esi
801022cc:	53                   	push   %ebx
801022cd:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
801022d0:	8b 45 08             	mov    0x8(%ebp),%eax
801022d3:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801022d9:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801022df:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801022e5:	39 de                	cmp    %ebx,%esi
801022e7:	72 1f                	jb     80102308 <freerange+0x40>
801022e9:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
801022ec:	83 ec 0c             	sub    $0xc,%esp
801022ef:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801022f5:	50                   	push   %eax
801022f6:	e8 3d ff ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801022fb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102301:	83 c4 10             	add    $0x10,%esp
80102304:	39 de                	cmp    %ebx,%esi
80102306:	73 e4                	jae    801022ec <freerange+0x24>
}
80102308:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010230b:	5b                   	pop    %ebx
8010230c:	5e                   	pop    %esi
8010230d:	5d                   	pop    %ebp
8010230e:	c3                   	ret    
8010230f:	90                   	nop

80102310 <kinit2>:
{
80102310:	55                   	push   %ebp
80102311:	89 e5                	mov    %esp,%ebp
80102313:	56                   	push   %esi
80102314:	53                   	push   %ebx
80102315:	8b 75 0c             	mov    0xc(%ebp),%esi
  p = (char*)PGROUNDUP((uint)vstart);
80102318:	8b 45 08             	mov    0x8(%ebp),%eax
8010231b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102321:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102327:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010232d:	39 de                	cmp    %ebx,%esi
8010232f:	72 1f                	jb     80102350 <kinit2+0x40>
80102331:	8d 76 00             	lea    0x0(%esi),%esi
    kfree(p);
80102334:	83 ec 0c             	sub    $0xc,%esp
80102337:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010233d:	50                   	push   %eax
8010233e:	e8 f5 fe ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102343:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102349:	83 c4 10             	add    $0x10,%esp
8010234c:	39 de                	cmp    %ebx,%esi
8010234e:	73 e4                	jae    80102334 <kinit2+0x24>
  kmem.use_lock = 1;
80102350:	c7 05 74 16 11 80 01 	movl   $0x1,0x80111674
80102357:	00 00 00 
}
8010235a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010235d:	5b                   	pop    %ebx
8010235e:	5e                   	pop    %esi
8010235f:	5d                   	pop    %ebp
80102360:	c3                   	ret    
80102361:	8d 76 00             	lea    0x0(%esi),%esi

80102364 <kinit1>:
{
80102364:	55                   	push   %ebp
80102365:	89 e5                	mov    %esp,%ebp
80102367:	56                   	push   %esi
80102368:	53                   	push   %ebx
80102369:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
8010236c:	83 ec 08             	sub    $0x8,%esp
8010236f:	68 2c 6b 10 80       	push   $0x80106b2c
80102374:	68 40 16 11 80       	push   $0x80111640
80102379:	e8 5a 1b 00 00       	call   80103ed8 <initlock>
  kmem.use_lock = 0;
8010237e:	c7 05 74 16 11 80 00 	movl   $0x0,0x80111674
80102385:	00 00 00 
  p = (char*)PGROUNDUP((uint)vstart);
80102388:	8b 45 08             	mov    0x8(%ebp),%eax
8010238b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102391:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102397:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 de                	cmp    %ebx,%esi
801023a2:	72 1c                	jb     801023c0 <kinit1+0x5c>
    kfree(p);
801023a4:	83 ec 0c             	sub    $0xc,%esp
801023a7:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023ad:	50                   	push   %eax
801023ae:	e8 85 fe ff ff       	call   80102238 <kfree>
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023b9:	83 c4 10             	add    $0x10,%esp
801023bc:	39 de                	cmp    %ebx,%esi
801023be:	73 e4                	jae    801023a4 <kinit1+0x40>
}
801023c0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023c3:	5b                   	pop    %ebx
801023c4:	5e                   	pop    %esi
801023c5:	5d                   	pop    %ebp
801023c6:	c3                   	ret    
801023c7:	90                   	nop

801023c8 <kalloc>:
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
801023c8:	a1 74 16 11 80       	mov    0x80111674,%eax
801023cd:	85 c0                	test   %eax,%eax
801023cf:	75 17                	jne    801023e8 <kalloc+0x20>
    acquire(&kmem.lock);
  r = kmem.freelist;
801023d1:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(r)
801023d6:	85 c0                	test   %eax,%eax
801023d8:	74 0a                	je     801023e4 <kalloc+0x1c>
    kmem.freelist = r->next;
801023da:	8b 10                	mov    (%eax),%edx
801023dc:	89 15 78 16 11 80    	mov    %edx,0x80111678
  if(kmem.use_lock)
801023e2:	c3                   	ret    
801023e3:	90                   	nop
    release(&kmem.lock);
  return (char*)r;
}
801023e4:	c3                   	ret    
801023e5:	8d 76 00             	lea    0x0(%esi),%esi
{
801023e8:	55                   	push   %ebp
801023e9:	89 e5                	mov    %esp,%ebp
801023eb:	83 ec 24             	sub    $0x24,%esp
    acquire(&kmem.lock);
801023ee:	68 40 16 11 80       	push   $0x80111640
801023f3:	e8 a0 1c 00 00       	call   80104098 <acquire>
  r = kmem.freelist;
801023f8:	a1 78 16 11 80       	mov    0x80111678,%eax
  if(r)
801023fd:	83 c4 10             	add    $0x10,%esp
  if(kmem.use_lock)
80102400:	8b 15 74 16 11 80    	mov    0x80111674,%edx
  if(r)
80102406:	85 c0                	test   %eax,%eax
80102408:	74 08                	je     80102412 <kalloc+0x4a>
    kmem.freelist = r->next;
8010240a:	8b 08                	mov    (%eax),%ecx
8010240c:	89 0d 78 16 11 80    	mov    %ecx,0x80111678
  if(kmem.use_lock)
80102412:	85 d2                	test   %edx,%edx
80102414:	74 16                	je     8010242c <kalloc+0x64>
80102416:	89 45 f4             	mov    %eax,-0xc(%ebp)
    release(&kmem.lock);
80102419:	83 ec 0c             	sub    $0xc,%esp
8010241c:	68 40 16 11 80       	push   $0x80111640
80102421:	e8 12 1c 00 00       	call   80104038 <release>
80102426:	83 c4 10             	add    $0x10,%esp
80102429:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
8010242c:	c9                   	leave  
8010242d:	c3                   	ret    
8010242e:	66 90                	xchg   %ax,%ax

80102430 <kbdgetc>:
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102430:	ba 64 00 00 00       	mov    $0x64,%edx
80102435:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102436:	a8 01                	test   $0x1,%al
80102438:	0f 84 aa 00 00 00    	je     801024e8 <kbdgetc+0xb8>
{
8010243e:	55                   	push   %ebp
8010243f:	89 e5                	mov    %esp,%ebp
80102441:	53                   	push   %ebx
80102442:	ba 60 00 00 00       	mov    $0x60,%edx
80102447:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102448:	0f b6 d8             	movzbl %al,%ebx

  if(data == 0xE0){
    shift |= E0ESC;
8010244b:	8b 0d 7c 16 11 80    	mov    0x8011167c,%ecx
  if(data == 0xE0){
80102451:	3c e0                	cmp    $0xe0,%al
80102453:	74 5b                	je     801024b0 <kbdgetc+0x80>
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102455:	89 ca                	mov    %ecx,%edx
80102457:	83 e2 40             	and    $0x40,%edx
  } else if(data & 0x80){
8010245a:	84 c0                	test   %al,%al
8010245c:	78 66                	js     801024c4 <kbdgetc+0x94>
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
8010245e:	85 d2                	test   %edx,%edx
80102460:	74 09                	je     8010246b <kbdgetc+0x3b>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102462:	83 c8 80             	or     $0xffffff80,%eax
80102465:	0f b6 d8             	movzbl %al,%ebx
    shift &= ~E0ESC;
80102468:	83 e1 bf             	and    $0xffffffbf,%ecx
  }

  shift |= shiftcode[data];
8010246b:	0f b6 93 60 6c 10 80 	movzbl -0x7fef93a0(%ebx),%edx
80102472:	09 ca                	or     %ecx,%edx
  shift ^= togglecode[data];
80102474:	0f b6 83 60 6b 10 80 	movzbl -0x7fef94a0(%ebx),%eax
8010247b:	31 c2                	xor    %eax,%edx
8010247d:	89 15 7c 16 11 80    	mov    %edx,0x8011167c
  c = charcode[shift & (CTL | SHIFT)][data];
80102483:	89 d0                	mov    %edx,%eax
80102485:	83 e0 03             	and    $0x3,%eax
80102488:	8b 04 85 40 6b 10 80 	mov    -0x7fef94c0(,%eax,4),%eax
8010248f:	0f b6 04 18          	movzbl (%eax,%ebx,1),%eax
  if(shift & CAPSLOCK){
80102493:	83 e2 08             	and    $0x8,%edx
80102496:	74 13                	je     801024ab <kbdgetc+0x7b>
    if('a' <= c && c <= 'z')
80102498:	8d 50 9f             	lea    -0x61(%eax),%edx
8010249b:	83 fa 19             	cmp    $0x19,%edx
8010249e:	76 40                	jbe    801024e0 <kbdgetc+0xb0>
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801024a0:	8d 50 bf             	lea    -0x41(%eax),%edx
801024a3:	83 fa 19             	cmp    $0x19,%edx
801024a6:	77 03                	ja     801024ab <kbdgetc+0x7b>
      c += 'a' - 'A';
801024a8:	83 c0 20             	add    $0x20,%eax
  }
  return c;
}
801024ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024ae:	c9                   	leave  
801024af:	c3                   	ret    
    shift |= E0ESC;
801024b0:	89 c8                	mov    %ecx,%eax
801024b2:	83 c8 40             	or     $0x40,%eax
    shift &= ~(shiftcode[data] | E0ESC);
801024b5:	a3 7c 16 11 80       	mov    %eax,0x8011167c
    return 0;
801024ba:	31 c0                	xor    %eax,%eax
}
801024bc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bf:	c9                   	leave  
801024c0:	c3                   	ret    
801024c1:	8d 76 00             	lea    0x0(%esi),%esi
    data = (shift & E0ESC ? data : data & 0x7F);
801024c4:	85 d2                	test   %edx,%edx
801024c6:	75 05                	jne    801024cd <kbdgetc+0x9d>
801024c8:	89 c3                	mov    %eax,%ebx
801024ca:	83 e3 7f             	and    $0x7f,%ebx
    shift &= ~(shiftcode[data] | E0ESC);
801024cd:	8a 83 60 6c 10 80    	mov    -0x7fef93a0(%ebx),%al
801024d3:	83 c8 40             	or     $0x40,%eax
801024d6:	0f b6 c0             	movzbl %al,%eax
801024d9:	f7 d0                	not    %eax
801024db:	21 c8                	and    %ecx,%eax
    return 0;
801024dd:	eb d6                	jmp    801024b5 <kbdgetc+0x85>
801024df:	90                   	nop
      c += 'A' - 'a';
801024e0:	83 e8 20             	sub    $0x20,%eax
}
801024e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024e6:	c9                   	leave  
801024e7:	c3                   	ret    
    return -1;
801024e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801024ed:	c3                   	ret    
801024ee:	66 90                	xchg   %ax,%ax

801024f0 <kbdintr>:

void
kbdintr(void)
{
801024f0:	55                   	push   %ebp
801024f1:	89 e5                	mov    %esp,%ebp
801024f3:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
801024f6:	68 30 24 10 80       	push   $0x80102430
801024fb:	e8 14 e3 ff ff       	call   80100814 <consoleintr>
}
80102500:	83 c4 10             	add    $0x10,%esp
80102503:	c9                   	leave  
80102504:	c3                   	ret    
80102505:	66 90                	xchg   %ax,%ax
80102507:	90                   	nop

80102508 <lapicinit>:
80102508:	a1 80 16 11 80       	mov    0x80111680,%eax
8010250d:	85 c0                	test   %eax,%eax
8010250f:	0f 84 c3 00 00 00    	je     801025d8 <lapicinit+0xd0>
80102515:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
8010251c:	01 00 00 
8010251f:	8b 50 20             	mov    0x20(%eax),%edx
80102522:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102529:	00 00 00 
8010252c:	8b 50 20             	mov    0x20(%eax),%edx
8010252f:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102536:	00 02 00 
80102539:	8b 50 20             	mov    0x20(%eax),%edx
8010253c:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
80102543:	96 98 00 
80102546:	8b 50 20             	mov    0x20(%eax),%edx
80102549:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
80102550:	00 01 00 
80102553:	8b 50 20             	mov    0x20(%eax),%edx
80102556:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
8010255d:	00 01 00 
80102560:	8b 50 20             	mov    0x20(%eax),%edx
80102563:	8b 50 30             	mov    0x30(%eax),%edx
80102566:	c1 ea 10             	shr    $0x10,%edx
80102569:	81 e2 fc 00 00 00    	and    $0xfc,%edx
8010256f:	75 6b                	jne    801025dc <lapicinit+0xd4>
80102571:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102578:	00 00 00 
8010257b:	8b 50 20             	mov    0x20(%eax),%edx
8010257e:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102585:	00 00 00 
80102588:	8b 50 20             	mov    0x20(%eax),%edx
8010258b:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
80102592:	00 00 00 
80102595:	8b 50 20             	mov    0x20(%eax),%edx
80102598:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
8010259f:	00 00 00 
801025a2:	8b 50 20             	mov    0x20(%eax),%edx
801025a5:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801025ac:	00 00 00 
801025af:	8b 50 20             	mov    0x20(%eax),%edx
801025b2:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801025b9:	85 08 00 
801025bc:	8b 50 20             	mov    0x20(%eax),%edx
801025bf:	90                   	nop
801025c0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801025c6:	80 e6 10             	and    $0x10,%dh
801025c9:	75 f5                	jne    801025c0 <lapicinit+0xb8>
801025cb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801025d2:	00 00 00 
801025d5:	8b 40 20             	mov    0x20(%eax),%eax
801025d8:	c3                   	ret    
801025d9:	8d 76 00             	lea    0x0(%esi),%esi
801025dc:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801025e3:	00 01 00 
801025e6:	8b 50 20             	mov    0x20(%eax),%edx
801025e9:	eb 86                	jmp    80102571 <lapicinit+0x69>
801025eb:	90                   	nop

801025ec <lapicid>:
801025ec:	a1 80 16 11 80       	mov    0x80111680,%eax
801025f1:	85 c0                	test   %eax,%eax
801025f3:	74 07                	je     801025fc <lapicid+0x10>
801025f5:	8b 40 20             	mov    0x20(%eax),%eax
801025f8:	c1 e8 18             	shr    $0x18,%eax
801025fb:	c3                   	ret    
801025fc:	31 c0                	xor    %eax,%eax
801025fe:	c3                   	ret    
801025ff:	90                   	nop

80102600 <lapiceoi>:
80102600:	a1 80 16 11 80       	mov    0x80111680,%eax
80102605:	85 c0                	test   %eax,%eax
80102607:	74 0d                	je     80102616 <lapiceoi+0x16>
80102609:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102610:	00 00 00 
80102613:	8b 40 20             	mov    0x20(%eax),%eax
80102616:	c3                   	ret    
80102617:	90                   	nop

80102618 <microdelay>:
80102618:	c3                   	ret    
80102619:	8d 76 00             	lea    0x0(%esi),%esi

8010261c <lapicstartap>:
8010261c:	55                   	push   %ebp
8010261d:	89 e5                	mov    %esp,%ebp
8010261f:	53                   	push   %ebx
80102620:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102623:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102626:	b0 0f                	mov    $0xf,%al
80102628:	ba 70 00 00 00       	mov    $0x70,%edx
8010262d:	ee                   	out    %al,(%dx)
8010262e:	b0 0a                	mov    $0xa,%al
80102630:	ba 71 00 00 00       	mov    $0x71,%edx
80102635:	ee                   	out    %al,(%dx)
80102636:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
8010263d:	00 00 
8010263f:	89 c8                	mov    %ecx,%eax
80102641:	c1 e8 04             	shr    $0x4,%eax
80102644:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010264a:	a1 80 16 11 80       	mov    0x80111680,%eax
8010264f:	c1 e3 18             	shl    $0x18,%ebx
80102652:	89 da                	mov    %ebx,%edx
80102654:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
8010265a:	8b 58 20             	mov    0x20(%eax),%ebx
8010265d:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102664:	c5 00 00 
80102667:	8b 58 20             	mov    0x20(%eax),%ebx
8010266a:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102671:	85 00 00 
80102674:	8b 58 20             	mov    0x20(%eax),%ebx
80102677:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010267d:	8b 58 20             	mov    0x20(%eax),%ebx
80102680:	c1 e9 0c             	shr    $0xc,%ecx
80102683:	80 cd 06             	or     $0x6,%ch
80102686:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010268c:	8b 58 20             	mov    0x20(%eax),%ebx
8010268f:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
80102695:	8b 50 20             	mov    0x20(%eax),%edx
80102698:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
8010269e:	8b 40 20             	mov    0x20(%eax),%eax
801026a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801026a4:	c9                   	leave  
801026a5:	c3                   	ret    
801026a6:	66 90                	xchg   %ax,%ax

801026a8 <cmostime>:
801026a8:	55                   	push   %ebp
801026a9:	89 e5                	mov    %esp,%ebp
801026ab:	57                   	push   %edi
801026ac:	56                   	push   %esi
801026ad:	53                   	push   %ebx
801026ae:	83 ec 4c             	sub    $0x4c,%esp
801026b1:	b0 0b                	mov    $0xb,%al
801026b3:	ba 70 00 00 00       	mov    $0x70,%edx
801026b8:	ee                   	out    %al,(%dx)
801026b9:	ba 71 00 00 00       	mov    $0x71,%edx
801026be:	ec                   	in     (%dx),%al
801026bf:	83 e0 04             	and    $0x4,%eax
801026c2:	89 c6                	mov    %eax,%esi
801026c4:	bb 70 00 00 00       	mov    $0x70,%ebx
801026c9:	8d 76 00             	lea    0x0(%esi),%esi
801026cc:	31 c0                	xor    %eax,%eax
801026ce:	89 da                	mov    %ebx,%edx
801026d0:	ee                   	out    %al,(%dx)
801026d1:	bf 71 00 00 00       	mov    $0x71,%edi
801026d6:	89 fa                	mov    %edi,%edx
801026d8:	ec                   	in     (%dx),%al
801026d9:	88 45 b7             	mov    %al,-0x49(%ebp)
801026dc:	b0 02                	mov    $0x2,%al
801026de:	89 da                	mov    %ebx,%edx
801026e0:	ee                   	out    %al,(%dx)
801026e1:	89 fa                	mov    %edi,%edx
801026e3:	ec                   	in     (%dx),%al
801026e4:	88 45 b6             	mov    %al,-0x4a(%ebp)
801026e7:	b0 04                	mov    $0x4,%al
801026e9:	89 da                	mov    %ebx,%edx
801026eb:	ee                   	out    %al,(%dx)
801026ec:	89 fa                	mov    %edi,%edx
801026ee:	ec                   	in     (%dx),%al
801026ef:	88 45 b5             	mov    %al,-0x4b(%ebp)
801026f2:	b0 07                	mov    $0x7,%al
801026f4:	89 da                	mov    %ebx,%edx
801026f6:	ee                   	out    %al,(%dx)
801026f7:	89 fa                	mov    %edi,%edx
801026f9:	ec                   	in     (%dx),%al
801026fa:	88 45 b4             	mov    %al,-0x4c(%ebp)
801026fd:	b0 08                	mov    $0x8,%al
801026ff:	89 da                	mov    %ebx,%edx
80102701:	ee                   	out    %al,(%dx)
80102702:	89 fa                	mov    %edi,%edx
80102704:	ec                   	in     (%dx),%al
80102705:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102708:	b0 09                	mov    $0x9,%al
8010270a:	89 da                	mov    %ebx,%edx
8010270c:	ee                   	out    %al,(%dx)
8010270d:	89 fa                	mov    %edi,%edx
8010270f:	ec                   	in     (%dx),%al
80102710:	0f b6 c8             	movzbl %al,%ecx
80102713:	b0 0a                	mov    $0xa,%al
80102715:	89 da                	mov    %ebx,%edx
80102717:	ee                   	out    %al,(%dx)
80102718:	89 fa                	mov    %edi,%edx
8010271a:	ec                   	in     (%dx),%al
8010271b:	84 c0                	test   %al,%al
8010271d:	78 ad                	js     801026cc <cmostime+0x24>
8010271f:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
80102723:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102726:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
8010272a:	89 45 bc             	mov    %eax,-0x44(%ebp)
8010272d:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
80102731:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102734:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
80102738:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010273b:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
8010273f:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102742:	89 4d cc             	mov    %ecx,-0x34(%ebp)
80102745:	31 c0                	xor    %eax,%eax
80102747:	89 da                	mov    %ebx,%edx
80102749:	ee                   	out    %al,(%dx)
8010274a:	89 fa                	mov    %edi,%edx
8010274c:	ec                   	in     (%dx),%al
8010274d:	0f b6 c0             	movzbl %al,%eax
80102750:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102753:	b0 02                	mov    $0x2,%al
80102755:	89 da                	mov    %ebx,%edx
80102757:	ee                   	out    %al,(%dx)
80102758:	89 fa                	mov    %edi,%edx
8010275a:	ec                   	in     (%dx),%al
8010275b:	0f b6 c0             	movzbl %al,%eax
8010275e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102761:	b0 04                	mov    $0x4,%al
80102763:	89 da                	mov    %ebx,%edx
80102765:	ee                   	out    %al,(%dx)
80102766:	89 fa                	mov    %edi,%edx
80102768:	ec                   	in     (%dx),%al
80102769:	0f b6 c0             	movzbl %al,%eax
8010276c:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010276f:	b0 07                	mov    $0x7,%al
80102771:	89 da                	mov    %ebx,%edx
80102773:	ee                   	out    %al,(%dx)
80102774:	89 fa                	mov    %edi,%edx
80102776:	ec                   	in     (%dx),%al
80102777:	0f b6 c0             	movzbl %al,%eax
8010277a:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010277d:	b0 08                	mov    $0x8,%al
8010277f:	89 da                	mov    %ebx,%edx
80102781:	ee                   	out    %al,(%dx)
80102782:	89 fa                	mov    %edi,%edx
80102784:	ec                   	in     (%dx),%al
80102785:	0f b6 c0             	movzbl %al,%eax
80102788:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010278b:	b0 09                	mov    $0x9,%al
8010278d:	89 da                	mov    %ebx,%edx
8010278f:	ee                   	out    %al,(%dx)
80102790:	89 fa                	mov    %edi,%edx
80102792:	ec                   	in     (%dx),%al
80102793:	0f b6 c0             	movzbl %al,%eax
80102796:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102799:	50                   	push   %eax
8010279a:	6a 18                	push   $0x18
8010279c:	8d 45 d0             	lea    -0x30(%ebp),%eax
8010279f:	50                   	push   %eax
801027a0:	8d 45 b8             	lea    -0x48(%ebp),%eax
801027a3:	50                   	push   %eax
801027a4:	e8 f3 19 00 00       	call   8010419c <memcmp>
801027a9:	83 c4 10             	add    $0x10,%esp
801027ac:	85 c0                	test   %eax,%eax
801027ae:	0f 85 18 ff ff ff    	jne    801026cc <cmostime+0x24>
801027b4:	89 f0                	mov    %esi,%eax
801027b6:	84 c0                	test   %al,%al
801027b8:	75 7e                	jne    80102838 <cmostime+0x190>
801027ba:	8b 55 b8             	mov    -0x48(%ebp),%edx
801027bd:	89 d0                	mov    %edx,%eax
801027bf:	c1 e8 04             	shr    $0x4,%eax
801027c2:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027c5:	01 c0                	add    %eax,%eax
801027c7:	83 e2 0f             	and    $0xf,%edx
801027ca:	01 d0                	add    %edx,%eax
801027cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
801027cf:	8b 55 bc             	mov    -0x44(%ebp),%edx
801027d2:	89 d0                	mov    %edx,%eax
801027d4:	c1 e8 04             	shr    $0x4,%eax
801027d7:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027da:	01 c0                	add    %eax,%eax
801027dc:	83 e2 0f             	and    $0xf,%edx
801027df:	01 d0                	add    %edx,%eax
801027e1:	89 45 bc             	mov    %eax,-0x44(%ebp)
801027e4:	8b 55 c0             	mov    -0x40(%ebp),%edx
801027e7:	89 d0                	mov    %edx,%eax
801027e9:	c1 e8 04             	shr    $0x4,%eax
801027ec:	8d 04 80             	lea    (%eax,%eax,4),%eax
801027ef:	01 c0                	add    %eax,%eax
801027f1:	83 e2 0f             	and    $0xf,%edx
801027f4:	01 d0                	add    %edx,%eax
801027f6:	89 45 c0             	mov    %eax,-0x40(%ebp)
801027f9:	8b 55 c4             	mov    -0x3c(%ebp),%edx
801027fc:	89 d0                	mov    %edx,%eax
801027fe:	c1 e8 04             	shr    $0x4,%eax
80102801:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102804:	01 c0                	add    %eax,%eax
80102806:	83 e2 0f             	and    $0xf,%edx
80102809:	01 d0                	add    %edx,%eax
8010280b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010280e:	8b 55 c8             	mov    -0x38(%ebp),%edx
80102811:	89 d0                	mov    %edx,%eax
80102813:	c1 e8 04             	shr    $0x4,%eax
80102816:	8d 04 80             	lea    (%eax,%eax,4),%eax
80102819:	01 c0                	add    %eax,%eax
8010281b:	83 e2 0f             	and    $0xf,%edx
8010281e:	01 d0                	add    %edx,%eax
80102820:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102823:	8b 55 cc             	mov    -0x34(%ebp),%edx
80102826:	89 d0                	mov    %edx,%eax
80102828:	c1 e8 04             	shr    $0x4,%eax
8010282b:	8d 04 80             	lea    (%eax,%eax,4),%eax
8010282e:	01 c0                	add    %eax,%eax
80102830:	83 e2 0f             	and    $0xf,%edx
80102833:	01 d0                	add    %edx,%eax
80102835:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102838:	b9 06 00 00 00       	mov    $0x6,%ecx
8010283d:	8b 7d 08             	mov    0x8(%ebp),%edi
80102840:	8d 75 b8             	lea    -0x48(%ebp),%esi
80102843:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80102845:	8b 45 08             	mov    0x8(%ebp),%eax
80102848:	81 40 14 d0 07 00 00 	addl   $0x7d0,0x14(%eax)
8010284f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102852:	5b                   	pop    %ebx
80102853:	5e                   	pop    %esi
80102854:	5f                   	pop    %edi
80102855:	5d                   	pop    %ebp
80102856:	c3                   	ret    
80102857:	90                   	nop

80102858 <install_trans>:
80102858:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
8010285e:	85 c9                	test   %ecx,%ecx
80102860:	7e 7e                	jle    801028e0 <install_trans+0x88>
80102862:	55                   	push   %ebp
80102863:	89 e5                	mov    %esp,%ebp
80102865:	57                   	push   %edi
80102866:	56                   	push   %esi
80102867:	53                   	push   %ebx
80102868:	83 ec 0c             	sub    $0xc,%esp
8010286b:	31 ff                	xor    %edi,%edi
8010286d:	8d 76 00             	lea    0x0(%esi),%esi
80102870:	83 ec 08             	sub    $0x8,%esp
80102873:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102878:	01 f8                	add    %edi,%eax
8010287a:	40                   	inc    %eax
8010287b:	50                   	push   %eax
8010287c:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102882:	e8 2d d8 ff ff       	call   801000b4 <bread>
80102887:	89 c6                	mov    %eax,%esi
80102889:	58                   	pop    %eax
8010288a:	5a                   	pop    %edx
8010288b:	ff 34 bd ec 16 11 80 	pushl  -0x7feee914(,%edi,4)
80102892:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102898:	e8 17 d8 ff ff       	call   801000b4 <bread>
8010289d:	89 c3                	mov    %eax,%ebx
8010289f:	83 c4 0c             	add    $0xc,%esp
801028a2:	68 00 02 00 00       	push   $0x200
801028a7:	8d 46 5c             	lea    0x5c(%esi),%eax
801028aa:	50                   	push   %eax
801028ab:	8d 43 5c             	lea    0x5c(%ebx),%eax
801028ae:	50                   	push   %eax
801028af:	e8 20 19 00 00       	call   801041d4 <memmove>
801028b4:	89 1c 24             	mov    %ebx,(%esp)
801028b7:	e8 c8 d8 ff ff       	call   80100184 <bwrite>
801028bc:	89 34 24             	mov    %esi,(%esp)
801028bf:	e8 f8 d8 ff ff       	call   801001bc <brelse>
801028c4:	89 1c 24             	mov    %ebx,(%esp)
801028c7:	e8 f0 d8 ff ff       	call   801001bc <brelse>
801028cc:	47                   	inc    %edi
801028cd:	83 c4 10             	add    $0x10,%esp
801028d0:	39 3d e8 16 11 80    	cmp    %edi,0x801116e8
801028d6:	7f 98                	jg     80102870 <install_trans+0x18>
801028d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801028db:	5b                   	pop    %ebx
801028dc:	5e                   	pop    %esi
801028dd:	5f                   	pop    %edi
801028de:	5d                   	pop    %ebp
801028df:	c3                   	ret    
801028e0:	c3                   	ret    
801028e1:	8d 76 00             	lea    0x0(%esi),%esi

801028e4 <write_head>:
801028e4:	55                   	push   %ebp
801028e5:	89 e5                	mov    %esp,%ebp
801028e7:	53                   	push   %ebx
801028e8:	83 ec 0c             	sub    $0xc,%esp
801028eb:	ff 35 d4 16 11 80    	pushl  0x801116d4
801028f1:	ff 35 e4 16 11 80    	pushl  0x801116e4
801028f7:	e8 b8 d7 ff ff       	call   801000b4 <bread>
801028fc:	89 c3                	mov    %eax,%ebx
801028fe:	a1 e8 16 11 80       	mov    0x801116e8,%eax
80102903:	89 43 5c             	mov    %eax,0x5c(%ebx)
80102906:	83 c4 10             	add    $0x10,%esp
80102909:	85 c0                	test   %eax,%eax
8010290b:	7e 13                	jle    80102920 <write_head+0x3c>
8010290d:	31 d2                	xor    %edx,%edx
8010290f:	90                   	nop
80102910:	8b 0c 95 ec 16 11 80 	mov    -0x7feee914(,%edx,4),%ecx
80102917:	89 4c 93 60          	mov    %ecx,0x60(%ebx,%edx,4)
8010291b:	42                   	inc    %edx
8010291c:	39 d0                	cmp    %edx,%eax
8010291e:	75 f0                	jne    80102910 <write_head+0x2c>
80102920:	83 ec 0c             	sub    $0xc,%esp
80102923:	53                   	push   %ebx
80102924:	e8 5b d8 ff ff       	call   80100184 <bwrite>
80102929:	89 1c 24             	mov    %ebx,(%esp)
8010292c:	e8 8b d8 ff ff       	call   801001bc <brelse>
80102931:	83 c4 10             	add    $0x10,%esp
80102934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102937:	c9                   	leave  
80102938:	c3                   	ret    
80102939:	8d 76 00             	lea    0x0(%esi),%esi

8010293c <initlog>:
8010293c:	55                   	push   %ebp
8010293d:	89 e5                	mov    %esp,%ebp
8010293f:	53                   	push   %ebx
80102940:	83 ec 2c             	sub    $0x2c,%esp
80102943:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102946:	68 60 6d 10 80       	push   $0x80106d60
8010294b:	68 a0 16 11 80       	push   $0x801116a0
80102950:	e8 83 15 00 00       	call   80103ed8 <initlock>
80102955:	58                   	pop    %eax
80102956:	5a                   	pop    %edx
80102957:	8d 45 dc             	lea    -0x24(%ebp),%eax
8010295a:	50                   	push   %eax
8010295b:	53                   	push   %ebx
8010295c:	e8 7b ea ff ff       	call   801013dc <readsb>
80102961:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102964:	a3 d4 16 11 80       	mov    %eax,0x801116d4
80102969:	8b 55 e8             	mov    -0x18(%ebp),%edx
8010296c:	89 15 d8 16 11 80    	mov    %edx,0x801116d8
80102972:	89 1d e4 16 11 80    	mov    %ebx,0x801116e4
80102978:	59                   	pop    %ecx
80102979:	5a                   	pop    %edx
8010297a:	50                   	push   %eax
8010297b:	53                   	push   %ebx
8010297c:	e8 33 d7 ff ff       	call   801000b4 <bread>
80102981:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102984:	89 1d e8 16 11 80    	mov    %ebx,0x801116e8
8010298a:	83 c4 10             	add    $0x10,%esp
8010298d:	85 db                	test   %ebx,%ebx
8010298f:	7e 13                	jle    801029a4 <initlog+0x68>
80102991:	31 d2                	xor    %edx,%edx
80102993:	90                   	nop
80102994:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
80102998:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
8010299f:	42                   	inc    %edx
801029a0:	39 d3                	cmp    %edx,%ebx
801029a2:	75 f0                	jne    80102994 <initlog+0x58>
801029a4:	83 ec 0c             	sub    $0xc,%esp
801029a7:	50                   	push   %eax
801029a8:	e8 0f d8 ff ff       	call   801001bc <brelse>
801029ad:	e8 a6 fe ff ff       	call   80102858 <install_trans>
801029b2:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
801029b9:	00 00 00 
801029bc:	e8 23 ff ff ff       	call   801028e4 <write_head>
801029c1:	83 c4 10             	add    $0x10,%esp
801029c4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801029c7:	c9                   	leave  
801029c8:	c3                   	ret    
801029c9:	8d 76 00             	lea    0x0(%esi),%esi

801029cc <begin_op>:
801029cc:	55                   	push   %ebp
801029cd:	89 e5                	mov    %esp,%ebp
801029cf:	83 ec 14             	sub    $0x14,%esp
801029d2:	68 a0 16 11 80       	push   $0x801116a0
801029d7:	e8 bc 16 00 00       	call   80104098 <acquire>
801029dc:	83 c4 10             	add    $0x10,%esp
801029df:	eb 18                	jmp    801029f9 <begin_op+0x2d>
801029e1:	8d 76 00             	lea    0x0(%esi),%esi
801029e4:	83 ec 08             	sub    $0x8,%esp
801029e7:	68 a0 16 11 80       	push   $0x801116a0
801029ec:	68 a0 16 11 80       	push   $0x801116a0
801029f1:	e8 5e 11 00 00       	call   80103b54 <sleep>
801029f6:	83 c4 10             	add    $0x10,%esp
801029f9:	a1 e0 16 11 80       	mov    0x801116e0,%eax
801029fe:	85 c0                	test   %eax,%eax
80102a00:	75 e2                	jne    801029e4 <begin_op+0x18>
80102a02:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102a07:	8d 50 01             	lea    0x1(%eax),%edx
80102a0a:	8d 44 80 05          	lea    0x5(%eax,%eax,4),%eax
80102a0e:	01 c0                	add    %eax,%eax
80102a10:	03 05 e8 16 11 80    	add    0x801116e8,%eax
80102a16:	83 f8 1e             	cmp    $0x1e,%eax
80102a19:	7f c9                	jg     801029e4 <begin_op+0x18>
80102a1b:	89 15 dc 16 11 80    	mov    %edx,0x801116dc
80102a21:	83 ec 0c             	sub    $0xc,%esp
80102a24:	68 a0 16 11 80       	push   $0x801116a0
80102a29:	e8 0a 16 00 00       	call   80104038 <release>
80102a2e:	83 c4 10             	add    $0x10,%esp
80102a31:	c9                   	leave  
80102a32:	c3                   	ret    
80102a33:	90                   	nop

80102a34 <end_op>:
80102a34:	55                   	push   %ebp
80102a35:	89 e5                	mov    %esp,%ebp
80102a37:	57                   	push   %edi
80102a38:	56                   	push   %esi
80102a39:	53                   	push   %ebx
80102a3a:	83 ec 18             	sub    $0x18,%esp
80102a3d:	68 a0 16 11 80       	push   $0x801116a0
80102a42:	e8 51 16 00 00       	call   80104098 <acquire>
80102a47:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102a4c:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102a4f:	89 1d dc 16 11 80    	mov    %ebx,0x801116dc
80102a55:	83 c4 10             	add    $0x10,%esp
80102a58:	8b 35 e0 16 11 80    	mov    0x801116e0,%esi
80102a5e:	85 f6                	test   %esi,%esi
80102a60:	0f 85 12 01 00 00    	jne    80102b78 <end_op+0x144>
80102a66:	85 db                	test   %ebx,%ebx
80102a68:	0f 85 e6 00 00 00    	jne    80102b54 <end_op+0x120>
80102a6e:	c7 05 e0 16 11 80 01 	movl   $0x1,0x801116e0
80102a75:	00 00 00 
80102a78:	83 ec 0c             	sub    $0xc,%esp
80102a7b:	68 a0 16 11 80       	push   $0x801116a0
80102a80:	e8 b3 15 00 00       	call   80104038 <release>
80102a85:	83 c4 10             	add    $0x10,%esp
80102a88:	8b 0d e8 16 11 80    	mov    0x801116e8,%ecx
80102a8e:	85 c9                	test   %ecx,%ecx
80102a90:	7f 3a                	jg     80102acc <end_op+0x98>
80102a92:	83 ec 0c             	sub    $0xc,%esp
80102a95:	68 a0 16 11 80       	push   $0x801116a0
80102a9a:	e8 f9 15 00 00       	call   80104098 <acquire>
80102a9f:	c7 05 e0 16 11 80 00 	movl   $0x0,0x801116e0
80102aa6:	00 00 00 
80102aa9:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102ab0:	e8 5b 11 00 00       	call   80103c10 <wakeup>
80102ab5:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102abc:	e8 77 15 00 00       	call   80104038 <release>
80102ac1:	83 c4 10             	add    $0x10,%esp
80102ac4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ac7:	5b                   	pop    %ebx
80102ac8:	5e                   	pop    %esi
80102ac9:	5f                   	pop    %edi
80102aca:	5d                   	pop    %ebp
80102acb:	c3                   	ret    
80102acc:	83 ec 08             	sub    $0x8,%esp
80102acf:	a1 d4 16 11 80       	mov    0x801116d4,%eax
80102ad4:	01 d8                	add    %ebx,%eax
80102ad6:	40                   	inc    %eax
80102ad7:	50                   	push   %eax
80102ad8:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102ade:	e8 d1 d5 ff ff       	call   801000b4 <bread>
80102ae3:	89 c6                	mov    %eax,%esi
80102ae5:	58                   	pop    %eax
80102ae6:	5a                   	pop    %edx
80102ae7:	ff 34 9d ec 16 11 80 	pushl  -0x7feee914(,%ebx,4)
80102aee:	ff 35 e4 16 11 80    	pushl  0x801116e4
80102af4:	e8 bb d5 ff ff       	call   801000b4 <bread>
80102af9:	89 c7                	mov    %eax,%edi
80102afb:	83 c4 0c             	add    $0xc,%esp
80102afe:	68 00 02 00 00       	push   $0x200
80102b03:	8d 40 5c             	lea    0x5c(%eax),%eax
80102b06:	50                   	push   %eax
80102b07:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b0a:	50                   	push   %eax
80102b0b:	e8 c4 16 00 00       	call   801041d4 <memmove>
80102b10:	89 34 24             	mov    %esi,(%esp)
80102b13:	e8 6c d6 ff ff       	call   80100184 <bwrite>
80102b18:	89 3c 24             	mov    %edi,(%esp)
80102b1b:	e8 9c d6 ff ff       	call   801001bc <brelse>
80102b20:	89 34 24             	mov    %esi,(%esp)
80102b23:	e8 94 d6 ff ff       	call   801001bc <brelse>
80102b28:	43                   	inc    %ebx
80102b29:	83 c4 10             	add    $0x10,%esp
80102b2c:	3b 1d e8 16 11 80    	cmp    0x801116e8,%ebx
80102b32:	7c 98                	jl     80102acc <end_op+0x98>
80102b34:	e8 ab fd ff ff       	call   801028e4 <write_head>
80102b39:	e8 1a fd ff ff       	call   80102858 <install_trans>
80102b3e:	c7 05 e8 16 11 80 00 	movl   $0x0,0x801116e8
80102b45:	00 00 00 
80102b48:	e8 97 fd ff ff       	call   801028e4 <write_head>
80102b4d:	e9 40 ff ff ff       	jmp    80102a92 <end_op+0x5e>
80102b52:	66 90                	xchg   %ax,%ax
80102b54:	83 ec 0c             	sub    $0xc,%esp
80102b57:	68 a0 16 11 80       	push   $0x801116a0
80102b5c:	e8 af 10 00 00       	call   80103c10 <wakeup>
80102b61:	c7 04 24 a0 16 11 80 	movl   $0x801116a0,(%esp)
80102b68:	e8 cb 14 00 00       	call   80104038 <release>
80102b6d:	83 c4 10             	add    $0x10,%esp
80102b70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b73:	5b                   	pop    %ebx
80102b74:	5e                   	pop    %esi
80102b75:	5f                   	pop    %edi
80102b76:	5d                   	pop    %ebp
80102b77:	c3                   	ret    
80102b78:	83 ec 0c             	sub    $0xc,%esp
80102b7b:	68 64 6d 10 80       	push   $0x80106d64
80102b80:	e8 b3 d7 ff ff       	call   80100338 <panic>
80102b85:	8d 76 00             	lea    0x0(%esi),%esi

80102b88 <log_write>:
80102b88:	55                   	push   %ebp
80102b89:	89 e5                	mov    %esp,%ebp
80102b8b:	53                   	push   %ebx
80102b8c:	52                   	push   %edx
80102b8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b90:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102b96:	83 fa 1d             	cmp    $0x1d,%edx
80102b99:	7f 71                	jg     80102c0c <log_write+0x84>
80102b9b:	a1 d8 16 11 80       	mov    0x801116d8,%eax
80102ba0:	48                   	dec    %eax
80102ba1:	39 c2                	cmp    %eax,%edx
80102ba3:	7d 67                	jge    80102c0c <log_write+0x84>
80102ba5:	a1 dc 16 11 80       	mov    0x801116dc,%eax
80102baa:	85 c0                	test   %eax,%eax
80102bac:	7e 6b                	jle    80102c19 <log_write+0x91>
80102bae:	83 ec 0c             	sub    $0xc,%esp
80102bb1:	68 a0 16 11 80       	push   $0x801116a0
80102bb6:	e8 dd 14 00 00       	call   80104098 <acquire>
80102bbb:	8b 15 e8 16 11 80    	mov    0x801116e8,%edx
80102bc1:	83 c4 10             	add    $0x10,%esp
80102bc4:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102bc7:	31 c0                	xor    %eax,%eax
80102bc9:	85 d2                	test   %edx,%edx
80102bcb:	7f 08                	jg     80102bd5 <log_write+0x4d>
80102bcd:	eb 0f                	jmp    80102bde <log_write+0x56>
80102bcf:	90                   	nop
80102bd0:	40                   	inc    %eax
80102bd1:	39 c2                	cmp    %eax,%edx
80102bd3:	74 27                	je     80102bfc <log_write+0x74>
80102bd5:	39 0c 85 ec 16 11 80 	cmp    %ecx,-0x7feee914(,%eax,4)
80102bdc:	75 f2                	jne    80102bd0 <log_write+0x48>
80102bde:	89 0c 85 ec 16 11 80 	mov    %ecx,-0x7feee914(,%eax,4)
80102be5:	39 c2                	cmp    %eax,%edx
80102be7:	74 1a                	je     80102c03 <log_write+0x7b>
80102be9:	83 0b 04             	orl    $0x4,(%ebx)
80102bec:	c7 45 08 a0 16 11 80 	movl   $0x801116a0,0x8(%ebp)
80102bf3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bf6:	c9                   	leave  
80102bf7:	e9 3c 14 00 00       	jmp    80104038 <release>
80102bfc:	89 0c 95 ec 16 11 80 	mov    %ecx,-0x7feee914(,%edx,4)
80102c03:	42                   	inc    %edx
80102c04:	89 15 e8 16 11 80    	mov    %edx,0x801116e8
80102c0a:	eb dd                	jmp    80102be9 <log_write+0x61>
80102c0c:	83 ec 0c             	sub    $0xc,%esp
80102c0f:	68 73 6d 10 80       	push   $0x80106d73
80102c14:	e8 1f d7 ff ff       	call   80100338 <panic>
80102c19:	83 ec 0c             	sub    $0xc,%esp
80102c1c:	68 89 6d 10 80       	push   $0x80106d89
80102c21:	e8 12 d7 ff ff       	call   80100338 <panic>
80102c26:	66 90                	xchg   %ax,%ax

80102c28 <mpmain>:
80102c28:	55                   	push   %ebp
80102c29:	89 e5                	mov    %esp,%ebp
80102c2b:	53                   	push   %ebx
80102c2c:	50                   	push   %eax
80102c2d:	e8 ae 08 00 00       	call   801034e0 <cpuid>
80102c32:	89 c3                	mov    %eax,%ebx
80102c34:	e8 a7 08 00 00       	call   801034e0 <cpuid>
80102c39:	52                   	push   %edx
80102c3a:	53                   	push   %ebx
80102c3b:	50                   	push   %eax
80102c3c:	68 a4 6d 10 80       	push   $0x80106da4
80102c41:	e8 e2 d9 ff ff       	call   80100628 <cprintf>
80102c46:	e8 4d 25 00 00       	call   80105198 <idtinit>
80102c4b:	e8 2c 08 00 00       	call   8010347c <mycpu>
80102c50:	89 c2                	mov    %eax,%edx
80102c52:	b8 01 00 00 00       	mov    $0x1,%eax
80102c57:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102c5e:	e8 35 0b 00 00       	call   80103798 <scheduler>
80102c63:	90                   	nop

80102c64 <mpenter>:
80102c64:	55                   	push   %ebp
80102c65:	89 e5                	mov    %esp,%ebp
80102c67:	83 ec 08             	sub    $0x8,%esp
80102c6a:	e8 81 35 00 00       	call   801061f0 <switchkvm>
80102c6f:	e8 f8 34 00 00       	call   8010616c <seginit>
80102c74:	e8 8f f8 ff ff       	call   80102508 <lapicinit>
80102c79:	e8 aa ff ff ff       	call   80102c28 <mpmain>
80102c7e:	66 90                	xchg   %ax,%ax

80102c80 <main>:
80102c80:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102c84:	83 e4 f0             	and    $0xfffffff0,%esp
80102c87:	ff 71 fc             	pushl  -0x4(%ecx)
80102c8a:	55                   	push   %ebp
80102c8b:	89 e5                	mov    %esp,%ebp
80102c8d:	53                   	push   %ebx
80102c8e:	51                   	push   %ecx
80102c8f:	83 ec 08             	sub    $0x8,%esp
80102c92:	68 00 00 40 80       	push   $0x80400000
80102c97:	68 d0 55 11 80       	push   $0x801155d0
80102c9c:	e8 c3 f6 ff ff       	call   80102364 <kinit1>
80102ca1:	e8 8e 39 00 00       	call   80106634 <kvmalloc>
80102ca6:	e8 61 01 00 00       	call   80102e0c <mpinit>
80102cab:	e8 58 f8 ff ff       	call   80102508 <lapicinit>
80102cb0:	e8 b7 34 00 00       	call   8010616c <seginit>
80102cb5:	e8 1a 03 00 00       	call   80102fd4 <picinit>
80102cba:	e8 a9 f4 ff ff       	call   80102168 <ioapicinit>
80102cbf:	e8 18 dd ff ff       	call   801009dc <consoleinit>
80102cc4:	e8 73 27 00 00       	call   8010543c <uartinit>
80102cc9:	e8 92 07 00 00       	call   80103460 <pinit>
80102cce:	e8 59 24 00 00       	call   8010512c <tvinit>
80102cd3:	e8 5c d3 ff ff       	call   80100034 <binit>
80102cd8:	e8 9f e0 ff ff       	call   80100d7c <fileinit>
80102cdd:	e8 a2 f2 ff ff       	call   80101f84 <ideinit>
80102ce2:	83 c4 0c             	add    $0xc,%esp
80102ce5:	68 8a 00 00 00       	push   $0x8a
80102cea:	68 8c a4 10 80       	push   $0x8010a48c
80102cef:	68 00 70 00 80       	push   $0x80007000
80102cf4:	e8 db 14 00 00       	call   801041d4 <memmove>
80102cf9:	8b 15 84 17 11 80    	mov    0x80111784,%edx
80102cff:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d02:	01 c0                	add    %eax,%eax
80102d04:	01 d0                	add    %edx,%eax
80102d06:	c1 e0 04             	shl    $0x4,%eax
80102d09:	05 a0 17 11 80       	add    $0x801117a0,%eax
80102d0e:	83 c4 10             	add    $0x10,%esp
80102d11:	3d a0 17 11 80       	cmp    $0x801117a0,%eax
80102d16:	76 74                	jbe    80102d8c <main+0x10c>
80102d18:	bb a0 17 11 80       	mov    $0x801117a0,%ebx
80102d1d:	eb 20                	jmp    80102d3f <main+0xbf>
80102d1f:	90                   	nop
80102d20:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102d26:	8b 15 84 17 11 80    	mov    0x80111784,%edx
80102d2c:	8d 04 92             	lea    (%edx,%edx,4),%eax
80102d2f:	01 c0                	add    %eax,%eax
80102d31:	01 d0                	add    %edx,%eax
80102d33:	c1 e0 04             	shl    $0x4,%eax
80102d36:	05 a0 17 11 80       	add    $0x801117a0,%eax
80102d3b:	39 c3                	cmp    %eax,%ebx
80102d3d:	73 4d                	jae    80102d8c <main+0x10c>
80102d3f:	e8 38 07 00 00       	call   8010347c <mycpu>
80102d44:	39 c3                	cmp    %eax,%ebx
80102d46:	74 d8                	je     80102d20 <main+0xa0>
80102d48:	e8 7b f6 ff ff       	call   801023c8 <kalloc>
80102d4d:	05 00 10 00 00       	add    $0x1000,%eax
80102d52:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102d57:	c7 05 f8 6f 00 80 64 	movl   $0x80102c64,0x80006ff8
80102d5e:	2c 10 80 
80102d61:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102d68:	90 10 00 
80102d6b:	83 ec 08             	sub    $0x8,%esp
80102d6e:	68 00 70 00 00       	push   $0x7000
80102d73:	0f b6 03             	movzbl (%ebx),%eax
80102d76:	50                   	push   %eax
80102d77:	e8 a0 f8 ff ff       	call   8010261c <lapicstartap>
80102d7c:	83 c4 10             	add    $0x10,%esp
80102d7f:	90                   	nop
80102d80:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102d86:	85 c0                	test   %eax,%eax
80102d88:	74 f6                	je     80102d80 <main+0x100>
80102d8a:	eb 94                	jmp    80102d20 <main+0xa0>
80102d8c:	83 ec 08             	sub    $0x8,%esp
80102d8f:	68 00 00 00 8e       	push   $0x8e000000
80102d94:	68 00 00 40 80       	push   $0x80400000
80102d99:	e8 72 f5 ff ff       	call   80102310 <kinit2>
80102d9e:	e8 95 07 00 00       	call   80103538 <userinit>
80102da3:	e8 80 fe ff ff       	call   80102c28 <mpmain>

80102da8 <mpsearch1>:
80102da8:	55                   	push   %ebp
80102da9:	89 e5                	mov    %esp,%ebp
80102dab:	57                   	push   %edi
80102dac:	56                   	push   %esi
80102dad:	53                   	push   %ebx
80102dae:	83 ec 0c             	sub    $0xc,%esp
80102db1:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102db7:	8d 9c 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%ebx
80102dbe:	39 de                	cmp    %ebx,%esi
80102dc0:	72 0b                	jb     80102dcd <mpsearch1+0x25>
80102dc2:	eb 3c                	jmp    80102e00 <mpsearch1+0x58>
80102dc4:	8d 7e 10             	lea    0x10(%esi),%edi
80102dc7:	89 fe                	mov    %edi,%esi
80102dc9:	39 df                	cmp    %ebx,%edi
80102dcb:	73 33                	jae    80102e00 <mpsearch1+0x58>
80102dcd:	50                   	push   %eax
80102dce:	6a 04                	push   $0x4
80102dd0:	68 b8 6d 10 80       	push   $0x80106db8
80102dd5:	56                   	push   %esi
80102dd6:	e8 c1 13 00 00       	call   8010419c <memcmp>
80102ddb:	83 c4 10             	add    $0x10,%esp
80102dde:	85 c0                	test   %eax,%eax
80102de0:	75 e2                	jne    80102dc4 <mpsearch1+0x1c>
80102de2:	89 f2                	mov    %esi,%edx
80102de4:	8d 7e 10             	lea    0x10(%esi),%edi
80102de7:	90                   	nop
80102de8:	0f b6 0a             	movzbl (%edx),%ecx
80102deb:	01 c8                	add    %ecx,%eax
80102ded:	42                   	inc    %edx
80102dee:	39 fa                	cmp    %edi,%edx
80102df0:	75 f6                	jne    80102de8 <mpsearch1+0x40>
80102df2:	84 c0                	test   %al,%al
80102df4:	75 d1                	jne    80102dc7 <mpsearch1+0x1f>
80102df6:	89 f0                	mov    %esi,%eax
80102df8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dfb:	5b                   	pop    %ebx
80102dfc:	5e                   	pop    %esi
80102dfd:	5f                   	pop    %edi
80102dfe:	5d                   	pop    %ebp
80102dff:	c3                   	ret    
80102e00:	31 f6                	xor    %esi,%esi
80102e02:	89 f0                	mov    %esi,%eax
80102e04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e07:	5b                   	pop    %ebx
80102e08:	5e                   	pop    %esi
80102e09:	5f                   	pop    %edi
80102e0a:	5d                   	pop    %ebp
80102e0b:	c3                   	ret    

80102e0c <mpinit>:
80102e0c:	55                   	push   %ebp
80102e0d:	89 e5                	mov    %esp,%ebp
80102e0f:	57                   	push   %edi
80102e10:	56                   	push   %esi
80102e11:	53                   	push   %ebx
80102e12:	83 ec 1c             	sub    $0x1c,%esp
80102e15:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102e1c:	c1 e0 08             	shl    $0x8,%eax
80102e1f:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102e26:	09 d0                	or     %edx,%eax
80102e28:	c1 e0 04             	shl    $0x4,%eax
80102e2b:	75 1b                	jne    80102e48 <mpinit+0x3c>
80102e2d:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102e34:	c1 e0 08             	shl    $0x8,%eax
80102e37:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102e3e:	09 d0                	or     %edx,%eax
80102e40:	c1 e0 0a             	shl    $0xa,%eax
80102e43:	2d 00 04 00 00       	sub    $0x400,%eax
80102e48:	ba 00 04 00 00       	mov    $0x400,%edx
80102e4d:	e8 56 ff ff ff       	call   80102da8 <mpsearch1>
80102e52:	89 c3                	mov    %eax,%ebx
80102e54:	85 c0                	test   %eax,%eax
80102e56:	0f 84 28 01 00 00    	je     80102f84 <mpinit+0x178>
80102e5c:	8b 73 04             	mov    0x4(%ebx),%esi
80102e5f:	85 f6                	test   %esi,%esi
80102e61:	0f 84 0d 01 00 00    	je     80102f74 <mpinit+0x168>
80102e67:	8d be 00 00 00 80    	lea    -0x80000000(%esi),%edi
80102e6d:	50                   	push   %eax
80102e6e:	6a 04                	push   $0x4
80102e70:	68 bd 6d 10 80       	push   $0x80106dbd
80102e75:	57                   	push   %edi
80102e76:	e8 21 13 00 00       	call   8010419c <memcmp>
80102e7b:	83 c4 10             	add    $0x10,%esp
80102e7e:	85 c0                	test   %eax,%eax
80102e80:	0f 85 ee 00 00 00    	jne    80102f74 <mpinit+0x168>
80102e86:	8a 86 06 00 00 80    	mov    -0x7ffffffa(%esi),%al
80102e8c:	3c 01                	cmp    $0x1,%al
80102e8e:	74 08                	je     80102e98 <mpinit+0x8c>
80102e90:	3c 04                	cmp    $0x4,%al
80102e92:	0f 85 dc 00 00 00    	jne    80102f74 <mpinit+0x168>
80102e98:	0f b7 96 04 00 00 80 	movzwl -0x7ffffffc(%esi),%edx
80102e9f:	66 85 d2             	test   %dx,%dx
80102ea2:	74 1f                	je     80102ec3 <mpinit+0xb7>
80102ea4:	89 f8                	mov    %edi,%eax
80102ea6:	8d 0c 17             	lea    (%edi,%edx,1),%ecx
80102ea9:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102eac:	31 d2                	xor    %edx,%edx
80102eae:	66 90                	xchg   %ax,%ax
80102eb0:	0f b6 08             	movzbl (%eax),%ecx
80102eb3:	01 ca                	add    %ecx,%edx
80102eb5:	40                   	inc    %eax
80102eb6:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
80102eb9:	75 f5                	jne    80102eb0 <mpinit+0xa4>
80102ebb:	84 d2                	test   %dl,%dl
80102ebd:	0f 85 b1 00 00 00    	jne    80102f74 <mpinit+0x168>
80102ec3:	8b 86 24 00 00 80    	mov    -0x7fffffdc(%esi),%eax
80102ec9:	a3 80 16 11 80       	mov    %eax,0x80111680
80102ece:	8d 96 2c 00 00 80    	lea    -0x7fffffd4(%esi),%edx
80102ed4:	0f b7 8e 04 00 00 80 	movzwl -0x7ffffffc(%esi),%ecx
80102edb:	01 f9                	add    %edi,%ecx
80102edd:	be 01 00 00 00       	mov    $0x1,%esi
80102ee2:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80102ee5:	8d 76 00             	lea    0x0(%esi),%esi
80102ee8:	39 ca                	cmp    %ecx,%edx
80102eea:	73 13                	jae    80102eff <mpinit+0xf3>
80102eec:	8a 02                	mov    (%edx),%al
80102eee:	3c 02                	cmp    $0x2,%al
80102ef0:	74 46                	je     80102f38 <mpinit+0x12c>
80102ef2:	77 38                	ja     80102f2c <mpinit+0x120>
80102ef4:	84 c0                	test   %al,%al
80102ef6:	74 50                	je     80102f48 <mpinit+0x13c>
80102ef8:	83 c2 08             	add    $0x8,%edx
80102efb:	39 ca                	cmp    %ecx,%edx
80102efd:	72 ed                	jb     80102eec <mpinit+0xe0>
80102eff:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80102f02:	85 f6                	test   %esi,%esi
80102f04:	0f 84 bd 00 00 00    	je     80102fc7 <mpinit+0x1bb>
80102f0a:	80 7b 0c 00          	cmpb   $0x0,0xc(%ebx)
80102f0e:	74 12                	je     80102f22 <mpinit+0x116>
80102f10:	b0 70                	mov    $0x70,%al
80102f12:	ba 22 00 00 00       	mov    $0x22,%edx
80102f17:	ee                   	out    %al,(%dx)
80102f18:	ba 23 00 00 00       	mov    $0x23,%edx
80102f1d:	ec                   	in     (%dx),%al
80102f1e:	83 c8 01             	or     $0x1,%eax
80102f21:	ee                   	out    %al,(%dx)
80102f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102f25:	5b                   	pop    %ebx
80102f26:	5e                   	pop    %esi
80102f27:	5f                   	pop    %edi
80102f28:	5d                   	pop    %ebp
80102f29:	c3                   	ret    
80102f2a:	66 90                	xchg   %ax,%ax
80102f2c:	83 e8 03             	sub    $0x3,%eax
80102f2f:	3c 01                	cmp    $0x1,%al
80102f31:	76 c5                	jbe    80102ef8 <mpinit+0xec>
80102f33:	31 f6                	xor    %esi,%esi
80102f35:	eb b1                	jmp    80102ee8 <mpinit+0xdc>
80102f37:	90                   	nop
80102f38:	8a 42 01             	mov    0x1(%edx),%al
80102f3b:	a2 80 17 11 80       	mov    %al,0x80111780
80102f40:	83 c2 08             	add    $0x8,%edx
80102f43:	eb a3                	jmp    80102ee8 <mpinit+0xdc>
80102f45:	8d 76 00             	lea    0x0(%esi),%esi
80102f48:	a1 84 17 11 80       	mov    0x80111784,%eax
80102f4d:	83 f8 07             	cmp    $0x7,%eax
80102f50:	7f 19                	jg     80102f6b <mpinit+0x15f>
80102f52:	8d 3c 80             	lea    (%eax,%eax,4),%edi
80102f55:	01 ff                	add    %edi,%edi
80102f57:	01 c7                	add    %eax,%edi
80102f59:	c1 e7 04             	shl    $0x4,%edi
80102f5c:	8a 5a 01             	mov    0x1(%edx),%bl
80102f5f:	88 9f a0 17 11 80    	mov    %bl,-0x7feee860(%edi)
80102f65:	40                   	inc    %eax
80102f66:	a3 84 17 11 80       	mov    %eax,0x80111784
80102f6b:	83 c2 14             	add    $0x14,%edx
80102f6e:	e9 75 ff ff ff       	jmp    80102ee8 <mpinit+0xdc>
80102f73:	90                   	nop
80102f74:	83 ec 0c             	sub    $0xc,%esp
80102f77:	68 c2 6d 10 80       	push   $0x80106dc2
80102f7c:	e8 b7 d3 ff ff       	call   80100338 <panic>
80102f81:	8d 76 00             	lea    0x0(%esi),%esi
80102f84:	bb 00 00 0f 80       	mov    $0x800f0000,%ebx
80102f89:	eb 0e                	jmp    80102f99 <mpinit+0x18d>
80102f8b:	90                   	nop
80102f8c:	8d 73 10             	lea    0x10(%ebx),%esi
80102f8f:	89 f3                	mov    %esi,%ebx
80102f91:	81 fe 00 00 10 80    	cmp    $0x80100000,%esi
80102f97:	74 db                	je     80102f74 <mpinit+0x168>
80102f99:	52                   	push   %edx
80102f9a:	6a 04                	push   $0x4
80102f9c:	68 b8 6d 10 80       	push   $0x80106db8
80102fa1:	53                   	push   %ebx
80102fa2:	e8 f5 11 00 00       	call   8010419c <memcmp>
80102fa7:	83 c4 10             	add    $0x10,%esp
80102faa:	85 c0                	test   %eax,%eax
80102fac:	75 de                	jne    80102f8c <mpinit+0x180>
80102fae:	89 da                	mov    %ebx,%edx
80102fb0:	8d 73 10             	lea    0x10(%ebx),%esi
80102fb3:	90                   	nop
80102fb4:	0f b6 0a             	movzbl (%edx),%ecx
80102fb7:	01 c8                	add    %ecx,%eax
80102fb9:	42                   	inc    %edx
80102fba:	39 f2                	cmp    %esi,%edx
80102fbc:	75 f6                	jne    80102fb4 <mpinit+0x1a8>
80102fbe:	84 c0                	test   %al,%al
80102fc0:	75 cd                	jne    80102f8f <mpinit+0x183>
80102fc2:	e9 95 fe ff ff       	jmp    80102e5c <mpinit+0x50>
80102fc7:	83 ec 0c             	sub    $0xc,%esp
80102fca:	68 dc 6d 10 80       	push   $0x80106ddc
80102fcf:	e8 64 d3 ff ff       	call   80100338 <panic>

80102fd4 <picinit>:
80102fd4:	b0 ff                	mov    $0xff,%al
80102fd6:	ba 21 00 00 00       	mov    $0x21,%edx
80102fdb:	ee                   	out    %al,(%dx)
80102fdc:	ba a1 00 00 00       	mov    $0xa1,%edx
80102fe1:	ee                   	out    %al,(%dx)
80102fe2:	c3                   	ret    
80102fe3:	90                   	nop

80102fe4 <pipealloc>:
80102fe4:	55                   	push   %ebp
80102fe5:	89 e5                	mov    %esp,%ebp
80102fe7:	57                   	push   %edi
80102fe8:	56                   	push   %esi
80102fe9:	53                   	push   %ebx
80102fea:	83 ec 0c             	sub    $0xc,%esp
80102fed:	8b 75 08             	mov    0x8(%ebp),%esi
80102ff0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80102ff3:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80102ff9:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102fff:	e8 94 dd ff ff       	call   80100d98 <filealloc>
80103004:	89 06                	mov    %eax,(%esi)
80103006:	85 c0                	test   %eax,%eax
80103008:	0f 84 a5 00 00 00    	je     801030b3 <pipealloc+0xcf>
8010300e:	e8 85 dd ff ff       	call   80100d98 <filealloc>
80103013:	89 07                	mov    %eax,(%edi)
80103015:	85 c0                	test   %eax,%eax
80103017:	0f 84 84 00 00 00    	je     801030a1 <pipealloc+0xbd>
8010301d:	e8 a6 f3 ff ff       	call   801023c8 <kalloc>
80103022:	89 c3                	mov    %eax,%ebx
80103024:	85 c0                	test   %eax,%eax
80103026:	0f 84 a0 00 00 00    	je     801030cc <pipealloc+0xe8>
8010302c:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103033:	00 00 00 
80103036:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010303d:	00 00 00 
80103040:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103047:	00 00 00 
8010304a:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103051:	00 00 00 
80103054:	83 ec 08             	sub    $0x8,%esp
80103057:	68 fb 6d 10 80       	push   $0x80106dfb
8010305c:	50                   	push   %eax
8010305d:	e8 76 0e 00 00       	call   80103ed8 <initlock>
80103062:	8b 06                	mov    (%esi),%eax
80103064:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010306a:	8b 06                	mov    (%esi),%eax
8010306c:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103070:	8b 06                	mov    (%esi),%eax
80103072:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103076:	8b 06                	mov    (%esi),%eax
80103078:	89 58 0c             	mov    %ebx,0xc(%eax)
8010307b:	8b 07                	mov    (%edi),%eax
8010307d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103083:	8b 07                	mov    (%edi),%eax
80103085:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103089:	8b 07                	mov    (%edi),%eax
8010308b:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010308f:	8b 07                	mov    (%edi),%eax
80103091:	89 58 0c             	mov    %ebx,0xc(%eax)
80103094:	83 c4 10             	add    $0x10,%esp
80103097:	31 c0                	xor    %eax,%eax
80103099:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010309c:	5b                   	pop    %ebx
8010309d:	5e                   	pop    %esi
8010309e:	5f                   	pop    %edi
8010309f:	5d                   	pop    %ebp
801030a0:	c3                   	ret    
801030a1:	8b 06                	mov    (%esi),%eax
801030a3:	85 c0                	test   %eax,%eax
801030a5:	74 1e                	je     801030c5 <pipealloc+0xe1>
801030a7:	83 ec 0c             	sub    $0xc,%esp
801030aa:	50                   	push   %eax
801030ab:	e8 94 dd ff ff       	call   80100e44 <fileclose>
801030b0:	83 c4 10             	add    $0x10,%esp
801030b3:	8b 07                	mov    (%edi),%eax
801030b5:	85 c0                	test   %eax,%eax
801030b7:	74 0c                	je     801030c5 <pipealloc+0xe1>
801030b9:	83 ec 0c             	sub    $0xc,%esp
801030bc:	50                   	push   %eax
801030bd:	e8 82 dd ff ff       	call   80100e44 <fileclose>
801030c2:	83 c4 10             	add    $0x10,%esp
801030c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801030ca:	eb cd                	jmp    80103099 <pipealloc+0xb5>
801030cc:	8b 06                	mov    (%esi),%eax
801030ce:	85 c0                	test   %eax,%eax
801030d0:	75 d5                	jne    801030a7 <pipealloc+0xc3>
801030d2:	eb df                	jmp    801030b3 <pipealloc+0xcf>

801030d4 <pipeclose>:
801030d4:	55                   	push   %ebp
801030d5:	89 e5                	mov    %esp,%ebp
801030d7:	56                   	push   %esi
801030d8:	53                   	push   %ebx
801030d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801030dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801030df:	83 ec 0c             	sub    $0xc,%esp
801030e2:	53                   	push   %ebx
801030e3:	e8 b0 0f 00 00       	call   80104098 <acquire>
801030e8:	83 c4 10             	add    $0x10,%esp
801030eb:	85 f6                	test   %esi,%esi
801030ed:	74 5d                	je     8010314c <pipeclose+0x78>
801030ef:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801030f6:	00 00 00 
801030f9:	83 ec 0c             	sub    $0xc,%esp
801030fc:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103102:	50                   	push   %eax
80103103:	e8 08 0b 00 00       	call   80103c10 <wakeup>
80103108:	83 c4 10             	add    $0x10,%esp
8010310b:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
80103111:	85 d2                	test   %edx,%edx
80103113:	75 0a                	jne    8010311f <pipeclose+0x4b>
80103115:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
8010311b:	85 c0                	test   %eax,%eax
8010311d:	74 11                	je     80103130 <pipeclose+0x5c>
8010311f:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103122:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103125:	5b                   	pop    %ebx
80103126:	5e                   	pop    %esi
80103127:	5d                   	pop    %ebp
80103128:	e9 0b 0f 00 00       	jmp    80104038 <release>
8010312d:	8d 76 00             	lea    0x0(%esi),%esi
80103130:	83 ec 0c             	sub    $0xc,%esp
80103133:	53                   	push   %ebx
80103134:	e8 ff 0e 00 00       	call   80104038 <release>
80103139:	83 c4 10             	add    $0x10,%esp
8010313c:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010313f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103142:	5b                   	pop    %ebx
80103143:	5e                   	pop    %esi
80103144:	5d                   	pop    %ebp
80103145:	e9 ee f0 ff ff       	jmp    80102238 <kfree>
8010314a:	66 90                	xchg   %ax,%ax
8010314c:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103153:	00 00 00 
80103156:	83 ec 0c             	sub    $0xc,%esp
80103159:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010315f:	50                   	push   %eax
80103160:	e8 ab 0a 00 00       	call   80103c10 <wakeup>
80103165:	83 c4 10             	add    $0x10,%esp
80103168:	eb a1                	jmp    8010310b <pipeclose+0x37>
8010316a:	66 90                	xchg   %ax,%ax

8010316c <pipewrite>:
8010316c:	55                   	push   %ebp
8010316d:	89 e5                	mov    %esp,%ebp
8010316f:	57                   	push   %edi
80103170:	56                   	push   %esi
80103171:	53                   	push   %ebx
80103172:	83 ec 28             	sub    $0x28,%esp
80103175:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103178:	8b 7d 10             	mov    0x10(%ebp),%edi
8010317b:	53                   	push   %ebx
8010317c:	e8 17 0f 00 00       	call   80104098 <acquire>
80103181:	83 c4 10             	add    $0x10,%esp
80103184:	85 ff                	test   %edi,%edi
80103186:	0f 8e c2 00 00 00    	jle    8010324e <pipewrite+0xe2>
8010318c:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103192:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103195:	8d 34 39             	lea    (%ecx,%edi,1),%esi
80103198:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010319b:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801031a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031a4:	89 7d 10             	mov    %edi,0x10(%ebp)
801031a7:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801031ad:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
801031b3:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
801031b9:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
801031bc:	0f 85 aa 00 00 00    	jne    8010326c <pipewrite+0x100>
801031c2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801031c5:	eb 37                	jmp    801031fe <pipewrite+0x92>
801031c7:	90                   	nop
801031c8:	e8 47 03 00 00       	call   80103514 <myproc>
801031cd:	8b 48 24             	mov    0x24(%eax),%ecx
801031d0:	85 c9                	test   %ecx,%ecx
801031d2:	75 34                	jne    80103208 <pipewrite+0x9c>
801031d4:	83 ec 0c             	sub    $0xc,%esp
801031d7:	56                   	push   %esi
801031d8:	e8 33 0a 00 00       	call   80103c10 <wakeup>
801031dd:	58                   	pop    %eax
801031de:	5a                   	pop    %edx
801031df:	53                   	push   %ebx
801031e0:	57                   	push   %edi
801031e1:	e8 6e 09 00 00       	call   80103b54 <sleep>
801031e6:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801031ec:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801031f2:	05 00 02 00 00       	add    $0x200,%eax
801031f7:	83 c4 10             	add    $0x10,%esp
801031fa:	39 c2                	cmp    %eax,%edx
801031fc:	75 26                	jne    80103224 <pipewrite+0xb8>
801031fe:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103204:	85 c0                	test   %eax,%eax
80103206:	75 c0                	jne    801031c8 <pipewrite+0x5c>
80103208:	83 ec 0c             	sub    $0xc,%esp
8010320b:	53                   	push   %ebx
8010320c:	e8 27 0e 00 00       	call   80104038 <release>
80103211:	83 c4 10             	add    $0x10,%esp
80103214:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103219:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010321c:	5b                   	pop    %ebx
8010321d:	5e                   	pop    %esi
8010321e:	5f                   	pop    %edi
8010321f:	5d                   	pop    %ebp
80103220:	c3                   	ret    
80103221:	8d 76 00             	lea    0x0(%esi),%esi
80103224:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103227:	8d 42 01             	lea    0x1(%edx),%eax
8010322a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010322d:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103233:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103239:	8a 01                	mov    (%ecx),%al
8010323b:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
8010323f:	41                   	inc    %ecx
80103240:	8b 45 e0             	mov    -0x20(%ebp),%eax
80103243:	39 c1                	cmp    %eax,%ecx
80103245:	0f 85 5c ff ff ff    	jne    801031a7 <pipewrite+0x3b>
8010324b:	8b 7d 10             	mov    0x10(%ebp),%edi
8010324e:	83 ec 0c             	sub    $0xc,%esp
80103251:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103257:	50                   	push   %eax
80103258:	e8 b3 09 00 00       	call   80103c10 <wakeup>
8010325d:	89 1c 24             	mov    %ebx,(%esp)
80103260:	e8 d3 0d 00 00       	call   80104038 <release>
80103265:	83 c4 10             	add    $0x10,%esp
80103268:	89 f8                	mov    %edi,%eax
8010326a:	eb ad                	jmp    80103219 <pipewrite+0xad>
8010326c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010326f:	eb b6                	jmp    80103227 <pipewrite+0xbb>
80103271:	8d 76 00             	lea    0x0(%esi),%esi

80103274 <piperead>:
80103274:	55                   	push   %ebp
80103275:	89 e5                	mov    %esp,%ebp
80103277:	57                   	push   %edi
80103278:	56                   	push   %esi
80103279:	53                   	push   %ebx
8010327a:	83 ec 18             	sub    $0x18,%esp
8010327d:	8b 75 08             	mov    0x8(%ebp),%esi
80103280:	8b 7d 0c             	mov    0xc(%ebp),%edi
80103283:	56                   	push   %esi
80103284:	e8 0f 0e 00 00       	call   80104098 <acquire>
80103289:	83 c4 10             	add    $0x10,%esp
8010328c:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103292:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
80103298:	39 86 38 02 00 00    	cmp    %eax,0x238(%esi)
8010329e:	74 2f                	je     801032cf <piperead+0x5b>
801032a0:	eb 37                	jmp    801032d9 <piperead+0x65>
801032a2:	66 90                	xchg   %ax,%ax
801032a4:	e8 6b 02 00 00       	call   80103514 <myproc>
801032a9:	8b 48 24             	mov    0x24(%eax),%ecx
801032ac:	85 c9                	test   %ecx,%ecx
801032ae:	0f 85 80 00 00 00    	jne    80103334 <piperead+0xc0>
801032b4:	83 ec 08             	sub    $0x8,%esp
801032b7:	56                   	push   %esi
801032b8:	53                   	push   %ebx
801032b9:	e8 96 08 00 00       	call   80103b54 <sleep>
801032be:	83 c4 10             	add    $0x10,%esp
801032c1:	8b 86 38 02 00 00    	mov    0x238(%esi),%eax
801032c7:	39 86 34 02 00 00    	cmp    %eax,0x234(%esi)
801032cd:	75 0a                	jne    801032d9 <piperead+0x65>
801032cf:	8b 86 40 02 00 00    	mov    0x240(%esi),%eax
801032d5:	85 c0                	test   %eax,%eax
801032d7:	75 cb                	jne    801032a4 <piperead+0x30>
801032d9:	31 db                	xor    %ebx,%ebx
801032db:	8b 55 10             	mov    0x10(%ebp),%edx
801032de:	85 d2                	test   %edx,%edx
801032e0:	7f 1d                	jg     801032ff <piperead+0x8b>
801032e2:	eb 29                	jmp    8010330d <piperead+0x99>
801032e4:	8d 48 01             	lea    0x1(%eax),%ecx
801032e7:	89 8e 34 02 00 00    	mov    %ecx,0x234(%esi)
801032ed:	25 ff 01 00 00       	and    $0x1ff,%eax
801032f2:	8a 44 06 34          	mov    0x34(%esi,%eax,1),%al
801032f6:	88 04 1f             	mov    %al,(%edi,%ebx,1)
801032f9:	43                   	inc    %ebx
801032fa:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801032fd:	74 0e                	je     8010330d <piperead+0x99>
801032ff:	8b 86 34 02 00 00    	mov    0x234(%esi),%eax
80103305:	3b 86 38 02 00 00    	cmp    0x238(%esi),%eax
8010330b:	75 d7                	jne    801032e4 <piperead+0x70>
8010330d:	83 ec 0c             	sub    $0xc,%esp
80103310:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
80103316:	50                   	push   %eax
80103317:	e8 f4 08 00 00       	call   80103c10 <wakeup>
8010331c:	89 34 24             	mov    %esi,(%esp)
8010331f:	e8 14 0d 00 00       	call   80104038 <release>
80103324:	83 c4 10             	add    $0x10,%esp
80103327:	89 d8                	mov    %ebx,%eax
80103329:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010332c:	5b                   	pop    %ebx
8010332d:	5e                   	pop    %esi
8010332e:	5f                   	pop    %edi
8010332f:	5d                   	pop    %ebp
80103330:	c3                   	ret    
80103331:	8d 76 00             	lea    0x0(%esi),%esi
80103334:	83 ec 0c             	sub    $0xc,%esp
80103337:	56                   	push   %esi
80103338:	e8 fb 0c 00 00       	call   80104038 <release>
8010333d:	83 c4 10             	add    $0x10,%esp
80103340:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103345:	89 d8                	mov    %ebx,%eax
80103347:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010334a:	5b                   	pop    %ebx
8010334b:	5e                   	pop    %esi
8010334c:	5f                   	pop    %edi
8010334d:	5d                   	pop    %ebp
8010334e:	c3                   	ret    
8010334f:	90                   	nop

80103350 <allocproc>:
80103350:	55                   	push   %ebp
80103351:	89 e5                	mov    %esp,%ebp
80103353:	53                   	push   %ebx
80103354:	83 ec 10             	sub    $0x10,%esp
80103357:	68 20 1d 11 80       	push   $0x80111d20
8010335c:	e8 37 0d 00 00       	call   80104098 <acquire>
80103361:	83 c4 10             	add    $0x10,%esp
80103364:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103369:	eb 0c                	jmp    80103377 <allocproc+0x27>
8010336b:	90                   	nop
8010336c:	83 eb 80             	sub    $0xffffff80,%ebx
8010336f:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103375:	74 7d                	je     801033f4 <allocproc+0xa4>
80103377:	8b 4b 0c             	mov    0xc(%ebx),%ecx
8010337a:	85 c9                	test   %ecx,%ecx
8010337c:	75 ee                	jne    8010336c <allocproc+0x1c>
8010337e:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
80103385:	a1 04 a0 10 80       	mov    0x8010a004,%eax
8010338a:	8d 50 01             	lea    0x1(%eax),%edx
8010338d:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
80103393:	89 43 10             	mov    %eax,0x10(%ebx)
80103396:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
8010339d:	83 ec 0c             	sub    $0xc,%esp
801033a0:	68 20 1d 11 80       	push   $0x80111d20
801033a5:	e8 8e 0c 00 00       	call   80104038 <release>
801033aa:	e8 19 f0 ff ff       	call   801023c8 <kalloc>
801033af:	89 43 08             	mov    %eax,0x8(%ebx)
801033b2:	83 c4 10             	add    $0x10,%esp
801033b5:	85 c0                	test   %eax,%eax
801033b7:	74 54                	je     8010340d <allocproc+0xbd>
801033b9:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
801033bf:	89 53 18             	mov    %edx,0x18(%ebx)
801033c2:	c7 80 b0 0f 00 00 1e 	movl   $0x8010511e,0xfb0(%eax)
801033c9:	51 10 80 
801033cc:	05 9c 0f 00 00       	add    $0xf9c,%eax
801033d1:	89 43 1c             	mov    %eax,0x1c(%ebx)
801033d4:	52                   	push   %edx
801033d5:	6a 14                	push   $0x14
801033d7:	6a 00                	push   $0x0
801033d9:	50                   	push   %eax
801033da:	e8 79 0d 00 00       	call   80104158 <memset>
801033df:	8b 43 1c             	mov    0x1c(%ebx),%eax
801033e2:	c7 40 10 18 34 10 80 	movl   $0x80103418,0x10(%eax)
801033e9:	83 c4 10             	add    $0x10,%esp
801033ec:	89 d8                	mov    %ebx,%eax
801033ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801033f1:	c9                   	leave  
801033f2:	c3                   	ret    
801033f3:	90                   	nop
801033f4:	83 ec 0c             	sub    $0xc,%esp
801033f7:	68 20 1d 11 80       	push   $0x80111d20
801033fc:	e8 37 0c 00 00       	call   80104038 <release>
80103401:	83 c4 10             	add    $0x10,%esp
80103404:	31 db                	xor    %ebx,%ebx
80103406:	89 d8                	mov    %ebx,%eax
80103408:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010340b:	c9                   	leave  
8010340c:	c3                   	ret    
8010340d:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103414:	31 db                	xor    %ebx,%ebx
80103416:	eb ee                	jmp    80103406 <allocproc+0xb6>

80103418 <forkret>:
80103418:	55                   	push   %ebp
80103419:	89 e5                	mov    %esp,%ebp
8010341b:	83 ec 14             	sub    $0x14,%esp
8010341e:	68 20 1d 11 80       	push   $0x80111d20
80103423:	e8 10 0c 00 00       	call   80104038 <release>
80103428:	83 c4 10             	add    $0x10,%esp
8010342b:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103430:	85 c0                	test   %eax,%eax
80103432:	75 04                	jne    80103438 <forkret+0x20>
80103434:	c9                   	leave  
80103435:	c3                   	ret    
80103436:	66 90                	xchg   %ax,%ax
80103438:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010343f:	00 00 00 
80103442:	83 ec 0c             	sub    $0xc,%esp
80103445:	6a 01                	push   $0x1
80103447:	e8 c8 df ff ff       	call   80101414 <iinit>
8010344c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
80103453:	e8 e4 f4 ff ff       	call   8010293c <initlog>
80103458:	83 c4 10             	add    $0x10,%esp
8010345b:	c9                   	leave  
8010345c:	c3                   	ret    
8010345d:	8d 76 00             	lea    0x0(%esi),%esi

80103460 <pinit>:
80103460:	55                   	push   %ebp
80103461:	89 e5                	mov    %esp,%ebp
80103463:	83 ec 10             	sub    $0x10,%esp
80103466:	68 00 6e 10 80       	push   $0x80106e00
8010346b:	68 20 1d 11 80       	push   $0x80111d20
80103470:	e8 63 0a 00 00       	call   80103ed8 <initlock>
80103475:	83 c4 10             	add    $0x10,%esp
80103478:	c9                   	leave  
80103479:	c3                   	ret    
8010347a:	66 90                	xchg   %ax,%ax

8010347c <mycpu>:
8010347c:	55                   	push   %ebp
8010347d:	89 e5                	mov    %esp,%ebp
8010347f:	56                   	push   %esi
80103480:	53                   	push   %ebx
80103481:	9c                   	pushf  
80103482:	58                   	pop    %eax
80103483:	f6 c4 02             	test   $0x2,%ah
80103486:	75 4b                	jne    801034d3 <mycpu+0x57>
80103488:	e8 5f f1 ff ff       	call   801025ec <lapicid>
8010348d:	89 c1                	mov    %eax,%ecx
8010348f:	8b 1d 84 17 11 80    	mov    0x80111784,%ebx
80103495:	85 db                	test   %ebx,%ebx
80103497:	7e 2d                	jle    801034c6 <mycpu+0x4a>
80103499:	31 d2                	xor    %edx,%edx
8010349b:	eb 08                	jmp    801034a5 <mycpu+0x29>
8010349d:	8d 76 00             	lea    0x0(%esi),%esi
801034a0:	42                   	inc    %edx
801034a1:	39 da                	cmp    %ebx,%edx
801034a3:	74 21                	je     801034c6 <mycpu+0x4a>
801034a5:	8d 04 92             	lea    (%edx,%edx,4),%eax
801034a8:	01 c0                	add    %eax,%eax
801034aa:	01 d0                	add    %edx,%eax
801034ac:	c1 e0 04             	shl    $0x4,%eax
801034af:	0f b6 b0 a0 17 11 80 	movzbl -0x7feee860(%eax),%esi
801034b6:	39 ce                	cmp    %ecx,%esi
801034b8:	75 e6                	jne    801034a0 <mycpu+0x24>
801034ba:	05 a0 17 11 80       	add    $0x801117a0,%eax
801034bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034c2:	5b                   	pop    %ebx
801034c3:	5e                   	pop    %esi
801034c4:	5d                   	pop    %ebp
801034c5:	c3                   	ret    
801034c6:	83 ec 0c             	sub    $0xc,%esp
801034c9:	68 07 6e 10 80       	push   $0x80106e07
801034ce:	e8 65 ce ff ff       	call   80100338 <panic>
801034d3:	83 ec 0c             	sub    $0xc,%esp
801034d6:	68 e4 6e 10 80       	push   $0x80106ee4
801034db:	e8 58 ce ff ff       	call   80100338 <panic>

801034e0 <cpuid>:
801034e0:	55                   	push   %ebp
801034e1:	89 e5                	mov    %esp,%ebp
801034e3:	83 ec 08             	sub    $0x8,%esp
801034e6:	e8 91 ff ff ff       	call   8010347c <mycpu>
801034eb:	2d a0 17 11 80       	sub    $0x801117a0,%eax
801034f0:	c1 f8 04             	sar    $0x4,%eax
801034f3:	8d 0c c0             	lea    (%eax,%eax,8),%ecx
801034f6:	89 ca                	mov    %ecx,%edx
801034f8:	c1 e2 05             	shl    $0x5,%edx
801034fb:	29 ca                	sub    %ecx,%edx
801034fd:	8d 14 90             	lea    (%eax,%edx,4),%edx
80103500:	8d 0c d0             	lea    (%eax,%edx,8),%ecx
80103503:	89 ca                	mov    %ecx,%edx
80103505:	c1 e2 0f             	shl    $0xf,%edx
80103508:	29 ca                	sub    %ecx,%edx
8010350a:	8d 04 90             	lea    (%eax,%edx,4),%eax
8010350d:	f7 d8                	neg    %eax
8010350f:	c9                   	leave  
80103510:	c3                   	ret    
80103511:	8d 76 00             	lea    0x0(%esi),%esi

80103514 <myproc>:
80103514:	55                   	push   %ebp
80103515:	89 e5                	mov    %esp,%ebp
80103517:	53                   	push   %ebx
80103518:	50                   	push   %eax
80103519:	e8 36 0a 00 00       	call   80103f54 <pushcli>
8010351e:	e8 59 ff ff ff       	call   8010347c <mycpu>
80103523:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103529:	e8 72 0a 00 00       	call   80103fa0 <popcli>
8010352e:	89 d8                	mov    %ebx,%eax
80103530:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103533:	c9                   	leave  
80103534:	c3                   	ret    
80103535:	8d 76 00             	lea    0x0(%esi),%esi

80103538 <userinit>:
80103538:	55                   	push   %ebp
80103539:	89 e5                	mov    %esp,%ebp
8010353b:	53                   	push   %ebx
8010353c:	51                   	push   %ecx
8010353d:	e8 0e fe ff ff       	call   80103350 <allocproc>
80103542:	89 c3                	mov    %eax,%ebx
80103544:	a3 54 3d 11 80       	mov    %eax,0x80113d54
80103549:	e8 72 30 00 00       	call   801065c0 <setupkvm>
8010354e:	89 43 04             	mov    %eax,0x4(%ebx)
80103551:	85 c0                	test   %eax,%eax
80103553:	0f 84 b3 00 00 00    	je     8010360c <userinit+0xd4>
80103559:	52                   	push   %edx
8010355a:	68 2c 00 00 00       	push   $0x2c
8010355f:	68 60 a4 10 80       	push   $0x8010a460
80103564:	50                   	push   %eax
80103565:	e8 92 2d 00 00       	call   801062fc <inituvm>
8010356a:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
80103570:	83 c4 0c             	add    $0xc,%esp
80103573:	6a 4c                	push   $0x4c
80103575:	6a 00                	push   $0x0
80103577:	ff 73 18             	pushl  0x18(%ebx)
8010357a:	e8 d9 0b 00 00       	call   80104158 <memset>
8010357f:	8b 43 18             	mov    0x18(%ebx),%eax
80103582:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
80103588:	8b 43 18             	mov    0x18(%ebx),%eax
8010358b:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
80103591:	8b 43 18             	mov    0x18(%ebx),%eax
80103594:	8b 50 2c             	mov    0x2c(%eax),%edx
80103597:	66 89 50 28          	mov    %dx,0x28(%eax)
8010359b:	8b 43 18             	mov    0x18(%ebx),%eax
8010359e:	8b 50 2c             	mov    0x2c(%eax),%edx
801035a1:	66 89 50 48          	mov    %dx,0x48(%eax)
801035a5:	8b 43 18             	mov    0x18(%ebx),%eax
801035a8:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
801035af:	8b 43 18             	mov    0x18(%ebx),%eax
801035b2:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
801035b9:	8b 43 18             	mov    0x18(%ebx),%eax
801035bc:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
801035c3:	83 c4 0c             	add    $0xc,%esp
801035c6:	6a 10                	push   $0x10
801035c8:	68 30 6e 10 80       	push   $0x80106e30
801035cd:	8d 43 6c             	lea    0x6c(%ebx),%eax
801035d0:	50                   	push   %eax
801035d1:	e8 ca 0c 00 00       	call   801042a0 <safestrcpy>
801035d6:	c7 04 24 39 6e 10 80 	movl   $0x80106e39,(%esp)
801035dd:	e8 be e8 ff ff       	call   80101ea0 <namei>
801035e2:	89 43 68             	mov    %eax,0x68(%ebx)
801035e5:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801035ec:	e8 a7 0a 00 00       	call   80104098 <acquire>
801035f1:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
801035f8:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
801035ff:	e8 34 0a 00 00       	call   80104038 <release>
80103604:	83 c4 10             	add    $0x10,%esp
80103607:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010360a:	c9                   	leave  
8010360b:	c3                   	ret    
8010360c:	83 ec 0c             	sub    $0xc,%esp
8010360f:	68 17 6e 10 80       	push   $0x80106e17
80103614:	e8 1f cd ff ff       	call   80100338 <panic>
80103619:	8d 76 00             	lea    0x0(%esi),%esi

8010361c <growproc>:
8010361c:	55                   	push   %ebp
8010361d:	89 e5                	mov    %esp,%ebp
8010361f:	56                   	push   %esi
80103620:	53                   	push   %ebx
80103621:	8b 75 08             	mov    0x8(%ebp),%esi
80103624:	e8 2b 09 00 00       	call   80103f54 <pushcli>
80103629:	e8 4e fe ff ff       	call   8010347c <mycpu>
8010362e:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103634:	e8 67 09 00 00       	call   80103fa0 <popcli>
80103639:	8b 03                	mov    (%ebx),%eax
8010363b:	85 f6                	test   %esi,%esi
8010363d:	7f 19                	jg     80103658 <growproc+0x3c>
8010363f:	75 33                	jne    80103674 <growproc+0x58>
80103641:	89 03                	mov    %eax,(%ebx)
80103643:	83 ec 0c             	sub    $0xc,%esp
80103646:	53                   	push   %ebx
80103647:	e8 b4 2b 00 00       	call   80106200 <switchuvm>
8010364c:	83 c4 10             	add    $0x10,%esp
8010364f:	31 c0                	xor    %eax,%eax
80103651:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103654:	5b                   	pop    %ebx
80103655:	5e                   	pop    %esi
80103656:	5d                   	pop    %ebp
80103657:	c3                   	ret    
80103658:	51                   	push   %ecx
80103659:	01 c6                	add    %eax,%esi
8010365b:	56                   	push   %esi
8010365c:	50                   	push   %eax
8010365d:	ff 73 04             	pushl  0x4(%ebx)
80103660:	e8 cf 2d 00 00       	call   80106434 <allocuvm>
80103665:	83 c4 10             	add    $0x10,%esp
80103668:	85 c0                	test   %eax,%eax
8010366a:	75 d5                	jne    80103641 <growproc+0x25>
8010366c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103671:	eb de                	jmp    80103651 <growproc+0x35>
80103673:	90                   	nop
80103674:	52                   	push   %edx
80103675:	01 c6                	add    %eax,%esi
80103677:	56                   	push   %esi
80103678:	50                   	push   %eax
80103679:	ff 73 04             	pushl  0x4(%ebx)
8010367c:	e8 b3 2e 00 00       	call   80106534 <deallocuvm>
80103681:	83 c4 10             	add    $0x10,%esp
80103684:	85 c0                	test   %eax,%eax
80103686:	75 b9                	jne    80103641 <growproc+0x25>
80103688:	eb e2                	jmp    8010366c <growproc+0x50>
8010368a:	66 90                	xchg   %ax,%ax

8010368c <fork>:
8010368c:	55                   	push   %ebp
8010368d:	89 e5                	mov    %esp,%ebp
8010368f:	57                   	push   %edi
80103690:	56                   	push   %esi
80103691:	53                   	push   %ebx
80103692:	83 ec 1c             	sub    $0x1c,%esp
80103695:	e8 ba 08 00 00       	call   80103f54 <pushcli>
8010369a:	e8 dd fd ff ff       	call   8010347c <mycpu>
8010369f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
801036a5:	e8 f6 08 00 00       	call   80103fa0 <popcli>
801036aa:	e8 a1 fc ff ff       	call   80103350 <allocproc>
801036af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801036b2:	85 c0                	test   %eax,%eax
801036b4:	0f 84 d4 00 00 00    	je     8010378e <fork+0x102>
801036ba:	89 c7                	mov    %eax,%edi
801036bc:	83 ec 08             	sub    $0x8,%esp
801036bf:	ff 33                	pushl  (%ebx)
801036c1:	ff 73 04             	pushl  0x4(%ebx)
801036c4:	e8 cf 2f 00 00       	call   80106698 <copyuvm>
801036c9:	89 47 04             	mov    %eax,0x4(%edi)
801036cc:	83 c4 10             	add    $0x10,%esp
801036cf:	85 c0                	test   %eax,%eax
801036d1:	0f 84 98 00 00 00    	je     8010376f <fork+0xe3>
801036d7:	8b 03                	mov    (%ebx),%eax
801036d9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801036dc:	89 01                	mov    %eax,(%ecx)
801036de:	89 c8                	mov    %ecx,%eax
801036e0:	89 59 14             	mov    %ebx,0x14(%ecx)
801036e3:	8b 73 18             	mov    0x18(%ebx),%esi
801036e6:	8b 79 18             	mov    0x18(%ecx),%edi
801036e9:	b9 13 00 00 00       	mov    $0x13,%ecx
801036ee:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
801036f0:	8b 40 18             	mov    0x18(%eax),%eax
801036f3:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
801036fa:	31 f6                	xor    %esi,%esi
801036fc:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103700:	85 c0                	test   %eax,%eax
80103702:	74 13                	je     80103717 <fork+0x8b>
80103704:	83 ec 0c             	sub    $0xc,%esp
80103707:	50                   	push   %eax
80103708:	e8 f3 d6 ff ff       	call   80100e00 <filedup>
8010370d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103710:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103714:	83 c4 10             	add    $0x10,%esp
80103717:	46                   	inc    %esi
80103718:	83 fe 10             	cmp    $0x10,%esi
8010371b:	75 df                	jne    801036fc <fork+0x70>
8010371d:	83 ec 0c             	sub    $0xc,%esp
80103720:	ff 73 68             	pushl  0x68(%ebx)
80103723:	e8 c0 de ff ff       	call   801015e8 <idup>
80103728:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010372b:	89 47 68             	mov    %eax,0x68(%edi)
8010372e:	83 c4 0c             	add    $0xc,%esp
80103731:	6a 10                	push   $0x10
80103733:	83 c3 6c             	add    $0x6c,%ebx
80103736:	53                   	push   %ebx
80103737:	8d 47 6c             	lea    0x6c(%edi),%eax
8010373a:	50                   	push   %eax
8010373b:	e8 60 0b 00 00       	call   801042a0 <safestrcpy>
80103740:	8b 5f 10             	mov    0x10(%edi),%ebx
80103743:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010374a:	e8 49 09 00 00       	call   80104098 <acquire>
8010374f:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103756:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
8010375d:	e8 d6 08 00 00       	call   80104038 <release>
80103762:	83 c4 10             	add    $0x10,%esp
80103765:	89 d8                	mov    %ebx,%eax
80103767:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010376a:	5b                   	pop    %ebx
8010376b:	5e                   	pop    %esi
8010376c:	5f                   	pop    %edi
8010376d:	5d                   	pop    %ebp
8010376e:	c3                   	ret    
8010376f:	83 ec 0c             	sub    $0xc,%esp
80103772:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103775:	ff 73 08             	pushl  0x8(%ebx)
80103778:	e8 bb ea ff ff       	call   80102238 <kfree>
8010377d:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103784:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010378b:	83 c4 10             	add    $0x10,%esp
8010378e:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103793:	eb d0                	jmp    80103765 <fork+0xd9>
80103795:	8d 76 00             	lea    0x0(%esi),%esi

80103798 <scheduler>:
80103798:	55                   	push   %ebp
80103799:	89 e5                	mov    %esp,%ebp
8010379b:	57                   	push   %edi
8010379c:	56                   	push   %esi
8010379d:	53                   	push   %ebx
8010379e:	83 ec 0c             	sub    $0xc,%esp
801037a1:	e8 d6 fc ff ff       	call   8010347c <mycpu>
801037a6:	89 c6                	mov    %eax,%esi
801037a8:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801037af:	00 00 00 
801037b2:	8d 78 04             	lea    0x4(%eax),%edi
801037b5:	8d 76 00             	lea    0x0(%esi),%esi
801037b8:	fb                   	sti    
801037b9:	83 ec 0c             	sub    $0xc,%esp
801037bc:	68 20 1d 11 80       	push   $0x80111d20
801037c1:	e8 d2 08 00 00       	call   80104098 <acquire>
801037c6:	83 c4 10             	add    $0x10,%esp
801037c9:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
801037ce:	66 90                	xchg   %ax,%ax
801037d0:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
801037d4:	75 33                	jne    80103809 <scheduler+0x71>
801037d6:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
801037dc:	83 ec 0c             	sub    $0xc,%esp
801037df:	53                   	push   %ebx
801037e0:	e8 1b 2a 00 00       	call   80106200 <switchuvm>
801037e5:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
801037ec:	58                   	pop    %eax
801037ed:	5a                   	pop    %edx
801037ee:	ff 73 1c             	pushl  0x1c(%ebx)
801037f1:	57                   	push   %edi
801037f2:	e8 f6 0a 00 00       	call   801042ed <swtch>
801037f7:	e8 f4 29 00 00       	call   801061f0 <switchkvm>
801037fc:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103803:	00 00 00 
80103806:	83 c4 10             	add    $0x10,%esp
80103809:	83 eb 80             	sub    $0xffffff80,%ebx
8010380c:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103812:	75 bc                	jne    801037d0 <scheduler+0x38>
80103814:	83 ec 0c             	sub    $0xc,%esp
80103817:	68 20 1d 11 80       	push   $0x80111d20
8010381c:	e8 17 08 00 00       	call   80104038 <release>
80103821:	83 c4 10             	add    $0x10,%esp
80103824:	eb 92                	jmp    801037b8 <scheduler+0x20>
80103826:	66 90                	xchg   %ax,%ax

80103828 <sched>:
80103828:	55                   	push   %ebp
80103829:	89 e5                	mov    %esp,%ebp
8010382b:	56                   	push   %esi
8010382c:	53                   	push   %ebx
8010382d:	e8 22 07 00 00       	call   80103f54 <pushcli>
80103832:	e8 45 fc ff ff       	call   8010347c <mycpu>
80103837:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
8010383d:	e8 5e 07 00 00       	call   80103fa0 <popcli>
80103842:	83 ec 0c             	sub    $0xc,%esp
80103845:	68 20 1d 11 80       	push   $0x80111d20
8010384a:	e8 a9 07 00 00       	call   80103ff8 <holding>
8010384f:	83 c4 10             	add    $0x10,%esp
80103852:	85 c0                	test   %eax,%eax
80103854:	74 4f                	je     801038a5 <sched+0x7d>
80103856:	e8 21 fc ff ff       	call   8010347c <mycpu>
8010385b:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103862:	75 68                	jne    801038cc <sched+0xa4>
80103864:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103868:	74 55                	je     801038bf <sched+0x97>
8010386a:	9c                   	pushf  
8010386b:	58                   	pop    %eax
8010386c:	f6 c4 02             	test   $0x2,%ah
8010386f:	75 41                	jne    801038b2 <sched+0x8a>
80103871:	e8 06 fc ff ff       	call   8010347c <mycpu>
80103876:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
8010387c:	e8 fb fb ff ff       	call   8010347c <mycpu>
80103881:	83 ec 08             	sub    $0x8,%esp
80103884:	ff 70 04             	pushl  0x4(%eax)
80103887:	83 c3 1c             	add    $0x1c,%ebx
8010388a:	53                   	push   %ebx
8010388b:	e8 5d 0a 00 00       	call   801042ed <swtch>
80103890:	e8 e7 fb ff ff       	call   8010347c <mycpu>
80103895:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
8010389b:	83 c4 10             	add    $0x10,%esp
8010389e:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038a1:	5b                   	pop    %ebx
801038a2:	5e                   	pop    %esi
801038a3:	5d                   	pop    %ebp
801038a4:	c3                   	ret    
801038a5:	83 ec 0c             	sub    $0xc,%esp
801038a8:	68 3b 6e 10 80       	push   $0x80106e3b
801038ad:	e8 86 ca ff ff       	call   80100338 <panic>
801038b2:	83 ec 0c             	sub    $0xc,%esp
801038b5:	68 67 6e 10 80       	push   $0x80106e67
801038ba:	e8 79 ca ff ff       	call   80100338 <panic>
801038bf:	83 ec 0c             	sub    $0xc,%esp
801038c2:	68 59 6e 10 80       	push   $0x80106e59
801038c7:	e8 6c ca ff ff       	call   80100338 <panic>
801038cc:	83 ec 0c             	sub    $0xc,%esp
801038cf:	68 4d 6e 10 80       	push   $0x80106e4d
801038d4:	e8 5f ca ff ff       	call   80100338 <panic>
801038d9:	8d 76 00             	lea    0x0(%esi),%esi

801038dc <exit>:
801038dc:	55                   	push   %ebp
801038dd:	89 e5                	mov    %esp,%ebp
801038df:	57                   	push   %edi
801038e0:	56                   	push   %esi
801038e1:	53                   	push   %ebx
801038e2:	83 ec 0c             	sub    $0xc,%esp
801038e5:	e8 2a fc ff ff       	call   80103514 <myproc>
801038ea:	39 05 54 3d 11 80    	cmp    %eax,0x80113d54
801038f0:	0f 84 e9 00 00 00    	je     801039df <exit+0x103>
801038f6:	89 c3                	mov    %eax,%ebx
801038f8:	8d 70 28             	lea    0x28(%eax),%esi
801038fb:	8d 78 68             	lea    0x68(%eax),%edi
801038fe:	66 90                	xchg   %ax,%ax
80103900:	8b 06                	mov    (%esi),%eax
80103902:	85 c0                	test   %eax,%eax
80103904:	74 12                	je     80103918 <exit+0x3c>
80103906:	83 ec 0c             	sub    $0xc,%esp
80103909:	50                   	push   %eax
8010390a:	e8 35 d5 ff ff       	call   80100e44 <fileclose>
8010390f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103915:	83 c4 10             	add    $0x10,%esp
80103918:	83 c6 04             	add    $0x4,%esi
8010391b:	39 f7                	cmp    %esi,%edi
8010391d:	75 e1                	jne    80103900 <exit+0x24>
8010391f:	e8 a8 f0 ff ff       	call   801029cc <begin_op>
80103924:	83 ec 0c             	sub    $0xc,%esp
80103927:	ff 73 68             	pushl  0x68(%ebx)
8010392a:	e8 f1 dd ff ff       	call   80101720 <iput>
8010392f:	e8 00 f1 ff ff       	call   80102a34 <end_op>
80103934:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)
8010393b:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103942:	e8 51 07 00 00       	call   80104098 <acquire>
80103947:	8b 53 14             	mov    0x14(%ebx),%edx
8010394a:	83 c4 10             	add    $0x10,%esp
8010394d:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103952:	eb 0a                	jmp    8010395e <exit+0x82>
80103954:	83 e8 80             	sub    $0xffffff80,%eax
80103957:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
8010395c:	74 1c                	je     8010397a <exit+0x9e>
8010395e:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103962:	75 f0                	jne    80103954 <exit+0x78>
80103964:	3b 50 20             	cmp    0x20(%eax),%edx
80103967:	75 eb                	jne    80103954 <exit+0x78>
80103969:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103970:	83 e8 80             	sub    $0xffffff80,%eax
80103973:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103978:	75 e4                	jne    8010395e <exit+0x82>
8010397a:	8b 0d 54 3d 11 80    	mov    0x80113d54,%ecx
80103980:	ba 54 1d 11 80       	mov    $0x80111d54,%edx
80103985:	eb 0c                	jmp    80103993 <exit+0xb7>
80103987:	90                   	nop
80103988:	83 ea 80             	sub    $0xffffff80,%edx
8010398b:	81 fa 54 3d 11 80    	cmp    $0x80113d54,%edx
80103991:	74 33                	je     801039c6 <exit+0xea>
80103993:	39 5a 14             	cmp    %ebx,0x14(%edx)
80103996:	75 f0                	jne    80103988 <exit+0xac>
80103998:	89 4a 14             	mov    %ecx,0x14(%edx)
8010399b:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
8010399f:	75 e7                	jne    80103988 <exit+0xac>
801039a1:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
801039a6:	eb 0a                	jmp    801039b2 <exit+0xd6>
801039a8:	83 e8 80             	sub    $0xffffff80,%eax
801039ab:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
801039b0:	74 d6                	je     80103988 <exit+0xac>
801039b2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801039b6:	75 f0                	jne    801039a8 <exit+0xcc>
801039b8:	3b 48 20             	cmp    0x20(%eax),%ecx
801039bb:	75 eb                	jne    801039a8 <exit+0xcc>
801039bd:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801039c4:	eb e2                	jmp    801039a8 <exit+0xcc>
801039c6:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
801039cd:	e8 56 fe ff ff       	call   80103828 <sched>
801039d2:	83 ec 0c             	sub    $0xc,%esp
801039d5:	68 88 6e 10 80       	push   $0x80106e88
801039da:	e8 59 c9 ff ff       	call   80100338 <panic>
801039df:	83 ec 0c             	sub    $0xc,%esp
801039e2:	68 7b 6e 10 80       	push   $0x80106e7b
801039e7:	e8 4c c9 ff ff       	call   80100338 <panic>

801039ec <wait>:
801039ec:	55                   	push   %ebp
801039ed:	89 e5                	mov    %esp,%ebp
801039ef:	56                   	push   %esi
801039f0:	53                   	push   %ebx
801039f1:	e8 5e 05 00 00       	call   80103f54 <pushcli>
801039f6:	e8 81 fa ff ff       	call   8010347c <mycpu>
801039fb:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
80103a01:	e8 9a 05 00 00       	call   80103fa0 <popcli>
80103a06:	83 ec 0c             	sub    $0xc,%esp
80103a09:	68 20 1d 11 80       	push   $0x80111d20
80103a0e:	e8 85 06 00 00       	call   80104098 <acquire>
80103a13:	83 c4 10             	add    $0x10,%esp
80103a16:	31 c0                	xor    %eax,%eax
80103a18:	bb 54 1d 11 80       	mov    $0x80111d54,%ebx
80103a1d:	eb 0c                	jmp    80103a2b <wait+0x3f>
80103a1f:	90                   	nop
80103a20:	83 eb 80             	sub    $0xffffff80,%ebx
80103a23:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103a29:	74 1b                	je     80103a46 <wait+0x5a>
80103a2b:	39 73 14             	cmp    %esi,0x14(%ebx)
80103a2e:	75 f0                	jne    80103a20 <wait+0x34>
80103a30:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103a34:	74 5a                	je     80103a90 <wait+0xa4>
80103a36:	b8 01 00 00 00       	mov    $0x1,%eax
80103a3b:	83 eb 80             	sub    $0xffffff80,%ebx
80103a3e:	81 fb 54 3d 11 80    	cmp    $0x80113d54,%ebx
80103a44:	75 e5                	jne    80103a2b <wait+0x3f>
80103a46:	85 c0                	test   %eax,%eax
80103a48:	0f 84 98 00 00 00    	je     80103ae6 <wait+0xfa>
80103a4e:	8b 46 24             	mov    0x24(%esi),%eax
80103a51:	85 c0                	test   %eax,%eax
80103a53:	0f 85 8d 00 00 00    	jne    80103ae6 <wait+0xfa>
80103a59:	e8 f6 04 00 00       	call   80103f54 <pushcli>
80103a5e:	e8 19 fa ff ff       	call   8010347c <mycpu>
80103a63:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103a69:	e8 32 05 00 00       	call   80103fa0 <popcli>
80103a6e:	85 db                	test   %ebx,%ebx
80103a70:	0f 84 87 00 00 00    	je     80103afd <wait+0x111>
80103a76:	89 73 20             	mov    %esi,0x20(%ebx)
80103a79:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103a80:	e8 a3 fd ff ff       	call   80103828 <sched>
80103a85:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103a8c:	eb 88                	jmp    80103a16 <wait+0x2a>
80103a8e:	66 90                	xchg   %ax,%ax
80103a90:	8b 73 10             	mov    0x10(%ebx),%esi
80103a93:	83 ec 0c             	sub    $0xc,%esp
80103a96:	ff 73 08             	pushl  0x8(%ebx)
80103a99:	e8 9a e7 ff ff       	call   80102238 <kfree>
80103a9e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103aa5:	5a                   	pop    %edx
80103aa6:	ff 73 04             	pushl  0x4(%ebx)
80103aa9:	e8 a2 2a 00 00       	call   80106550 <freevm>
80103aae:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
80103ab5:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80103abc:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
80103ac0:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
80103ac7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103ace:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103ad5:	e8 5e 05 00 00       	call   80104038 <release>
80103ada:	83 c4 10             	add    $0x10,%esp
80103add:	89 f0                	mov    %esi,%eax
80103adf:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ae2:	5b                   	pop    %ebx
80103ae3:	5e                   	pop    %esi
80103ae4:	5d                   	pop    %ebp
80103ae5:	c3                   	ret    
80103ae6:	83 ec 0c             	sub    $0xc,%esp
80103ae9:	68 20 1d 11 80       	push   $0x80111d20
80103aee:	e8 45 05 00 00       	call   80104038 <release>
80103af3:	83 c4 10             	add    $0x10,%esp
80103af6:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103afb:	eb e0                	jmp    80103add <wait+0xf1>
80103afd:	83 ec 0c             	sub    $0xc,%esp
80103b00:	68 94 6e 10 80       	push   $0x80106e94
80103b05:	e8 2e c8 ff ff       	call   80100338 <panic>
80103b0a:	66 90                	xchg   %ax,%ax

80103b0c <yield>:
80103b0c:	55                   	push   %ebp
80103b0d:	89 e5                	mov    %esp,%ebp
80103b0f:	53                   	push   %ebx
80103b10:	83 ec 10             	sub    $0x10,%esp
80103b13:	68 20 1d 11 80       	push   $0x80111d20
80103b18:	e8 7b 05 00 00       	call   80104098 <acquire>
80103b1d:	e8 32 04 00 00       	call   80103f54 <pushcli>
80103b22:	e8 55 f9 ff ff       	call   8010347c <mycpu>
80103b27:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103b2d:	e8 6e 04 00 00       	call   80103fa0 <popcli>
80103b32:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103b39:	e8 ea fc ff ff       	call   80103828 <sched>
80103b3e:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103b45:	e8 ee 04 00 00       	call   80104038 <release>
80103b4a:	83 c4 10             	add    $0x10,%esp
80103b4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b50:	c9                   	leave  
80103b51:	c3                   	ret    
80103b52:	66 90                	xchg   %ax,%ax

80103b54 <sleep>:
80103b54:	55                   	push   %ebp
80103b55:	89 e5                	mov    %esp,%ebp
80103b57:	57                   	push   %edi
80103b58:	56                   	push   %esi
80103b59:	53                   	push   %ebx
80103b5a:	83 ec 0c             	sub    $0xc,%esp
80103b5d:	8b 7d 08             	mov    0x8(%ebp),%edi
80103b60:	8b 75 0c             	mov    0xc(%ebp),%esi
80103b63:	e8 ec 03 00 00       	call   80103f54 <pushcli>
80103b68:	e8 0f f9 ff ff       	call   8010347c <mycpu>
80103b6d:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103b73:	e8 28 04 00 00       	call   80103fa0 <popcli>
80103b78:	85 db                	test   %ebx,%ebx
80103b7a:	0f 84 83 00 00 00    	je     80103c03 <sleep+0xaf>
80103b80:	85 f6                	test   %esi,%esi
80103b82:	74 72                	je     80103bf6 <sleep+0xa2>
80103b84:	81 fe 20 1d 11 80    	cmp    $0x80111d20,%esi
80103b8a:	74 4c                	je     80103bd8 <sleep+0x84>
80103b8c:	83 ec 0c             	sub    $0xc,%esp
80103b8f:	68 20 1d 11 80       	push   $0x80111d20
80103b94:	e8 ff 04 00 00       	call   80104098 <acquire>
80103b99:	89 34 24             	mov    %esi,(%esp)
80103b9c:	e8 97 04 00 00       	call   80104038 <release>
80103ba1:	89 7b 20             	mov    %edi,0x20(%ebx)
80103ba4:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103bab:	e8 78 fc ff ff       	call   80103828 <sched>
80103bb0:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103bb7:	c7 04 24 20 1d 11 80 	movl   $0x80111d20,(%esp)
80103bbe:	e8 75 04 00 00       	call   80104038 <release>
80103bc3:	83 c4 10             	add    $0x10,%esp
80103bc6:	89 75 08             	mov    %esi,0x8(%ebp)
80103bc9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bcc:	5b                   	pop    %ebx
80103bcd:	5e                   	pop    %esi
80103bce:	5f                   	pop    %edi
80103bcf:	5d                   	pop    %ebp
80103bd0:	e9 c3 04 00 00       	jmp    80104098 <acquire>
80103bd5:	8d 76 00             	lea    0x0(%esi),%esi
80103bd8:	89 7b 20             	mov    %edi,0x20(%ebx)
80103bdb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103be2:	e8 41 fc ff ff       	call   80103828 <sched>
80103be7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
80103bee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bf1:	5b                   	pop    %ebx
80103bf2:	5e                   	pop    %esi
80103bf3:	5f                   	pop    %edi
80103bf4:	5d                   	pop    %ebp
80103bf5:	c3                   	ret    
80103bf6:	83 ec 0c             	sub    $0xc,%esp
80103bf9:	68 9a 6e 10 80       	push   $0x80106e9a
80103bfe:	e8 35 c7 ff ff       	call   80100338 <panic>
80103c03:	83 ec 0c             	sub    $0xc,%esp
80103c06:	68 94 6e 10 80       	push   $0x80106e94
80103c0b:	e8 28 c7 ff ff       	call   80100338 <panic>

80103c10 <wakeup>:
80103c10:	55                   	push   %ebp
80103c11:	89 e5                	mov    %esp,%ebp
80103c13:	53                   	push   %ebx
80103c14:	83 ec 10             	sub    $0x10,%esp
80103c17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c1a:	68 20 1d 11 80       	push   $0x80111d20
80103c1f:	e8 74 04 00 00       	call   80104098 <acquire>
80103c24:	83 c4 10             	add    $0x10,%esp
80103c27:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103c2c:	eb 0c                	jmp    80103c3a <wakeup+0x2a>
80103c2e:	66 90                	xchg   %ax,%ax
80103c30:	83 e8 80             	sub    $0xffffff80,%eax
80103c33:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103c38:	74 1c                	je     80103c56 <wakeup+0x46>
80103c3a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c3e:	75 f0                	jne    80103c30 <wakeup+0x20>
80103c40:	3b 58 20             	cmp    0x20(%eax),%ebx
80103c43:	75 eb                	jne    80103c30 <wakeup+0x20>
80103c45:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103c4c:	83 e8 80             	sub    $0xffffff80,%eax
80103c4f:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103c54:	75 e4                	jne    80103c3a <wakeup+0x2a>
80103c56:	c7 45 08 20 1d 11 80 	movl   $0x80111d20,0x8(%ebp)
80103c5d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c60:	c9                   	leave  
80103c61:	e9 d2 03 00 00       	jmp    80104038 <release>
80103c66:	66 90                	xchg   %ax,%ax

80103c68 <kill>:
80103c68:	55                   	push   %ebp
80103c69:	89 e5                	mov    %esp,%ebp
80103c6b:	53                   	push   %ebx
80103c6c:	83 ec 10             	sub    $0x10,%esp
80103c6f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103c72:	68 20 1d 11 80       	push   $0x80111d20
80103c77:	e8 1c 04 00 00       	call   80104098 <acquire>
80103c7c:	83 c4 10             	add    $0x10,%esp
80103c7f:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103c84:	eb 0c                	jmp    80103c92 <kill+0x2a>
80103c86:	66 90                	xchg   %ax,%ax
80103c88:	83 e8 80             	sub    $0xffffff80,%eax
80103c8b:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103c90:	74 32                	je     80103cc4 <kill+0x5c>
80103c92:	39 58 10             	cmp    %ebx,0x10(%eax)
80103c95:	75 f1                	jne    80103c88 <kill+0x20>
80103c97:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80103c9e:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ca2:	75 07                	jne    80103cab <kill+0x43>
80103ca4:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cab:	83 ec 0c             	sub    $0xc,%esp
80103cae:	68 20 1d 11 80       	push   $0x80111d20
80103cb3:	e8 80 03 00 00       	call   80104038 <release>
80103cb8:	83 c4 10             	add    $0x10,%esp
80103cbb:	31 c0                	xor    %eax,%eax
80103cbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cc0:	c9                   	leave  
80103cc1:	c3                   	ret    
80103cc2:	66 90                	xchg   %ax,%ax
80103cc4:	83 ec 0c             	sub    $0xc,%esp
80103cc7:	68 20 1d 11 80       	push   $0x80111d20
80103ccc:	e8 67 03 00 00       	call   80104038 <release>
80103cd1:	83 c4 10             	add    $0x10,%esp
80103cd4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103cd9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cdc:	c9                   	leave  
80103cdd:	c3                   	ret    
80103cde:	66 90                	xchg   %ax,%ax

80103ce0 <procdump>:
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	57                   	push   %edi
80103ce4:	56                   	push   %esi
80103ce5:	53                   	push   %ebx
80103ce6:	83 ec 3c             	sub    $0x3c,%esp
80103ce9:	bb c0 1d 11 80       	mov    $0x80111dc0,%ebx
80103cee:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103cf1:	eb 3f                	jmp    80103d32 <procdump+0x52>
80103cf3:	90                   	nop
80103cf4:	8b 04 85 0c 6f 10 80 	mov    -0x7fef90f4(,%eax,4),%eax
80103cfb:	85 c0                	test   %eax,%eax
80103cfd:	74 3f                	je     80103d3e <procdump+0x5e>
80103cff:	53                   	push   %ebx
80103d00:	50                   	push   %eax
80103d01:	ff 73 a4             	pushl  -0x5c(%ebx)
80103d04:	68 af 6e 10 80       	push   $0x80106eaf
80103d09:	e8 1a c9 ff ff       	call   80100628 <cprintf>
80103d0e:	83 c4 10             	add    $0x10,%esp
80103d11:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80103d15:	74 31                	je     80103d48 <procdump+0x68>
80103d17:	83 ec 0c             	sub    $0xc,%esp
80103d1a:	68 1b 72 10 80       	push   $0x8010721b
80103d1f:	e8 04 c9 ff ff       	call   80100628 <cprintf>
80103d24:	83 c4 10             	add    $0x10,%esp
80103d27:	83 eb 80             	sub    $0xffffff80,%ebx
80103d2a:	81 fb c0 3d 11 80    	cmp    $0x80113dc0,%ebx
80103d30:	74 52                	je     80103d84 <procdump+0xa4>
80103d32:	8b 43 a0             	mov    -0x60(%ebx),%eax
80103d35:	85 c0                	test   %eax,%eax
80103d37:	74 ee                	je     80103d27 <procdump+0x47>
80103d39:	83 f8 05             	cmp    $0x5,%eax
80103d3c:	76 b6                	jbe    80103cf4 <procdump+0x14>
80103d3e:	b8 ab 6e 10 80       	mov    $0x80106eab,%eax
80103d43:	eb ba                	jmp    80103cff <procdump+0x1f>
80103d45:	8d 76 00             	lea    0x0(%esi),%esi
80103d48:	83 ec 08             	sub    $0x8,%esp
80103d4b:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103d4e:	50                   	push   %eax
80103d4f:	8b 43 b0             	mov    -0x50(%ebx),%eax
80103d52:	8b 40 0c             	mov    0xc(%eax),%eax
80103d55:	83 c0 08             	add    $0x8,%eax
80103d58:	50                   	push   %eax
80103d59:	e8 96 01 00 00       	call   80103ef4 <getcallerpcs>
80103d5e:	8d 7d c0             	lea    -0x40(%ebp),%edi
80103d61:	83 c4 10             	add    $0x10,%esp
80103d64:	8b 17                	mov    (%edi),%edx
80103d66:	85 d2                	test   %edx,%edx
80103d68:	74 ad                	je     80103d17 <procdump+0x37>
80103d6a:	83 ec 08             	sub    $0x8,%esp
80103d6d:	52                   	push   %edx
80103d6e:	68 01 69 10 80       	push   $0x80106901
80103d73:	e8 b0 c8 ff ff       	call   80100628 <cprintf>
80103d78:	83 c7 04             	add    $0x4,%edi
80103d7b:	83 c4 10             	add    $0x10,%esp
80103d7e:	39 f7                	cmp    %esi,%edi
80103d80:	75 e2                	jne    80103d64 <procdump+0x84>
80103d82:	eb 93                	jmp    80103d17 <procdump+0x37>
80103d84:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103d87:	5b                   	pop    %ebx
80103d88:	5e                   	pop    %esi
80103d89:	5f                   	pop    %edi
80103d8a:	5d                   	pop    %ebp
80103d8b:	c3                   	ret    

80103d8c <getreadcount>:
80103d8c:	55                   	push   %ebp
80103d8d:	89 e5                	mov    %esp,%ebp
80103d8f:	53                   	push   %ebx
80103d90:	83 ec 10             	sub    $0x10,%esp
80103d93:	68 20 1d 11 80       	push   $0x80111d20
80103d98:	e8 fb 02 00 00       	call   80104098 <acquire>
80103d9d:	83 c4 10             	add    $0x10,%esp
80103da0:	31 db                	xor    %ebx,%ebx
80103da2:	b8 54 1d 11 80       	mov    $0x80111d54,%eax
80103da7:	90                   	nop
80103da8:	03 58 7c             	add    0x7c(%eax),%ebx
80103dab:	83 e8 80             	sub    $0xffffff80,%eax
80103dae:	3d 54 3d 11 80       	cmp    $0x80113d54,%eax
80103db3:	75 f3                	jne    80103da8 <getreadcount+0x1c>
80103db5:	83 ec 0c             	sub    $0xc,%esp
80103db8:	68 20 1d 11 80       	push   $0x80111d20
80103dbd:	e8 76 02 00 00       	call   80104038 <release>
80103dc2:	89 d8                	mov    %ebx,%eax
80103dc4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103dc7:	c9                   	leave  
80103dc8:	c3                   	ret    
80103dc9:	66 90                	xchg   %ax,%ax
80103dcb:	90                   	nop

80103dcc <initsleeplock>:
80103dcc:	55                   	push   %ebp
80103dcd:	89 e5                	mov    %esp,%ebp
80103dcf:	53                   	push   %ebx
80103dd0:	83 ec 0c             	sub    $0xc,%esp
80103dd3:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103dd6:	68 24 6f 10 80       	push   $0x80106f24
80103ddb:	8d 43 04             	lea    0x4(%ebx),%eax
80103dde:	50                   	push   %eax
80103ddf:	e8 f4 00 00 00       	call   80103ed8 <initlock>
80103de4:	8b 45 0c             	mov    0xc(%ebp),%eax
80103de7:	89 43 38             	mov    %eax,0x38(%ebx)
80103dea:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103df0:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103df7:	83 c4 10             	add    $0x10,%esp
80103dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103dfd:	c9                   	leave  
80103dfe:	c3                   	ret    
80103dff:	90                   	nop

80103e00 <acquiresleep>:
80103e00:	55                   	push   %ebp
80103e01:	89 e5                	mov    %esp,%ebp
80103e03:	56                   	push   %esi
80103e04:	53                   	push   %ebx
80103e05:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e08:	8d 73 04             	lea    0x4(%ebx),%esi
80103e0b:	83 ec 0c             	sub    $0xc,%esp
80103e0e:	56                   	push   %esi
80103e0f:	e8 84 02 00 00       	call   80104098 <acquire>
80103e14:	83 c4 10             	add    $0x10,%esp
80103e17:	8b 13                	mov    (%ebx),%edx
80103e19:	85 d2                	test   %edx,%edx
80103e1b:	74 16                	je     80103e33 <acquiresleep+0x33>
80103e1d:	8d 76 00             	lea    0x0(%esi),%esi
80103e20:	83 ec 08             	sub    $0x8,%esp
80103e23:	56                   	push   %esi
80103e24:	53                   	push   %ebx
80103e25:	e8 2a fd ff ff       	call   80103b54 <sleep>
80103e2a:	83 c4 10             	add    $0x10,%esp
80103e2d:	8b 03                	mov    (%ebx),%eax
80103e2f:	85 c0                	test   %eax,%eax
80103e31:	75 ed                	jne    80103e20 <acquiresleep+0x20>
80103e33:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80103e39:	e8 d6 f6 ff ff       	call   80103514 <myproc>
80103e3e:	8b 40 10             	mov    0x10(%eax),%eax
80103e41:	89 43 3c             	mov    %eax,0x3c(%ebx)
80103e44:	89 75 08             	mov    %esi,0x8(%ebp)
80103e47:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e4a:	5b                   	pop    %ebx
80103e4b:	5e                   	pop    %esi
80103e4c:	5d                   	pop    %ebp
80103e4d:	e9 e6 01 00 00       	jmp    80104038 <release>
80103e52:	66 90                	xchg   %ax,%ax

80103e54 <releasesleep>:
80103e54:	55                   	push   %ebp
80103e55:	89 e5                	mov    %esp,%ebp
80103e57:	56                   	push   %esi
80103e58:	53                   	push   %ebx
80103e59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e5c:	8d 73 04             	lea    0x4(%ebx),%esi
80103e5f:	83 ec 0c             	sub    $0xc,%esp
80103e62:	56                   	push   %esi
80103e63:	e8 30 02 00 00       	call   80104098 <acquire>
80103e68:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103e6e:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103e75:	89 1c 24             	mov    %ebx,(%esp)
80103e78:	e8 93 fd ff ff       	call   80103c10 <wakeup>
80103e7d:	83 c4 10             	add    $0x10,%esp
80103e80:	89 75 08             	mov    %esi,0x8(%ebp)
80103e83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103e86:	5b                   	pop    %ebx
80103e87:	5e                   	pop    %esi
80103e88:	5d                   	pop    %ebp
80103e89:	e9 aa 01 00 00       	jmp    80104038 <release>
80103e8e:	66 90                	xchg   %ax,%ax

80103e90 <holdingsleep>:
80103e90:	55                   	push   %ebp
80103e91:	89 e5                	mov    %esp,%ebp
80103e93:	56                   	push   %esi
80103e94:	53                   	push   %ebx
80103e95:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103e98:	8d 73 04             	lea    0x4(%ebx),%esi
80103e9b:	83 ec 0c             	sub    $0xc,%esp
80103e9e:	56                   	push   %esi
80103e9f:	e8 f4 01 00 00       	call   80104098 <acquire>
80103ea4:	83 c4 10             	add    $0x10,%esp
80103ea7:	8b 03                	mov    (%ebx),%eax
80103ea9:	85 c0                	test   %eax,%eax
80103eab:	75 17                	jne    80103ec4 <holdingsleep+0x34>
80103ead:	31 db                	xor    %ebx,%ebx
80103eaf:	83 ec 0c             	sub    $0xc,%esp
80103eb2:	56                   	push   %esi
80103eb3:	e8 80 01 00 00       	call   80104038 <release>
80103eb8:	89 d8                	mov    %ebx,%eax
80103eba:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ebd:	5b                   	pop    %ebx
80103ebe:	5e                   	pop    %esi
80103ebf:	5d                   	pop    %ebp
80103ec0:	c3                   	ret    
80103ec1:	8d 76 00             	lea    0x0(%esi),%esi
80103ec4:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103ec7:	e8 48 f6 ff ff       	call   80103514 <myproc>
80103ecc:	39 58 10             	cmp    %ebx,0x10(%eax)
80103ecf:	0f 94 c3             	sete   %bl
80103ed2:	0f b6 db             	movzbl %bl,%ebx
80103ed5:	eb d8                	jmp    80103eaf <holdingsleep+0x1f>
80103ed7:	90                   	nop

80103ed8 <initlock>:
80103ed8:	55                   	push   %ebp
80103ed9:	89 e5                	mov    %esp,%ebp
80103edb:	8b 45 08             	mov    0x8(%ebp),%eax
80103ede:	8b 55 0c             	mov    0xc(%ebp),%edx
80103ee1:	89 50 04             	mov    %edx,0x4(%eax)
80103ee4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103eea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103ef1:	5d                   	pop    %ebp
80103ef2:	c3                   	ret    
80103ef3:	90                   	nop

80103ef4 <getcallerpcs>:
80103ef4:	55                   	push   %ebp
80103ef5:	89 e5                	mov    %esp,%ebp
80103ef7:	53                   	push   %ebx
80103ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80103efb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103efe:	8d 50 f8             	lea    -0x8(%eax),%edx
80103f01:	05 f8 ff ff 7f       	add    $0x7ffffff8,%eax
80103f06:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
80103f0b:	b8 00 00 00 00       	mov    $0x0,%eax
80103f10:	76 10                	jbe    80103f22 <getcallerpcs+0x2e>
80103f12:	eb 24                	jmp    80103f38 <getcallerpcs+0x44>
80103f14:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103f1a:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103f20:	77 16                	ja     80103f38 <getcallerpcs+0x44>
80103f22:	8b 5a 04             	mov    0x4(%edx),%ebx
80103f25:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80103f28:	8b 12                	mov    (%edx),%edx
80103f2a:	40                   	inc    %eax
80103f2b:	83 f8 0a             	cmp    $0xa,%eax
80103f2e:	75 e4                	jne    80103f14 <getcallerpcs+0x20>
80103f30:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f33:	c9                   	leave  
80103f34:	c3                   	ret    
80103f35:	8d 76 00             	lea    0x0(%esi),%esi
80103f38:	8d 04 81             	lea    (%ecx,%eax,4),%eax
80103f3b:	8d 51 28             	lea    0x28(%ecx),%edx
80103f3e:	66 90                	xchg   %ax,%ax
80103f40:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103f46:	83 c0 04             	add    $0x4,%eax
80103f49:	39 d0                	cmp    %edx,%eax
80103f4b:	75 f3                	jne    80103f40 <getcallerpcs+0x4c>
80103f4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f50:	c9                   	leave  
80103f51:	c3                   	ret    
80103f52:	66 90                	xchg   %ax,%ax

80103f54 <pushcli>:
80103f54:	55                   	push   %ebp
80103f55:	89 e5                	mov    %esp,%ebp
80103f57:	53                   	push   %ebx
80103f58:	50                   	push   %eax
80103f59:	9c                   	pushf  
80103f5a:	5b                   	pop    %ebx
80103f5b:	fa                   	cli    
80103f5c:	e8 1b f5 ff ff       	call   8010347c <mycpu>
80103f61:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80103f67:	85 d2                	test   %edx,%edx
80103f69:	74 11                	je     80103f7c <pushcli+0x28>
80103f6b:	e8 0c f5 ff ff       	call   8010347c <mycpu>
80103f70:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
80103f76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f79:	c9                   	leave  
80103f7a:	c3                   	ret    
80103f7b:	90                   	nop
80103f7c:	e8 fb f4 ff ff       	call   8010347c <mycpu>
80103f81:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103f87:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103f8d:	e8 ea f4 ff ff       	call   8010347c <mycpu>
80103f92:	ff 80 a4 00 00 00    	incl   0xa4(%eax)
80103f98:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f9b:	c9                   	leave  
80103f9c:	c3                   	ret    
80103f9d:	8d 76 00             	lea    0x0(%esi),%esi

80103fa0 <popcli>:
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	83 ec 08             	sub    $0x8,%esp
80103fa6:	9c                   	pushf  
80103fa7:	58                   	pop    %eax
80103fa8:	f6 c4 02             	test   $0x2,%ah
80103fab:	75 31                	jne    80103fde <popcli+0x3e>
80103fad:	e8 ca f4 ff ff       	call   8010347c <mycpu>
80103fb2:	ff 88 a4 00 00 00    	decl   0xa4(%eax)
80103fb8:	78 31                	js     80103feb <popcli+0x4b>
80103fba:	e8 bd f4 ff ff       	call   8010347c <mycpu>
80103fbf:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80103fc5:	85 d2                	test   %edx,%edx
80103fc7:	74 03                	je     80103fcc <popcli+0x2c>
80103fc9:	c9                   	leave  
80103fca:	c3                   	ret    
80103fcb:	90                   	nop
80103fcc:	e8 ab f4 ff ff       	call   8010347c <mycpu>
80103fd1:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80103fd7:	85 c0                	test   %eax,%eax
80103fd9:	74 ee                	je     80103fc9 <popcli+0x29>
80103fdb:	fb                   	sti    
80103fdc:	c9                   	leave  
80103fdd:	c3                   	ret    
80103fde:	83 ec 0c             	sub    $0xc,%esp
80103fe1:	68 2f 6f 10 80       	push   $0x80106f2f
80103fe6:	e8 4d c3 ff ff       	call   80100338 <panic>
80103feb:	83 ec 0c             	sub    $0xc,%esp
80103fee:	68 46 6f 10 80       	push   $0x80106f46
80103ff3:	e8 40 c3 ff ff       	call   80100338 <panic>

80103ff8 <holding>:
80103ff8:	55                   	push   %ebp
80103ff9:	89 e5                	mov    %esp,%ebp
80103ffb:	53                   	push   %ebx
80103ffc:	50                   	push   %eax
80103ffd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104000:	e8 4f ff ff ff       	call   80103f54 <pushcli>
80104005:	8b 13                	mov    (%ebx),%edx
80104007:	85 d2                	test   %edx,%edx
80104009:	75 11                	jne    8010401c <holding+0x24>
8010400b:	31 db                	xor    %ebx,%ebx
8010400d:	e8 8e ff ff ff       	call   80103fa0 <popcli>
80104012:	89 d8                	mov    %ebx,%eax
80104014:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104017:	c9                   	leave  
80104018:	c3                   	ret    
80104019:	8d 76 00             	lea    0x0(%esi),%esi
8010401c:	8b 5b 08             	mov    0x8(%ebx),%ebx
8010401f:	e8 58 f4 ff ff       	call   8010347c <mycpu>
80104024:	39 c3                	cmp    %eax,%ebx
80104026:	0f 94 c3             	sete   %bl
80104029:	0f b6 db             	movzbl %bl,%ebx
8010402c:	e8 6f ff ff ff       	call   80103fa0 <popcli>
80104031:	89 d8                	mov    %ebx,%eax
80104033:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104036:	c9                   	leave  
80104037:	c3                   	ret    

80104038 <release>:
80104038:	55                   	push   %ebp
80104039:	89 e5                	mov    %esp,%ebp
8010403b:	56                   	push   %esi
8010403c:	53                   	push   %ebx
8010403d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104040:	e8 0f ff ff ff       	call   80103f54 <pushcli>
80104045:	8b 03                	mov    (%ebx),%eax
80104047:	85 c0                	test   %eax,%eax
80104049:	75 15                	jne    80104060 <release+0x28>
8010404b:	e8 50 ff ff ff       	call   80103fa0 <popcli>
80104050:	83 ec 0c             	sub    $0xc,%esp
80104053:	68 4d 6f 10 80       	push   $0x80106f4d
80104058:	e8 db c2 ff ff       	call   80100338 <panic>
8010405d:	8d 76 00             	lea    0x0(%esi),%esi
80104060:	8b 73 08             	mov    0x8(%ebx),%esi
80104063:	e8 14 f4 ff ff       	call   8010347c <mycpu>
80104068:	39 c6                	cmp    %eax,%esi
8010406a:	75 df                	jne    8010404b <release+0x13>
8010406c:	e8 2f ff ff ff       	call   80103fa0 <popcli>
80104071:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104078:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
8010407f:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104084:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010408a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010408d:	5b                   	pop    %ebx
8010408e:	5e                   	pop    %esi
8010408f:	5d                   	pop    %ebp
80104090:	e9 0b ff ff ff       	jmp    80103fa0 <popcli>
80104095:	8d 76 00             	lea    0x0(%esi),%esi

80104098 <acquire>:
80104098:	55                   	push   %ebp
80104099:	89 e5                	mov    %esp,%ebp
8010409b:	53                   	push   %ebx
8010409c:	50                   	push   %eax
8010409d:	e8 b2 fe ff ff       	call   80103f54 <pushcli>
801040a2:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040a5:	e8 aa fe ff ff       	call   80103f54 <pushcli>
801040aa:	8b 13                	mov    (%ebx),%edx
801040ac:	85 d2                	test   %edx,%edx
801040ae:	0f 85 80 00 00 00    	jne    80104134 <acquire+0x9c>
801040b4:	e8 e7 fe ff ff       	call   80103fa0 <popcli>
801040b9:	b9 01 00 00 00       	mov    $0x1,%ecx
801040be:	66 90                	xchg   %ax,%ax
801040c0:	8b 55 08             	mov    0x8(%ebp),%edx
801040c3:	89 c8                	mov    %ecx,%eax
801040c5:	f0 87 02             	lock xchg %eax,(%edx)
801040c8:	85 c0                	test   %eax,%eax
801040ca:	75 f4                	jne    801040c0 <acquire+0x28>
801040cc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801040d1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040d4:	e8 a3 f3 ff ff       	call   8010347c <mycpu>
801040d9:	89 43 08             	mov    %eax,0x8(%ebx)
801040dc:	8b 4d 08             	mov    0x8(%ebp),%ecx
801040df:	8d 85 00 00 00 80    	lea    -0x80000000(%ebp),%eax
801040e5:	31 d2                	xor    %edx,%edx
801040e7:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
801040ec:	77 2a                	ja     80104118 <acquire+0x80>
801040ee:	89 e8                	mov    %ebp,%eax
801040f0:	eb 10                	jmp    80104102 <acquire+0x6a>
801040f2:	66 90                	xchg   %ax,%ax
801040f4:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
801040fa:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104100:	77 16                	ja     80104118 <acquire+0x80>
80104102:	8b 58 04             	mov    0x4(%eax),%ebx
80104105:	89 5c 91 0c          	mov    %ebx,0xc(%ecx,%edx,4)
80104109:	8b 00                	mov    (%eax),%eax
8010410b:	42                   	inc    %edx
8010410c:	83 fa 0a             	cmp    $0xa,%edx
8010410f:	75 e3                	jne    801040f4 <acquire+0x5c>
80104111:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104114:	c9                   	leave  
80104115:	c3                   	ret    
80104116:	66 90                	xchg   %ax,%ax
80104118:	8d 44 91 0c          	lea    0xc(%ecx,%edx,4),%eax
8010411c:	8d 51 34             	lea    0x34(%ecx),%edx
8010411f:	90                   	nop
80104120:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104126:	83 c0 04             	add    $0x4,%eax
80104129:	39 c2                	cmp    %eax,%edx
8010412b:	75 f3                	jne    80104120 <acquire+0x88>
8010412d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104130:	c9                   	leave  
80104131:	c3                   	ret    
80104132:	66 90                	xchg   %ax,%ax
80104134:	8b 5b 08             	mov    0x8(%ebx),%ebx
80104137:	e8 40 f3 ff ff       	call   8010347c <mycpu>
8010413c:	39 c3                	cmp    %eax,%ebx
8010413e:	0f 85 70 ff ff ff    	jne    801040b4 <acquire+0x1c>
80104144:	e8 57 fe ff ff       	call   80103fa0 <popcli>
80104149:	83 ec 0c             	sub    $0xc,%esp
8010414c:	68 55 6f 10 80       	push   $0x80106f55
80104151:	e8 e2 c1 ff ff       	call   80100338 <panic>
80104156:	66 90                	xchg   %ax,%ax

80104158 <memset>:
80104158:	55                   	push   %ebp
80104159:	89 e5                	mov    %esp,%ebp
8010415b:	57                   	push   %edi
8010415c:	8b 55 08             	mov    0x8(%ebp),%edx
8010415f:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104162:	89 d0                	mov    %edx,%eax
80104164:	09 c8                	or     %ecx,%eax
80104166:	a8 03                	test   $0x3,%al
80104168:	75 22                	jne    8010418c <memset+0x34>
8010416a:	c1 e9 02             	shr    $0x2,%ecx
8010416d:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
80104171:	89 f8                	mov    %edi,%eax
80104173:	c1 e0 08             	shl    $0x8,%eax
80104176:	01 f8                	add    %edi,%eax
80104178:	89 c7                	mov    %eax,%edi
8010417a:	c1 e7 10             	shl    $0x10,%edi
8010417d:	01 f8                	add    %edi,%eax
8010417f:	89 d7                	mov    %edx,%edi
80104181:	fc                   	cld    
80104182:	f3 ab                	rep stos %eax,%es:(%edi)
80104184:	89 d0                	mov    %edx,%eax
80104186:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104189:	c9                   	leave  
8010418a:	c3                   	ret    
8010418b:	90                   	nop
8010418c:	89 d7                	mov    %edx,%edi
8010418e:	8b 45 0c             	mov    0xc(%ebp),%eax
80104191:	fc                   	cld    
80104192:	f3 aa                	rep stos %al,%es:(%edi)
80104194:	89 d0                	mov    %edx,%eax
80104196:	8b 7d fc             	mov    -0x4(%ebp),%edi
80104199:	c9                   	leave  
8010419a:	c3                   	ret    
8010419b:	90                   	nop

8010419c <memcmp>:
8010419c:	55                   	push   %ebp
8010419d:	89 e5                	mov    %esp,%ebp
8010419f:	56                   	push   %esi
801041a0:	53                   	push   %ebx
801041a1:	8b 55 08             	mov    0x8(%ebp),%edx
801041a4:	8b 45 0c             	mov    0xc(%ebp),%eax
801041a7:	8b 75 10             	mov    0x10(%ebp),%esi
801041aa:	85 f6                	test   %esi,%esi
801041ac:	74 1e                	je     801041cc <memcmp+0x30>
801041ae:	01 c6                	add    %eax,%esi
801041b0:	eb 08                	jmp    801041ba <memcmp+0x1e>
801041b2:	66 90                	xchg   %ax,%ax
801041b4:	42                   	inc    %edx
801041b5:	40                   	inc    %eax
801041b6:	39 f0                	cmp    %esi,%eax
801041b8:	74 12                	je     801041cc <memcmp+0x30>
801041ba:	8a 0a                	mov    (%edx),%cl
801041bc:	0f b6 18             	movzbl (%eax),%ebx
801041bf:	38 d9                	cmp    %bl,%cl
801041c1:	74 f1                	je     801041b4 <memcmp+0x18>
801041c3:	0f b6 c1             	movzbl %cl,%eax
801041c6:	29 d8                	sub    %ebx,%eax
801041c8:	5b                   	pop    %ebx
801041c9:	5e                   	pop    %esi
801041ca:	5d                   	pop    %ebp
801041cb:	c3                   	ret    
801041cc:	31 c0                	xor    %eax,%eax
801041ce:	5b                   	pop    %ebx
801041cf:	5e                   	pop    %esi
801041d0:	5d                   	pop    %ebp
801041d1:	c3                   	ret    
801041d2:	66 90                	xchg   %ax,%ax

801041d4 <memmove>:
801041d4:	55                   	push   %ebp
801041d5:	89 e5                	mov    %esp,%ebp
801041d7:	57                   	push   %edi
801041d8:	56                   	push   %esi
801041d9:	8b 55 08             	mov    0x8(%ebp),%edx
801041dc:	8b 75 0c             	mov    0xc(%ebp),%esi
801041df:	8b 45 10             	mov    0x10(%ebp),%eax
801041e2:	39 d6                	cmp    %edx,%esi
801041e4:	73 22                	jae    80104208 <memmove+0x34>
801041e6:	8d 0c 06             	lea    (%esi,%eax,1),%ecx
801041e9:	39 ca                	cmp    %ecx,%edx
801041eb:	73 1b                	jae    80104208 <memmove+0x34>
801041ed:	85 c0                	test   %eax,%eax
801041ef:	74 0e                	je     801041ff <memmove+0x2b>
801041f1:	48                   	dec    %eax
801041f2:	66 90                	xchg   %ax,%ax
801041f4:	8a 0c 06             	mov    (%esi,%eax,1),%cl
801041f7:	88 0c 02             	mov    %cl,(%edx,%eax,1)
801041fa:	83 e8 01             	sub    $0x1,%eax
801041fd:	73 f5                	jae    801041f4 <memmove+0x20>
801041ff:	89 d0                	mov    %edx,%eax
80104201:	5e                   	pop    %esi
80104202:	5f                   	pop    %edi
80104203:	5d                   	pop    %ebp
80104204:	c3                   	ret    
80104205:	8d 76 00             	lea    0x0(%esi),%esi
80104208:	85 c0                	test   %eax,%eax
8010420a:	74 f3                	je     801041ff <memmove+0x2b>
8010420c:	01 f0                	add    %esi,%eax
8010420e:	89 d7                	mov    %edx,%edi
80104210:	a4                   	movsb  %ds:(%esi),%es:(%edi)
80104211:	39 c6                	cmp    %eax,%esi
80104213:	75 fb                	jne    80104210 <memmove+0x3c>
80104215:	89 d0                	mov    %edx,%eax
80104217:	5e                   	pop    %esi
80104218:	5f                   	pop    %edi
80104219:	5d                   	pop    %ebp
8010421a:	c3                   	ret    
8010421b:	90                   	nop

8010421c <memcpy>:
8010421c:	eb b6                	jmp    801041d4 <memmove>
8010421e:	66 90                	xchg   %ax,%ax

80104220 <strncmp>:
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	53                   	push   %ebx
80104224:	8b 45 08             	mov    0x8(%ebp),%eax
80104227:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010422a:	8b 55 10             	mov    0x10(%ebp),%edx
8010422d:	85 d2                	test   %edx,%edx
8010422f:	75 0c                	jne    8010423d <strncmp+0x1d>
80104231:	eb 1d                	jmp    80104250 <strncmp+0x30>
80104233:	90                   	nop
80104234:	3a 19                	cmp    (%ecx),%bl
80104236:	75 0b                	jne    80104243 <strncmp+0x23>
80104238:	40                   	inc    %eax
80104239:	41                   	inc    %ecx
8010423a:	4a                   	dec    %edx
8010423b:	74 13                	je     80104250 <strncmp+0x30>
8010423d:	8a 18                	mov    (%eax),%bl
8010423f:	84 db                	test   %bl,%bl
80104241:	75 f1                	jne    80104234 <strncmp+0x14>
80104243:	0f b6 00             	movzbl (%eax),%eax
80104246:	0f b6 11             	movzbl (%ecx),%edx
80104249:	29 d0                	sub    %edx,%eax
8010424b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010424e:	c9                   	leave  
8010424f:	c3                   	ret    
80104250:	31 c0                	xor    %eax,%eax
80104252:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104255:	c9                   	leave  
80104256:	c3                   	ret    
80104257:	90                   	nop

80104258 <strncpy>:
80104258:	55                   	push   %ebp
80104259:	89 e5                	mov    %esp,%ebp
8010425b:	56                   	push   %esi
8010425c:	53                   	push   %ebx
8010425d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104260:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104263:	8b 55 08             	mov    0x8(%ebp),%edx
80104266:	eb 0c                	jmp    80104274 <strncpy+0x1c>
80104268:	43                   	inc    %ebx
80104269:	42                   	inc    %edx
8010426a:	8a 43 ff             	mov    -0x1(%ebx),%al
8010426d:	88 42 ff             	mov    %al,-0x1(%edx)
80104270:	84 c0                	test   %al,%al
80104272:	74 10                	je     80104284 <strncpy+0x2c>
80104274:	89 ce                	mov    %ecx,%esi
80104276:	49                   	dec    %ecx
80104277:	85 f6                	test   %esi,%esi
80104279:	7f ed                	jg     80104268 <strncpy+0x10>
8010427b:	8b 45 08             	mov    0x8(%ebp),%eax
8010427e:	5b                   	pop    %ebx
8010427f:	5e                   	pop    %esi
80104280:	5d                   	pop    %ebp
80104281:	c3                   	ret    
80104282:	66 90                	xchg   %ax,%ax
80104284:	8d 5c 32 ff          	lea    -0x1(%edx,%esi,1),%ebx
80104288:	85 c9                	test   %ecx,%ecx
8010428a:	74 ef                	je     8010427b <strncpy+0x23>
8010428c:	42                   	inc    %edx
8010428d:	c6 42 ff 00          	movb   $0x0,-0x1(%edx)
80104291:	89 d9                	mov    %ebx,%ecx
80104293:	29 d1                	sub    %edx,%ecx
80104295:	85 c9                	test   %ecx,%ecx
80104297:	7f f3                	jg     8010428c <strncpy+0x34>
80104299:	8b 45 08             	mov    0x8(%ebp),%eax
8010429c:	5b                   	pop    %ebx
8010429d:	5e                   	pop    %esi
8010429e:	5d                   	pop    %ebp
8010429f:	c3                   	ret    

801042a0 <safestrcpy>:
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	56                   	push   %esi
801042a4:	53                   	push   %ebx
801042a5:	8b 45 08             	mov    0x8(%ebp),%eax
801042a8:	8b 55 0c             	mov    0xc(%ebp),%edx
801042ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
801042ae:	85 c9                	test   %ecx,%ecx
801042b0:	7e 1d                	jle    801042cf <safestrcpy+0x2f>
801042b2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801042b6:	89 c1                	mov    %eax,%ecx
801042b8:	eb 0e                	jmp    801042c8 <safestrcpy+0x28>
801042ba:	66 90                	xchg   %ax,%ax
801042bc:	42                   	inc    %edx
801042bd:	41                   	inc    %ecx
801042be:	8a 5a ff             	mov    -0x1(%edx),%bl
801042c1:	88 59 ff             	mov    %bl,-0x1(%ecx)
801042c4:	84 db                	test   %bl,%bl
801042c6:	74 04                	je     801042cc <safestrcpy+0x2c>
801042c8:	39 f2                	cmp    %esi,%edx
801042ca:	75 f0                	jne    801042bc <safestrcpy+0x1c>
801042cc:	c6 01 00             	movb   $0x0,(%ecx)
801042cf:	5b                   	pop    %ebx
801042d0:	5e                   	pop    %esi
801042d1:	5d                   	pop    %ebp
801042d2:	c3                   	ret    
801042d3:	90                   	nop

801042d4 <strlen>:
801042d4:	55                   	push   %ebp
801042d5:	89 e5                	mov    %esp,%ebp
801042d7:	8b 55 08             	mov    0x8(%ebp),%edx
801042da:	31 c0                	xor    %eax,%eax
801042dc:	80 3a 00             	cmpb   $0x0,(%edx)
801042df:	74 0a                	je     801042eb <strlen+0x17>
801042e1:	8d 76 00             	lea    0x0(%esi),%esi
801042e4:	40                   	inc    %eax
801042e5:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801042e9:	75 f9                	jne    801042e4 <strlen+0x10>
801042eb:	5d                   	pop    %ebp
801042ec:	c3                   	ret    

801042ed <swtch>:
801042ed:	8b 44 24 04          	mov    0x4(%esp),%eax
801042f1:	8b 54 24 08          	mov    0x8(%esp),%edx
801042f5:	55                   	push   %ebp
801042f6:	53                   	push   %ebx
801042f7:	56                   	push   %esi
801042f8:	57                   	push   %edi
801042f9:	89 20                	mov    %esp,(%eax)
801042fb:	89 d4                	mov    %edx,%esp
801042fd:	5f                   	pop    %edi
801042fe:	5e                   	pop    %esi
801042ff:	5b                   	pop    %ebx
80104300:	5d                   	pop    %ebp
80104301:	c3                   	ret    
80104302:	66 90                	xchg   %ax,%ax

80104304 <fetchint>:
80104304:	55                   	push   %ebp
80104305:	89 e5                	mov    %esp,%ebp
80104307:	53                   	push   %ebx
80104308:	50                   	push   %eax
80104309:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010430c:	e8 03 f2 ff ff       	call   80103514 <myproc>
80104311:	8b 00                	mov    (%eax),%eax
80104313:	39 c3                	cmp    %eax,%ebx
80104315:	73 15                	jae    8010432c <fetchint+0x28>
80104317:	8d 53 04             	lea    0x4(%ebx),%edx
8010431a:	39 d0                	cmp    %edx,%eax
8010431c:	72 0e                	jb     8010432c <fetchint+0x28>
8010431e:	8b 13                	mov    (%ebx),%edx
80104320:	8b 45 0c             	mov    0xc(%ebp),%eax
80104323:	89 10                	mov    %edx,(%eax)
80104325:	31 c0                	xor    %eax,%eax
80104327:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010432a:	c9                   	leave  
8010432b:	c3                   	ret    
8010432c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104331:	eb f4                	jmp    80104327 <fetchint+0x23>
80104333:	90                   	nop

80104334 <fetchstr>:
80104334:	55                   	push   %ebp
80104335:	89 e5                	mov    %esp,%ebp
80104337:	53                   	push   %ebx
80104338:	50                   	push   %eax
80104339:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010433c:	e8 d3 f1 ff ff       	call   80103514 <myproc>
80104341:	3b 18                	cmp    (%eax),%ebx
80104343:	73 23                	jae    80104368 <fetchstr+0x34>
80104345:	8b 55 0c             	mov    0xc(%ebp),%edx
80104348:	89 1a                	mov    %ebx,(%edx)
8010434a:	8b 10                	mov    (%eax),%edx
8010434c:	39 d3                	cmp    %edx,%ebx
8010434e:	73 18                	jae    80104368 <fetchstr+0x34>
80104350:	89 d8                	mov    %ebx,%eax
80104352:	eb 05                	jmp    80104359 <fetchstr+0x25>
80104354:	40                   	inc    %eax
80104355:	39 d0                	cmp    %edx,%eax
80104357:	73 0f                	jae    80104368 <fetchstr+0x34>
80104359:	80 38 00             	cmpb   $0x0,(%eax)
8010435c:	75 f6                	jne    80104354 <fetchstr+0x20>
8010435e:	29 d8                	sub    %ebx,%eax
80104360:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104363:	c9                   	leave  
80104364:	c3                   	ret    
80104365:	8d 76 00             	lea    0x0(%esi),%esi
80104368:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010436d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104370:	c9                   	leave  
80104371:	c3                   	ret    
80104372:	66 90                	xchg   %ax,%ax

80104374 <argint>:
80104374:	55                   	push   %ebp
80104375:	89 e5                	mov    %esp,%ebp
80104377:	56                   	push   %esi
80104378:	53                   	push   %ebx
80104379:	e8 96 f1 ff ff       	call   80103514 <myproc>
8010437e:	8b 40 18             	mov    0x18(%eax),%eax
80104381:	8b 40 44             	mov    0x44(%eax),%eax
80104384:	8b 55 08             	mov    0x8(%ebp),%edx
80104387:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
8010438a:	8d 73 04             	lea    0x4(%ebx),%esi
8010438d:	e8 82 f1 ff ff       	call   80103514 <myproc>
80104392:	8b 00                	mov    (%eax),%eax
80104394:	39 c6                	cmp    %eax,%esi
80104396:	73 18                	jae    801043b0 <argint+0x3c>
80104398:	8d 53 08             	lea    0x8(%ebx),%edx
8010439b:	39 d0                	cmp    %edx,%eax
8010439d:	72 11                	jb     801043b0 <argint+0x3c>
8010439f:	8b 53 04             	mov    0x4(%ebx),%edx
801043a2:	8b 45 0c             	mov    0xc(%ebp),%eax
801043a5:	89 10                	mov    %edx,(%eax)
801043a7:	31 c0                	xor    %eax,%eax
801043a9:	5b                   	pop    %ebx
801043aa:	5e                   	pop    %esi
801043ab:	5d                   	pop    %ebp
801043ac:	c3                   	ret    
801043ad:	8d 76 00             	lea    0x0(%esi),%esi
801043b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043b5:	eb f2                	jmp    801043a9 <argint+0x35>
801043b7:	90                   	nop

801043b8 <argptr>:
801043b8:	55                   	push   %ebp
801043b9:	89 e5                	mov    %esp,%ebp
801043bb:	57                   	push   %edi
801043bc:	56                   	push   %esi
801043bd:	53                   	push   %ebx
801043be:	83 ec 0c             	sub    $0xc,%esp
801043c1:	e8 4e f1 ff ff       	call   80103514 <myproc>
801043c6:	89 c6                	mov    %eax,%esi
801043c8:	e8 47 f1 ff ff       	call   80103514 <myproc>
801043cd:	8b 40 18             	mov    0x18(%eax),%eax
801043d0:	8b 40 44             	mov    0x44(%eax),%eax
801043d3:	8b 55 08             	mov    0x8(%ebp),%edx
801043d6:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
801043d9:	8d 7b 04             	lea    0x4(%ebx),%edi
801043dc:	e8 33 f1 ff ff       	call   80103514 <myproc>
801043e1:	8b 00                	mov    (%eax),%eax
801043e3:	39 c7                	cmp    %eax,%edi
801043e5:	73 31                	jae    80104418 <argptr+0x60>
801043e7:	8d 4b 08             	lea    0x8(%ebx),%ecx
801043ea:	39 c8                	cmp    %ecx,%eax
801043ec:	72 2a                	jb     80104418 <argptr+0x60>
801043ee:	8b 43 04             	mov    0x4(%ebx),%eax
801043f1:	8b 55 10             	mov    0x10(%ebp),%edx
801043f4:	85 d2                	test   %edx,%edx
801043f6:	78 20                	js     80104418 <argptr+0x60>
801043f8:	8b 16                	mov    (%esi),%edx
801043fa:	39 d0                	cmp    %edx,%eax
801043fc:	73 1a                	jae    80104418 <argptr+0x60>
801043fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104401:	01 c3                	add    %eax,%ebx
80104403:	39 da                	cmp    %ebx,%edx
80104405:	72 11                	jb     80104418 <argptr+0x60>
80104407:	8b 55 0c             	mov    0xc(%ebp),%edx
8010440a:	89 02                	mov    %eax,(%edx)
8010440c:	31 c0                	xor    %eax,%eax
8010440e:	83 c4 0c             	add    $0xc,%esp
80104411:	5b                   	pop    %ebx
80104412:	5e                   	pop    %esi
80104413:	5f                   	pop    %edi
80104414:	5d                   	pop    %ebp
80104415:	c3                   	ret    
80104416:	66 90                	xchg   %ax,%ax
80104418:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010441d:	eb ef                	jmp    8010440e <argptr+0x56>
8010441f:	90                   	nop

80104420 <argstr>:
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	56                   	push   %esi
80104424:	53                   	push   %ebx
80104425:	e8 ea f0 ff ff       	call   80103514 <myproc>
8010442a:	8b 40 18             	mov    0x18(%eax),%eax
8010442d:	8b 40 44             	mov    0x44(%eax),%eax
80104430:	8b 55 08             	mov    0x8(%ebp),%edx
80104433:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104436:	8d 73 04             	lea    0x4(%ebx),%esi
80104439:	e8 d6 f0 ff ff       	call   80103514 <myproc>
8010443e:	8b 00                	mov    (%eax),%eax
80104440:	39 c6                	cmp    %eax,%esi
80104442:	73 34                	jae    80104478 <argstr+0x58>
80104444:	8d 53 08             	lea    0x8(%ebx),%edx
80104447:	39 d0                	cmp    %edx,%eax
80104449:	72 2d                	jb     80104478 <argstr+0x58>
8010444b:	8b 5b 04             	mov    0x4(%ebx),%ebx
8010444e:	e8 c1 f0 ff ff       	call   80103514 <myproc>
80104453:	3b 18                	cmp    (%eax),%ebx
80104455:	73 21                	jae    80104478 <argstr+0x58>
80104457:	8b 55 0c             	mov    0xc(%ebp),%edx
8010445a:	89 1a                	mov    %ebx,(%edx)
8010445c:	8b 10                	mov    (%eax),%edx
8010445e:	39 d3                	cmp    %edx,%ebx
80104460:	73 16                	jae    80104478 <argstr+0x58>
80104462:	89 d8                	mov    %ebx,%eax
80104464:	eb 07                	jmp    8010446d <argstr+0x4d>
80104466:	66 90                	xchg   %ax,%ax
80104468:	40                   	inc    %eax
80104469:	39 d0                	cmp    %edx,%eax
8010446b:	73 0b                	jae    80104478 <argstr+0x58>
8010446d:	80 38 00             	cmpb   $0x0,(%eax)
80104470:	75 f6                	jne    80104468 <argstr+0x48>
80104472:	29 d8                	sub    %ebx,%eax
80104474:	5b                   	pop    %ebx
80104475:	5e                   	pop    %esi
80104476:	5d                   	pop    %ebp
80104477:	c3                   	ret    
80104478:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010447d:	5b                   	pop    %ebx
8010447e:	5e                   	pop    %esi
8010447f:	5d                   	pop    %ebp
80104480:	c3                   	ret    
80104481:	8d 76 00             	lea    0x0(%esi),%esi

80104484 <syscall>:
80104484:	55                   	push   %ebp
80104485:	89 e5                	mov    %esp,%ebp
80104487:	53                   	push   %ebx
80104488:	50                   	push   %eax
80104489:	e8 86 f0 ff ff       	call   80103514 <myproc>
8010448e:	89 c3                	mov    %eax,%ebx
80104490:	8b 40 18             	mov    0x18(%eax),%eax
80104493:	8b 40 1c             	mov    0x1c(%eax),%eax
80104496:	8d 50 ff             	lea    -0x1(%eax),%edx
80104499:	83 fa 15             	cmp    $0x15,%edx
8010449c:	77 1a                	ja     801044b8 <syscall+0x34>
8010449e:	8b 14 85 80 6f 10 80 	mov    -0x7fef9080(,%eax,4),%edx
801044a5:	85 d2                	test   %edx,%edx
801044a7:	74 0f                	je     801044b8 <syscall+0x34>
801044a9:	ff d2                	call   *%edx
801044ab:	89 c2                	mov    %eax,%edx
801044ad:	8b 43 18             	mov    0x18(%ebx),%eax
801044b0:	89 50 1c             	mov    %edx,0x1c(%eax)
801044b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044b6:	c9                   	leave  
801044b7:	c3                   	ret    
801044b8:	50                   	push   %eax
801044b9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801044bc:	50                   	push   %eax
801044bd:	ff 73 10             	pushl  0x10(%ebx)
801044c0:	68 5d 6f 10 80       	push   $0x80106f5d
801044c5:	e8 5e c1 ff ff       	call   80100628 <cprintf>
801044ca:	8b 43 18             	mov    0x18(%ebx),%eax
801044cd:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
801044d4:	83 c4 10             	add    $0x10,%esp
801044d7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801044da:	c9                   	leave  
801044db:	c3                   	ret    

801044dc <create>:
801044dc:	55                   	push   %ebp
801044dd:	89 e5                	mov    %esp,%ebp
801044df:	57                   	push   %edi
801044e0:	56                   	push   %esi
801044e1:	53                   	push   %ebx
801044e2:	83 ec 34             	sub    $0x34,%esp
801044e5:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801044e8:	89 4d d0             	mov    %ecx,-0x30(%ebp)
801044eb:	8b 4d 08             	mov    0x8(%ebp),%ecx
801044ee:	89 4d cc             	mov    %ecx,-0x34(%ebp)
801044f1:	8d 7d da             	lea    -0x26(%ebp),%edi
801044f4:	57                   	push   %edi
801044f5:	50                   	push   %eax
801044f6:	e8 bd d9 ff ff       	call   80101eb8 <nameiparent>
801044fb:	83 c4 10             	add    $0x10,%esp
801044fe:	85 c0                	test   %eax,%eax
80104500:	74 5a                	je     8010455c <create+0x80>
80104502:	89 c3                	mov    %eax,%ebx
80104504:	83 ec 0c             	sub    $0xc,%esp
80104507:	50                   	push   %eax
80104508:	e8 07 d1 ff ff       	call   80101614 <ilock>
8010450d:	83 c4 0c             	add    $0xc,%esp
80104510:	6a 00                	push   $0x0
80104512:	57                   	push   %edi
80104513:	53                   	push   %ebx
80104514:	e8 ff d5 ff ff       	call   80101b18 <dirlookup>
80104519:	89 c6                	mov    %eax,%esi
8010451b:	83 c4 10             	add    $0x10,%esp
8010451e:	85 c0                	test   %eax,%eax
80104520:	74 46                	je     80104568 <create+0x8c>
80104522:	83 ec 0c             	sub    $0xc,%esp
80104525:	53                   	push   %ebx
80104526:	e8 3d d3 ff ff       	call   80101868 <iunlockput>
8010452b:	89 34 24             	mov    %esi,(%esp)
8010452e:	e8 e1 d0 ff ff       	call   80101614 <ilock>
80104533:	83 c4 10             	add    $0x10,%esp
80104536:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
8010453b:	75 13                	jne    80104550 <create+0x74>
8010453d:	66 83 7e 50 02       	cmpw   $0x2,0x50(%esi)
80104542:	75 0c                	jne    80104550 <create+0x74>
80104544:	89 f0                	mov    %esi,%eax
80104546:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104549:	5b                   	pop    %ebx
8010454a:	5e                   	pop    %esi
8010454b:	5f                   	pop    %edi
8010454c:	5d                   	pop    %ebp
8010454d:	c3                   	ret    
8010454e:	66 90                	xchg   %ax,%ax
80104550:	83 ec 0c             	sub    $0xc,%esp
80104553:	56                   	push   %esi
80104554:	e8 0f d3 ff ff       	call   80101868 <iunlockput>
80104559:	83 c4 10             	add    $0x10,%esp
8010455c:	31 f6                	xor    %esi,%esi
8010455e:	89 f0                	mov    %esi,%eax
80104560:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104563:	5b                   	pop    %ebx
80104564:	5e                   	pop    %esi
80104565:	5f                   	pop    %edi
80104566:	5d                   	pop    %ebp
80104567:	c3                   	ret    
80104568:	83 ec 08             	sub    $0x8,%esp
8010456b:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
8010456f:	50                   	push   %eax
80104570:	ff 33                	pushl  (%ebx)
80104572:	e8 45 cf ff ff       	call   801014bc <ialloc>
80104577:	89 c6                	mov    %eax,%esi
80104579:	83 c4 10             	add    $0x10,%esp
8010457c:	85 c0                	test   %eax,%eax
8010457e:	0f 84 ad 00 00 00    	je     80104631 <create+0x155>
80104584:	83 ec 0c             	sub    $0xc,%esp
80104587:	50                   	push   %eax
80104588:	e8 87 d0 ff ff       	call   80101614 <ilock>
8010458d:	8b 45 d0             	mov    -0x30(%ebp),%eax
80104590:	66 89 46 52          	mov    %ax,0x52(%esi)
80104594:	8b 45 cc             	mov    -0x34(%ebp),%eax
80104597:	66 89 46 54          	mov    %ax,0x54(%esi)
8010459b:	66 c7 46 56 01 00    	movw   $0x1,0x56(%esi)
801045a1:	89 34 24             	mov    %esi,(%esp)
801045a4:	e8 c3 cf ff ff       	call   8010156c <iupdate>
801045a9:	83 c4 10             	add    $0x10,%esp
801045ac:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801045b1:	74 29                	je     801045dc <create+0x100>
801045b3:	50                   	push   %eax
801045b4:	ff 76 04             	pushl  0x4(%esi)
801045b7:	57                   	push   %edi
801045b8:	53                   	push   %ebx
801045b9:	e8 32 d8 ff ff       	call   80101df0 <dirlink>
801045be:	83 c4 10             	add    $0x10,%esp
801045c1:	85 c0                	test   %eax,%eax
801045c3:	78 5f                	js     80104624 <create+0x148>
801045c5:	83 ec 0c             	sub    $0xc,%esp
801045c8:	53                   	push   %ebx
801045c9:	e8 9a d2 ff ff       	call   80101868 <iunlockput>
801045ce:	83 c4 10             	add    $0x10,%esp
801045d1:	89 f0                	mov    %esi,%eax
801045d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801045d6:	5b                   	pop    %ebx
801045d7:	5e                   	pop    %esi
801045d8:	5f                   	pop    %edi
801045d9:	5d                   	pop    %ebp
801045da:	c3                   	ret    
801045db:	90                   	nop
801045dc:	66 ff 43 56          	incw   0x56(%ebx)
801045e0:	83 ec 0c             	sub    $0xc,%esp
801045e3:	53                   	push   %ebx
801045e4:	e8 83 cf ff ff       	call   8010156c <iupdate>
801045e9:	83 c4 0c             	add    $0xc,%esp
801045ec:	ff 76 04             	pushl  0x4(%esi)
801045ef:	68 f8 6f 10 80       	push   $0x80106ff8
801045f4:	56                   	push   %esi
801045f5:	e8 f6 d7 ff ff       	call   80101df0 <dirlink>
801045fa:	83 c4 10             	add    $0x10,%esp
801045fd:	85 c0                	test   %eax,%eax
801045ff:	78 16                	js     80104617 <create+0x13b>
80104601:	52                   	push   %edx
80104602:	ff 73 04             	pushl  0x4(%ebx)
80104605:	68 f7 6f 10 80       	push   $0x80106ff7
8010460a:	56                   	push   %esi
8010460b:	e8 e0 d7 ff ff       	call   80101df0 <dirlink>
80104610:	83 c4 10             	add    $0x10,%esp
80104613:	85 c0                	test   %eax,%eax
80104615:	79 9c                	jns    801045b3 <create+0xd7>
80104617:	83 ec 0c             	sub    $0xc,%esp
8010461a:	68 eb 6f 10 80       	push   $0x80106feb
8010461f:	e8 14 bd ff ff       	call   80100338 <panic>
80104624:	83 ec 0c             	sub    $0xc,%esp
80104627:	68 fa 6f 10 80       	push   $0x80106ffa
8010462c:	e8 07 bd ff ff       	call   80100338 <panic>
80104631:	83 ec 0c             	sub    $0xc,%esp
80104634:	68 dc 6f 10 80       	push   $0x80106fdc
80104639:	e8 fa bc ff ff       	call   80100338 <panic>
8010463e:	66 90                	xchg   %ax,%ax

80104640 <sys_dup>:
80104640:	55                   	push   %ebp
80104641:	89 e5                	mov    %esp,%ebp
80104643:	56                   	push   %esi
80104644:	53                   	push   %ebx
80104645:	83 ec 18             	sub    $0x18,%esp
80104648:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010464b:	50                   	push   %eax
8010464c:	6a 00                	push   $0x0
8010464e:	e8 21 fd ff ff       	call   80104374 <argint>
80104653:	83 c4 10             	add    $0x10,%esp
80104656:	85 c0                	test   %eax,%eax
80104658:	78 2c                	js     80104686 <sys_dup+0x46>
8010465a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010465e:	77 26                	ja     80104686 <sys_dup+0x46>
80104660:	e8 af ee ff ff       	call   80103514 <myproc>
80104665:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104668:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
8010466c:	85 f6                	test   %esi,%esi
8010466e:	74 16                	je     80104686 <sys_dup+0x46>
80104670:	e8 9f ee ff ff       	call   80103514 <myproc>
80104675:	31 db                	xor    %ebx,%ebx
80104677:	90                   	nop
80104678:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
8010467c:	85 d2                	test   %edx,%edx
8010467e:	74 14                	je     80104694 <sys_dup+0x54>
80104680:	43                   	inc    %ebx
80104681:	83 fb 10             	cmp    $0x10,%ebx
80104684:	75 f2                	jne    80104678 <sys_dup+0x38>
80104686:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010468b:	89 d8                	mov    %ebx,%eax
8010468d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104690:	5b                   	pop    %ebx
80104691:	5e                   	pop    %esi
80104692:	5d                   	pop    %ebp
80104693:	c3                   	ret    
80104694:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104698:	83 ec 0c             	sub    $0xc,%esp
8010469b:	56                   	push   %esi
8010469c:	e8 5f c7 ff ff       	call   80100e00 <filedup>
801046a1:	83 c4 10             	add    $0x10,%esp
801046a4:	89 d8                	mov    %ebx,%eax
801046a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046a9:	5b                   	pop    %ebx
801046aa:	5e                   	pop    %esi
801046ab:	5d                   	pop    %ebp
801046ac:	c3                   	ret    
801046ad:	8d 76 00             	lea    0x0(%esi),%esi

801046b0 <sys_read>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	56                   	push   %esi
801046b4:	53                   	push   %ebx
801046b5:	83 ec 10             	sub    $0x10,%esp
801046b8:	e8 57 ee ff ff       	call   80103514 <myproc>
801046bd:	ff 40 7c             	incl   0x7c(%eax)
801046c0:	83 ec 08             	sub    $0x8,%esp
801046c3:	8d 5d f4             	lea    -0xc(%ebp),%ebx
801046c6:	53                   	push   %ebx
801046c7:	6a 00                	push   $0x0
801046c9:	e8 a6 fc ff ff       	call   80104374 <argint>
801046ce:	83 c4 10             	add    $0x10,%esp
801046d1:	85 c0                	test   %eax,%eax
801046d3:	78 57                	js     8010472c <sys_read+0x7c>
801046d5:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801046d9:	77 51                	ja     8010472c <sys_read+0x7c>
801046db:	e8 34 ee ff ff       	call   80103514 <myproc>
801046e0:	8b 55 f4             	mov    -0xc(%ebp),%edx
801046e3:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
801046e7:	85 f6                	test   %esi,%esi
801046e9:	74 41                	je     8010472c <sys_read+0x7c>
801046eb:	83 ec 08             	sub    $0x8,%esp
801046ee:	8d 45 f0             	lea    -0x10(%ebp),%eax
801046f1:	50                   	push   %eax
801046f2:	6a 02                	push   $0x2
801046f4:	e8 7b fc ff ff       	call   80104374 <argint>
801046f9:	83 c4 10             	add    $0x10,%esp
801046fc:	85 c0                	test   %eax,%eax
801046fe:	78 2c                	js     8010472c <sys_read+0x7c>
80104700:	52                   	push   %edx
80104701:	ff 75 f0             	pushl  -0x10(%ebp)
80104704:	53                   	push   %ebx
80104705:	6a 01                	push   $0x1
80104707:	e8 ac fc ff ff       	call   801043b8 <argptr>
8010470c:	83 c4 10             	add    $0x10,%esp
8010470f:	85 c0                	test   %eax,%eax
80104711:	78 19                	js     8010472c <sys_read+0x7c>
80104713:	50                   	push   %eax
80104714:	ff 75 f0             	pushl  -0x10(%ebp)
80104717:	ff 75 f4             	pushl  -0xc(%ebp)
8010471a:	56                   	push   %esi
8010471b:	e8 28 c8 ff ff       	call   80100f48 <fileread>
80104720:	83 c4 10             	add    $0x10,%esp
80104723:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104726:	5b                   	pop    %ebx
80104727:	5e                   	pop    %esi
80104728:	5d                   	pop    %ebp
80104729:	c3                   	ret    
8010472a:	66 90                	xchg   %ax,%ax
8010472c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104731:	eb f0                	jmp    80104723 <sys_read+0x73>
80104733:	90                   	nop

80104734 <sys_write>:
80104734:	55                   	push   %ebp
80104735:	89 e5                	mov    %esp,%ebp
80104737:	56                   	push   %esi
80104738:	53                   	push   %ebx
80104739:	83 ec 18             	sub    $0x18,%esp
8010473c:	8d 5d f4             	lea    -0xc(%ebp),%ebx
8010473f:	53                   	push   %ebx
80104740:	6a 00                	push   $0x0
80104742:	e8 2d fc ff ff       	call   80104374 <argint>
80104747:	83 c4 10             	add    $0x10,%esp
8010474a:	85 c0                	test   %eax,%eax
8010474c:	78 56                	js     801047a4 <sys_write+0x70>
8010474e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104752:	77 50                	ja     801047a4 <sys_write+0x70>
80104754:	e8 bb ed ff ff       	call   80103514 <myproc>
80104759:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010475c:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104760:	85 f6                	test   %esi,%esi
80104762:	74 40                	je     801047a4 <sys_write+0x70>
80104764:	83 ec 08             	sub    $0x8,%esp
80104767:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010476a:	50                   	push   %eax
8010476b:	6a 02                	push   $0x2
8010476d:	e8 02 fc ff ff       	call   80104374 <argint>
80104772:	83 c4 10             	add    $0x10,%esp
80104775:	85 c0                	test   %eax,%eax
80104777:	78 2b                	js     801047a4 <sys_write+0x70>
80104779:	52                   	push   %edx
8010477a:	ff 75 f0             	pushl  -0x10(%ebp)
8010477d:	53                   	push   %ebx
8010477e:	6a 01                	push   $0x1
80104780:	e8 33 fc ff ff       	call   801043b8 <argptr>
80104785:	83 c4 10             	add    $0x10,%esp
80104788:	85 c0                	test   %eax,%eax
8010478a:	78 18                	js     801047a4 <sys_write+0x70>
8010478c:	50                   	push   %eax
8010478d:	ff 75 f0             	pushl  -0x10(%ebp)
80104790:	ff 75 f4             	pushl  -0xc(%ebp)
80104793:	56                   	push   %esi
80104794:	e8 3b c8 ff ff       	call   80100fd4 <filewrite>
80104799:	83 c4 10             	add    $0x10,%esp
8010479c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010479f:	5b                   	pop    %ebx
801047a0:	5e                   	pop    %esi
801047a1:	5d                   	pop    %ebp
801047a2:	c3                   	ret    
801047a3:	90                   	nop
801047a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047a9:	eb f1                	jmp    8010479c <sys_write+0x68>
801047ab:	90                   	nop

801047ac <sys_close>:
801047ac:	55                   	push   %ebp
801047ad:	89 e5                	mov    %esp,%ebp
801047af:	56                   	push   %esi
801047b0:	53                   	push   %ebx
801047b1:	83 ec 18             	sub    $0x18,%esp
801047b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047b7:	50                   	push   %eax
801047b8:	6a 00                	push   $0x0
801047ba:	e8 b5 fb ff ff       	call   80104374 <argint>
801047bf:	83 c4 10             	add    $0x10,%esp
801047c2:	85 c0                	test   %eax,%eax
801047c4:	78 3e                	js     80104804 <sys_close+0x58>
801047c6:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801047ca:	77 38                	ja     80104804 <sys_close+0x58>
801047cc:	e8 43 ed ff ff       	call   80103514 <myproc>
801047d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
801047d4:	8d 5a 08             	lea    0x8(%edx),%ebx
801047d7:	8b 74 98 08          	mov    0x8(%eax,%ebx,4),%esi
801047db:	85 f6                	test   %esi,%esi
801047dd:	74 25                	je     80104804 <sys_close+0x58>
801047df:	e8 30 ed ff ff       	call   80103514 <myproc>
801047e4:	c7 44 98 08 00 00 00 	movl   $0x0,0x8(%eax,%ebx,4)
801047eb:	00 
801047ec:	83 ec 0c             	sub    $0xc,%esp
801047ef:	56                   	push   %esi
801047f0:	e8 4f c6 ff ff       	call   80100e44 <fileclose>
801047f5:	83 c4 10             	add    $0x10,%esp
801047f8:	31 c0                	xor    %eax,%eax
801047fa:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047fd:	5b                   	pop    %ebx
801047fe:	5e                   	pop    %esi
801047ff:	5d                   	pop    %ebp
80104800:	c3                   	ret    
80104801:	8d 76 00             	lea    0x0(%esi),%esi
80104804:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104809:	eb ef                	jmp    801047fa <sys_close+0x4e>
8010480b:	90                   	nop

8010480c <sys_fstat>:
8010480c:	55                   	push   %ebp
8010480d:	89 e5                	mov    %esp,%ebp
8010480f:	56                   	push   %esi
80104810:	53                   	push   %ebx
80104811:	83 ec 18             	sub    $0x18,%esp
80104814:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80104817:	53                   	push   %ebx
80104818:	6a 00                	push   $0x0
8010481a:	e8 55 fb ff ff       	call   80104374 <argint>
8010481f:	83 c4 10             	add    $0x10,%esp
80104822:	85 c0                	test   %eax,%eax
80104824:	78 3e                	js     80104864 <sys_fstat+0x58>
80104826:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
8010482a:	77 38                	ja     80104864 <sys_fstat+0x58>
8010482c:	e8 e3 ec ff ff       	call   80103514 <myproc>
80104831:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104834:	8b 74 90 28          	mov    0x28(%eax,%edx,4),%esi
80104838:	85 f6                	test   %esi,%esi
8010483a:	74 28                	je     80104864 <sys_fstat+0x58>
8010483c:	50                   	push   %eax
8010483d:	6a 14                	push   $0x14
8010483f:	53                   	push   %ebx
80104840:	6a 01                	push   $0x1
80104842:	e8 71 fb ff ff       	call   801043b8 <argptr>
80104847:	83 c4 10             	add    $0x10,%esp
8010484a:	85 c0                	test   %eax,%eax
8010484c:	78 16                	js     80104864 <sys_fstat+0x58>
8010484e:	83 ec 08             	sub    $0x8,%esp
80104851:	ff 75 f4             	pushl  -0xc(%ebp)
80104854:	56                   	push   %esi
80104855:	e8 aa c6 ff ff       	call   80100f04 <filestat>
8010485a:	83 c4 10             	add    $0x10,%esp
8010485d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104860:	5b                   	pop    %ebx
80104861:	5e                   	pop    %esi
80104862:	5d                   	pop    %ebp
80104863:	c3                   	ret    
80104864:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104869:	eb f2                	jmp    8010485d <sys_fstat+0x51>
8010486b:	90                   	nop

8010486c <sys_link>:
8010486c:	55                   	push   %ebp
8010486d:	89 e5                	mov    %esp,%ebp
8010486f:	57                   	push   %edi
80104870:	56                   	push   %esi
80104871:	53                   	push   %ebx
80104872:	83 ec 34             	sub    $0x34,%esp
80104875:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104878:	50                   	push   %eax
80104879:	6a 00                	push   $0x0
8010487b:	e8 a0 fb ff ff       	call   80104420 <argstr>
80104880:	83 c4 10             	add    $0x10,%esp
80104883:	85 c0                	test   %eax,%eax
80104885:	0f 88 f2 00 00 00    	js     8010497d <sys_link+0x111>
8010488b:	83 ec 08             	sub    $0x8,%esp
8010488e:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104891:	50                   	push   %eax
80104892:	6a 01                	push   $0x1
80104894:	e8 87 fb ff ff       	call   80104420 <argstr>
80104899:	83 c4 10             	add    $0x10,%esp
8010489c:	85 c0                	test   %eax,%eax
8010489e:	0f 88 d9 00 00 00    	js     8010497d <sys_link+0x111>
801048a4:	e8 23 e1 ff ff       	call   801029cc <begin_op>
801048a9:	83 ec 0c             	sub    $0xc,%esp
801048ac:	ff 75 d4             	pushl  -0x2c(%ebp)
801048af:	e8 ec d5 ff ff       	call   80101ea0 <namei>
801048b4:	89 c3                	mov    %eax,%ebx
801048b6:	83 c4 10             	add    $0x10,%esp
801048b9:	85 c0                	test   %eax,%eax
801048bb:	0f 84 d6 00 00 00    	je     80104997 <sys_link+0x12b>
801048c1:	83 ec 0c             	sub    $0xc,%esp
801048c4:	50                   	push   %eax
801048c5:	e8 4a cd ff ff       	call   80101614 <ilock>
801048ca:	83 c4 10             	add    $0x10,%esp
801048cd:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801048d2:	0f 84 ac 00 00 00    	je     80104984 <sys_link+0x118>
801048d8:	66 ff 43 56          	incw   0x56(%ebx)
801048dc:	83 ec 0c             	sub    $0xc,%esp
801048df:	53                   	push   %ebx
801048e0:	e8 87 cc ff ff       	call   8010156c <iupdate>
801048e5:	89 1c 24             	mov    %ebx,(%esp)
801048e8:	e8 ef cd ff ff       	call   801016dc <iunlock>
801048ed:	5a                   	pop    %edx
801048ee:	59                   	pop    %ecx
801048ef:	8d 7d da             	lea    -0x26(%ebp),%edi
801048f2:	57                   	push   %edi
801048f3:	ff 75 d0             	pushl  -0x30(%ebp)
801048f6:	e8 bd d5 ff ff       	call   80101eb8 <nameiparent>
801048fb:	89 c6                	mov    %eax,%esi
801048fd:	83 c4 10             	add    $0x10,%esp
80104900:	85 c0                	test   %eax,%eax
80104902:	74 54                	je     80104958 <sys_link+0xec>
80104904:	83 ec 0c             	sub    $0xc,%esp
80104907:	50                   	push   %eax
80104908:	e8 07 cd ff ff       	call   80101614 <ilock>
8010490d:	83 c4 10             	add    $0x10,%esp
80104910:	8b 03                	mov    (%ebx),%eax
80104912:	39 06                	cmp    %eax,(%esi)
80104914:	75 36                	jne    8010494c <sys_link+0xe0>
80104916:	50                   	push   %eax
80104917:	ff 73 04             	pushl  0x4(%ebx)
8010491a:	57                   	push   %edi
8010491b:	56                   	push   %esi
8010491c:	e8 cf d4 ff ff       	call   80101df0 <dirlink>
80104921:	83 c4 10             	add    $0x10,%esp
80104924:	85 c0                	test   %eax,%eax
80104926:	78 24                	js     8010494c <sys_link+0xe0>
80104928:	83 ec 0c             	sub    $0xc,%esp
8010492b:	56                   	push   %esi
8010492c:	e8 37 cf ff ff       	call   80101868 <iunlockput>
80104931:	89 1c 24             	mov    %ebx,(%esp)
80104934:	e8 e7 cd ff ff       	call   80101720 <iput>
80104939:	e8 f6 e0 ff ff       	call   80102a34 <end_op>
8010493e:	83 c4 10             	add    $0x10,%esp
80104941:	31 c0                	xor    %eax,%eax
80104943:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104946:	5b                   	pop    %ebx
80104947:	5e                   	pop    %esi
80104948:	5f                   	pop    %edi
80104949:	5d                   	pop    %ebp
8010494a:	c3                   	ret    
8010494b:	90                   	nop
8010494c:	83 ec 0c             	sub    $0xc,%esp
8010494f:	56                   	push   %esi
80104950:	e8 13 cf ff ff       	call   80101868 <iunlockput>
80104955:	83 c4 10             	add    $0x10,%esp
80104958:	83 ec 0c             	sub    $0xc,%esp
8010495b:	53                   	push   %ebx
8010495c:	e8 b3 cc ff ff       	call   80101614 <ilock>
80104961:	66 ff 4b 56          	decw   0x56(%ebx)
80104965:	89 1c 24             	mov    %ebx,(%esp)
80104968:	e8 ff cb ff ff       	call   8010156c <iupdate>
8010496d:	89 1c 24             	mov    %ebx,(%esp)
80104970:	e8 f3 ce ff ff       	call   80101868 <iunlockput>
80104975:	e8 ba e0 ff ff       	call   80102a34 <end_op>
8010497a:	83 c4 10             	add    $0x10,%esp
8010497d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104982:	eb bf                	jmp    80104943 <sys_link+0xd7>
80104984:	83 ec 0c             	sub    $0xc,%esp
80104987:	53                   	push   %ebx
80104988:	e8 db ce ff ff       	call   80101868 <iunlockput>
8010498d:	e8 a2 e0 ff ff       	call   80102a34 <end_op>
80104992:	83 c4 10             	add    $0x10,%esp
80104995:	eb e6                	jmp    8010497d <sys_link+0x111>
80104997:	e8 98 e0 ff ff       	call   80102a34 <end_op>
8010499c:	eb df                	jmp    8010497d <sys_link+0x111>
8010499e:	66 90                	xchg   %ax,%ax

801049a0 <sys_unlink>:
801049a0:	55                   	push   %ebp
801049a1:	89 e5                	mov    %esp,%ebp
801049a3:	57                   	push   %edi
801049a4:	56                   	push   %esi
801049a5:	53                   	push   %ebx
801049a6:	83 ec 54             	sub    $0x54,%esp
801049a9:	8d 45 c0             	lea    -0x40(%ebp),%eax
801049ac:	50                   	push   %eax
801049ad:	6a 00                	push   $0x0
801049af:	e8 6c fa ff ff       	call   80104420 <argstr>
801049b4:	83 c4 10             	add    $0x10,%esp
801049b7:	85 c0                	test   %eax,%eax
801049b9:	0f 88 50 01 00 00    	js     80104b0f <sys_unlink+0x16f>
801049bf:	e8 08 e0 ff ff       	call   801029cc <begin_op>
801049c4:	83 ec 08             	sub    $0x8,%esp
801049c7:	8d 5d ca             	lea    -0x36(%ebp),%ebx
801049ca:	53                   	push   %ebx
801049cb:	ff 75 c0             	pushl  -0x40(%ebp)
801049ce:	e8 e5 d4 ff ff       	call   80101eb8 <nameiparent>
801049d3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
801049d6:	83 c4 10             	add    $0x10,%esp
801049d9:	85 c0                	test   %eax,%eax
801049db:	0f 84 4f 01 00 00    	je     80104b30 <sys_unlink+0x190>
801049e1:	83 ec 0c             	sub    $0xc,%esp
801049e4:	8b 7d b4             	mov    -0x4c(%ebp),%edi
801049e7:	57                   	push   %edi
801049e8:	e8 27 cc ff ff       	call   80101614 <ilock>
801049ed:	59                   	pop    %ecx
801049ee:	5e                   	pop    %esi
801049ef:	68 f8 6f 10 80       	push   $0x80106ff8
801049f4:	53                   	push   %ebx
801049f5:	e8 06 d1 ff ff       	call   80101b00 <namecmp>
801049fa:	83 c4 10             	add    $0x10,%esp
801049fd:	85 c0                	test   %eax,%eax
801049ff:	0f 84 f7 00 00 00    	je     80104afc <sys_unlink+0x15c>
80104a05:	83 ec 08             	sub    $0x8,%esp
80104a08:	68 f7 6f 10 80       	push   $0x80106ff7
80104a0d:	53                   	push   %ebx
80104a0e:	e8 ed d0 ff ff       	call   80101b00 <namecmp>
80104a13:	83 c4 10             	add    $0x10,%esp
80104a16:	85 c0                	test   %eax,%eax
80104a18:	0f 84 de 00 00 00    	je     80104afc <sys_unlink+0x15c>
80104a1e:	52                   	push   %edx
80104a1f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104a22:	50                   	push   %eax
80104a23:	53                   	push   %ebx
80104a24:	57                   	push   %edi
80104a25:	e8 ee d0 ff ff       	call   80101b18 <dirlookup>
80104a2a:	89 c3                	mov    %eax,%ebx
80104a2c:	83 c4 10             	add    $0x10,%esp
80104a2f:	85 c0                	test   %eax,%eax
80104a31:	0f 84 c5 00 00 00    	je     80104afc <sys_unlink+0x15c>
80104a37:	83 ec 0c             	sub    $0xc,%esp
80104a3a:	50                   	push   %eax
80104a3b:	e8 d4 cb ff ff       	call   80101614 <ilock>
80104a40:	83 c4 10             	add    $0x10,%esp
80104a43:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104a48:	0f 8e 03 01 00 00    	jle    80104b51 <sys_unlink+0x1b1>
80104a4e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a53:	74 67                	je     80104abc <sys_unlink+0x11c>
80104a55:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104a58:	50                   	push   %eax
80104a59:	6a 10                	push   $0x10
80104a5b:	6a 00                	push   $0x0
80104a5d:	57                   	push   %edi
80104a5e:	e8 f5 f6 ff ff       	call   80104158 <memset>
80104a63:	6a 10                	push   $0x10
80104a65:	ff 75 c4             	pushl  -0x3c(%ebp)
80104a68:	57                   	push   %edi
80104a69:	ff 75 b4             	pushl  -0x4c(%ebp)
80104a6c:	e8 73 cf ff ff       	call   801019e4 <writei>
80104a71:	83 c4 20             	add    $0x20,%esp
80104a74:	83 f8 10             	cmp    $0x10,%eax
80104a77:	0f 85 c7 00 00 00    	jne    80104b44 <sys_unlink+0x1a4>
80104a7d:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a82:	0f 84 90 00 00 00    	je     80104b18 <sys_unlink+0x178>
80104a88:	83 ec 0c             	sub    $0xc,%esp
80104a8b:	ff 75 b4             	pushl  -0x4c(%ebp)
80104a8e:	e8 d5 cd ff ff       	call   80101868 <iunlockput>
80104a93:	66 ff 4b 56          	decw   0x56(%ebx)
80104a97:	89 1c 24             	mov    %ebx,(%esp)
80104a9a:	e8 cd ca ff ff       	call   8010156c <iupdate>
80104a9f:	89 1c 24             	mov    %ebx,(%esp)
80104aa2:	e8 c1 cd ff ff       	call   80101868 <iunlockput>
80104aa7:	e8 88 df ff ff       	call   80102a34 <end_op>
80104aac:	83 c4 10             	add    $0x10,%esp
80104aaf:	31 c0                	xor    %eax,%eax
80104ab1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ab4:	5b                   	pop    %ebx
80104ab5:	5e                   	pop    %esi
80104ab6:	5f                   	pop    %edi
80104ab7:	5d                   	pop    %ebp
80104ab8:	c3                   	ret    
80104ab9:	8d 76 00             	lea    0x0(%esi),%esi
80104abc:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104ac0:	76 93                	jbe    80104a55 <sys_unlink+0xb5>
80104ac2:	be 20 00 00 00       	mov    $0x20,%esi
80104ac7:	8d 7d d8             	lea    -0x28(%ebp),%edi
80104aca:	eb 08                	jmp    80104ad4 <sys_unlink+0x134>
80104acc:	83 c6 10             	add    $0x10,%esi
80104acf:	3b 73 58             	cmp    0x58(%ebx),%esi
80104ad2:	73 84                	jae    80104a58 <sys_unlink+0xb8>
80104ad4:	6a 10                	push   $0x10
80104ad6:	56                   	push   %esi
80104ad7:	57                   	push   %edi
80104ad8:	53                   	push   %ebx
80104ad9:	e8 06 ce ff ff       	call   801018e4 <readi>
80104ade:	83 c4 10             	add    $0x10,%esp
80104ae1:	83 f8 10             	cmp    $0x10,%eax
80104ae4:	75 51                	jne    80104b37 <sys_unlink+0x197>
80104ae6:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104aeb:	74 df                	je     80104acc <sys_unlink+0x12c>
80104aed:	83 ec 0c             	sub    $0xc,%esp
80104af0:	53                   	push   %ebx
80104af1:	e8 72 cd ff ff       	call   80101868 <iunlockput>
80104af6:	83 c4 10             	add    $0x10,%esp
80104af9:	8d 76 00             	lea    0x0(%esi),%esi
80104afc:	83 ec 0c             	sub    $0xc,%esp
80104aff:	ff 75 b4             	pushl  -0x4c(%ebp)
80104b02:	e8 61 cd ff ff       	call   80101868 <iunlockput>
80104b07:	e8 28 df ff ff       	call   80102a34 <end_op>
80104b0c:	83 c4 10             	add    $0x10,%esp
80104b0f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b14:	eb 9b                	jmp    80104ab1 <sys_unlink+0x111>
80104b16:	66 90                	xchg   %ax,%ax
80104b18:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104b1b:	66 ff 48 56          	decw   0x56(%eax)
80104b1f:	83 ec 0c             	sub    $0xc,%esp
80104b22:	50                   	push   %eax
80104b23:	e8 44 ca ff ff       	call   8010156c <iupdate>
80104b28:	83 c4 10             	add    $0x10,%esp
80104b2b:	e9 58 ff ff ff       	jmp    80104a88 <sys_unlink+0xe8>
80104b30:	e8 ff de ff ff       	call   80102a34 <end_op>
80104b35:	eb d8                	jmp    80104b0f <sys_unlink+0x16f>
80104b37:	83 ec 0c             	sub    $0xc,%esp
80104b3a:	68 1c 70 10 80       	push   $0x8010701c
80104b3f:	e8 f4 b7 ff ff       	call   80100338 <panic>
80104b44:	83 ec 0c             	sub    $0xc,%esp
80104b47:	68 2e 70 10 80       	push   $0x8010702e
80104b4c:	e8 e7 b7 ff ff       	call   80100338 <panic>
80104b51:	83 ec 0c             	sub    $0xc,%esp
80104b54:	68 0a 70 10 80       	push   $0x8010700a
80104b59:	e8 da b7 ff ff       	call   80100338 <panic>
80104b5e:	66 90                	xchg   %ax,%ax

80104b60 <sys_open>:
80104b60:	55                   	push   %ebp
80104b61:	89 e5                	mov    %esp,%ebp
80104b63:	57                   	push   %edi
80104b64:	56                   	push   %esi
80104b65:	53                   	push   %ebx
80104b66:	83 ec 24             	sub    $0x24,%esp
80104b69:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104b6c:	50                   	push   %eax
80104b6d:	6a 00                	push   $0x0
80104b6f:	e8 ac f8 ff ff       	call   80104420 <argstr>
80104b74:	83 c4 10             	add    $0x10,%esp
80104b77:	85 c0                	test   %eax,%eax
80104b79:	0f 88 88 00 00 00    	js     80104c07 <sys_open+0xa7>
80104b7f:	83 ec 08             	sub    $0x8,%esp
80104b82:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104b85:	50                   	push   %eax
80104b86:	6a 01                	push   $0x1
80104b88:	e8 e7 f7 ff ff       	call   80104374 <argint>
80104b8d:	83 c4 10             	add    $0x10,%esp
80104b90:	85 c0                	test   %eax,%eax
80104b92:	78 73                	js     80104c07 <sys_open+0xa7>
80104b94:	e8 33 de ff ff       	call   801029cc <begin_op>
80104b99:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80104b9d:	75 71                	jne    80104c10 <sys_open+0xb0>
80104b9f:	83 ec 0c             	sub    $0xc,%esp
80104ba2:	ff 75 e0             	pushl  -0x20(%ebp)
80104ba5:	e8 f6 d2 ff ff       	call   80101ea0 <namei>
80104baa:	89 c6                	mov    %eax,%esi
80104bac:	83 c4 10             	add    $0x10,%esp
80104baf:	85 c0                	test   %eax,%eax
80104bb1:	74 7a                	je     80104c2d <sys_open+0xcd>
80104bb3:	83 ec 0c             	sub    $0xc,%esp
80104bb6:	50                   	push   %eax
80104bb7:	e8 58 ca ff ff       	call   80101614 <ilock>
80104bbc:	83 c4 10             	add    $0x10,%esp
80104bbf:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104bc4:	0f 84 ae 00 00 00    	je     80104c78 <sys_open+0x118>
80104bca:	e8 c9 c1 ff ff       	call   80100d98 <filealloc>
80104bcf:	89 c7                	mov    %eax,%edi
80104bd1:	85 c0                	test   %eax,%eax
80104bd3:	74 21                	je     80104bf6 <sys_open+0x96>
80104bd5:	e8 3a e9 ff ff       	call   80103514 <myproc>
80104bda:	31 db                	xor    %ebx,%ebx
80104bdc:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104be0:	85 d2                	test   %edx,%edx
80104be2:	74 50                	je     80104c34 <sys_open+0xd4>
80104be4:	43                   	inc    %ebx
80104be5:	83 fb 10             	cmp    $0x10,%ebx
80104be8:	75 f2                	jne    80104bdc <sys_open+0x7c>
80104bea:	83 ec 0c             	sub    $0xc,%esp
80104bed:	57                   	push   %edi
80104bee:	e8 51 c2 ff ff       	call   80100e44 <fileclose>
80104bf3:	83 c4 10             	add    $0x10,%esp
80104bf6:	83 ec 0c             	sub    $0xc,%esp
80104bf9:	56                   	push   %esi
80104bfa:	e8 69 cc ff ff       	call   80101868 <iunlockput>
80104bff:	e8 30 de ff ff       	call   80102a34 <end_op>
80104c04:	83 c4 10             	add    $0x10,%esp
80104c07:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c0c:	eb 5f                	jmp    80104c6d <sys_open+0x10d>
80104c0e:	66 90                	xchg   %ax,%ax
80104c10:	83 ec 0c             	sub    $0xc,%esp
80104c13:	6a 00                	push   $0x0
80104c15:	31 c9                	xor    %ecx,%ecx
80104c17:	ba 02 00 00 00       	mov    $0x2,%edx
80104c1c:	8b 45 e0             	mov    -0x20(%ebp),%eax
80104c1f:	e8 b8 f8 ff ff       	call   801044dc <create>
80104c24:	89 c6                	mov    %eax,%esi
80104c26:	83 c4 10             	add    $0x10,%esp
80104c29:	85 c0                	test   %eax,%eax
80104c2b:	75 9d                	jne    80104bca <sys_open+0x6a>
80104c2d:	e8 02 de ff ff       	call   80102a34 <end_op>
80104c32:	eb d3                	jmp    80104c07 <sys_open+0xa7>
80104c34:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
80104c38:	83 ec 0c             	sub    $0xc,%esp
80104c3b:	56                   	push   %esi
80104c3c:	e8 9b ca ff ff       	call   801016dc <iunlock>
80104c41:	e8 ee dd ff ff       	call   80102a34 <end_op>
80104c46:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80104c4c:	89 77 10             	mov    %esi,0x10(%edi)
80104c4f:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
80104c56:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80104c59:	89 d0                	mov    %edx,%eax
80104c5b:	f7 d0                	not    %eax
80104c5d:	83 e0 01             	and    $0x1,%eax
80104c60:	88 47 08             	mov    %al,0x8(%edi)
80104c63:	83 c4 10             	add    $0x10,%esp
80104c66:	83 e2 03             	and    $0x3,%edx
80104c69:	0f 95 47 09          	setne  0x9(%edi)
80104c6d:	89 d8                	mov    %ebx,%eax
80104c6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c72:	5b                   	pop    %ebx
80104c73:	5e                   	pop    %esi
80104c74:	5f                   	pop    %edi
80104c75:	5d                   	pop    %ebp
80104c76:	c3                   	ret    
80104c77:	90                   	nop
80104c78:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104c7b:	85 c9                	test   %ecx,%ecx
80104c7d:	0f 84 47 ff ff ff    	je     80104bca <sys_open+0x6a>
80104c83:	e9 6e ff ff ff       	jmp    80104bf6 <sys_open+0x96>

80104c88 <sys_mkdir>:
80104c88:	55                   	push   %ebp
80104c89:	89 e5                	mov    %esp,%ebp
80104c8b:	83 ec 18             	sub    $0x18,%esp
80104c8e:	e8 39 dd ff ff       	call   801029cc <begin_op>
80104c93:	83 ec 08             	sub    $0x8,%esp
80104c96:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c99:	50                   	push   %eax
80104c9a:	6a 00                	push   $0x0
80104c9c:	e8 7f f7 ff ff       	call   80104420 <argstr>
80104ca1:	83 c4 10             	add    $0x10,%esp
80104ca4:	85 c0                	test   %eax,%eax
80104ca6:	78 30                	js     80104cd8 <sys_mkdir+0x50>
80104ca8:	83 ec 0c             	sub    $0xc,%esp
80104cab:	6a 00                	push   $0x0
80104cad:	31 c9                	xor    %ecx,%ecx
80104caf:	ba 01 00 00 00       	mov    $0x1,%edx
80104cb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cb7:	e8 20 f8 ff ff       	call   801044dc <create>
80104cbc:	83 c4 10             	add    $0x10,%esp
80104cbf:	85 c0                	test   %eax,%eax
80104cc1:	74 15                	je     80104cd8 <sys_mkdir+0x50>
80104cc3:	83 ec 0c             	sub    $0xc,%esp
80104cc6:	50                   	push   %eax
80104cc7:	e8 9c cb ff ff       	call   80101868 <iunlockput>
80104ccc:	e8 63 dd ff ff       	call   80102a34 <end_op>
80104cd1:	83 c4 10             	add    $0x10,%esp
80104cd4:	31 c0                	xor    %eax,%eax
80104cd6:	c9                   	leave  
80104cd7:	c3                   	ret    
80104cd8:	e8 57 dd ff ff       	call   80102a34 <end_op>
80104cdd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ce2:	c9                   	leave  
80104ce3:	c3                   	ret    

80104ce4 <sys_mknod>:
80104ce4:	55                   	push   %ebp
80104ce5:	89 e5                	mov    %esp,%ebp
80104ce7:	83 ec 18             	sub    $0x18,%esp
80104cea:	e8 dd dc ff ff       	call   801029cc <begin_op>
80104cef:	83 ec 08             	sub    $0x8,%esp
80104cf2:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104cf5:	50                   	push   %eax
80104cf6:	6a 00                	push   $0x0
80104cf8:	e8 23 f7 ff ff       	call   80104420 <argstr>
80104cfd:	83 c4 10             	add    $0x10,%esp
80104d00:	85 c0                	test   %eax,%eax
80104d02:	78 60                	js     80104d64 <sys_mknod+0x80>
80104d04:	83 ec 08             	sub    $0x8,%esp
80104d07:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d0a:	50                   	push   %eax
80104d0b:	6a 01                	push   $0x1
80104d0d:	e8 62 f6 ff ff       	call   80104374 <argint>
80104d12:	83 c4 10             	add    $0x10,%esp
80104d15:	85 c0                	test   %eax,%eax
80104d17:	78 4b                	js     80104d64 <sys_mknod+0x80>
80104d19:	83 ec 08             	sub    $0x8,%esp
80104d1c:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d1f:	50                   	push   %eax
80104d20:	6a 02                	push   $0x2
80104d22:	e8 4d f6 ff ff       	call   80104374 <argint>
80104d27:	83 c4 10             	add    $0x10,%esp
80104d2a:	85 c0                	test   %eax,%eax
80104d2c:	78 36                	js     80104d64 <sys_mknod+0x80>
80104d2e:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104d32:	83 ec 0c             	sub    $0xc,%esp
80104d35:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
80104d39:	50                   	push   %eax
80104d3a:	ba 03 00 00 00       	mov    $0x3,%edx
80104d3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104d42:	e8 95 f7 ff ff       	call   801044dc <create>
80104d47:	83 c4 10             	add    $0x10,%esp
80104d4a:	85 c0                	test   %eax,%eax
80104d4c:	74 16                	je     80104d64 <sys_mknod+0x80>
80104d4e:	83 ec 0c             	sub    $0xc,%esp
80104d51:	50                   	push   %eax
80104d52:	e8 11 cb ff ff       	call   80101868 <iunlockput>
80104d57:	e8 d8 dc ff ff       	call   80102a34 <end_op>
80104d5c:	83 c4 10             	add    $0x10,%esp
80104d5f:	31 c0                	xor    %eax,%eax
80104d61:	c9                   	leave  
80104d62:	c3                   	ret    
80104d63:	90                   	nop
80104d64:	e8 cb dc ff ff       	call   80102a34 <end_op>
80104d69:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d6e:	c9                   	leave  
80104d6f:	c3                   	ret    

80104d70 <sys_chdir>:
80104d70:	55                   	push   %ebp
80104d71:	89 e5                	mov    %esp,%ebp
80104d73:	56                   	push   %esi
80104d74:	53                   	push   %ebx
80104d75:	83 ec 10             	sub    $0x10,%esp
80104d78:	e8 97 e7 ff ff       	call   80103514 <myproc>
80104d7d:	89 c6                	mov    %eax,%esi
80104d7f:	e8 48 dc ff ff       	call   801029cc <begin_op>
80104d84:	83 ec 08             	sub    $0x8,%esp
80104d87:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d8a:	50                   	push   %eax
80104d8b:	6a 00                	push   $0x0
80104d8d:	e8 8e f6 ff ff       	call   80104420 <argstr>
80104d92:	83 c4 10             	add    $0x10,%esp
80104d95:	85 c0                	test   %eax,%eax
80104d97:	78 67                	js     80104e00 <sys_chdir+0x90>
80104d99:	83 ec 0c             	sub    $0xc,%esp
80104d9c:	ff 75 f4             	pushl  -0xc(%ebp)
80104d9f:	e8 fc d0 ff ff       	call   80101ea0 <namei>
80104da4:	89 c3                	mov    %eax,%ebx
80104da6:	83 c4 10             	add    $0x10,%esp
80104da9:	85 c0                	test   %eax,%eax
80104dab:	74 53                	je     80104e00 <sys_chdir+0x90>
80104dad:	83 ec 0c             	sub    $0xc,%esp
80104db0:	50                   	push   %eax
80104db1:	e8 5e c8 ff ff       	call   80101614 <ilock>
80104db6:	83 c4 10             	add    $0x10,%esp
80104db9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104dbe:	75 28                	jne    80104de8 <sys_chdir+0x78>
80104dc0:	83 ec 0c             	sub    $0xc,%esp
80104dc3:	53                   	push   %ebx
80104dc4:	e8 13 c9 ff ff       	call   801016dc <iunlock>
80104dc9:	58                   	pop    %eax
80104dca:	ff 76 68             	pushl  0x68(%esi)
80104dcd:	e8 4e c9 ff ff       	call   80101720 <iput>
80104dd2:	e8 5d dc ff ff       	call   80102a34 <end_op>
80104dd7:	89 5e 68             	mov    %ebx,0x68(%esi)
80104dda:	83 c4 10             	add    $0x10,%esp
80104ddd:	31 c0                	xor    %eax,%eax
80104ddf:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104de2:	5b                   	pop    %ebx
80104de3:	5e                   	pop    %esi
80104de4:	5d                   	pop    %ebp
80104de5:	c3                   	ret    
80104de6:	66 90                	xchg   %ax,%ax
80104de8:	83 ec 0c             	sub    $0xc,%esp
80104deb:	53                   	push   %ebx
80104dec:	e8 77 ca ff ff       	call   80101868 <iunlockput>
80104df1:	e8 3e dc ff ff       	call   80102a34 <end_op>
80104df6:	83 c4 10             	add    $0x10,%esp
80104df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dfe:	eb df                	jmp    80104ddf <sys_chdir+0x6f>
80104e00:	e8 2f dc ff ff       	call   80102a34 <end_op>
80104e05:	eb f2                	jmp    80104df9 <sys_chdir+0x89>
80104e07:	90                   	nop

80104e08 <sys_exec>:
80104e08:	55                   	push   %ebp
80104e09:	89 e5                	mov    %esp,%ebp
80104e0b:	57                   	push   %edi
80104e0c:	56                   	push   %esi
80104e0d:	53                   	push   %ebx
80104e0e:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80104e14:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80104e1a:	50                   	push   %eax
80104e1b:	6a 00                	push   $0x0
80104e1d:	e8 fe f5 ff ff       	call   80104420 <argstr>
80104e22:	83 c4 10             	add    $0x10,%esp
80104e25:	85 c0                	test   %eax,%eax
80104e27:	78 79                	js     80104ea2 <sys_exec+0x9a>
80104e29:	83 ec 08             	sub    $0x8,%esp
80104e2c:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80104e32:	50                   	push   %eax
80104e33:	6a 01                	push   $0x1
80104e35:	e8 3a f5 ff ff       	call   80104374 <argint>
80104e3a:	83 c4 10             	add    $0x10,%esp
80104e3d:	85 c0                	test   %eax,%eax
80104e3f:	78 61                	js     80104ea2 <sys_exec+0x9a>
80104e41:	50                   	push   %eax
80104e42:	68 80 00 00 00       	push   $0x80
80104e47:	6a 00                	push   $0x0
80104e49:	8d bd 68 ff ff ff    	lea    -0x98(%ebp),%edi
80104e4f:	57                   	push   %edi
80104e50:	e8 03 f3 ff ff       	call   80104158 <memset>
80104e55:	83 c4 10             	add    $0x10,%esp
80104e58:	31 db                	xor    %ebx,%ebx
80104e5a:	31 f6                	xor    %esi,%esi
80104e5c:	83 ec 08             	sub    $0x8,%esp
80104e5f:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104e65:	50                   	push   %eax
80104e66:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80104e6c:	01 d8                	add    %ebx,%eax
80104e6e:	50                   	push   %eax
80104e6f:	e8 90 f4 ff ff       	call   80104304 <fetchint>
80104e74:	83 c4 10             	add    $0x10,%esp
80104e77:	85 c0                	test   %eax,%eax
80104e79:	78 27                	js     80104ea2 <sys_exec+0x9a>
80104e7b:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80104e81:	85 c0                	test   %eax,%eax
80104e83:	74 2b                	je     80104eb0 <sys_exec+0xa8>
80104e85:	83 ec 08             	sub    $0x8,%esp
80104e88:	8d 14 1f             	lea    (%edi,%ebx,1),%edx
80104e8b:	52                   	push   %edx
80104e8c:	50                   	push   %eax
80104e8d:	e8 a2 f4 ff ff       	call   80104334 <fetchstr>
80104e92:	83 c4 10             	add    $0x10,%esp
80104e95:	85 c0                	test   %eax,%eax
80104e97:	78 09                	js     80104ea2 <sys_exec+0x9a>
80104e99:	46                   	inc    %esi
80104e9a:	83 c3 04             	add    $0x4,%ebx
80104e9d:	83 fe 20             	cmp    $0x20,%esi
80104ea0:	75 ba                	jne    80104e5c <sys_exec+0x54>
80104ea2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ea7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104eaa:	5b                   	pop    %ebx
80104eab:	5e                   	pop    %esi
80104eac:	5f                   	pop    %edi
80104ead:	5d                   	pop    %ebp
80104eae:	c3                   	ret    
80104eaf:	90                   	nop
80104eb0:	c7 84 b5 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%esi,4)
80104eb7:	00 00 00 00 
80104ebb:	83 ec 08             	sub    $0x8,%esp
80104ebe:	57                   	push   %edi
80104ebf:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
80104ec5:	e8 56 bb ff ff       	call   80100a20 <exec>
80104eca:	83 c4 10             	add    $0x10,%esp
80104ecd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ed0:	5b                   	pop    %ebx
80104ed1:	5e                   	pop    %esi
80104ed2:	5f                   	pop    %edi
80104ed3:	5d                   	pop    %ebp
80104ed4:	c3                   	ret    
80104ed5:	8d 76 00             	lea    0x0(%esi),%esi

80104ed8 <sys_pipe>:
80104ed8:	55                   	push   %ebp
80104ed9:	89 e5                	mov    %esp,%ebp
80104edb:	57                   	push   %edi
80104edc:	56                   	push   %esi
80104edd:	53                   	push   %ebx
80104ede:	83 ec 20             	sub    $0x20,%esp
80104ee1:	6a 08                	push   $0x8
80104ee3:	8d 45 dc             	lea    -0x24(%ebp),%eax
80104ee6:	50                   	push   %eax
80104ee7:	6a 00                	push   $0x0
80104ee9:	e8 ca f4 ff ff       	call   801043b8 <argptr>
80104eee:	83 c4 10             	add    $0x10,%esp
80104ef1:	85 c0                	test   %eax,%eax
80104ef3:	78 7d                	js     80104f72 <sys_pipe+0x9a>
80104ef5:	83 ec 08             	sub    $0x8,%esp
80104ef8:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104efb:	50                   	push   %eax
80104efc:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104eff:	50                   	push   %eax
80104f00:	e8 df e0 ff ff       	call   80102fe4 <pipealloc>
80104f05:	83 c4 10             	add    $0x10,%esp
80104f08:	85 c0                	test   %eax,%eax
80104f0a:	78 66                	js     80104f72 <sys_pipe+0x9a>
80104f0c:	8b 7d e0             	mov    -0x20(%ebp),%edi
80104f0f:	e8 00 e6 ff ff       	call   80103514 <myproc>
80104f14:	31 db                	xor    %ebx,%ebx
80104f16:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80104f1a:	85 f6                	test   %esi,%esi
80104f1c:	74 10                	je     80104f2e <sys_pipe+0x56>
80104f1e:	66 90                	xchg   %ax,%ax
80104f20:	43                   	inc    %ebx
80104f21:	83 fb 10             	cmp    $0x10,%ebx
80104f24:	74 35                	je     80104f5b <sys_pipe+0x83>
80104f26:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80104f2a:	85 f6                	test   %esi,%esi
80104f2c:	75 f2                	jne    80104f20 <sys_pipe+0x48>
80104f2e:	8d 73 08             	lea    0x8(%ebx),%esi
80104f31:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80104f35:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80104f38:	e8 d7 e5 ff ff       	call   80103514 <myproc>
80104f3d:	31 d2                	xor    %edx,%edx
80104f3f:	90                   	nop
80104f40:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80104f44:	85 c9                	test   %ecx,%ecx
80104f46:	74 34                	je     80104f7c <sys_pipe+0xa4>
80104f48:	42                   	inc    %edx
80104f49:	83 fa 10             	cmp    $0x10,%edx
80104f4c:	75 f2                	jne    80104f40 <sys_pipe+0x68>
80104f4e:	e8 c1 e5 ff ff       	call   80103514 <myproc>
80104f53:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80104f5a:	00 
80104f5b:	83 ec 0c             	sub    $0xc,%esp
80104f5e:	ff 75 e0             	pushl  -0x20(%ebp)
80104f61:	e8 de be ff ff       	call   80100e44 <fileclose>
80104f66:	58                   	pop    %eax
80104f67:	ff 75 e4             	pushl  -0x1c(%ebp)
80104f6a:	e8 d5 be ff ff       	call   80100e44 <fileclose>
80104f6f:	83 c4 10             	add    $0x10,%esp
80104f72:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f77:	eb 14                	jmp    80104f8d <sys_pipe+0xb5>
80104f79:	8d 76 00             	lea    0x0(%esi),%esi
80104f7c:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80104f80:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104f83:	89 18                	mov    %ebx,(%eax)
80104f85:	8b 45 dc             	mov    -0x24(%ebp),%eax
80104f88:	89 50 04             	mov    %edx,0x4(%eax)
80104f8b:	31 c0                	xor    %eax,%eax
80104f8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f90:	5b                   	pop    %ebx
80104f91:	5e                   	pop    %esi
80104f92:	5f                   	pop    %edi
80104f93:	5d                   	pop    %ebp
80104f94:	c3                   	ret    
80104f95:	8d 76 00             	lea    0x0(%esi),%esi

80104f98 <sys_getreadcount>:
80104f98:	e9 ef ed ff ff       	jmp    80103d8c <getreadcount>
80104f9d:	66 90                	xchg   %ax,%ax
80104f9f:	90                   	nop

80104fa0 <sys_fork>:
80104fa0:	e9 e7 e6 ff ff       	jmp    8010368c <fork>
80104fa5:	8d 76 00             	lea    0x0(%esi),%esi

80104fa8 <sys_exit>:
80104fa8:	55                   	push   %ebp
80104fa9:	89 e5                	mov    %esp,%ebp
80104fab:	83 ec 08             	sub    $0x8,%esp
80104fae:	e8 29 e9 ff ff       	call   801038dc <exit>
80104fb3:	31 c0                	xor    %eax,%eax
80104fb5:	c9                   	leave  
80104fb6:	c3                   	ret    
80104fb7:	90                   	nop

80104fb8 <sys_wait>:
80104fb8:	e9 2f ea ff ff       	jmp    801039ec <wait>
80104fbd:	8d 76 00             	lea    0x0(%esi),%esi

80104fc0 <sys_kill>:
80104fc0:	55                   	push   %ebp
80104fc1:	89 e5                	mov    %esp,%ebp
80104fc3:	83 ec 20             	sub    $0x20,%esp
80104fc6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fc9:	50                   	push   %eax
80104fca:	6a 00                	push   $0x0
80104fcc:	e8 a3 f3 ff ff       	call   80104374 <argint>
80104fd1:	83 c4 10             	add    $0x10,%esp
80104fd4:	85 c0                	test   %eax,%eax
80104fd6:	78 10                	js     80104fe8 <sys_kill+0x28>
80104fd8:	83 ec 0c             	sub    $0xc,%esp
80104fdb:	ff 75 f4             	pushl  -0xc(%ebp)
80104fde:	e8 85 ec ff ff       	call   80103c68 <kill>
80104fe3:	83 c4 10             	add    $0x10,%esp
80104fe6:	c9                   	leave  
80104fe7:	c3                   	ret    
80104fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fed:	c9                   	leave  
80104fee:	c3                   	ret    
80104fef:	90                   	nop

80104ff0 <sys_getpid>:
80104ff0:	55                   	push   %ebp
80104ff1:	89 e5                	mov    %esp,%ebp
80104ff3:	83 ec 08             	sub    $0x8,%esp
80104ff6:	e8 19 e5 ff ff       	call   80103514 <myproc>
80104ffb:	8b 40 10             	mov    0x10(%eax),%eax
80104ffe:	c9                   	leave  
80104fff:	c3                   	ret    

80105000 <sys_sbrk>:
80105000:	55                   	push   %ebp
80105001:	89 e5                	mov    %esp,%ebp
80105003:	53                   	push   %ebx
80105004:	83 ec 1c             	sub    $0x1c,%esp
80105007:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010500a:	50                   	push   %eax
8010500b:	6a 00                	push   $0x0
8010500d:	e8 62 f3 ff ff       	call   80104374 <argint>
80105012:	83 c4 10             	add    $0x10,%esp
80105015:	85 c0                	test   %eax,%eax
80105017:	78 23                	js     8010503c <sys_sbrk+0x3c>
80105019:	e8 f6 e4 ff ff       	call   80103514 <myproc>
8010501e:	8b 18                	mov    (%eax),%ebx
80105020:	83 ec 0c             	sub    $0xc,%esp
80105023:	ff 75 f4             	pushl  -0xc(%ebp)
80105026:	e8 f1 e5 ff ff       	call   8010361c <growproc>
8010502b:	83 c4 10             	add    $0x10,%esp
8010502e:	85 c0                	test   %eax,%eax
80105030:	78 0a                	js     8010503c <sys_sbrk+0x3c>
80105032:	89 d8                	mov    %ebx,%eax
80105034:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105037:	c9                   	leave  
80105038:	c3                   	ret    
80105039:	8d 76 00             	lea    0x0(%esi),%esi
8010503c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105041:	eb ef                	jmp    80105032 <sys_sbrk+0x32>
80105043:	90                   	nop

80105044 <sys_sleep>:
80105044:	55                   	push   %ebp
80105045:	89 e5                	mov    %esp,%ebp
80105047:	53                   	push   %ebx
80105048:	83 ec 1c             	sub    $0x1c,%esp
8010504b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010504e:	50                   	push   %eax
8010504f:	6a 00                	push   $0x0
80105051:	e8 1e f3 ff ff       	call   80104374 <argint>
80105056:	83 c4 10             	add    $0x10,%esp
80105059:	85 c0                	test   %eax,%eax
8010505b:	78 5c                	js     801050b9 <sys_sleep+0x75>
8010505d:	83 ec 0c             	sub    $0xc,%esp
80105060:	68 80 3d 11 80       	push   $0x80113d80
80105065:	e8 2e f0 ff ff       	call   80104098 <acquire>
8010506a:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
80105070:	83 c4 10             	add    $0x10,%esp
80105073:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105076:	85 d2                	test   %edx,%edx
80105078:	75 23                	jne    8010509d <sys_sleep+0x59>
8010507a:	eb 48                	jmp    801050c4 <sys_sleep+0x80>
8010507c:	83 ec 08             	sub    $0x8,%esp
8010507f:	68 80 3d 11 80       	push   $0x80113d80
80105084:	68 60 3d 11 80       	push   $0x80113d60
80105089:	e8 c6 ea ff ff       	call   80103b54 <sleep>
8010508e:	a1 60 3d 11 80       	mov    0x80113d60,%eax
80105093:	29 d8                	sub    %ebx,%eax
80105095:	83 c4 10             	add    $0x10,%esp
80105098:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010509b:	73 27                	jae    801050c4 <sys_sleep+0x80>
8010509d:	e8 72 e4 ff ff       	call   80103514 <myproc>
801050a2:	8b 40 24             	mov    0x24(%eax),%eax
801050a5:	85 c0                	test   %eax,%eax
801050a7:	74 d3                	je     8010507c <sys_sleep+0x38>
801050a9:	83 ec 0c             	sub    $0xc,%esp
801050ac:	68 80 3d 11 80       	push   $0x80113d80
801050b1:	e8 82 ef ff ff       	call   80104038 <release>
801050b6:	83 c4 10             	add    $0x10,%esp
801050b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801050c1:	c9                   	leave  
801050c2:	c3                   	ret    
801050c3:	90                   	nop
801050c4:	83 ec 0c             	sub    $0xc,%esp
801050c7:	68 80 3d 11 80       	push   $0x80113d80
801050cc:	e8 67 ef ff ff       	call   80104038 <release>
801050d1:	83 c4 10             	add    $0x10,%esp
801050d4:	31 c0                	xor    %eax,%eax
801050d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801050d9:	c9                   	leave  
801050da:	c3                   	ret    
801050db:	90                   	nop

801050dc <sys_uptime>:
801050dc:	55                   	push   %ebp
801050dd:	89 e5                	mov    %esp,%ebp
801050df:	53                   	push   %ebx
801050e0:	83 ec 10             	sub    $0x10,%esp
801050e3:	68 80 3d 11 80       	push   $0x80113d80
801050e8:	e8 ab ef ff ff       	call   80104098 <acquire>
801050ed:	8b 1d 60 3d 11 80    	mov    0x80113d60,%ebx
801050f3:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
801050fa:	e8 39 ef ff ff       	call   80104038 <release>
801050ff:	89 d8                	mov    %ebx,%eax
80105101:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105104:	c9                   	leave  
80105105:	c3                   	ret    

80105106 <alltraps>:
80105106:	1e                   	push   %ds
80105107:	06                   	push   %es
80105108:	0f a0                	push   %fs
8010510a:	0f a8                	push   %gs
8010510c:	60                   	pusha  
8010510d:	66 b8 10 00          	mov    $0x10,%ax
80105111:	8e d8                	mov    %eax,%ds
80105113:	8e c0                	mov    %eax,%es
80105115:	54                   	push   %esp
80105116:	e8 a1 00 00 00       	call   801051bc <trap>
8010511b:	83 c4 04             	add    $0x4,%esp

8010511e <trapret>:
8010511e:	61                   	popa   
8010511f:	0f a9                	pop    %gs
80105121:	0f a1                	pop    %fs
80105123:	07                   	pop    %es
80105124:	1f                   	pop    %ds
80105125:	83 c4 08             	add    $0x8,%esp
80105128:	cf                   	iret   
80105129:	66 90                	xchg   %ax,%ax
8010512b:	90                   	nop

8010512c <tvinit>:
8010512c:	55                   	push   %ebp
8010512d:	89 e5                	mov    %esp,%ebp
8010512f:	83 ec 08             	sub    $0x8,%esp
80105132:	31 c0                	xor    %eax,%eax
80105134:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
8010513b:	66 89 14 c5 c0 3d 11 	mov    %dx,-0x7feec240(,%eax,8)
80105142:	80 
80105143:	c7 04 c5 c2 3d 11 80 	movl   $0x8e000008,-0x7feec23e(,%eax,8)
8010514a:	08 00 00 8e 
8010514e:	c1 ea 10             	shr    $0x10,%edx
80105151:	66 89 14 c5 c6 3d 11 	mov    %dx,-0x7feec23a(,%eax,8)
80105158:	80 
80105159:	40                   	inc    %eax
8010515a:	3d 00 01 00 00       	cmp    $0x100,%eax
8010515f:	75 d3                	jne    80105134 <tvinit+0x8>
80105161:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105166:	66 a3 c0 3f 11 80    	mov    %ax,0x80113fc0
8010516c:	c7 05 c2 3f 11 80 08 	movl   $0xef000008,0x80113fc2
80105173:	00 00 ef 
80105176:	c1 e8 10             	shr    $0x10,%eax
80105179:	66 a3 c6 3f 11 80    	mov    %ax,0x80113fc6
8010517f:	83 ec 08             	sub    $0x8,%esp
80105182:	68 3d 70 10 80       	push   $0x8010703d
80105187:	68 80 3d 11 80       	push   $0x80113d80
8010518c:	e8 47 ed ff ff       	call   80103ed8 <initlock>
80105191:	83 c4 10             	add    $0x10,%esp
80105194:	c9                   	leave  
80105195:	c3                   	ret    
80105196:	66 90                	xchg   %ax,%ax

80105198 <idtinit>:
80105198:	55                   	push   %ebp
80105199:	89 e5                	mov    %esp,%ebp
8010519b:	83 ec 10             	sub    $0x10,%esp
8010519e:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
801051a4:	b8 c0 3d 11 80       	mov    $0x80113dc0,%eax
801051a9:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801051ad:	c1 e8 10             	shr    $0x10,%eax
801051b0:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801051b4:	8d 45 fa             	lea    -0x6(%ebp),%eax
801051b7:	0f 01 18             	lidtl  (%eax)
801051ba:	c9                   	leave  
801051bb:	c3                   	ret    

801051bc <trap>:
801051bc:	55                   	push   %ebp
801051bd:	89 e5                	mov    %esp,%ebp
801051bf:	57                   	push   %edi
801051c0:	56                   	push   %esi
801051c1:	53                   	push   %ebx
801051c2:	83 ec 1c             	sub    $0x1c,%esp
801051c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801051c8:	8b 43 30             	mov    0x30(%ebx),%eax
801051cb:	83 f8 40             	cmp    $0x40,%eax
801051ce:	0f 84 4c 01 00 00    	je     80105320 <trap+0x164>
801051d4:	83 e8 20             	sub    $0x20,%eax
801051d7:	83 f8 1f             	cmp    $0x1f,%eax
801051da:	77 7c                	ja     80105258 <trap+0x9c>
801051dc:	ff 24 85 e4 70 10 80 	jmp    *-0x7fef8f1c(,%eax,4)
801051e3:	90                   	nop
801051e4:	e8 0b ce ff ff       	call   80101ff4 <ideintr>
801051e9:	e8 12 d4 ff ff       	call   80102600 <lapiceoi>
801051ee:	e8 21 e3 ff ff       	call   80103514 <myproc>
801051f3:	85 c0                	test   %eax,%eax
801051f5:	74 1c                	je     80105213 <trap+0x57>
801051f7:	e8 18 e3 ff ff       	call   80103514 <myproc>
801051fc:	8b 50 24             	mov    0x24(%eax),%edx
801051ff:	85 d2                	test   %edx,%edx
80105201:	74 10                	je     80105213 <trap+0x57>
80105203:	8b 43 3c             	mov    0x3c(%ebx),%eax
80105206:	83 e0 03             	and    $0x3,%eax
80105209:	66 83 f8 03          	cmp    $0x3,%ax
8010520d:	0f 84 c1 01 00 00    	je     801053d4 <trap+0x218>
80105213:	e8 fc e2 ff ff       	call   80103514 <myproc>
80105218:	85 c0                	test   %eax,%eax
8010521a:	74 0f                	je     8010522b <trap+0x6f>
8010521c:	e8 f3 e2 ff ff       	call   80103514 <myproc>
80105221:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105225:	0f 84 ad 00 00 00    	je     801052d8 <trap+0x11c>
8010522b:	e8 e4 e2 ff ff       	call   80103514 <myproc>
80105230:	85 c0                	test   %eax,%eax
80105232:	74 1c                	je     80105250 <trap+0x94>
80105234:	e8 db e2 ff ff       	call   80103514 <myproc>
80105239:	8b 40 24             	mov    0x24(%eax),%eax
8010523c:	85 c0                	test   %eax,%eax
8010523e:	74 10                	je     80105250 <trap+0x94>
80105240:	8b 43 3c             	mov    0x3c(%ebx),%eax
80105243:	83 e0 03             	and    $0x3,%eax
80105246:	66 83 f8 03          	cmp    $0x3,%ax
8010524a:	0f 84 fd 00 00 00    	je     8010534d <trap+0x191>
80105250:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105253:	5b                   	pop    %ebx
80105254:	5e                   	pop    %esi
80105255:	5f                   	pop    %edi
80105256:	5d                   	pop    %ebp
80105257:	c3                   	ret    
80105258:	e8 b7 e2 ff ff       	call   80103514 <myproc>
8010525d:	8b 7b 38             	mov    0x38(%ebx),%edi
80105260:	85 c0                	test   %eax,%eax
80105262:	0f 84 82 01 00 00    	je     801053ea <trap+0x22e>
80105268:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
8010526c:	0f 84 78 01 00 00    	je     801053ea <trap+0x22e>
80105272:	0f 20 d1             	mov    %cr2,%ecx
80105275:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105278:	e8 63 e2 ff ff       	call   801034e0 <cpuid>
8010527d:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105280:	8b 43 34             	mov    0x34(%ebx),%eax
80105283:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105286:	8b 73 30             	mov    0x30(%ebx),%esi
80105289:	e8 86 e2 ff ff       	call   80103514 <myproc>
8010528e:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105291:	e8 7e e2 ff ff       	call   80103514 <myproc>
80105296:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105299:	51                   	push   %ecx
8010529a:	57                   	push   %edi
8010529b:	8b 55 dc             	mov    -0x24(%ebp),%edx
8010529e:	52                   	push   %edx
8010529f:	ff 75 e4             	pushl  -0x1c(%ebp)
801052a2:	56                   	push   %esi
801052a3:	8b 75 e0             	mov    -0x20(%ebp),%esi
801052a6:	83 c6 6c             	add    $0x6c,%esi
801052a9:	56                   	push   %esi
801052aa:	ff 70 10             	pushl  0x10(%eax)
801052ad:	68 a0 70 10 80       	push   $0x801070a0
801052b2:	e8 71 b3 ff ff       	call   80100628 <cprintf>
801052b7:	83 c4 20             	add    $0x20,%esp
801052ba:	e8 55 e2 ff ff       	call   80103514 <myproc>
801052bf:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801052c6:	e8 49 e2 ff ff       	call   80103514 <myproc>
801052cb:	85 c0                	test   %eax,%eax
801052cd:	0f 85 24 ff ff ff    	jne    801051f7 <trap+0x3b>
801052d3:	e9 3b ff ff ff       	jmp    80105213 <trap+0x57>
801052d8:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
801052dc:	0f 85 49 ff ff ff    	jne    8010522b <trap+0x6f>
801052e2:	e8 25 e8 ff ff       	call   80103b0c <yield>
801052e7:	e9 3f ff ff ff       	jmp    8010522b <trap+0x6f>
801052ec:	8b 7b 38             	mov    0x38(%ebx),%edi
801052ef:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801052f3:	e8 e8 e1 ff ff       	call   801034e0 <cpuid>
801052f8:	57                   	push   %edi
801052f9:	56                   	push   %esi
801052fa:	50                   	push   %eax
801052fb:	68 48 70 10 80       	push   $0x80107048
80105300:	e8 23 b3 ff ff       	call   80100628 <cprintf>
80105305:	e8 f6 d2 ff ff       	call   80102600 <lapiceoi>
8010530a:	83 c4 10             	add    $0x10,%esp
8010530d:	e8 02 e2 ff ff       	call   80103514 <myproc>
80105312:	85 c0                	test   %eax,%eax
80105314:	0f 85 dd fe ff ff    	jne    801051f7 <trap+0x3b>
8010531a:	e9 f4 fe ff ff       	jmp    80105213 <trap+0x57>
8010531f:	90                   	nop
80105320:	e8 ef e1 ff ff       	call   80103514 <myproc>
80105325:	8b 70 24             	mov    0x24(%eax),%esi
80105328:	85 f6                	test   %esi,%esi
8010532a:	0f 85 b0 00 00 00    	jne    801053e0 <trap+0x224>
80105330:	e8 df e1 ff ff       	call   80103514 <myproc>
80105335:	89 58 18             	mov    %ebx,0x18(%eax)
80105338:	e8 47 f1 ff ff       	call   80104484 <syscall>
8010533d:	e8 d2 e1 ff ff       	call   80103514 <myproc>
80105342:	8b 48 24             	mov    0x24(%eax),%ecx
80105345:	85 c9                	test   %ecx,%ecx
80105347:	0f 84 03 ff ff ff    	je     80105250 <trap+0x94>
8010534d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105350:	5b                   	pop    %ebx
80105351:	5e                   	pop    %esi
80105352:	5f                   	pop    %edi
80105353:	5d                   	pop    %ebp
80105354:	e9 83 e5 ff ff       	jmp    801038dc <exit>
80105359:	8d 76 00             	lea    0x0(%esi),%esi
8010535c:	e8 f3 01 00 00       	call   80105554 <uartintr>
80105361:	e8 9a d2 ff ff       	call   80102600 <lapiceoi>
80105366:	e8 a9 e1 ff ff       	call   80103514 <myproc>
8010536b:	85 c0                	test   %eax,%eax
8010536d:	0f 85 84 fe ff ff    	jne    801051f7 <trap+0x3b>
80105373:	e9 9b fe ff ff       	jmp    80105213 <trap+0x57>
80105378:	e8 73 d1 ff ff       	call   801024f0 <kbdintr>
8010537d:	e8 7e d2 ff ff       	call   80102600 <lapiceoi>
80105382:	e8 8d e1 ff ff       	call   80103514 <myproc>
80105387:	85 c0                	test   %eax,%eax
80105389:	0f 85 68 fe ff ff    	jne    801051f7 <trap+0x3b>
8010538f:	e9 7f fe ff ff       	jmp    80105213 <trap+0x57>
80105394:	e8 47 e1 ff ff       	call   801034e0 <cpuid>
80105399:	85 c0                	test   %eax,%eax
8010539b:	0f 85 48 fe ff ff    	jne    801051e9 <trap+0x2d>
801053a1:	83 ec 0c             	sub    $0xc,%esp
801053a4:	68 80 3d 11 80       	push   $0x80113d80
801053a9:	e8 ea ec ff ff       	call   80104098 <acquire>
801053ae:	ff 05 60 3d 11 80    	incl   0x80113d60
801053b4:	c7 04 24 60 3d 11 80 	movl   $0x80113d60,(%esp)
801053bb:	e8 50 e8 ff ff       	call   80103c10 <wakeup>
801053c0:	c7 04 24 80 3d 11 80 	movl   $0x80113d80,(%esp)
801053c7:	e8 6c ec ff ff       	call   80104038 <release>
801053cc:	83 c4 10             	add    $0x10,%esp
801053cf:	e9 15 fe ff ff       	jmp    801051e9 <trap+0x2d>
801053d4:	e8 03 e5 ff ff       	call   801038dc <exit>
801053d9:	e9 35 fe ff ff       	jmp    80105213 <trap+0x57>
801053de:	66 90                	xchg   %ax,%ax
801053e0:	e8 f7 e4 ff ff       	call   801038dc <exit>
801053e5:	e9 46 ff ff ff       	jmp    80105330 <trap+0x174>
801053ea:	0f 20 d6             	mov    %cr2,%esi
801053ed:	e8 ee e0 ff ff       	call   801034e0 <cpuid>
801053f2:	83 ec 0c             	sub    $0xc,%esp
801053f5:	56                   	push   %esi
801053f6:	57                   	push   %edi
801053f7:	50                   	push   %eax
801053f8:	ff 73 30             	pushl  0x30(%ebx)
801053fb:	68 6c 70 10 80       	push   $0x8010706c
80105400:	e8 23 b2 ff ff       	call   80100628 <cprintf>
80105405:	83 c4 14             	add    $0x14,%esp
80105408:	68 42 70 10 80       	push   $0x80107042
8010540d:	e8 26 af ff ff       	call   80100338 <panic>
80105412:	66 90                	xchg   %ax,%ax

80105414 <uartgetc>:
80105414:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105419:	85 c0                	test   %eax,%eax
8010541b:	74 17                	je     80105434 <uartgetc+0x20>
8010541d:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105422:	ec                   	in     (%dx),%al
80105423:	a8 01                	test   $0x1,%al
80105425:	74 0d                	je     80105434 <uartgetc+0x20>
80105427:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010542c:	ec                   	in     (%dx),%al
8010542d:	0f b6 c0             	movzbl %al,%eax
80105430:	c3                   	ret    
80105431:	8d 76 00             	lea    0x0(%esi),%esi
80105434:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105439:	c3                   	ret    
8010543a:	66 90                	xchg   %ax,%ax

8010543c <uartinit>:
8010543c:	55                   	push   %ebp
8010543d:	89 e5                	mov    %esp,%ebp
8010543f:	57                   	push   %edi
80105440:	56                   	push   %esi
80105441:	53                   	push   %ebx
80105442:	83 ec 1c             	sub    $0x1c,%esp
80105445:	bf fa 03 00 00       	mov    $0x3fa,%edi
8010544a:	31 c0                	xor    %eax,%eax
8010544c:	89 fa                	mov    %edi,%edx
8010544e:	ee                   	out    %al,(%dx)
8010544f:	bb fb 03 00 00       	mov    $0x3fb,%ebx
80105454:	b0 80                	mov    $0x80,%al
80105456:	89 da                	mov    %ebx,%edx
80105458:	ee                   	out    %al,(%dx)
80105459:	be f8 03 00 00       	mov    $0x3f8,%esi
8010545e:	b0 0c                	mov    $0xc,%al
80105460:	89 f2                	mov    %esi,%edx
80105462:	ee                   	out    %al,(%dx)
80105463:	b9 f9 03 00 00       	mov    $0x3f9,%ecx
80105468:	31 c0                	xor    %eax,%eax
8010546a:	89 ca                	mov    %ecx,%edx
8010546c:	ee                   	out    %al,(%dx)
8010546d:	b0 03                	mov    $0x3,%al
8010546f:	89 da                	mov    %ebx,%edx
80105471:	ee                   	out    %al,(%dx)
80105472:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105477:	31 c0                	xor    %eax,%eax
80105479:	ee                   	out    %al,(%dx)
8010547a:	b0 01                	mov    $0x1,%al
8010547c:	89 ca                	mov    %ecx,%edx
8010547e:	ee                   	out    %al,(%dx)
8010547f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105484:	ec                   	in     (%dx),%al
80105485:	fe c0                	inc    %al
80105487:	74 71                	je     801054fa <uartinit+0xbe>
80105489:	c7 05 c0 45 11 80 01 	movl   $0x1,0x801145c0
80105490:	00 00 00 
80105493:	89 fa                	mov    %edi,%edx
80105495:	ec                   	in     (%dx),%al
80105496:	89 f2                	mov    %esi,%edx
80105498:	ec                   	in     (%dx),%al
80105499:	83 ec 08             	sub    $0x8,%esp
8010549c:	6a 00                	push   $0x0
8010549e:	6a 04                	push   $0x4
801054a0:	e8 5f cd ff ff       	call   80102204 <ioapicenable>
801054a5:	83 c4 10             	add    $0x10,%esp
801054a8:	bf 64 71 10 80       	mov    $0x80107164,%edi
801054ad:	c6 45 e7 78          	movb   $0x78,-0x19(%ebp)
801054b1:	be fd 03 00 00       	mov    $0x3fd,%esi
801054b6:	66 90                	xchg   %ax,%ax
801054b8:	a1 c0 45 11 80       	mov    0x801145c0,%eax
801054bd:	85 c0                	test   %eax,%eax
801054bf:	74 2f                	je     801054f0 <uartinit+0xb4>
801054c1:	89 f2                	mov    %esi,%edx
801054c3:	ec                   	in     (%dx),%al
801054c4:	a8 20                	test   $0x20,%al
801054c6:	75 1f                	jne    801054e7 <uartinit+0xab>
801054c8:	bb 80 00 00 00       	mov    $0x80,%ebx
801054cd:	8d 76 00             	lea    0x0(%esi),%esi
801054d0:	83 ec 0c             	sub    $0xc,%esp
801054d3:	6a 0a                	push   $0xa
801054d5:	e8 3e d1 ff ff       	call   80102618 <microdelay>
801054da:	83 c4 10             	add    $0x10,%esp
801054dd:	4b                   	dec    %ebx
801054de:	74 07                	je     801054e7 <uartinit+0xab>
801054e0:	89 f2                	mov    %esi,%edx
801054e2:	ec                   	in     (%dx),%al
801054e3:	a8 20                	test   $0x20,%al
801054e5:	74 e9                	je     801054d0 <uartinit+0x94>
801054e7:	ba f8 03 00 00       	mov    $0x3f8,%edx
801054ec:	8a 45 e7             	mov    -0x19(%ebp),%al
801054ef:	ee                   	out    %al,(%dx)
801054f0:	47                   	inc    %edi
801054f1:	8a 07                	mov    (%edi),%al
801054f3:	88 45 e7             	mov    %al,-0x19(%ebp)
801054f6:	84 c0                	test   %al,%al
801054f8:	75 be                	jne    801054b8 <uartinit+0x7c>
801054fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054fd:	5b                   	pop    %ebx
801054fe:	5e                   	pop    %esi
801054ff:	5f                   	pop    %edi
80105500:	5d                   	pop    %ebp
80105501:	c3                   	ret    
80105502:	66 90                	xchg   %ax,%ax

80105504 <uartputc>:
80105504:	a1 c0 45 11 80       	mov    0x801145c0,%eax
80105509:	85 c0                	test   %eax,%eax
8010550b:	74 43                	je     80105550 <uartputc+0x4c>
8010550d:	55                   	push   %ebp
8010550e:	89 e5                	mov    %esp,%ebp
80105510:	56                   	push   %esi
80105511:	53                   	push   %ebx
80105512:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105517:	ec                   	in     (%dx),%al
80105518:	a8 20                	test   $0x20,%al
8010551a:	75 23                	jne    8010553f <uartputc+0x3b>
8010551c:	bb 80 00 00 00       	mov    $0x80,%ebx
80105521:	be fd 03 00 00       	mov    $0x3fd,%esi
80105526:	66 90                	xchg   %ax,%ax
80105528:	83 ec 0c             	sub    $0xc,%esp
8010552b:	6a 0a                	push   $0xa
8010552d:	e8 e6 d0 ff ff       	call   80102618 <microdelay>
80105532:	83 c4 10             	add    $0x10,%esp
80105535:	4b                   	dec    %ebx
80105536:	74 07                	je     8010553f <uartputc+0x3b>
80105538:	89 f2                	mov    %esi,%edx
8010553a:	ec                   	in     (%dx),%al
8010553b:	a8 20                	test   $0x20,%al
8010553d:	74 e9                	je     80105528 <uartputc+0x24>
8010553f:	8b 45 08             	mov    0x8(%ebp),%eax
80105542:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105547:	ee                   	out    %al,(%dx)
80105548:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010554b:	5b                   	pop    %ebx
8010554c:	5e                   	pop    %esi
8010554d:	5d                   	pop    %ebp
8010554e:	c3                   	ret    
8010554f:	90                   	nop
80105550:	c3                   	ret    
80105551:	8d 76 00             	lea    0x0(%esi),%esi

80105554 <uartintr>:
80105554:	55                   	push   %ebp
80105555:	89 e5                	mov    %esp,%ebp
80105557:	83 ec 14             	sub    $0x14,%esp
8010555a:	68 14 54 10 80       	push   $0x80105414
8010555f:	e8 b0 b2 ff ff       	call   80100814 <consoleintr>
80105564:	83 c4 10             	add    $0x10,%esp
80105567:	c9                   	leave  
80105568:	c3                   	ret    

80105569 <vector0>:
80105569:	6a 00                	push   $0x0
8010556b:	6a 00                	push   $0x0
8010556d:	e9 94 fb ff ff       	jmp    80105106 <alltraps>

80105572 <vector1>:
80105572:	6a 00                	push   $0x0
80105574:	6a 01                	push   $0x1
80105576:	e9 8b fb ff ff       	jmp    80105106 <alltraps>

8010557b <vector2>:
8010557b:	6a 00                	push   $0x0
8010557d:	6a 02                	push   $0x2
8010557f:	e9 82 fb ff ff       	jmp    80105106 <alltraps>

80105584 <vector3>:
80105584:	6a 00                	push   $0x0
80105586:	6a 03                	push   $0x3
80105588:	e9 79 fb ff ff       	jmp    80105106 <alltraps>

8010558d <vector4>:
8010558d:	6a 00                	push   $0x0
8010558f:	6a 04                	push   $0x4
80105591:	e9 70 fb ff ff       	jmp    80105106 <alltraps>

80105596 <vector5>:
80105596:	6a 00                	push   $0x0
80105598:	6a 05                	push   $0x5
8010559a:	e9 67 fb ff ff       	jmp    80105106 <alltraps>

8010559f <vector6>:
8010559f:	6a 00                	push   $0x0
801055a1:	6a 06                	push   $0x6
801055a3:	e9 5e fb ff ff       	jmp    80105106 <alltraps>

801055a8 <vector7>:
801055a8:	6a 00                	push   $0x0
801055aa:	6a 07                	push   $0x7
801055ac:	e9 55 fb ff ff       	jmp    80105106 <alltraps>

801055b1 <vector8>:
801055b1:	6a 08                	push   $0x8
801055b3:	e9 4e fb ff ff       	jmp    80105106 <alltraps>

801055b8 <vector9>:
801055b8:	6a 00                	push   $0x0
801055ba:	6a 09                	push   $0x9
801055bc:	e9 45 fb ff ff       	jmp    80105106 <alltraps>

801055c1 <vector10>:
801055c1:	6a 0a                	push   $0xa
801055c3:	e9 3e fb ff ff       	jmp    80105106 <alltraps>

801055c8 <vector11>:
801055c8:	6a 0b                	push   $0xb
801055ca:	e9 37 fb ff ff       	jmp    80105106 <alltraps>

801055cf <vector12>:
801055cf:	6a 0c                	push   $0xc
801055d1:	e9 30 fb ff ff       	jmp    80105106 <alltraps>

801055d6 <vector13>:
801055d6:	6a 0d                	push   $0xd
801055d8:	e9 29 fb ff ff       	jmp    80105106 <alltraps>

801055dd <vector14>:
801055dd:	6a 0e                	push   $0xe
801055df:	e9 22 fb ff ff       	jmp    80105106 <alltraps>

801055e4 <vector15>:
801055e4:	6a 00                	push   $0x0
801055e6:	6a 0f                	push   $0xf
801055e8:	e9 19 fb ff ff       	jmp    80105106 <alltraps>

801055ed <vector16>:
801055ed:	6a 00                	push   $0x0
801055ef:	6a 10                	push   $0x10
801055f1:	e9 10 fb ff ff       	jmp    80105106 <alltraps>

801055f6 <vector17>:
801055f6:	6a 11                	push   $0x11
801055f8:	e9 09 fb ff ff       	jmp    80105106 <alltraps>

801055fd <vector18>:
801055fd:	6a 00                	push   $0x0
801055ff:	6a 12                	push   $0x12
80105601:	e9 00 fb ff ff       	jmp    80105106 <alltraps>

80105606 <vector19>:
80105606:	6a 00                	push   $0x0
80105608:	6a 13                	push   $0x13
8010560a:	e9 f7 fa ff ff       	jmp    80105106 <alltraps>

8010560f <vector20>:
8010560f:	6a 00                	push   $0x0
80105611:	6a 14                	push   $0x14
80105613:	e9 ee fa ff ff       	jmp    80105106 <alltraps>

80105618 <vector21>:
80105618:	6a 00                	push   $0x0
8010561a:	6a 15                	push   $0x15
8010561c:	e9 e5 fa ff ff       	jmp    80105106 <alltraps>

80105621 <vector22>:
80105621:	6a 00                	push   $0x0
80105623:	6a 16                	push   $0x16
80105625:	e9 dc fa ff ff       	jmp    80105106 <alltraps>

8010562a <vector23>:
8010562a:	6a 00                	push   $0x0
8010562c:	6a 17                	push   $0x17
8010562e:	e9 d3 fa ff ff       	jmp    80105106 <alltraps>

80105633 <vector24>:
80105633:	6a 00                	push   $0x0
80105635:	6a 18                	push   $0x18
80105637:	e9 ca fa ff ff       	jmp    80105106 <alltraps>

8010563c <vector25>:
8010563c:	6a 00                	push   $0x0
8010563e:	6a 19                	push   $0x19
80105640:	e9 c1 fa ff ff       	jmp    80105106 <alltraps>

80105645 <vector26>:
80105645:	6a 00                	push   $0x0
80105647:	6a 1a                	push   $0x1a
80105649:	e9 b8 fa ff ff       	jmp    80105106 <alltraps>

8010564e <vector27>:
8010564e:	6a 00                	push   $0x0
80105650:	6a 1b                	push   $0x1b
80105652:	e9 af fa ff ff       	jmp    80105106 <alltraps>

80105657 <vector28>:
80105657:	6a 00                	push   $0x0
80105659:	6a 1c                	push   $0x1c
8010565b:	e9 a6 fa ff ff       	jmp    80105106 <alltraps>

80105660 <vector29>:
80105660:	6a 00                	push   $0x0
80105662:	6a 1d                	push   $0x1d
80105664:	e9 9d fa ff ff       	jmp    80105106 <alltraps>

80105669 <vector30>:
80105669:	6a 00                	push   $0x0
8010566b:	6a 1e                	push   $0x1e
8010566d:	e9 94 fa ff ff       	jmp    80105106 <alltraps>

80105672 <vector31>:
80105672:	6a 00                	push   $0x0
80105674:	6a 1f                	push   $0x1f
80105676:	e9 8b fa ff ff       	jmp    80105106 <alltraps>

8010567b <vector32>:
8010567b:	6a 00                	push   $0x0
8010567d:	6a 20                	push   $0x20
8010567f:	e9 82 fa ff ff       	jmp    80105106 <alltraps>

80105684 <vector33>:
80105684:	6a 00                	push   $0x0
80105686:	6a 21                	push   $0x21
80105688:	e9 79 fa ff ff       	jmp    80105106 <alltraps>

8010568d <vector34>:
8010568d:	6a 00                	push   $0x0
8010568f:	6a 22                	push   $0x22
80105691:	e9 70 fa ff ff       	jmp    80105106 <alltraps>

80105696 <vector35>:
80105696:	6a 00                	push   $0x0
80105698:	6a 23                	push   $0x23
8010569a:	e9 67 fa ff ff       	jmp    80105106 <alltraps>

8010569f <vector36>:
8010569f:	6a 00                	push   $0x0
801056a1:	6a 24                	push   $0x24
801056a3:	e9 5e fa ff ff       	jmp    80105106 <alltraps>

801056a8 <vector37>:
801056a8:	6a 00                	push   $0x0
801056aa:	6a 25                	push   $0x25
801056ac:	e9 55 fa ff ff       	jmp    80105106 <alltraps>

801056b1 <vector38>:
801056b1:	6a 00                	push   $0x0
801056b3:	6a 26                	push   $0x26
801056b5:	e9 4c fa ff ff       	jmp    80105106 <alltraps>

801056ba <vector39>:
801056ba:	6a 00                	push   $0x0
801056bc:	6a 27                	push   $0x27
801056be:	e9 43 fa ff ff       	jmp    80105106 <alltraps>

801056c3 <vector40>:
801056c3:	6a 00                	push   $0x0
801056c5:	6a 28                	push   $0x28
801056c7:	e9 3a fa ff ff       	jmp    80105106 <alltraps>

801056cc <vector41>:
801056cc:	6a 00                	push   $0x0
801056ce:	6a 29                	push   $0x29
801056d0:	e9 31 fa ff ff       	jmp    80105106 <alltraps>

801056d5 <vector42>:
801056d5:	6a 00                	push   $0x0
801056d7:	6a 2a                	push   $0x2a
801056d9:	e9 28 fa ff ff       	jmp    80105106 <alltraps>

801056de <vector43>:
801056de:	6a 00                	push   $0x0
801056e0:	6a 2b                	push   $0x2b
801056e2:	e9 1f fa ff ff       	jmp    80105106 <alltraps>

801056e7 <vector44>:
801056e7:	6a 00                	push   $0x0
801056e9:	6a 2c                	push   $0x2c
801056eb:	e9 16 fa ff ff       	jmp    80105106 <alltraps>

801056f0 <vector45>:
801056f0:	6a 00                	push   $0x0
801056f2:	6a 2d                	push   $0x2d
801056f4:	e9 0d fa ff ff       	jmp    80105106 <alltraps>

801056f9 <vector46>:
801056f9:	6a 00                	push   $0x0
801056fb:	6a 2e                	push   $0x2e
801056fd:	e9 04 fa ff ff       	jmp    80105106 <alltraps>

80105702 <vector47>:
80105702:	6a 00                	push   $0x0
80105704:	6a 2f                	push   $0x2f
80105706:	e9 fb f9 ff ff       	jmp    80105106 <alltraps>

8010570b <vector48>:
8010570b:	6a 00                	push   $0x0
8010570d:	6a 30                	push   $0x30
8010570f:	e9 f2 f9 ff ff       	jmp    80105106 <alltraps>

80105714 <vector49>:
80105714:	6a 00                	push   $0x0
80105716:	6a 31                	push   $0x31
80105718:	e9 e9 f9 ff ff       	jmp    80105106 <alltraps>

8010571d <vector50>:
8010571d:	6a 00                	push   $0x0
8010571f:	6a 32                	push   $0x32
80105721:	e9 e0 f9 ff ff       	jmp    80105106 <alltraps>

80105726 <vector51>:
80105726:	6a 00                	push   $0x0
80105728:	6a 33                	push   $0x33
8010572a:	e9 d7 f9 ff ff       	jmp    80105106 <alltraps>

8010572f <vector52>:
8010572f:	6a 00                	push   $0x0
80105731:	6a 34                	push   $0x34
80105733:	e9 ce f9 ff ff       	jmp    80105106 <alltraps>

80105738 <vector53>:
80105738:	6a 00                	push   $0x0
8010573a:	6a 35                	push   $0x35
8010573c:	e9 c5 f9 ff ff       	jmp    80105106 <alltraps>

80105741 <vector54>:
80105741:	6a 00                	push   $0x0
80105743:	6a 36                	push   $0x36
80105745:	e9 bc f9 ff ff       	jmp    80105106 <alltraps>

8010574a <vector55>:
8010574a:	6a 00                	push   $0x0
8010574c:	6a 37                	push   $0x37
8010574e:	e9 b3 f9 ff ff       	jmp    80105106 <alltraps>

80105753 <vector56>:
80105753:	6a 00                	push   $0x0
80105755:	6a 38                	push   $0x38
80105757:	e9 aa f9 ff ff       	jmp    80105106 <alltraps>

8010575c <vector57>:
8010575c:	6a 00                	push   $0x0
8010575e:	6a 39                	push   $0x39
80105760:	e9 a1 f9 ff ff       	jmp    80105106 <alltraps>

80105765 <vector58>:
80105765:	6a 00                	push   $0x0
80105767:	6a 3a                	push   $0x3a
80105769:	e9 98 f9 ff ff       	jmp    80105106 <alltraps>

8010576e <vector59>:
8010576e:	6a 00                	push   $0x0
80105770:	6a 3b                	push   $0x3b
80105772:	e9 8f f9 ff ff       	jmp    80105106 <alltraps>

80105777 <vector60>:
80105777:	6a 00                	push   $0x0
80105779:	6a 3c                	push   $0x3c
8010577b:	e9 86 f9 ff ff       	jmp    80105106 <alltraps>

80105780 <vector61>:
80105780:	6a 00                	push   $0x0
80105782:	6a 3d                	push   $0x3d
80105784:	e9 7d f9 ff ff       	jmp    80105106 <alltraps>

80105789 <vector62>:
80105789:	6a 00                	push   $0x0
8010578b:	6a 3e                	push   $0x3e
8010578d:	e9 74 f9 ff ff       	jmp    80105106 <alltraps>

80105792 <vector63>:
80105792:	6a 00                	push   $0x0
80105794:	6a 3f                	push   $0x3f
80105796:	e9 6b f9 ff ff       	jmp    80105106 <alltraps>

8010579b <vector64>:
8010579b:	6a 00                	push   $0x0
8010579d:	6a 40                	push   $0x40
8010579f:	e9 62 f9 ff ff       	jmp    80105106 <alltraps>

801057a4 <vector65>:
801057a4:	6a 00                	push   $0x0
801057a6:	6a 41                	push   $0x41
801057a8:	e9 59 f9 ff ff       	jmp    80105106 <alltraps>

801057ad <vector66>:
801057ad:	6a 00                	push   $0x0
801057af:	6a 42                	push   $0x42
801057b1:	e9 50 f9 ff ff       	jmp    80105106 <alltraps>

801057b6 <vector67>:
801057b6:	6a 00                	push   $0x0
801057b8:	6a 43                	push   $0x43
801057ba:	e9 47 f9 ff ff       	jmp    80105106 <alltraps>

801057bf <vector68>:
801057bf:	6a 00                	push   $0x0
801057c1:	6a 44                	push   $0x44
801057c3:	e9 3e f9 ff ff       	jmp    80105106 <alltraps>

801057c8 <vector69>:
801057c8:	6a 00                	push   $0x0
801057ca:	6a 45                	push   $0x45
801057cc:	e9 35 f9 ff ff       	jmp    80105106 <alltraps>

801057d1 <vector70>:
801057d1:	6a 00                	push   $0x0
801057d3:	6a 46                	push   $0x46
801057d5:	e9 2c f9 ff ff       	jmp    80105106 <alltraps>

801057da <vector71>:
801057da:	6a 00                	push   $0x0
801057dc:	6a 47                	push   $0x47
801057de:	e9 23 f9 ff ff       	jmp    80105106 <alltraps>

801057e3 <vector72>:
801057e3:	6a 00                	push   $0x0
801057e5:	6a 48                	push   $0x48
801057e7:	e9 1a f9 ff ff       	jmp    80105106 <alltraps>

801057ec <vector73>:
801057ec:	6a 00                	push   $0x0
801057ee:	6a 49                	push   $0x49
801057f0:	e9 11 f9 ff ff       	jmp    80105106 <alltraps>

801057f5 <vector74>:
801057f5:	6a 00                	push   $0x0
801057f7:	6a 4a                	push   $0x4a
801057f9:	e9 08 f9 ff ff       	jmp    80105106 <alltraps>

801057fe <vector75>:
801057fe:	6a 00                	push   $0x0
80105800:	6a 4b                	push   $0x4b
80105802:	e9 ff f8 ff ff       	jmp    80105106 <alltraps>

80105807 <vector76>:
80105807:	6a 00                	push   $0x0
80105809:	6a 4c                	push   $0x4c
8010580b:	e9 f6 f8 ff ff       	jmp    80105106 <alltraps>

80105810 <vector77>:
80105810:	6a 00                	push   $0x0
80105812:	6a 4d                	push   $0x4d
80105814:	e9 ed f8 ff ff       	jmp    80105106 <alltraps>

80105819 <vector78>:
80105819:	6a 00                	push   $0x0
8010581b:	6a 4e                	push   $0x4e
8010581d:	e9 e4 f8 ff ff       	jmp    80105106 <alltraps>

80105822 <vector79>:
80105822:	6a 00                	push   $0x0
80105824:	6a 4f                	push   $0x4f
80105826:	e9 db f8 ff ff       	jmp    80105106 <alltraps>

8010582b <vector80>:
8010582b:	6a 00                	push   $0x0
8010582d:	6a 50                	push   $0x50
8010582f:	e9 d2 f8 ff ff       	jmp    80105106 <alltraps>

80105834 <vector81>:
80105834:	6a 00                	push   $0x0
80105836:	6a 51                	push   $0x51
80105838:	e9 c9 f8 ff ff       	jmp    80105106 <alltraps>

8010583d <vector82>:
8010583d:	6a 00                	push   $0x0
8010583f:	6a 52                	push   $0x52
80105841:	e9 c0 f8 ff ff       	jmp    80105106 <alltraps>

80105846 <vector83>:
80105846:	6a 00                	push   $0x0
80105848:	6a 53                	push   $0x53
8010584a:	e9 b7 f8 ff ff       	jmp    80105106 <alltraps>

8010584f <vector84>:
8010584f:	6a 00                	push   $0x0
80105851:	6a 54                	push   $0x54
80105853:	e9 ae f8 ff ff       	jmp    80105106 <alltraps>

80105858 <vector85>:
80105858:	6a 00                	push   $0x0
8010585a:	6a 55                	push   $0x55
8010585c:	e9 a5 f8 ff ff       	jmp    80105106 <alltraps>

80105861 <vector86>:
80105861:	6a 00                	push   $0x0
80105863:	6a 56                	push   $0x56
80105865:	e9 9c f8 ff ff       	jmp    80105106 <alltraps>

8010586a <vector87>:
8010586a:	6a 00                	push   $0x0
8010586c:	6a 57                	push   $0x57
8010586e:	e9 93 f8 ff ff       	jmp    80105106 <alltraps>

80105873 <vector88>:
80105873:	6a 00                	push   $0x0
80105875:	6a 58                	push   $0x58
80105877:	e9 8a f8 ff ff       	jmp    80105106 <alltraps>

8010587c <vector89>:
8010587c:	6a 00                	push   $0x0
8010587e:	6a 59                	push   $0x59
80105880:	e9 81 f8 ff ff       	jmp    80105106 <alltraps>

80105885 <vector90>:
80105885:	6a 00                	push   $0x0
80105887:	6a 5a                	push   $0x5a
80105889:	e9 78 f8 ff ff       	jmp    80105106 <alltraps>

8010588e <vector91>:
8010588e:	6a 00                	push   $0x0
80105890:	6a 5b                	push   $0x5b
80105892:	e9 6f f8 ff ff       	jmp    80105106 <alltraps>

80105897 <vector92>:
80105897:	6a 00                	push   $0x0
80105899:	6a 5c                	push   $0x5c
8010589b:	e9 66 f8 ff ff       	jmp    80105106 <alltraps>

801058a0 <vector93>:
801058a0:	6a 00                	push   $0x0
801058a2:	6a 5d                	push   $0x5d
801058a4:	e9 5d f8 ff ff       	jmp    80105106 <alltraps>

801058a9 <vector94>:
801058a9:	6a 00                	push   $0x0
801058ab:	6a 5e                	push   $0x5e
801058ad:	e9 54 f8 ff ff       	jmp    80105106 <alltraps>

801058b2 <vector95>:
801058b2:	6a 00                	push   $0x0
801058b4:	6a 5f                	push   $0x5f
801058b6:	e9 4b f8 ff ff       	jmp    80105106 <alltraps>

801058bb <vector96>:
801058bb:	6a 00                	push   $0x0
801058bd:	6a 60                	push   $0x60
801058bf:	e9 42 f8 ff ff       	jmp    80105106 <alltraps>

801058c4 <vector97>:
801058c4:	6a 00                	push   $0x0
801058c6:	6a 61                	push   $0x61
801058c8:	e9 39 f8 ff ff       	jmp    80105106 <alltraps>

801058cd <vector98>:
801058cd:	6a 00                	push   $0x0
801058cf:	6a 62                	push   $0x62
801058d1:	e9 30 f8 ff ff       	jmp    80105106 <alltraps>

801058d6 <vector99>:
801058d6:	6a 00                	push   $0x0
801058d8:	6a 63                	push   $0x63
801058da:	e9 27 f8 ff ff       	jmp    80105106 <alltraps>

801058df <vector100>:
801058df:	6a 00                	push   $0x0
801058e1:	6a 64                	push   $0x64
801058e3:	e9 1e f8 ff ff       	jmp    80105106 <alltraps>

801058e8 <vector101>:
801058e8:	6a 00                	push   $0x0
801058ea:	6a 65                	push   $0x65
801058ec:	e9 15 f8 ff ff       	jmp    80105106 <alltraps>

801058f1 <vector102>:
801058f1:	6a 00                	push   $0x0
801058f3:	6a 66                	push   $0x66
801058f5:	e9 0c f8 ff ff       	jmp    80105106 <alltraps>

801058fa <vector103>:
801058fa:	6a 00                	push   $0x0
801058fc:	6a 67                	push   $0x67
801058fe:	e9 03 f8 ff ff       	jmp    80105106 <alltraps>

80105903 <vector104>:
80105903:	6a 00                	push   $0x0
80105905:	6a 68                	push   $0x68
80105907:	e9 fa f7 ff ff       	jmp    80105106 <alltraps>

8010590c <vector105>:
8010590c:	6a 00                	push   $0x0
8010590e:	6a 69                	push   $0x69
80105910:	e9 f1 f7 ff ff       	jmp    80105106 <alltraps>

80105915 <vector106>:
80105915:	6a 00                	push   $0x0
80105917:	6a 6a                	push   $0x6a
80105919:	e9 e8 f7 ff ff       	jmp    80105106 <alltraps>

8010591e <vector107>:
8010591e:	6a 00                	push   $0x0
80105920:	6a 6b                	push   $0x6b
80105922:	e9 df f7 ff ff       	jmp    80105106 <alltraps>

80105927 <vector108>:
80105927:	6a 00                	push   $0x0
80105929:	6a 6c                	push   $0x6c
8010592b:	e9 d6 f7 ff ff       	jmp    80105106 <alltraps>

80105930 <vector109>:
80105930:	6a 00                	push   $0x0
80105932:	6a 6d                	push   $0x6d
80105934:	e9 cd f7 ff ff       	jmp    80105106 <alltraps>

80105939 <vector110>:
80105939:	6a 00                	push   $0x0
8010593b:	6a 6e                	push   $0x6e
8010593d:	e9 c4 f7 ff ff       	jmp    80105106 <alltraps>

80105942 <vector111>:
80105942:	6a 00                	push   $0x0
80105944:	6a 6f                	push   $0x6f
80105946:	e9 bb f7 ff ff       	jmp    80105106 <alltraps>

8010594b <vector112>:
8010594b:	6a 00                	push   $0x0
8010594d:	6a 70                	push   $0x70
8010594f:	e9 b2 f7 ff ff       	jmp    80105106 <alltraps>

80105954 <vector113>:
80105954:	6a 00                	push   $0x0
80105956:	6a 71                	push   $0x71
80105958:	e9 a9 f7 ff ff       	jmp    80105106 <alltraps>

8010595d <vector114>:
8010595d:	6a 00                	push   $0x0
8010595f:	6a 72                	push   $0x72
80105961:	e9 a0 f7 ff ff       	jmp    80105106 <alltraps>

80105966 <vector115>:
80105966:	6a 00                	push   $0x0
80105968:	6a 73                	push   $0x73
8010596a:	e9 97 f7 ff ff       	jmp    80105106 <alltraps>

8010596f <vector116>:
8010596f:	6a 00                	push   $0x0
80105971:	6a 74                	push   $0x74
80105973:	e9 8e f7 ff ff       	jmp    80105106 <alltraps>

80105978 <vector117>:
80105978:	6a 00                	push   $0x0
8010597a:	6a 75                	push   $0x75
8010597c:	e9 85 f7 ff ff       	jmp    80105106 <alltraps>

80105981 <vector118>:
80105981:	6a 00                	push   $0x0
80105983:	6a 76                	push   $0x76
80105985:	e9 7c f7 ff ff       	jmp    80105106 <alltraps>

8010598a <vector119>:
8010598a:	6a 00                	push   $0x0
8010598c:	6a 77                	push   $0x77
8010598e:	e9 73 f7 ff ff       	jmp    80105106 <alltraps>

80105993 <vector120>:
80105993:	6a 00                	push   $0x0
80105995:	6a 78                	push   $0x78
80105997:	e9 6a f7 ff ff       	jmp    80105106 <alltraps>

8010599c <vector121>:
8010599c:	6a 00                	push   $0x0
8010599e:	6a 79                	push   $0x79
801059a0:	e9 61 f7 ff ff       	jmp    80105106 <alltraps>

801059a5 <vector122>:
801059a5:	6a 00                	push   $0x0
801059a7:	6a 7a                	push   $0x7a
801059a9:	e9 58 f7 ff ff       	jmp    80105106 <alltraps>

801059ae <vector123>:
801059ae:	6a 00                	push   $0x0
801059b0:	6a 7b                	push   $0x7b
801059b2:	e9 4f f7 ff ff       	jmp    80105106 <alltraps>

801059b7 <vector124>:
801059b7:	6a 00                	push   $0x0
801059b9:	6a 7c                	push   $0x7c
801059bb:	e9 46 f7 ff ff       	jmp    80105106 <alltraps>

801059c0 <vector125>:
801059c0:	6a 00                	push   $0x0
801059c2:	6a 7d                	push   $0x7d
801059c4:	e9 3d f7 ff ff       	jmp    80105106 <alltraps>

801059c9 <vector126>:
801059c9:	6a 00                	push   $0x0
801059cb:	6a 7e                	push   $0x7e
801059cd:	e9 34 f7 ff ff       	jmp    80105106 <alltraps>

801059d2 <vector127>:
801059d2:	6a 00                	push   $0x0
801059d4:	6a 7f                	push   $0x7f
801059d6:	e9 2b f7 ff ff       	jmp    80105106 <alltraps>

801059db <vector128>:
801059db:	6a 00                	push   $0x0
801059dd:	68 80 00 00 00       	push   $0x80
801059e2:	e9 1f f7 ff ff       	jmp    80105106 <alltraps>

801059e7 <vector129>:
801059e7:	6a 00                	push   $0x0
801059e9:	68 81 00 00 00       	push   $0x81
801059ee:	e9 13 f7 ff ff       	jmp    80105106 <alltraps>

801059f3 <vector130>:
801059f3:	6a 00                	push   $0x0
801059f5:	68 82 00 00 00       	push   $0x82
801059fa:	e9 07 f7 ff ff       	jmp    80105106 <alltraps>

801059ff <vector131>:
801059ff:	6a 00                	push   $0x0
80105a01:	68 83 00 00 00       	push   $0x83
80105a06:	e9 fb f6 ff ff       	jmp    80105106 <alltraps>

80105a0b <vector132>:
80105a0b:	6a 00                	push   $0x0
80105a0d:	68 84 00 00 00       	push   $0x84
80105a12:	e9 ef f6 ff ff       	jmp    80105106 <alltraps>

80105a17 <vector133>:
80105a17:	6a 00                	push   $0x0
80105a19:	68 85 00 00 00       	push   $0x85
80105a1e:	e9 e3 f6 ff ff       	jmp    80105106 <alltraps>

80105a23 <vector134>:
80105a23:	6a 00                	push   $0x0
80105a25:	68 86 00 00 00       	push   $0x86
80105a2a:	e9 d7 f6 ff ff       	jmp    80105106 <alltraps>

80105a2f <vector135>:
80105a2f:	6a 00                	push   $0x0
80105a31:	68 87 00 00 00       	push   $0x87
80105a36:	e9 cb f6 ff ff       	jmp    80105106 <alltraps>

80105a3b <vector136>:
80105a3b:	6a 00                	push   $0x0
80105a3d:	68 88 00 00 00       	push   $0x88
80105a42:	e9 bf f6 ff ff       	jmp    80105106 <alltraps>

80105a47 <vector137>:
80105a47:	6a 00                	push   $0x0
80105a49:	68 89 00 00 00       	push   $0x89
80105a4e:	e9 b3 f6 ff ff       	jmp    80105106 <alltraps>

80105a53 <vector138>:
80105a53:	6a 00                	push   $0x0
80105a55:	68 8a 00 00 00       	push   $0x8a
80105a5a:	e9 a7 f6 ff ff       	jmp    80105106 <alltraps>

80105a5f <vector139>:
80105a5f:	6a 00                	push   $0x0
80105a61:	68 8b 00 00 00       	push   $0x8b
80105a66:	e9 9b f6 ff ff       	jmp    80105106 <alltraps>

80105a6b <vector140>:
80105a6b:	6a 00                	push   $0x0
80105a6d:	68 8c 00 00 00       	push   $0x8c
80105a72:	e9 8f f6 ff ff       	jmp    80105106 <alltraps>

80105a77 <vector141>:
80105a77:	6a 00                	push   $0x0
80105a79:	68 8d 00 00 00       	push   $0x8d
80105a7e:	e9 83 f6 ff ff       	jmp    80105106 <alltraps>

80105a83 <vector142>:
80105a83:	6a 00                	push   $0x0
80105a85:	68 8e 00 00 00       	push   $0x8e
80105a8a:	e9 77 f6 ff ff       	jmp    80105106 <alltraps>

80105a8f <vector143>:
80105a8f:	6a 00                	push   $0x0
80105a91:	68 8f 00 00 00       	push   $0x8f
80105a96:	e9 6b f6 ff ff       	jmp    80105106 <alltraps>

80105a9b <vector144>:
80105a9b:	6a 00                	push   $0x0
80105a9d:	68 90 00 00 00       	push   $0x90
80105aa2:	e9 5f f6 ff ff       	jmp    80105106 <alltraps>

80105aa7 <vector145>:
80105aa7:	6a 00                	push   $0x0
80105aa9:	68 91 00 00 00       	push   $0x91
80105aae:	e9 53 f6 ff ff       	jmp    80105106 <alltraps>

80105ab3 <vector146>:
80105ab3:	6a 00                	push   $0x0
80105ab5:	68 92 00 00 00       	push   $0x92
80105aba:	e9 47 f6 ff ff       	jmp    80105106 <alltraps>

80105abf <vector147>:
80105abf:	6a 00                	push   $0x0
80105ac1:	68 93 00 00 00       	push   $0x93
80105ac6:	e9 3b f6 ff ff       	jmp    80105106 <alltraps>

80105acb <vector148>:
80105acb:	6a 00                	push   $0x0
80105acd:	68 94 00 00 00       	push   $0x94
80105ad2:	e9 2f f6 ff ff       	jmp    80105106 <alltraps>

80105ad7 <vector149>:
80105ad7:	6a 00                	push   $0x0
80105ad9:	68 95 00 00 00       	push   $0x95
80105ade:	e9 23 f6 ff ff       	jmp    80105106 <alltraps>

80105ae3 <vector150>:
80105ae3:	6a 00                	push   $0x0
80105ae5:	68 96 00 00 00       	push   $0x96
80105aea:	e9 17 f6 ff ff       	jmp    80105106 <alltraps>

80105aef <vector151>:
80105aef:	6a 00                	push   $0x0
80105af1:	68 97 00 00 00       	push   $0x97
80105af6:	e9 0b f6 ff ff       	jmp    80105106 <alltraps>

80105afb <vector152>:
80105afb:	6a 00                	push   $0x0
80105afd:	68 98 00 00 00       	push   $0x98
80105b02:	e9 ff f5 ff ff       	jmp    80105106 <alltraps>

80105b07 <vector153>:
80105b07:	6a 00                	push   $0x0
80105b09:	68 99 00 00 00       	push   $0x99
80105b0e:	e9 f3 f5 ff ff       	jmp    80105106 <alltraps>

80105b13 <vector154>:
80105b13:	6a 00                	push   $0x0
80105b15:	68 9a 00 00 00       	push   $0x9a
80105b1a:	e9 e7 f5 ff ff       	jmp    80105106 <alltraps>

80105b1f <vector155>:
80105b1f:	6a 00                	push   $0x0
80105b21:	68 9b 00 00 00       	push   $0x9b
80105b26:	e9 db f5 ff ff       	jmp    80105106 <alltraps>

80105b2b <vector156>:
80105b2b:	6a 00                	push   $0x0
80105b2d:	68 9c 00 00 00       	push   $0x9c
80105b32:	e9 cf f5 ff ff       	jmp    80105106 <alltraps>

80105b37 <vector157>:
80105b37:	6a 00                	push   $0x0
80105b39:	68 9d 00 00 00       	push   $0x9d
80105b3e:	e9 c3 f5 ff ff       	jmp    80105106 <alltraps>

80105b43 <vector158>:
80105b43:	6a 00                	push   $0x0
80105b45:	68 9e 00 00 00       	push   $0x9e
80105b4a:	e9 b7 f5 ff ff       	jmp    80105106 <alltraps>

80105b4f <vector159>:
80105b4f:	6a 00                	push   $0x0
80105b51:	68 9f 00 00 00       	push   $0x9f
80105b56:	e9 ab f5 ff ff       	jmp    80105106 <alltraps>

80105b5b <vector160>:
80105b5b:	6a 00                	push   $0x0
80105b5d:	68 a0 00 00 00       	push   $0xa0
80105b62:	e9 9f f5 ff ff       	jmp    80105106 <alltraps>

80105b67 <vector161>:
80105b67:	6a 00                	push   $0x0
80105b69:	68 a1 00 00 00       	push   $0xa1
80105b6e:	e9 93 f5 ff ff       	jmp    80105106 <alltraps>

80105b73 <vector162>:
80105b73:	6a 00                	push   $0x0
80105b75:	68 a2 00 00 00       	push   $0xa2
80105b7a:	e9 87 f5 ff ff       	jmp    80105106 <alltraps>

80105b7f <vector163>:
80105b7f:	6a 00                	push   $0x0
80105b81:	68 a3 00 00 00       	push   $0xa3
80105b86:	e9 7b f5 ff ff       	jmp    80105106 <alltraps>

80105b8b <vector164>:
80105b8b:	6a 00                	push   $0x0
80105b8d:	68 a4 00 00 00       	push   $0xa4
80105b92:	e9 6f f5 ff ff       	jmp    80105106 <alltraps>

80105b97 <vector165>:
80105b97:	6a 00                	push   $0x0
80105b99:	68 a5 00 00 00       	push   $0xa5
80105b9e:	e9 63 f5 ff ff       	jmp    80105106 <alltraps>

80105ba3 <vector166>:
80105ba3:	6a 00                	push   $0x0
80105ba5:	68 a6 00 00 00       	push   $0xa6
80105baa:	e9 57 f5 ff ff       	jmp    80105106 <alltraps>

80105baf <vector167>:
80105baf:	6a 00                	push   $0x0
80105bb1:	68 a7 00 00 00       	push   $0xa7
80105bb6:	e9 4b f5 ff ff       	jmp    80105106 <alltraps>

80105bbb <vector168>:
80105bbb:	6a 00                	push   $0x0
80105bbd:	68 a8 00 00 00       	push   $0xa8
80105bc2:	e9 3f f5 ff ff       	jmp    80105106 <alltraps>

80105bc7 <vector169>:
80105bc7:	6a 00                	push   $0x0
80105bc9:	68 a9 00 00 00       	push   $0xa9
80105bce:	e9 33 f5 ff ff       	jmp    80105106 <alltraps>

80105bd3 <vector170>:
80105bd3:	6a 00                	push   $0x0
80105bd5:	68 aa 00 00 00       	push   $0xaa
80105bda:	e9 27 f5 ff ff       	jmp    80105106 <alltraps>

80105bdf <vector171>:
80105bdf:	6a 00                	push   $0x0
80105be1:	68 ab 00 00 00       	push   $0xab
80105be6:	e9 1b f5 ff ff       	jmp    80105106 <alltraps>

80105beb <vector172>:
80105beb:	6a 00                	push   $0x0
80105bed:	68 ac 00 00 00       	push   $0xac
80105bf2:	e9 0f f5 ff ff       	jmp    80105106 <alltraps>

80105bf7 <vector173>:
80105bf7:	6a 00                	push   $0x0
80105bf9:	68 ad 00 00 00       	push   $0xad
80105bfe:	e9 03 f5 ff ff       	jmp    80105106 <alltraps>

80105c03 <vector174>:
80105c03:	6a 00                	push   $0x0
80105c05:	68 ae 00 00 00       	push   $0xae
80105c0a:	e9 f7 f4 ff ff       	jmp    80105106 <alltraps>

80105c0f <vector175>:
80105c0f:	6a 00                	push   $0x0
80105c11:	68 af 00 00 00       	push   $0xaf
80105c16:	e9 eb f4 ff ff       	jmp    80105106 <alltraps>

80105c1b <vector176>:
80105c1b:	6a 00                	push   $0x0
80105c1d:	68 b0 00 00 00       	push   $0xb0
80105c22:	e9 df f4 ff ff       	jmp    80105106 <alltraps>

80105c27 <vector177>:
80105c27:	6a 00                	push   $0x0
80105c29:	68 b1 00 00 00       	push   $0xb1
80105c2e:	e9 d3 f4 ff ff       	jmp    80105106 <alltraps>

80105c33 <vector178>:
80105c33:	6a 00                	push   $0x0
80105c35:	68 b2 00 00 00       	push   $0xb2
80105c3a:	e9 c7 f4 ff ff       	jmp    80105106 <alltraps>

80105c3f <vector179>:
80105c3f:	6a 00                	push   $0x0
80105c41:	68 b3 00 00 00       	push   $0xb3
80105c46:	e9 bb f4 ff ff       	jmp    80105106 <alltraps>

80105c4b <vector180>:
80105c4b:	6a 00                	push   $0x0
80105c4d:	68 b4 00 00 00       	push   $0xb4
80105c52:	e9 af f4 ff ff       	jmp    80105106 <alltraps>

80105c57 <vector181>:
80105c57:	6a 00                	push   $0x0
80105c59:	68 b5 00 00 00       	push   $0xb5
80105c5e:	e9 a3 f4 ff ff       	jmp    80105106 <alltraps>

80105c63 <vector182>:
80105c63:	6a 00                	push   $0x0
80105c65:	68 b6 00 00 00       	push   $0xb6
80105c6a:	e9 97 f4 ff ff       	jmp    80105106 <alltraps>

80105c6f <vector183>:
80105c6f:	6a 00                	push   $0x0
80105c71:	68 b7 00 00 00       	push   $0xb7
80105c76:	e9 8b f4 ff ff       	jmp    80105106 <alltraps>

80105c7b <vector184>:
80105c7b:	6a 00                	push   $0x0
80105c7d:	68 b8 00 00 00       	push   $0xb8
80105c82:	e9 7f f4 ff ff       	jmp    80105106 <alltraps>

80105c87 <vector185>:
80105c87:	6a 00                	push   $0x0
80105c89:	68 b9 00 00 00       	push   $0xb9
80105c8e:	e9 73 f4 ff ff       	jmp    80105106 <alltraps>

80105c93 <vector186>:
80105c93:	6a 00                	push   $0x0
80105c95:	68 ba 00 00 00       	push   $0xba
80105c9a:	e9 67 f4 ff ff       	jmp    80105106 <alltraps>

80105c9f <vector187>:
80105c9f:	6a 00                	push   $0x0
80105ca1:	68 bb 00 00 00       	push   $0xbb
80105ca6:	e9 5b f4 ff ff       	jmp    80105106 <alltraps>

80105cab <vector188>:
80105cab:	6a 00                	push   $0x0
80105cad:	68 bc 00 00 00       	push   $0xbc
80105cb2:	e9 4f f4 ff ff       	jmp    80105106 <alltraps>

80105cb7 <vector189>:
80105cb7:	6a 00                	push   $0x0
80105cb9:	68 bd 00 00 00       	push   $0xbd
80105cbe:	e9 43 f4 ff ff       	jmp    80105106 <alltraps>

80105cc3 <vector190>:
80105cc3:	6a 00                	push   $0x0
80105cc5:	68 be 00 00 00       	push   $0xbe
80105cca:	e9 37 f4 ff ff       	jmp    80105106 <alltraps>

80105ccf <vector191>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	68 bf 00 00 00       	push   $0xbf
80105cd6:	e9 2b f4 ff ff       	jmp    80105106 <alltraps>

80105cdb <vector192>:
80105cdb:	6a 00                	push   $0x0
80105cdd:	68 c0 00 00 00       	push   $0xc0
80105ce2:	e9 1f f4 ff ff       	jmp    80105106 <alltraps>

80105ce7 <vector193>:
80105ce7:	6a 00                	push   $0x0
80105ce9:	68 c1 00 00 00       	push   $0xc1
80105cee:	e9 13 f4 ff ff       	jmp    80105106 <alltraps>

80105cf3 <vector194>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	68 c2 00 00 00       	push   $0xc2
80105cfa:	e9 07 f4 ff ff       	jmp    80105106 <alltraps>

80105cff <vector195>:
80105cff:	6a 00                	push   $0x0
80105d01:	68 c3 00 00 00       	push   $0xc3
80105d06:	e9 fb f3 ff ff       	jmp    80105106 <alltraps>

80105d0b <vector196>:
80105d0b:	6a 00                	push   $0x0
80105d0d:	68 c4 00 00 00       	push   $0xc4
80105d12:	e9 ef f3 ff ff       	jmp    80105106 <alltraps>

80105d17 <vector197>:
80105d17:	6a 00                	push   $0x0
80105d19:	68 c5 00 00 00       	push   $0xc5
80105d1e:	e9 e3 f3 ff ff       	jmp    80105106 <alltraps>

80105d23 <vector198>:
80105d23:	6a 00                	push   $0x0
80105d25:	68 c6 00 00 00       	push   $0xc6
80105d2a:	e9 d7 f3 ff ff       	jmp    80105106 <alltraps>

80105d2f <vector199>:
80105d2f:	6a 00                	push   $0x0
80105d31:	68 c7 00 00 00       	push   $0xc7
80105d36:	e9 cb f3 ff ff       	jmp    80105106 <alltraps>

80105d3b <vector200>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	68 c8 00 00 00       	push   $0xc8
80105d42:	e9 bf f3 ff ff       	jmp    80105106 <alltraps>

80105d47 <vector201>:
80105d47:	6a 00                	push   $0x0
80105d49:	68 c9 00 00 00       	push   $0xc9
80105d4e:	e9 b3 f3 ff ff       	jmp    80105106 <alltraps>

80105d53 <vector202>:
80105d53:	6a 00                	push   $0x0
80105d55:	68 ca 00 00 00       	push   $0xca
80105d5a:	e9 a7 f3 ff ff       	jmp    80105106 <alltraps>

80105d5f <vector203>:
80105d5f:	6a 00                	push   $0x0
80105d61:	68 cb 00 00 00       	push   $0xcb
80105d66:	e9 9b f3 ff ff       	jmp    80105106 <alltraps>

80105d6b <vector204>:
80105d6b:	6a 00                	push   $0x0
80105d6d:	68 cc 00 00 00       	push   $0xcc
80105d72:	e9 8f f3 ff ff       	jmp    80105106 <alltraps>

80105d77 <vector205>:
80105d77:	6a 00                	push   $0x0
80105d79:	68 cd 00 00 00       	push   $0xcd
80105d7e:	e9 83 f3 ff ff       	jmp    80105106 <alltraps>

80105d83 <vector206>:
80105d83:	6a 00                	push   $0x0
80105d85:	68 ce 00 00 00       	push   $0xce
80105d8a:	e9 77 f3 ff ff       	jmp    80105106 <alltraps>

80105d8f <vector207>:
80105d8f:	6a 00                	push   $0x0
80105d91:	68 cf 00 00 00       	push   $0xcf
80105d96:	e9 6b f3 ff ff       	jmp    80105106 <alltraps>

80105d9b <vector208>:
80105d9b:	6a 00                	push   $0x0
80105d9d:	68 d0 00 00 00       	push   $0xd0
80105da2:	e9 5f f3 ff ff       	jmp    80105106 <alltraps>

80105da7 <vector209>:
80105da7:	6a 00                	push   $0x0
80105da9:	68 d1 00 00 00       	push   $0xd1
80105dae:	e9 53 f3 ff ff       	jmp    80105106 <alltraps>

80105db3 <vector210>:
80105db3:	6a 00                	push   $0x0
80105db5:	68 d2 00 00 00       	push   $0xd2
80105dba:	e9 47 f3 ff ff       	jmp    80105106 <alltraps>

80105dbf <vector211>:
80105dbf:	6a 00                	push   $0x0
80105dc1:	68 d3 00 00 00       	push   $0xd3
80105dc6:	e9 3b f3 ff ff       	jmp    80105106 <alltraps>

80105dcb <vector212>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	68 d4 00 00 00       	push   $0xd4
80105dd2:	e9 2f f3 ff ff       	jmp    80105106 <alltraps>

80105dd7 <vector213>:
80105dd7:	6a 00                	push   $0x0
80105dd9:	68 d5 00 00 00       	push   $0xd5
80105dde:	e9 23 f3 ff ff       	jmp    80105106 <alltraps>

80105de3 <vector214>:
80105de3:	6a 00                	push   $0x0
80105de5:	68 d6 00 00 00       	push   $0xd6
80105dea:	e9 17 f3 ff ff       	jmp    80105106 <alltraps>

80105def <vector215>:
80105def:	6a 00                	push   $0x0
80105df1:	68 d7 00 00 00       	push   $0xd7
80105df6:	e9 0b f3 ff ff       	jmp    80105106 <alltraps>

80105dfb <vector216>:
80105dfb:	6a 00                	push   $0x0
80105dfd:	68 d8 00 00 00       	push   $0xd8
80105e02:	e9 ff f2 ff ff       	jmp    80105106 <alltraps>

80105e07 <vector217>:
80105e07:	6a 00                	push   $0x0
80105e09:	68 d9 00 00 00       	push   $0xd9
80105e0e:	e9 f3 f2 ff ff       	jmp    80105106 <alltraps>

80105e13 <vector218>:
80105e13:	6a 00                	push   $0x0
80105e15:	68 da 00 00 00       	push   $0xda
80105e1a:	e9 e7 f2 ff ff       	jmp    80105106 <alltraps>

80105e1f <vector219>:
80105e1f:	6a 00                	push   $0x0
80105e21:	68 db 00 00 00       	push   $0xdb
80105e26:	e9 db f2 ff ff       	jmp    80105106 <alltraps>

80105e2b <vector220>:
80105e2b:	6a 00                	push   $0x0
80105e2d:	68 dc 00 00 00       	push   $0xdc
80105e32:	e9 cf f2 ff ff       	jmp    80105106 <alltraps>

80105e37 <vector221>:
80105e37:	6a 00                	push   $0x0
80105e39:	68 dd 00 00 00       	push   $0xdd
80105e3e:	e9 c3 f2 ff ff       	jmp    80105106 <alltraps>

80105e43 <vector222>:
80105e43:	6a 00                	push   $0x0
80105e45:	68 de 00 00 00       	push   $0xde
80105e4a:	e9 b7 f2 ff ff       	jmp    80105106 <alltraps>

80105e4f <vector223>:
80105e4f:	6a 00                	push   $0x0
80105e51:	68 df 00 00 00       	push   $0xdf
80105e56:	e9 ab f2 ff ff       	jmp    80105106 <alltraps>

80105e5b <vector224>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	68 e0 00 00 00       	push   $0xe0
80105e62:	e9 9f f2 ff ff       	jmp    80105106 <alltraps>

80105e67 <vector225>:
80105e67:	6a 00                	push   $0x0
80105e69:	68 e1 00 00 00       	push   $0xe1
80105e6e:	e9 93 f2 ff ff       	jmp    80105106 <alltraps>

80105e73 <vector226>:
80105e73:	6a 00                	push   $0x0
80105e75:	68 e2 00 00 00       	push   $0xe2
80105e7a:	e9 87 f2 ff ff       	jmp    80105106 <alltraps>

80105e7f <vector227>:
80105e7f:	6a 00                	push   $0x0
80105e81:	68 e3 00 00 00       	push   $0xe3
80105e86:	e9 7b f2 ff ff       	jmp    80105106 <alltraps>

80105e8b <vector228>:
80105e8b:	6a 00                	push   $0x0
80105e8d:	68 e4 00 00 00       	push   $0xe4
80105e92:	e9 6f f2 ff ff       	jmp    80105106 <alltraps>

80105e97 <vector229>:
80105e97:	6a 00                	push   $0x0
80105e99:	68 e5 00 00 00       	push   $0xe5
80105e9e:	e9 63 f2 ff ff       	jmp    80105106 <alltraps>

80105ea3 <vector230>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	68 e6 00 00 00       	push   $0xe6
80105eaa:	e9 57 f2 ff ff       	jmp    80105106 <alltraps>

80105eaf <vector231>:
80105eaf:	6a 00                	push   $0x0
80105eb1:	68 e7 00 00 00       	push   $0xe7
80105eb6:	e9 4b f2 ff ff       	jmp    80105106 <alltraps>

80105ebb <vector232>:
80105ebb:	6a 00                	push   $0x0
80105ebd:	68 e8 00 00 00       	push   $0xe8
80105ec2:	e9 3f f2 ff ff       	jmp    80105106 <alltraps>

80105ec7 <vector233>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	68 e9 00 00 00       	push   $0xe9
80105ece:	e9 33 f2 ff ff       	jmp    80105106 <alltraps>

80105ed3 <vector234>:
80105ed3:	6a 00                	push   $0x0
80105ed5:	68 ea 00 00 00       	push   $0xea
80105eda:	e9 27 f2 ff ff       	jmp    80105106 <alltraps>

80105edf <vector235>:
80105edf:	6a 00                	push   $0x0
80105ee1:	68 eb 00 00 00       	push   $0xeb
80105ee6:	e9 1b f2 ff ff       	jmp    80105106 <alltraps>

80105eeb <vector236>:
80105eeb:	6a 00                	push   $0x0
80105eed:	68 ec 00 00 00       	push   $0xec
80105ef2:	e9 0f f2 ff ff       	jmp    80105106 <alltraps>

80105ef7 <vector237>:
80105ef7:	6a 00                	push   $0x0
80105ef9:	68 ed 00 00 00       	push   $0xed
80105efe:	e9 03 f2 ff ff       	jmp    80105106 <alltraps>

80105f03 <vector238>:
80105f03:	6a 00                	push   $0x0
80105f05:	68 ee 00 00 00       	push   $0xee
80105f0a:	e9 f7 f1 ff ff       	jmp    80105106 <alltraps>

80105f0f <vector239>:
80105f0f:	6a 00                	push   $0x0
80105f11:	68 ef 00 00 00       	push   $0xef
80105f16:	e9 eb f1 ff ff       	jmp    80105106 <alltraps>

80105f1b <vector240>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	68 f0 00 00 00       	push   $0xf0
80105f22:	e9 df f1 ff ff       	jmp    80105106 <alltraps>

80105f27 <vector241>:
80105f27:	6a 00                	push   $0x0
80105f29:	68 f1 00 00 00       	push   $0xf1
80105f2e:	e9 d3 f1 ff ff       	jmp    80105106 <alltraps>

80105f33 <vector242>:
80105f33:	6a 00                	push   $0x0
80105f35:	68 f2 00 00 00       	push   $0xf2
80105f3a:	e9 c7 f1 ff ff       	jmp    80105106 <alltraps>

80105f3f <vector243>:
80105f3f:	6a 00                	push   $0x0
80105f41:	68 f3 00 00 00       	push   $0xf3
80105f46:	e9 bb f1 ff ff       	jmp    80105106 <alltraps>

80105f4b <vector244>:
80105f4b:	6a 00                	push   $0x0
80105f4d:	68 f4 00 00 00       	push   $0xf4
80105f52:	e9 af f1 ff ff       	jmp    80105106 <alltraps>

80105f57 <vector245>:
80105f57:	6a 00                	push   $0x0
80105f59:	68 f5 00 00 00       	push   $0xf5
80105f5e:	e9 a3 f1 ff ff       	jmp    80105106 <alltraps>

80105f63 <vector246>:
80105f63:	6a 00                	push   $0x0
80105f65:	68 f6 00 00 00       	push   $0xf6
80105f6a:	e9 97 f1 ff ff       	jmp    80105106 <alltraps>

80105f6f <vector247>:
80105f6f:	6a 00                	push   $0x0
80105f71:	68 f7 00 00 00       	push   $0xf7
80105f76:	e9 8b f1 ff ff       	jmp    80105106 <alltraps>

80105f7b <vector248>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	68 f8 00 00 00       	push   $0xf8
80105f82:	e9 7f f1 ff ff       	jmp    80105106 <alltraps>

80105f87 <vector249>:
80105f87:	6a 00                	push   $0x0
80105f89:	68 f9 00 00 00       	push   $0xf9
80105f8e:	e9 73 f1 ff ff       	jmp    80105106 <alltraps>

80105f93 <vector250>:
80105f93:	6a 00                	push   $0x0
80105f95:	68 fa 00 00 00       	push   $0xfa
80105f9a:	e9 67 f1 ff ff       	jmp    80105106 <alltraps>

80105f9f <vector251>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	68 fb 00 00 00       	push   $0xfb
80105fa6:	e9 5b f1 ff ff       	jmp    80105106 <alltraps>

80105fab <vector252>:
80105fab:	6a 00                	push   $0x0
80105fad:	68 fc 00 00 00       	push   $0xfc
80105fb2:	e9 4f f1 ff ff       	jmp    80105106 <alltraps>

80105fb7 <vector253>:
80105fb7:	6a 00                	push   $0x0
80105fb9:	68 fd 00 00 00       	push   $0xfd
80105fbe:	e9 43 f1 ff ff       	jmp    80105106 <alltraps>

80105fc3 <vector254>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	68 fe 00 00 00       	push   $0xfe
80105fca:	e9 37 f1 ff ff       	jmp    80105106 <alltraps>

80105fcf <vector255>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	68 ff 00 00 00       	push   $0xff
80105fd6:	e9 2b f1 ff ff       	jmp    80105106 <alltraps>
80105fdb:	90                   	nop

80105fdc <deallocuvm.part.0>:
80105fdc:	55                   	push   %ebp
80105fdd:	89 e5                	mov    %esp,%ebp
80105fdf:	57                   	push   %edi
80105fe0:	56                   	push   %esi
80105fe1:	53                   	push   %ebx
80105fe2:	83 ec 1c             	sub    $0x1c,%esp
80105fe5:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80105feb:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105ff1:	39 d3                	cmp    %edx,%ebx
80105ff3:	73 50                	jae    80106045 <deallocuvm.part.0+0x69>
80105ff5:	89 c6                	mov    %eax,%esi
80105ff7:	89 d7                	mov    %edx,%edi
80105ff9:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80105ffc:	eb 0c                	jmp    8010600a <deallocuvm.part.0+0x2e>
80105ffe:	66 90                	xchg   %ax,%ax
80106000:	42                   	inc    %edx
80106001:	89 d3                	mov    %edx,%ebx
80106003:	c1 e3 16             	shl    $0x16,%ebx
80106006:	39 fb                	cmp    %edi,%ebx
80106008:	73 38                	jae    80106042 <deallocuvm.part.0+0x66>
8010600a:	89 da                	mov    %ebx,%edx
8010600c:	c1 ea 16             	shr    $0x16,%edx
8010600f:	8b 04 96             	mov    (%esi,%edx,4),%eax
80106012:	a8 01                	test   $0x1,%al
80106014:	74 ea                	je     80106000 <deallocuvm.part.0+0x24>
80106016:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010601b:	89 d9                	mov    %ebx,%ecx
8010601d:	c1 e9 0a             	shr    $0xa,%ecx
80106020:	81 e1 fc 0f 00 00    	and    $0xffc,%ecx
80106026:	8d 84 08 00 00 00 80 	lea    -0x80000000(%eax,%ecx,1),%eax
8010602d:	85 c0                	test   %eax,%eax
8010602f:	74 cf                	je     80106000 <deallocuvm.part.0+0x24>
80106031:	8b 10                	mov    (%eax),%edx
80106033:	f6 c2 01             	test   $0x1,%dl
80106036:	75 18                	jne    80106050 <deallocuvm.part.0+0x74>
80106038:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010603e:	39 fb                	cmp    %edi,%ebx
80106040:	72 c8                	jb     8010600a <deallocuvm.part.0+0x2e>
80106042:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80106045:	89 c8                	mov    %ecx,%eax
80106047:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010604a:	5b                   	pop    %ebx
8010604b:	5e                   	pop    %esi
8010604c:	5f                   	pop    %edi
8010604d:	5d                   	pop    %ebp
8010604e:	c3                   	ret    
8010604f:	90                   	nop
80106050:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106056:	74 26                	je     8010607e <deallocuvm.part.0+0xa2>
80106058:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010605b:	83 ec 0c             	sub    $0xc,%esp
8010605e:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106064:	52                   	push   %edx
80106065:	e8 ce c1 ff ff       	call   80102238 <kfree>
8010606a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010606d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106073:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106079:	83 c4 10             	add    $0x10,%esp
8010607c:	eb 88                	jmp    80106006 <deallocuvm.part.0+0x2a>
8010607e:	83 ec 0c             	sub    $0xc,%esp
80106081:	68 26 6b 10 80       	push   $0x80106b26
80106086:	e8 ad a2 ff ff       	call   80100338 <panic>
8010608b:	90                   	nop

8010608c <mappages>:
8010608c:	55                   	push   %ebp
8010608d:	89 e5                	mov    %esp,%ebp
8010608f:	57                   	push   %edi
80106090:	56                   	push   %esi
80106091:	53                   	push   %ebx
80106092:	83 ec 1c             	sub    $0x1c,%esp
80106095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106098:	89 d3                	mov    %edx,%ebx
8010609a:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801060a0:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801060a4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801060a9:	89 45 dc             	mov    %eax,-0x24(%ebp)
801060ac:	8b 45 08             	mov    0x8(%ebp),%eax
801060af:	29 d8                	sub    %ebx,%eax
801060b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801060b4:	eb 3b                	jmp    801060f1 <mappages+0x65>
801060b6:	66 90                	xchg   %ax,%ax
801060b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801060bd:	89 da                	mov    %ebx,%edx
801060bf:	c1 ea 0a             	shr    $0xa,%edx
801060c2:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801060c8:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
801060cf:	85 c0                	test   %eax,%eax
801060d1:	74 71                	je     80106144 <mappages+0xb8>
801060d3:	f6 00 01             	testb  $0x1,(%eax)
801060d6:	0f 85 82 00 00 00    	jne    8010615e <mappages+0xd2>
801060dc:	0b 75 0c             	or     0xc(%ebp),%esi
801060df:	83 ce 01             	or     $0x1,%esi
801060e2:	89 30                	mov    %esi,(%eax)
801060e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801060e7:	39 c3                	cmp    %eax,%ebx
801060e9:	74 69                	je     80106154 <mappages+0xc8>
801060eb:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801060f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801060f4:	8d 34 03             	lea    (%ebx,%eax,1),%esi
801060f7:	89 d8                	mov    %ebx,%eax
801060f9:	c1 e8 16             	shr    $0x16,%eax
801060fc:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801060ff:	8d 3c 81             	lea    (%ecx,%eax,4),%edi
80106102:	8b 07                	mov    (%edi),%eax
80106104:	a8 01                	test   $0x1,%al
80106106:	75 b0                	jne    801060b8 <mappages+0x2c>
80106108:	e8 bb c2 ff ff       	call   801023c8 <kalloc>
8010610d:	89 c2                	mov    %eax,%edx
8010610f:	85 c0                	test   %eax,%eax
80106111:	74 31                	je     80106144 <mappages+0xb8>
80106113:	50                   	push   %eax
80106114:	68 00 10 00 00       	push   $0x1000
80106119:	6a 00                	push   $0x0
8010611b:	52                   	push   %edx
8010611c:	89 55 d8             	mov    %edx,-0x28(%ebp)
8010611f:	e8 34 e0 ff ff       	call   80104158 <memset>
80106124:	8b 55 d8             	mov    -0x28(%ebp),%edx
80106127:	8d 82 00 00 00 80    	lea    -0x80000000(%edx),%eax
8010612d:	83 c8 07             	or     $0x7,%eax
80106130:	89 07                	mov    %eax,(%edi)
80106132:	89 d8                	mov    %ebx,%eax
80106134:	c1 e8 0a             	shr    $0xa,%eax
80106137:	25 fc 0f 00 00       	and    $0xffc,%eax
8010613c:	01 d0                	add    %edx,%eax
8010613e:	83 c4 10             	add    $0x10,%esp
80106141:	eb 90                	jmp    801060d3 <mappages+0x47>
80106143:	90                   	nop
80106144:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106149:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010614c:	5b                   	pop    %ebx
8010614d:	5e                   	pop    %esi
8010614e:	5f                   	pop    %edi
8010614f:	5d                   	pop    %ebp
80106150:	c3                   	ret    
80106151:	8d 76 00             	lea    0x0(%esi),%esi
80106154:	31 c0                	xor    %eax,%eax
80106156:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106159:	5b                   	pop    %ebx
8010615a:	5e                   	pop    %esi
8010615b:	5f                   	pop    %edi
8010615c:	5d                   	pop    %ebp
8010615d:	c3                   	ret    
8010615e:	83 ec 0c             	sub    $0xc,%esp
80106161:	68 6c 71 10 80       	push   $0x8010716c
80106166:	e8 cd a1 ff ff       	call   80100338 <panic>
8010616b:	90                   	nop

8010616c <seginit>:
8010616c:	55                   	push   %ebp
8010616d:	89 e5                	mov    %esp,%ebp
8010616f:	83 ec 18             	sub    $0x18,%esp
80106172:	e8 69 d3 ff ff       	call   801034e0 <cpuid>
80106177:	8d 14 80             	lea    (%eax,%eax,4),%edx
8010617a:	01 d2                	add    %edx,%edx
8010617c:	01 d0                	add    %edx,%eax
8010617e:	c1 e0 04             	shl    $0x4,%eax
80106181:	c7 80 18 18 11 80 ff 	movl   $0xffff,-0x7feee7e8(%eax)
80106188:	ff 00 00 
8010618b:	c7 80 1c 18 11 80 00 	movl   $0xcf9a00,-0x7feee7e4(%eax)
80106192:	9a cf 00 
80106195:	c7 80 20 18 11 80 ff 	movl   $0xffff,-0x7feee7e0(%eax)
8010619c:	ff 00 00 
8010619f:	c7 80 24 18 11 80 00 	movl   $0xcf9200,-0x7feee7dc(%eax)
801061a6:	92 cf 00 
801061a9:	c7 80 28 18 11 80 ff 	movl   $0xffff,-0x7feee7d8(%eax)
801061b0:	ff 00 00 
801061b3:	c7 80 2c 18 11 80 00 	movl   $0xcffa00,-0x7feee7d4(%eax)
801061ba:	fa cf 00 
801061bd:	c7 80 30 18 11 80 ff 	movl   $0xffff,-0x7feee7d0(%eax)
801061c4:	ff 00 00 
801061c7:	c7 80 34 18 11 80 00 	movl   $0xcff200,-0x7feee7cc(%eax)
801061ce:	f2 cf 00 
801061d1:	05 10 18 11 80       	add    $0x80111810,%eax
801061d6:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
801061dc:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
801061e0:	c1 e8 10             	shr    $0x10,%eax
801061e3:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
801061e7:	8d 45 f2             	lea    -0xe(%ebp),%eax
801061ea:	0f 01 10             	lgdtl  (%eax)
801061ed:	c9                   	leave  
801061ee:	c3                   	ret    
801061ef:	90                   	nop

801061f0 <switchkvm>:
801061f0:	a1 c4 45 11 80       	mov    0x801145c4,%eax
801061f5:	05 00 00 00 80       	add    $0x80000000,%eax
801061fa:	0f 22 d8             	mov    %eax,%cr3
801061fd:	c3                   	ret    
801061fe:	66 90                	xchg   %ax,%ax

80106200 <switchuvm>:
80106200:	55                   	push   %ebp
80106201:	89 e5                	mov    %esp,%ebp
80106203:	57                   	push   %edi
80106204:	56                   	push   %esi
80106205:	53                   	push   %ebx
80106206:	83 ec 1c             	sub    $0x1c,%esp
80106209:	8b 75 08             	mov    0x8(%ebp),%esi
8010620c:	85 f6                	test   %esi,%esi
8010620e:	0f 84 bf 00 00 00    	je     801062d3 <switchuvm+0xd3>
80106214:	8b 56 08             	mov    0x8(%esi),%edx
80106217:	85 d2                	test   %edx,%edx
80106219:	0f 84 ce 00 00 00    	je     801062ed <switchuvm+0xed>
8010621f:	8b 46 04             	mov    0x4(%esi),%eax
80106222:	85 c0                	test   %eax,%eax
80106224:	0f 84 b6 00 00 00    	je     801062e0 <switchuvm+0xe0>
8010622a:	e8 25 dd ff ff       	call   80103f54 <pushcli>
8010622f:	e8 48 d2 ff ff       	call   8010347c <mycpu>
80106234:	89 c3                	mov    %eax,%ebx
80106236:	e8 41 d2 ff ff       	call   8010347c <mycpu>
8010623b:	89 c7                	mov    %eax,%edi
8010623d:	e8 3a d2 ff ff       	call   8010347c <mycpu>
80106242:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106245:	e8 32 d2 ff ff       	call   8010347c <mycpu>
8010624a:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80106251:	67 00 
80106253:	83 c7 08             	add    $0x8,%edi
80106256:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
8010625d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106260:	83 c1 08             	add    $0x8,%ecx
80106263:	c1 e9 10             	shr    $0x10,%ecx
80106266:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
8010626c:	66 c7 83 9d 00 00 00 	movw   $0x4099,0x9d(%ebx)
80106273:	99 40 
80106275:	83 c0 08             	add    $0x8,%eax
80106278:	c1 e8 18             	shr    $0x18,%eax
8010627b:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106281:	e8 f6 d1 ff ff       	call   8010347c <mycpu>
80106286:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
8010628d:	e8 ea d1 ff ff       	call   8010347c <mycpu>
80106292:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
80106298:	8b 5e 08             	mov    0x8(%esi),%ebx
8010629b:	e8 dc d1 ff ff       	call   8010347c <mycpu>
801062a0:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801062a6:	89 58 0c             	mov    %ebx,0xc(%eax)
801062a9:	e8 ce d1 ff ff       	call   8010347c <mycpu>
801062ae:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
801062b4:	b8 28 00 00 00       	mov    $0x28,%eax
801062b9:	0f 00 d8             	ltr    %ax
801062bc:	8b 46 04             	mov    0x4(%esi),%eax
801062bf:	05 00 00 00 80       	add    $0x80000000,%eax
801062c4:	0f 22 d8             	mov    %eax,%cr3
801062c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801062ca:	5b                   	pop    %ebx
801062cb:	5e                   	pop    %esi
801062cc:	5f                   	pop    %edi
801062cd:	5d                   	pop    %ebp
801062ce:	e9 cd dc ff ff       	jmp    80103fa0 <popcli>
801062d3:	83 ec 0c             	sub    $0xc,%esp
801062d6:	68 72 71 10 80       	push   $0x80107172
801062db:	e8 58 a0 ff ff       	call   80100338 <panic>
801062e0:	83 ec 0c             	sub    $0xc,%esp
801062e3:	68 9d 71 10 80       	push   $0x8010719d
801062e8:	e8 4b a0 ff ff       	call   80100338 <panic>
801062ed:	83 ec 0c             	sub    $0xc,%esp
801062f0:	68 88 71 10 80       	push   $0x80107188
801062f5:	e8 3e a0 ff ff       	call   80100338 <panic>
801062fa:	66 90                	xchg   %ax,%ax

801062fc <inituvm>:
801062fc:	55                   	push   %ebp
801062fd:	89 e5                	mov    %esp,%ebp
801062ff:	57                   	push   %edi
80106300:	56                   	push   %esi
80106301:	53                   	push   %ebx
80106302:	83 ec 1c             	sub    $0x1c,%esp
80106305:	8b 45 08             	mov    0x8(%ebp),%eax
80106308:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010630b:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010630e:	8b 75 10             	mov    0x10(%ebp),%esi
80106311:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106317:	77 47                	ja     80106360 <inituvm+0x64>
80106319:	e8 aa c0 ff ff       	call   801023c8 <kalloc>
8010631e:	89 c3                	mov    %eax,%ebx
80106320:	50                   	push   %eax
80106321:	68 00 10 00 00       	push   $0x1000
80106326:	6a 00                	push   $0x0
80106328:	53                   	push   %ebx
80106329:	e8 2a de ff ff       	call   80104158 <memset>
8010632e:	5a                   	pop    %edx
8010632f:	59                   	pop    %ecx
80106330:	6a 06                	push   $0x6
80106332:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106338:	50                   	push   %eax
80106339:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010633e:	31 d2                	xor    %edx,%edx
80106340:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106343:	e8 44 fd ff ff       	call   8010608c <mappages>
80106348:	83 c4 10             	add    $0x10,%esp
8010634b:	89 75 10             	mov    %esi,0x10(%ebp)
8010634e:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106351:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106354:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106357:	5b                   	pop    %ebx
80106358:	5e                   	pop    %esi
80106359:	5f                   	pop    %edi
8010635a:	5d                   	pop    %ebp
8010635b:	e9 74 de ff ff       	jmp    801041d4 <memmove>
80106360:	83 ec 0c             	sub    $0xc,%esp
80106363:	68 b1 71 10 80       	push   $0x801071b1
80106368:	e8 cb 9f ff ff       	call   80100338 <panic>
8010636d:	8d 76 00             	lea    0x0(%esi),%esi

80106370 <loaduvm>:
80106370:	55                   	push   %ebp
80106371:	89 e5                	mov    %esp,%ebp
80106373:	57                   	push   %edi
80106374:	56                   	push   %esi
80106375:	53                   	push   %ebx
80106376:	83 ec 0c             	sub    $0xc,%esp
80106379:	8b 7d 18             	mov    0x18(%ebp),%edi
8010637c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010637f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106385:	0f 85 9a 00 00 00    	jne    80106425 <loaduvm+0xb5>
8010638b:	85 ff                	test   %edi,%edi
8010638d:	74 7c                	je     8010640b <loaduvm+0x9b>
8010638f:	90                   	nop
80106390:	8b 45 0c             	mov    0xc(%ebp),%eax
80106393:	01 d8                	add    %ebx,%eax
80106395:	89 c2                	mov    %eax,%edx
80106397:	c1 ea 16             	shr    $0x16,%edx
8010639a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010639d:	8b 14 91             	mov    (%ecx,%edx,4),%edx
801063a0:	f6 c2 01             	test   $0x1,%dl
801063a3:	75 0f                	jne    801063b4 <loaduvm+0x44>
801063a5:	83 ec 0c             	sub    $0xc,%esp
801063a8:	68 cb 71 10 80       	push   $0x801071cb
801063ad:	e8 86 9f ff ff       	call   80100338 <panic>
801063b2:	66 90                	xchg   %ax,%ax
801063b4:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801063ba:	c1 e8 0a             	shr    $0xa,%eax
801063bd:	25 fc 0f 00 00       	and    $0xffc,%eax
801063c2:	8d 8c 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%ecx
801063c9:	85 c9                	test   %ecx,%ecx
801063cb:	74 d8                	je     801063a5 <loaduvm+0x35>
801063cd:	89 fe                	mov    %edi,%esi
801063cf:	29 de                	sub    %ebx,%esi
801063d1:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
801063d7:	76 05                	jbe    801063de <loaduvm+0x6e>
801063d9:	be 00 10 00 00       	mov    $0x1000,%esi
801063de:	56                   	push   %esi
801063df:	8b 45 14             	mov    0x14(%ebp),%eax
801063e2:	01 d8                	add    %ebx,%eax
801063e4:	50                   	push   %eax
801063e5:	8b 01                	mov    (%ecx),%eax
801063e7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801063ec:	05 00 00 00 80       	add    $0x80000000,%eax
801063f1:	50                   	push   %eax
801063f2:	ff 75 10             	pushl  0x10(%ebp)
801063f5:	e8 ea b4 ff ff       	call   801018e4 <readi>
801063fa:	83 c4 10             	add    $0x10,%esp
801063fd:	39 f0                	cmp    %esi,%eax
801063ff:	75 17                	jne    80106418 <loaduvm+0xa8>
80106401:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106407:	39 fb                	cmp    %edi,%ebx
80106409:	72 85                	jb     80106390 <loaduvm+0x20>
8010640b:	31 c0                	xor    %eax,%eax
8010640d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106410:	5b                   	pop    %ebx
80106411:	5e                   	pop    %esi
80106412:	5f                   	pop    %edi
80106413:	5d                   	pop    %ebp
80106414:	c3                   	ret    
80106415:	8d 76 00             	lea    0x0(%esi),%esi
80106418:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010641d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106420:	5b                   	pop    %ebx
80106421:	5e                   	pop    %esi
80106422:	5f                   	pop    %edi
80106423:	5d                   	pop    %ebp
80106424:	c3                   	ret    
80106425:	83 ec 0c             	sub    $0xc,%esp
80106428:	68 6c 72 10 80       	push   $0x8010726c
8010642d:	e8 06 9f ff ff       	call   80100338 <panic>
80106432:	66 90                	xchg   %ax,%ax

80106434 <allocuvm>:
80106434:	55                   	push   %ebp
80106435:	89 e5                	mov    %esp,%ebp
80106437:	57                   	push   %edi
80106438:	56                   	push   %esi
80106439:	53                   	push   %ebx
8010643a:	83 ec 1c             	sub    $0x1c,%esp
8010643d:	8b 75 10             	mov    0x10(%ebp),%esi
80106440:	85 f6                	test   %esi,%esi
80106442:	0f 88 8a 00 00 00    	js     801064d2 <allocuvm+0x9e>
80106448:	89 f2                	mov    %esi,%edx
8010644a:	3b 75 0c             	cmp    0xc(%ebp),%esi
8010644d:	0f 82 8d 00 00 00    	jb     801064e0 <allocuvm+0xac>
80106453:	8b 45 0c             	mov    0xc(%ebp),%eax
80106456:	05 ff 0f 00 00       	add    $0xfff,%eax
8010645b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106460:	89 c7                	mov    %eax,%edi
80106462:	39 f0                	cmp    %esi,%eax
80106464:	73 7d                	jae    801064e3 <allocuvm+0xaf>
80106466:	89 75 e4             	mov    %esi,-0x1c(%ebp)
80106469:	eb 3a                	jmp    801064a5 <allocuvm+0x71>
8010646b:	90                   	nop
8010646c:	50                   	push   %eax
8010646d:	68 00 10 00 00       	push   $0x1000
80106472:	6a 00                	push   $0x0
80106474:	53                   	push   %ebx
80106475:	e8 de dc ff ff       	call   80104158 <memset>
8010647a:	5a                   	pop    %edx
8010647b:	59                   	pop    %ecx
8010647c:	6a 06                	push   $0x6
8010647e:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106484:	50                   	push   %eax
80106485:	b9 00 10 00 00       	mov    $0x1000,%ecx
8010648a:	89 fa                	mov    %edi,%edx
8010648c:	8b 45 08             	mov    0x8(%ebp),%eax
8010648f:	e8 f8 fb ff ff       	call   8010608c <mappages>
80106494:	83 c4 10             	add    $0x10,%esp
80106497:	85 c0                	test   %eax,%eax
80106499:	78 55                	js     801064f0 <allocuvm+0xbc>
8010649b:	81 c7 00 10 00 00    	add    $0x1000,%edi
801064a1:	39 f7                	cmp    %esi,%edi
801064a3:	73 7f                	jae    80106524 <allocuvm+0xf0>
801064a5:	e8 1e bf ff ff       	call   801023c8 <kalloc>
801064aa:	89 c3                	mov    %eax,%ebx
801064ac:	85 c0                	test   %eax,%eax
801064ae:	75 bc                	jne    8010646c <allocuvm+0x38>
801064b0:	83 ec 0c             	sub    $0xc,%esp
801064b3:	68 e9 71 10 80       	push   $0x801071e9
801064b8:	e8 6b a1 ff ff       	call   80100628 <cprintf>
801064bd:	83 c4 10             	add    $0x10,%esp
801064c0:	3b 75 0c             	cmp    0xc(%ebp),%esi
801064c3:	74 0d                	je     801064d2 <allocuvm+0x9e>
801064c5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801064c8:	89 f2                	mov    %esi,%edx
801064ca:	8b 45 08             	mov    0x8(%ebp),%eax
801064cd:	e8 0a fb ff ff       	call   80105fdc <deallocuvm.part.0>
801064d2:	31 d2                	xor    %edx,%edx
801064d4:	89 d0                	mov    %edx,%eax
801064d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801064d9:	5b                   	pop    %ebx
801064da:	5e                   	pop    %esi
801064db:	5f                   	pop    %edi
801064dc:	5d                   	pop    %ebp
801064dd:	c3                   	ret    
801064de:	66 90                	xchg   %ax,%ax
801064e0:	8b 55 0c             	mov    0xc(%ebp),%edx
801064e3:	89 d0                	mov    %edx,%eax
801064e5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801064e8:	5b                   	pop    %ebx
801064e9:	5e                   	pop    %esi
801064ea:	5f                   	pop    %edi
801064eb:	5d                   	pop    %ebp
801064ec:	c3                   	ret    
801064ed:	8d 76 00             	lea    0x0(%esi),%esi
801064f0:	83 ec 0c             	sub    $0xc,%esp
801064f3:	68 01 72 10 80       	push   $0x80107201
801064f8:	e8 2b a1 ff ff       	call   80100628 <cprintf>
801064fd:	83 c4 10             	add    $0x10,%esp
80106500:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106503:	74 0d                	je     80106512 <allocuvm+0xde>
80106505:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106508:	89 f2                	mov    %esi,%edx
8010650a:	8b 45 08             	mov    0x8(%ebp),%eax
8010650d:	e8 ca fa ff ff       	call   80105fdc <deallocuvm.part.0>
80106512:	83 ec 0c             	sub    $0xc,%esp
80106515:	53                   	push   %ebx
80106516:	e8 1d bd ff ff       	call   80102238 <kfree>
8010651b:	83 c4 10             	add    $0x10,%esp
8010651e:	31 d2                	xor    %edx,%edx
80106520:	eb b2                	jmp    801064d4 <allocuvm+0xa0>
80106522:	66 90                	xchg   %ax,%ax
80106524:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106527:	89 d0                	mov    %edx,%eax
80106529:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010652c:	5b                   	pop    %ebx
8010652d:	5e                   	pop    %esi
8010652e:	5f                   	pop    %edi
8010652f:	5d                   	pop    %ebp
80106530:	c3                   	ret    
80106531:	8d 76 00             	lea    0x0(%esi),%esi

80106534 <deallocuvm>:
80106534:	55                   	push   %ebp
80106535:	89 e5                	mov    %esp,%ebp
80106537:	8b 45 08             	mov    0x8(%ebp),%eax
8010653a:	8b 55 0c             	mov    0xc(%ebp),%edx
8010653d:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106540:	39 d1                	cmp    %edx,%ecx
80106542:	73 08                	jae    8010654c <deallocuvm+0x18>
80106544:	5d                   	pop    %ebp
80106545:	e9 92 fa ff ff       	jmp    80105fdc <deallocuvm.part.0>
8010654a:	66 90                	xchg   %ax,%ax
8010654c:	89 d0                	mov    %edx,%eax
8010654e:	5d                   	pop    %ebp
8010654f:	c3                   	ret    

80106550 <freevm>:
80106550:	55                   	push   %ebp
80106551:	89 e5                	mov    %esp,%ebp
80106553:	57                   	push   %edi
80106554:	56                   	push   %esi
80106555:	53                   	push   %ebx
80106556:	83 ec 0c             	sub    $0xc,%esp
80106559:	8b 75 08             	mov    0x8(%ebp),%esi
8010655c:	85 f6                	test   %esi,%esi
8010655e:	74 51                	je     801065b1 <freevm+0x61>
80106560:	31 c9                	xor    %ecx,%ecx
80106562:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106567:	89 f0                	mov    %esi,%eax
80106569:	e8 6e fa ff ff       	call   80105fdc <deallocuvm.part.0>
8010656e:	89 f3                	mov    %esi,%ebx
80106570:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106576:	eb 07                	jmp    8010657f <freevm+0x2f>
80106578:	83 c3 04             	add    $0x4,%ebx
8010657b:	39 fb                	cmp    %edi,%ebx
8010657d:	74 23                	je     801065a2 <freevm+0x52>
8010657f:	8b 03                	mov    (%ebx),%eax
80106581:	a8 01                	test   $0x1,%al
80106583:	74 f3                	je     80106578 <freevm+0x28>
80106585:	83 ec 0c             	sub    $0xc,%esp
80106588:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010658d:	05 00 00 00 80       	add    $0x80000000,%eax
80106592:	50                   	push   %eax
80106593:	e8 a0 bc ff ff       	call   80102238 <kfree>
80106598:	83 c4 10             	add    $0x10,%esp
8010659b:	83 c3 04             	add    $0x4,%ebx
8010659e:	39 fb                	cmp    %edi,%ebx
801065a0:	75 dd                	jne    8010657f <freevm+0x2f>
801065a2:	89 75 08             	mov    %esi,0x8(%ebp)
801065a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065a8:	5b                   	pop    %ebx
801065a9:	5e                   	pop    %esi
801065aa:	5f                   	pop    %edi
801065ab:	5d                   	pop    %ebp
801065ac:	e9 87 bc ff ff       	jmp    80102238 <kfree>
801065b1:	83 ec 0c             	sub    $0xc,%esp
801065b4:	68 1d 72 10 80       	push   $0x8010721d
801065b9:	e8 7a 9d ff ff       	call   80100338 <panic>
801065be:	66 90                	xchg   %ax,%ax

801065c0 <setupkvm>:
801065c0:	55                   	push   %ebp
801065c1:	89 e5                	mov    %esp,%ebp
801065c3:	56                   	push   %esi
801065c4:	53                   	push   %ebx
801065c5:	e8 fe bd ff ff       	call   801023c8 <kalloc>
801065ca:	85 c0                	test   %eax,%eax
801065cc:	74 5a                	je     80106628 <setupkvm+0x68>
801065ce:	89 c6                	mov    %eax,%esi
801065d0:	50                   	push   %eax
801065d1:	68 00 10 00 00       	push   $0x1000
801065d6:	6a 00                	push   $0x0
801065d8:	56                   	push   %esi
801065d9:	e8 7a db ff ff       	call   80104158 <memset>
801065de:	83 c4 10             	add    $0x10,%esp
801065e1:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
801065e6:	8b 43 04             	mov    0x4(%ebx),%eax
801065e9:	8b 4b 08             	mov    0x8(%ebx),%ecx
801065ec:	29 c1                	sub    %eax,%ecx
801065ee:	8b 13                	mov    (%ebx),%edx
801065f0:	83 ec 08             	sub    $0x8,%esp
801065f3:	ff 73 0c             	pushl  0xc(%ebx)
801065f6:	50                   	push   %eax
801065f7:	89 f0                	mov    %esi,%eax
801065f9:	e8 8e fa ff ff       	call   8010608c <mappages>
801065fe:	83 c4 10             	add    $0x10,%esp
80106601:	85 c0                	test   %eax,%eax
80106603:	78 17                	js     8010661c <setupkvm+0x5c>
80106605:	83 c3 10             	add    $0x10,%ebx
80106608:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
8010660e:	75 d6                	jne    801065e6 <setupkvm+0x26>
80106610:	89 f0                	mov    %esi,%eax
80106612:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106615:	5b                   	pop    %ebx
80106616:	5e                   	pop    %esi
80106617:	5d                   	pop    %ebp
80106618:	c3                   	ret    
80106619:	8d 76 00             	lea    0x0(%esi),%esi
8010661c:	83 ec 0c             	sub    $0xc,%esp
8010661f:	56                   	push   %esi
80106620:	e8 2b ff ff ff       	call   80106550 <freevm>
80106625:	83 c4 10             	add    $0x10,%esp
80106628:	31 f6                	xor    %esi,%esi
8010662a:	89 f0                	mov    %esi,%eax
8010662c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010662f:	5b                   	pop    %ebx
80106630:	5e                   	pop    %esi
80106631:	5d                   	pop    %ebp
80106632:	c3                   	ret    
80106633:	90                   	nop

80106634 <kvmalloc>:
80106634:	55                   	push   %ebp
80106635:	89 e5                	mov    %esp,%ebp
80106637:	83 ec 08             	sub    $0x8,%esp
8010663a:	e8 81 ff ff ff       	call   801065c0 <setupkvm>
8010663f:	a3 c4 45 11 80       	mov    %eax,0x801145c4
80106644:	05 00 00 00 80       	add    $0x80000000,%eax
80106649:	0f 22 d8             	mov    %eax,%cr3
8010664c:	c9                   	leave  
8010664d:	c3                   	ret    
8010664e:	66 90                	xchg   %ax,%ax

80106650 <clearpteu>:
80106650:	55                   	push   %ebp
80106651:	89 e5                	mov    %esp,%ebp
80106653:	83 ec 08             	sub    $0x8,%esp
80106656:	8b 55 0c             	mov    0xc(%ebp),%edx
80106659:	c1 ea 16             	shr    $0x16,%edx
8010665c:	8b 45 08             	mov    0x8(%ebp),%eax
8010665f:	8b 04 90             	mov    (%eax,%edx,4),%eax
80106662:	a8 01                	test   $0x1,%al
80106664:	75 0e                	jne    80106674 <clearpteu+0x24>
80106666:	83 ec 0c             	sub    $0xc,%esp
80106669:	68 2e 72 10 80       	push   $0x8010722e
8010666e:	e8 c5 9c ff ff       	call   80100338 <panic>
80106673:	90                   	nop
80106674:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106679:	89 c2                	mov    %eax,%edx
8010667b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010667e:	c1 e8 0a             	shr    $0xa,%eax
80106681:	25 fc 0f 00 00       	and    $0xffc,%eax
80106686:	8d 84 02 00 00 00 80 	lea    -0x80000000(%edx,%eax,1),%eax
8010668d:	85 c0                	test   %eax,%eax
8010668f:	74 d5                	je     80106666 <clearpteu+0x16>
80106691:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106694:	c9                   	leave  
80106695:	c3                   	ret    
80106696:	66 90                	xchg   %ax,%ax

80106698 <copyuvm>:
80106698:	55                   	push   %ebp
80106699:	89 e5                	mov    %esp,%ebp
8010669b:	57                   	push   %edi
8010669c:	56                   	push   %esi
8010669d:	53                   	push   %ebx
8010669e:	83 ec 1c             	sub    $0x1c,%esp
801066a1:	e8 1a ff ff ff       	call   801065c0 <setupkvm>
801066a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801066a9:	85 c0                	test   %eax,%eax
801066ab:	0f 84 d5 00 00 00    	je     80106786 <copyuvm+0xee>
801066b1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801066b4:	85 db                	test   %ebx,%ebx
801066b6:	0f 84 a5 00 00 00    	je     80106761 <copyuvm+0xc9>
801066bc:	31 ff                	xor    %edi,%edi
801066be:	66 90                	xchg   %ax,%ax
801066c0:	89 f8                	mov    %edi,%eax
801066c2:	c1 e8 16             	shr    $0x16,%eax
801066c5:	8b 4d 08             	mov    0x8(%ebp),%ecx
801066c8:	8b 04 81             	mov    (%ecx,%eax,4),%eax
801066cb:	a8 01                	test   $0x1,%al
801066cd:	75 0d                	jne    801066dc <copyuvm+0x44>
801066cf:	83 ec 0c             	sub    $0xc,%esp
801066d2:	68 38 72 10 80       	push   $0x80107238
801066d7:	e8 5c 9c ff ff       	call   80100338 <panic>
801066dc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801066e1:	89 fa                	mov    %edi,%edx
801066e3:	c1 ea 0a             	shr    $0xa,%edx
801066e6:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
801066ec:	8d 84 10 00 00 00 80 	lea    -0x80000000(%eax,%edx,1),%eax
801066f3:	85 c0                	test   %eax,%eax
801066f5:	74 d8                	je     801066cf <copyuvm+0x37>
801066f7:	8b 18                	mov    (%eax),%ebx
801066f9:	f6 c3 01             	test   $0x1,%bl
801066fc:	0f 84 96 00 00 00    	je     80106798 <copyuvm+0x100>
80106702:	89 d8                	mov    %ebx,%eax
80106704:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106709:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010670c:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106712:	e8 b1 bc ff ff       	call   801023c8 <kalloc>
80106717:	89 c6                	mov    %eax,%esi
80106719:	85 c0                	test   %eax,%eax
8010671b:	74 5b                	je     80106778 <copyuvm+0xe0>
8010671d:	50                   	push   %eax
8010671e:	68 00 10 00 00       	push   $0x1000
80106723:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106726:	05 00 00 00 80       	add    $0x80000000,%eax
8010672b:	50                   	push   %eax
8010672c:	56                   	push   %esi
8010672d:	e8 a2 da ff ff       	call   801041d4 <memmove>
80106732:	5a                   	pop    %edx
80106733:	59                   	pop    %ecx
80106734:	53                   	push   %ebx
80106735:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010673b:	50                   	push   %eax
8010673c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106741:	89 fa                	mov    %edi,%edx
80106743:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106746:	e8 41 f9 ff ff       	call   8010608c <mappages>
8010674b:	83 c4 10             	add    $0x10,%esp
8010674e:	85 c0                	test   %eax,%eax
80106750:	78 1a                	js     8010676c <copyuvm+0xd4>
80106752:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106758:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010675b:	0f 82 5f ff ff ff    	jb     801066c0 <copyuvm+0x28>
80106761:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106764:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106767:	5b                   	pop    %ebx
80106768:	5e                   	pop    %esi
80106769:	5f                   	pop    %edi
8010676a:	5d                   	pop    %ebp
8010676b:	c3                   	ret    
8010676c:	83 ec 0c             	sub    $0xc,%esp
8010676f:	56                   	push   %esi
80106770:	e8 c3 ba ff ff       	call   80102238 <kfree>
80106775:	83 c4 10             	add    $0x10,%esp
80106778:	83 ec 0c             	sub    $0xc,%esp
8010677b:	ff 75 e0             	pushl  -0x20(%ebp)
8010677e:	e8 cd fd ff ff       	call   80106550 <freevm>
80106783:	83 c4 10             	add    $0x10,%esp
80106786:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
8010678d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106790:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106793:	5b                   	pop    %ebx
80106794:	5e                   	pop    %esi
80106795:	5f                   	pop    %edi
80106796:	5d                   	pop    %ebp
80106797:	c3                   	ret    
80106798:	83 ec 0c             	sub    $0xc,%esp
8010679b:	68 52 72 10 80       	push   $0x80107252
801067a0:	e8 93 9b ff ff       	call   80100338 <panic>
801067a5:	8d 76 00             	lea    0x0(%esi),%esi

801067a8 <uva2ka>:
801067a8:	55                   	push   %ebp
801067a9:	89 e5                	mov    %esp,%ebp
801067ab:	8b 55 0c             	mov    0xc(%ebp),%edx
801067ae:	c1 ea 16             	shr    $0x16,%edx
801067b1:	8b 45 08             	mov    0x8(%ebp),%eax
801067b4:	8b 04 90             	mov    (%eax,%edx,4),%eax
801067b7:	a8 01                	test   $0x1,%al
801067b9:	0f 84 f3 00 00 00    	je     801068b2 <uva2ka.cold>
801067bf:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067c4:	89 c2                	mov    %eax,%edx
801067c6:	8b 45 0c             	mov    0xc(%ebp),%eax
801067c9:	c1 e8 0c             	shr    $0xc,%eax
801067cc:	25 ff 03 00 00       	and    $0x3ff,%eax
801067d1:	8b 84 82 00 00 00 80 	mov    -0x80000000(%edx,%eax,4),%eax
801067d8:	89 c2                	mov    %eax,%edx
801067da:	83 e2 05             	and    $0x5,%edx
801067dd:	83 fa 05             	cmp    $0x5,%edx
801067e0:	75 0e                	jne    801067f0 <uva2ka+0x48>
801067e2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067e7:	05 00 00 00 80       	add    $0x80000000,%eax
801067ec:	5d                   	pop    %ebp
801067ed:	c3                   	ret    
801067ee:	66 90                	xchg   %ax,%ax
801067f0:	31 c0                	xor    %eax,%eax
801067f2:	5d                   	pop    %ebp
801067f3:	c3                   	ret    

801067f4 <copyout>:
801067f4:	55                   	push   %ebp
801067f5:	89 e5                	mov    %esp,%ebp
801067f7:	57                   	push   %edi
801067f8:	56                   	push   %esi
801067f9:	53                   	push   %ebx
801067fa:	83 ec 0c             	sub    $0xc,%esp
801067fd:	8b 45 0c             	mov    0xc(%ebp),%eax
80106800:	8b 7d 10             	mov    0x10(%ebp),%edi
80106803:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106806:	85 c9                	test   %ecx,%ecx
80106808:	0f 84 9a 00 00 00    	je     801068a8 <copyout+0xb4>
8010680e:	89 fe                	mov    %edi,%esi
80106810:	eb 45                	jmp    80106857 <copyout+0x63>
80106812:	66 90                	xchg   %ax,%ax
80106814:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010681a:	8d 8b 00 00 00 80    	lea    -0x80000000(%ebx),%ecx
80106820:	81 fb 00 00 00 80    	cmp    $0x80000000,%ebx
80106826:	74 71                	je     80106899 <copyout+0xa5>
80106828:	89 fb                	mov    %edi,%ebx
8010682a:	29 c3                	sub    %eax,%ebx
8010682c:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106832:	39 5d 14             	cmp    %ebx,0x14(%ebp)
80106835:	73 03                	jae    8010683a <copyout+0x46>
80106837:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010683a:	52                   	push   %edx
8010683b:	53                   	push   %ebx
8010683c:	56                   	push   %esi
8010683d:	29 f8                	sub    %edi,%eax
8010683f:	01 c1                	add    %eax,%ecx
80106841:	51                   	push   %ecx
80106842:	e8 8d d9 ff ff       	call   801041d4 <memmove>
80106847:	01 de                	add    %ebx,%esi
80106849:	8d 87 00 10 00 00    	lea    0x1000(%edi),%eax
8010684f:	83 c4 10             	add    $0x10,%esp
80106852:	29 5d 14             	sub    %ebx,0x14(%ebp)
80106855:	74 51                	je     801068a8 <copyout+0xb4>
80106857:	89 c7                	mov    %eax,%edi
80106859:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
8010685f:	89 c1                	mov    %eax,%ecx
80106861:	c1 e9 16             	shr    $0x16,%ecx
80106864:	8b 55 08             	mov    0x8(%ebp),%edx
80106867:	8b 0c 8a             	mov    (%edx,%ecx,4),%ecx
8010686a:	f6 c1 01             	test   $0x1,%cl
8010686d:	0f 84 46 00 00 00    	je     801068b9 <copyout.cold>
80106873:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
80106879:	89 fb                	mov    %edi,%ebx
8010687b:	c1 eb 0c             	shr    $0xc,%ebx
8010687e:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
80106884:	8b 9c 99 00 00 00 80 	mov    -0x80000000(%ecx,%ebx,4),%ebx
8010688b:	89 d9                	mov    %ebx,%ecx
8010688d:	83 e1 05             	and    $0x5,%ecx
80106890:	83 f9 05             	cmp    $0x5,%ecx
80106893:	0f 84 7b ff ff ff    	je     80106814 <copyout+0x20>
80106899:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010689e:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068a1:	5b                   	pop    %ebx
801068a2:	5e                   	pop    %esi
801068a3:	5f                   	pop    %edi
801068a4:	5d                   	pop    %ebp
801068a5:	c3                   	ret    
801068a6:	66 90                	xchg   %ax,%ax
801068a8:	31 c0                	xor    %eax,%eax
801068aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068ad:	5b                   	pop    %ebx
801068ae:	5e                   	pop    %esi
801068af:	5f                   	pop    %edi
801068b0:	5d                   	pop    %ebp
801068b1:	c3                   	ret    

801068b2 <uva2ka.cold>:
801068b2:	a1 00 00 00 00       	mov    0x0,%eax
801068b7:	0f 0b                	ud2    

801068b9 <copyout.cold>:
801068b9:	a1 00 00 00 00       	mov    0x0,%eax
801068be:	0f 0b                	ud2    
