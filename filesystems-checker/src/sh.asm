
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	50                   	push   %eax
       f:	eb 0c                	jmp    1d <main+0x1d>
      11:	8d 76 00             	lea    0x0(%esi),%esi
      14:	83 f8 02             	cmp    $0x2,%eax
      17:	0f 8f 90 00 00 00    	jg     ad <main+0xad>
      1d:	83 ec 08             	sub    $0x8,%esp
      20:	6a 02                	push   $0x2
      22:	68 6d 11 00 00       	push   $0x116d
      27:	e8 c7 0c 00 00       	call   cf3 <open>
      2c:	83 c4 10             	add    $0x10,%esp
      2f:	85 c0                	test   %eax,%eax
      31:	79 e1                	jns    14 <main+0x14>
      33:	eb 2a                	jmp    5f <main+0x5f>
      35:	8d 76 00             	lea    0x0(%esi),%esi
      38:	80 3d 42 12 00 00 20 	cmpb   $0x20,0x1242
      3f:	0f 84 8b 00 00 00    	je     d0 <main+0xd0>
      45:	8d 76 00             	lea    0x0(%esi),%esi
      48:	e8 5e 0c 00 00       	call   cab <fork>
      4d:	83 f8 ff             	cmp    $0xffffffff,%eax
      50:	0f 84 bf 00 00 00    	je     115 <main+0x115>
      56:	85 c0                	test   %eax,%eax
      58:	74 61                	je     bb <main+0xbb>
      5a:	e8 5c 0c 00 00       	call   cbb <wait>
      5f:	83 ec 08             	sub    $0x8,%esp
      62:	68 cc 10 00 00       	push   $0x10cc
      67:	6a 02                	push   $0x2
      69:	e8 7a 0d 00 00       	call   de8 <printf>
      6e:	83 c4 0c             	add    $0xc,%esp
      71:	6a 64                	push   $0x64
      73:	6a 00                	push   $0x0
      75:	68 40 12 00 00       	push   $0x1240
      7a:	e8 fd 0a 00 00       	call   b7c <memset>
      7f:	58                   	pop    %eax
      80:	5a                   	pop    %edx
      81:	6a 64                	push   $0x64
      83:	68 40 12 00 00       	push   $0x1240
      88:	e8 2f 0b 00 00       	call   bbc <gets>
      8d:	a0 40 12 00 00       	mov    0x1240,%al
      92:	83 c4 10             	add    $0x10,%esp
      95:	84 c0                	test   %al,%al
      97:	74 0f                	je     a8 <main+0xa8>
      99:	3c 63                	cmp    $0x63,%al
      9b:	75 ab                	jne    48 <main+0x48>
      9d:	80 3d 41 12 00 00 64 	cmpb   $0x64,0x1241
      a4:	75 a2                	jne    48 <main+0x48>
      a6:	eb 90                	jmp    38 <main+0x38>
      a8:	e8 06 0c 00 00       	call   cb3 <exit>
      ad:	83 ec 0c             	sub    $0xc,%esp
      b0:	50                   	push   %eax
      b1:	e8 25 0c 00 00       	call   cdb <close>
      b6:	83 c4 10             	add    $0x10,%esp
      b9:	eb a4                	jmp    5f <main+0x5f>
      bb:	83 ec 0c             	sub    $0xc,%esp
      be:	68 40 12 00 00       	push   $0x1240
      c3:	e8 c0 09 00 00       	call   a88 <parsecmd>
      c8:	89 04 24             	mov    %eax,(%esp)
      cb:	e8 d0 00 00 00       	call   1a0 <runcmd>
      d0:	83 ec 0c             	sub    $0xc,%esp
      d3:	68 40 12 00 00       	push   $0x1240
      d8:	e8 77 0a 00 00       	call   b54 <strlen>
      dd:	c6 80 3f 12 00 00 00 	movb   $0x0,0x123f(%eax)
      e4:	c7 04 24 43 12 00 00 	movl   $0x1243,(%esp)
      eb:	e8 33 0c 00 00       	call   d23 <chdir>
      f0:	83 c4 10             	add    $0x10,%esp
      f3:	85 c0                	test   %eax,%eax
      f5:	0f 89 64 ff ff ff    	jns    5f <main+0x5f>
      fb:	51                   	push   %ecx
      fc:	68 43 12 00 00       	push   $0x1243
     101:	68 75 11 00 00       	push   $0x1175
     106:	6a 02                	push   $0x2
     108:	e8 db 0c 00 00       	call   de8 <printf>
     10d:	83 c4 10             	add    $0x10,%esp
     110:	e9 4a ff ff ff       	jmp    5f <main+0x5f>
     115:	83 ec 0c             	sub    $0xc,%esp
     118:	68 cf 10 00 00       	push   $0x10cf
     11d:	e8 42 00 00 00       	call   164 <panic>
     122:	66 90                	xchg   %ax,%ax

00000124 <getcmd>:
     124:	55                   	push   %ebp
     125:	89 e5                	mov    %esp,%ebp
     127:	56                   	push   %esi
     128:	53                   	push   %ebx
     129:	8b 5d 08             	mov    0x8(%ebp),%ebx
     12c:	8b 75 0c             	mov    0xc(%ebp),%esi
     12f:	83 ec 08             	sub    $0x8,%esp
     132:	68 cc 10 00 00       	push   $0x10cc
     137:	6a 02                	push   $0x2
     139:	e8 aa 0c 00 00       	call   de8 <printf>
     13e:	83 c4 0c             	add    $0xc,%esp
     141:	56                   	push   %esi
     142:	6a 00                	push   $0x0
     144:	53                   	push   %ebx
     145:	e8 32 0a 00 00       	call   b7c <memset>
     14a:	58                   	pop    %eax
     14b:	5a                   	pop    %edx
     14c:	56                   	push   %esi
     14d:	53                   	push   %ebx
     14e:	e8 69 0a 00 00       	call   bbc <gets>
     153:	83 c4 10             	add    $0x10,%esp
     156:	80 3b 01             	cmpb   $0x1,(%ebx)
     159:	19 c0                	sbb    %eax,%eax
     15b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     15e:	5b                   	pop    %ebx
     15f:	5e                   	pop    %esi
     160:	5d                   	pop    %ebp
     161:	c3                   	ret    
     162:	66 90                	xchg   %ax,%ax

00000164 <panic>:
     164:	55                   	push   %ebp
     165:	89 e5                	mov    %esp,%ebp
     167:	83 ec 0c             	sub    $0xc,%esp
     16a:	ff 75 08             	pushl  0x8(%ebp)
     16d:	68 69 11 00 00       	push   $0x1169
     172:	6a 02                	push   $0x2
     174:	e8 6f 0c 00 00       	call   de8 <printf>
     179:	e8 35 0b 00 00       	call   cb3 <exit>
     17e:	66 90                	xchg   %ax,%ax

00000180 <fork1>:
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	83 ec 08             	sub    $0x8,%esp
     186:	e8 20 0b 00 00       	call   cab <fork>
     18b:	83 f8 ff             	cmp    $0xffffffff,%eax
     18e:	74 02                	je     192 <fork1+0x12>
     190:	c9                   	leave  
     191:	c3                   	ret    
     192:	83 ec 0c             	sub    $0xc,%esp
     195:	68 cf 10 00 00       	push   $0x10cf
     19a:	e8 c5 ff ff ff       	call   164 <panic>
     19f:	90                   	nop

000001a0 <runcmd>:
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 14             	sub    $0x14,%esp
     1a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
     1aa:	85 db                	test   %ebx,%ebx
     1ac:	74 3a                	je     1e8 <runcmd+0x48>
     1ae:	83 3b 05             	cmpl   $0x5,(%ebx)
     1b1:	0f 87 e6 00 00 00    	ja     29d <runcmd+0xfd>
     1b7:	8b 03                	mov    (%ebx),%eax
     1b9:	ff 24 85 84 11 00 00 	jmp    *0x1184(,%eax,4)
     1c0:	8b 43 04             	mov    0x4(%ebx),%eax
     1c3:	85 c0                	test   %eax,%eax
     1c5:	74 21                	je     1e8 <runcmd+0x48>
     1c7:	51                   	push   %ecx
     1c8:	51                   	push   %ecx
     1c9:	8d 53 04             	lea    0x4(%ebx),%edx
     1cc:	52                   	push   %edx
     1cd:	50                   	push   %eax
     1ce:	e8 18 0b 00 00       	call   ceb <exec>
     1d3:	83 c4 0c             	add    $0xc,%esp
     1d6:	ff 73 04             	pushl  0x4(%ebx)
     1d9:	68 db 10 00 00       	push   $0x10db
     1de:	6a 02                	push   $0x2
     1e0:	e8 03 0c 00 00       	call   de8 <printf>
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	e8 c6 0a 00 00       	call   cb3 <exit>
     1ed:	e8 8e ff ff ff       	call   180 <fork1>
     1f2:	85 c0                	test   %eax,%eax
     1f4:	75 f2                	jne    1e8 <runcmd+0x48>
     1f6:	e9 97 00 00 00       	jmp    292 <runcmd+0xf2>
     1fb:	83 ec 0c             	sub    $0xc,%esp
     1fe:	8d 45 f0             	lea    -0x10(%ebp),%eax
     201:	50                   	push   %eax
     202:	e8 bc 0a 00 00       	call   cc3 <pipe>
     207:	83 c4 10             	add    $0x10,%esp
     20a:	85 c0                	test   %eax,%eax
     20c:	0f 88 ad 00 00 00    	js     2bf <runcmd+0x11f>
     212:	e8 69 ff ff ff       	call   180 <fork1>
     217:	85 c0                	test   %eax,%eax
     219:	0f 84 ad 00 00 00    	je     2cc <runcmd+0x12c>
     21f:	e8 5c ff ff ff       	call   180 <fork1>
     224:	85 c0                	test   %eax,%eax
     226:	0f 85 ce 00 00 00    	jne    2fa <runcmd+0x15a>
     22c:	83 ec 0c             	sub    $0xc,%esp
     22f:	6a 00                	push   $0x0
     231:	e8 a5 0a 00 00       	call   cdb <close>
     236:	5a                   	pop    %edx
     237:	ff 75 f0             	pushl  -0x10(%ebp)
     23a:	e8 ec 0a 00 00       	call   d2b <dup>
     23f:	59                   	pop    %ecx
     240:	ff 75 f0             	pushl  -0x10(%ebp)
     243:	e8 93 0a 00 00       	call   cdb <close>
     248:	58                   	pop    %eax
     249:	ff 75 f4             	pushl  -0xc(%ebp)
     24c:	e8 8a 0a 00 00       	call   cdb <close>
     251:	58                   	pop    %eax
     252:	ff 73 08             	pushl  0x8(%ebx)
     255:	e8 46 ff ff ff       	call   1a0 <runcmd>
     25a:	e8 21 ff ff ff       	call   180 <fork1>
     25f:	85 c0                	test   %eax,%eax
     261:	74 2f                	je     292 <runcmd+0xf2>
     263:	e8 53 0a 00 00       	call   cbb <wait>
     268:	83 ec 0c             	sub    $0xc,%esp
     26b:	ff 73 08             	pushl  0x8(%ebx)
     26e:	e8 2d ff ff ff       	call   1a0 <runcmd>
     273:	83 ec 0c             	sub    $0xc,%esp
     276:	ff 73 14             	pushl  0x14(%ebx)
     279:	e8 5d 0a 00 00       	call   cdb <close>
     27e:	58                   	pop    %eax
     27f:	5a                   	pop    %edx
     280:	ff 73 10             	pushl  0x10(%ebx)
     283:	ff 73 08             	pushl  0x8(%ebx)
     286:	e8 68 0a 00 00       	call   cf3 <open>
     28b:	83 c4 10             	add    $0x10,%esp
     28e:	85 c0                	test   %eax,%eax
     290:	78 18                	js     2aa <runcmd+0x10a>
     292:	83 ec 0c             	sub    $0xc,%esp
     295:	ff 73 04             	pushl  0x4(%ebx)
     298:	e8 03 ff ff ff       	call   1a0 <runcmd>
     29d:	83 ec 0c             	sub    $0xc,%esp
     2a0:	68 d4 10 00 00       	push   $0x10d4
     2a5:	e8 ba fe ff ff       	call   164 <panic>
     2aa:	51                   	push   %ecx
     2ab:	ff 73 08             	pushl  0x8(%ebx)
     2ae:	68 eb 10 00 00       	push   $0x10eb
     2b3:	6a 02                	push   $0x2
     2b5:	e8 2e 0b 00 00       	call   de8 <printf>
     2ba:	e8 f4 09 00 00       	call   cb3 <exit>
     2bf:	83 ec 0c             	sub    $0xc,%esp
     2c2:	68 fb 10 00 00       	push   $0x10fb
     2c7:	e8 98 fe ff ff       	call   164 <panic>
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	6a 01                	push   $0x1
     2d1:	e8 05 0a 00 00       	call   cdb <close>
     2d6:	58                   	pop    %eax
     2d7:	ff 75 f4             	pushl  -0xc(%ebp)
     2da:	e8 4c 0a 00 00       	call   d2b <dup>
     2df:	58                   	pop    %eax
     2e0:	ff 75 f0             	pushl  -0x10(%ebp)
     2e3:	e8 f3 09 00 00       	call   cdb <close>
     2e8:	58                   	pop    %eax
     2e9:	ff 75 f4             	pushl  -0xc(%ebp)
     2ec:	e8 ea 09 00 00       	call   cdb <close>
     2f1:	5a                   	pop    %edx
     2f2:	ff 73 04             	pushl  0x4(%ebx)
     2f5:	e8 a6 fe ff ff       	call   1a0 <runcmd>
     2fa:	83 ec 0c             	sub    $0xc,%esp
     2fd:	ff 75 f0             	pushl  -0x10(%ebp)
     300:	e8 d6 09 00 00       	call   cdb <close>
     305:	58                   	pop    %eax
     306:	ff 75 f4             	pushl  -0xc(%ebp)
     309:	e8 cd 09 00 00       	call   cdb <close>
     30e:	e8 a8 09 00 00       	call   cbb <wait>
     313:	e8 a3 09 00 00       	call   cbb <wait>
     318:	83 c4 10             	add    $0x10,%esp
     31b:	e9 c8 fe ff ff       	jmp    1e8 <runcmd+0x48>

00000320 <execcmd>:
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
     327:	6a 54                	push   $0x54
     329:	e8 ba 0c 00 00       	call   fe8 <malloc>
     32e:	89 c3                	mov    %eax,%ebx
     330:	83 c4 0c             	add    $0xc,%esp
     333:	6a 54                	push   $0x54
     335:	6a 00                	push   $0x0
     337:	50                   	push   %eax
     338:	e8 3f 08 00 00       	call   b7c <memset>
     33d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
     343:	89 d8                	mov    %ebx,%eax
     345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     348:	c9                   	leave  
     349:	c3                   	ret    
     34a:	66 90                	xchg   %ax,%ax

0000034c <redircmd>:
     34c:	55                   	push   %ebp
     34d:	89 e5                	mov    %esp,%ebp
     34f:	53                   	push   %ebx
     350:	83 ec 10             	sub    $0x10,%esp
     353:	6a 18                	push   $0x18
     355:	e8 8e 0c 00 00       	call   fe8 <malloc>
     35a:	89 c3                	mov    %eax,%ebx
     35c:	83 c4 0c             	add    $0xc,%esp
     35f:	6a 18                	push   $0x18
     361:	6a 00                	push   $0x0
     363:	50                   	push   %eax
     364:	e8 13 08 00 00       	call   b7c <memset>
     369:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
     36f:	8b 45 08             	mov    0x8(%ebp),%eax
     372:	89 43 04             	mov    %eax,0x4(%ebx)
     375:	8b 45 0c             	mov    0xc(%ebp),%eax
     378:	89 43 08             	mov    %eax,0x8(%ebx)
     37b:	8b 45 10             	mov    0x10(%ebp),%eax
     37e:	89 43 0c             	mov    %eax,0xc(%ebx)
     381:	8b 45 14             	mov    0x14(%ebp),%eax
     384:	89 43 10             	mov    %eax,0x10(%ebx)
     387:	8b 45 18             	mov    0x18(%ebp),%eax
     38a:	89 43 14             	mov    %eax,0x14(%ebx)
     38d:	89 d8                	mov    %ebx,%eax
     38f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     392:	c9                   	leave  
     393:	c3                   	ret    

00000394 <pipecmd>:
     394:	55                   	push   %ebp
     395:	89 e5                	mov    %esp,%ebp
     397:	53                   	push   %ebx
     398:	83 ec 10             	sub    $0x10,%esp
     39b:	6a 0c                	push   $0xc
     39d:	e8 46 0c 00 00       	call   fe8 <malloc>
     3a2:	89 c3                	mov    %eax,%ebx
     3a4:	83 c4 0c             	add    $0xc,%esp
     3a7:	6a 0c                	push   $0xc
     3a9:	6a 00                	push   $0x0
     3ab:	50                   	push   %eax
     3ac:	e8 cb 07 00 00       	call   b7c <memset>
     3b1:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
     3b7:	8b 45 08             	mov    0x8(%ebp),%eax
     3ba:	89 43 04             	mov    %eax,0x4(%ebx)
     3bd:	8b 45 0c             	mov    0xc(%ebp),%eax
     3c0:	89 43 08             	mov    %eax,0x8(%ebx)
     3c3:	89 d8                	mov    %ebx,%eax
     3c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c8:	c9                   	leave  
     3c9:	c3                   	ret    
     3ca:	66 90                	xchg   %ax,%ax

000003cc <listcmd>:
     3cc:	55                   	push   %ebp
     3cd:	89 e5                	mov    %esp,%ebp
     3cf:	53                   	push   %ebx
     3d0:	83 ec 10             	sub    $0x10,%esp
     3d3:	6a 0c                	push   $0xc
     3d5:	e8 0e 0c 00 00       	call   fe8 <malloc>
     3da:	89 c3                	mov    %eax,%ebx
     3dc:	83 c4 0c             	add    $0xc,%esp
     3df:	6a 0c                	push   $0xc
     3e1:	6a 00                	push   $0x0
     3e3:	50                   	push   %eax
     3e4:	e8 93 07 00 00       	call   b7c <memset>
     3e9:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
     3ef:	8b 45 08             	mov    0x8(%ebp),%eax
     3f2:	89 43 04             	mov    %eax,0x4(%ebx)
     3f5:	8b 45 0c             	mov    0xc(%ebp),%eax
     3f8:	89 43 08             	mov    %eax,0x8(%ebx)
     3fb:	89 d8                	mov    %ebx,%eax
     3fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     400:	c9                   	leave  
     401:	c3                   	ret    
     402:	66 90                	xchg   %ax,%ax

00000404 <backcmd>:
     404:	55                   	push   %ebp
     405:	89 e5                	mov    %esp,%ebp
     407:	53                   	push   %ebx
     408:	83 ec 10             	sub    $0x10,%esp
     40b:	6a 08                	push   $0x8
     40d:	e8 d6 0b 00 00       	call   fe8 <malloc>
     412:	89 c3                	mov    %eax,%ebx
     414:	83 c4 0c             	add    $0xc,%esp
     417:	6a 08                	push   $0x8
     419:	6a 00                	push   $0x0
     41b:	50                   	push   %eax
     41c:	e8 5b 07 00 00       	call   b7c <memset>
     421:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
     427:	8b 45 08             	mov    0x8(%ebp),%eax
     42a:	89 43 04             	mov    %eax,0x4(%ebx)
     42d:	89 d8                	mov    %ebx,%eax
     42f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     432:	c9                   	leave  
     433:	c3                   	ret    

00000434 <gettoken>:
     434:	55                   	push   %ebp
     435:	89 e5                	mov    %esp,%ebp
     437:	57                   	push   %edi
     438:	56                   	push   %esi
     439:	53                   	push   %ebx
     43a:	83 ec 0c             	sub    $0xc,%esp
     43d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     440:	8b 75 10             	mov    0x10(%ebp),%esi
     443:	8b 45 08             	mov    0x8(%ebp),%eax
     446:	8b 38                	mov    (%eax),%edi
     448:	39 df                	cmp    %ebx,%edi
     44a:	72 09                	jb     455 <gettoken+0x21>
     44c:	eb 1f                	jmp    46d <gettoken+0x39>
     44e:	66 90                	xchg   %ax,%ax
     450:	47                   	inc    %edi
     451:	39 fb                	cmp    %edi,%ebx
     453:	74 18                	je     46d <gettoken+0x39>
     455:	83 ec 08             	sub    $0x8,%esp
     458:	0f be 07             	movsbl (%edi),%eax
     45b:	50                   	push   %eax
     45c:	68 30 12 00 00       	push   $0x1230
     461:	e8 2e 07 00 00       	call   b94 <strchr>
     466:	83 c4 10             	add    $0x10,%esp
     469:	85 c0                	test   %eax,%eax
     46b:	75 e3                	jne    450 <gettoken+0x1c>
     46d:	85 f6                	test   %esi,%esi
     46f:	74 02                	je     473 <gettoken+0x3f>
     471:	89 3e                	mov    %edi,(%esi)
     473:	8a 07                	mov    (%edi),%al
     475:	3c 3c                	cmp    $0x3c,%al
     477:	0f 8f c3 00 00 00    	jg     540 <gettoken+0x10c>
     47d:	3c 3a                	cmp    $0x3a,%al
     47f:	0f 8f af 00 00 00    	jg     534 <gettoken+0x100>
     485:	84 c0                	test   %al,%al
     487:	75 43                	jne    4cc <gettoken+0x98>
     489:	31 f6                	xor    %esi,%esi
     48b:	8b 4d 14             	mov    0x14(%ebp),%ecx
     48e:	85 c9                	test   %ecx,%ecx
     490:	74 05                	je     497 <gettoken+0x63>
     492:	8b 45 14             	mov    0x14(%ebp),%eax
     495:	89 38                	mov    %edi,(%eax)
     497:	39 df                	cmp    %ebx,%edi
     499:	72 0a                	jb     4a5 <gettoken+0x71>
     49b:	eb 20                	jmp    4bd <gettoken+0x89>
     49d:	8d 76 00             	lea    0x0(%esi),%esi
     4a0:	47                   	inc    %edi
     4a1:	39 fb                	cmp    %edi,%ebx
     4a3:	74 18                	je     4bd <gettoken+0x89>
     4a5:	83 ec 08             	sub    $0x8,%esp
     4a8:	0f be 07             	movsbl (%edi),%eax
     4ab:	50                   	push   %eax
     4ac:	68 30 12 00 00       	push   $0x1230
     4b1:	e8 de 06 00 00       	call   b94 <strchr>
     4b6:	83 c4 10             	add    $0x10,%esp
     4b9:	85 c0                	test   %eax,%eax
     4bb:	75 e3                	jne    4a0 <gettoken+0x6c>
     4bd:	8b 45 08             	mov    0x8(%ebp),%eax
     4c0:	89 38                	mov    %edi,(%eax)
     4c2:	89 f0                	mov    %esi,%eax
     4c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4c7:	5b                   	pop    %ebx
     4c8:	5e                   	pop    %esi
     4c9:	5f                   	pop    %edi
     4ca:	5d                   	pop    %ebp
     4cb:	c3                   	ret    
     4cc:	79 5a                	jns    528 <gettoken+0xf4>
     4ce:	39 df                	cmp    %ebx,%edi
     4d0:	72 33                	jb     505 <gettoken+0xd1>
     4d2:	8b 55 14             	mov    0x14(%ebp),%edx
     4d5:	85 d2                	test   %edx,%edx
     4d7:	0f 84 9f 00 00 00    	je     57c <gettoken+0x148>
     4dd:	8b 45 14             	mov    0x14(%ebp),%eax
     4e0:	89 38                	mov    %edi,(%eax)
     4e2:	e9 95 00 00 00       	jmp    57c <gettoken+0x148>
     4e7:	90                   	nop
     4e8:	83 ec 08             	sub    $0x8,%esp
     4eb:	0f be 07             	movsbl (%edi),%eax
     4ee:	50                   	push   %eax
     4ef:	68 28 12 00 00       	push   $0x1228
     4f4:	e8 9b 06 00 00       	call   b94 <strchr>
     4f9:	83 c4 10             	add    $0x10,%esp
     4fc:	85 c0                	test   %eax,%eax
     4fe:	75 1d                	jne    51d <gettoken+0xe9>
     500:	47                   	inc    %edi
     501:	39 fb                	cmp    %edi,%ebx
     503:	74 69                	je     56e <gettoken+0x13a>
     505:	83 ec 08             	sub    $0x8,%esp
     508:	0f be 07             	movsbl (%edi),%eax
     50b:	50                   	push   %eax
     50c:	68 30 12 00 00       	push   $0x1230
     511:	e8 7e 06 00 00       	call   b94 <strchr>
     516:	83 c4 10             	add    $0x10,%esp
     519:	85 c0                	test   %eax,%eax
     51b:	74 cb                	je     4e8 <gettoken+0xb4>
     51d:	be 61 00 00 00       	mov    $0x61,%esi
     522:	e9 64 ff ff ff       	jmp    48b <gettoken+0x57>
     527:	90                   	nop
     528:	3c 26                	cmp    $0x26,%al
     52a:	74 08                	je     534 <gettoken+0x100>
     52c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     52f:	80 f9 01             	cmp    $0x1,%cl
     532:	77 9a                	ja     4ce <gettoken+0x9a>
     534:	0f be f0             	movsbl %al,%esi
     537:	47                   	inc    %edi
     538:	e9 4e ff ff ff       	jmp    48b <gettoken+0x57>
     53d:	8d 76 00             	lea    0x0(%esi),%esi
     540:	3c 3e                	cmp    $0x3e,%al
     542:	75 14                	jne    558 <gettoken+0x124>
     544:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     548:	74 17                	je     561 <gettoken+0x12d>
     54a:	47                   	inc    %edi
     54b:	be 3e 00 00 00       	mov    $0x3e,%esi
     550:	e9 36 ff ff ff       	jmp    48b <gettoken+0x57>
     555:	8d 76 00             	lea    0x0(%esi),%esi
     558:	3c 7c                	cmp    $0x7c,%al
     55a:	74 d8                	je     534 <gettoken+0x100>
     55c:	e9 6d ff ff ff       	jmp    4ce <gettoken+0x9a>
     561:	83 c7 02             	add    $0x2,%edi
     564:	be 2b 00 00 00       	mov    $0x2b,%esi
     569:	e9 1d ff ff ff       	jmp    48b <gettoken+0x57>
     56e:	8b 45 14             	mov    0x14(%ebp),%eax
     571:	85 c0                	test   %eax,%eax
     573:	74 05                	je     57a <gettoken+0x146>
     575:	8b 45 14             	mov    0x14(%ebp),%eax
     578:	89 18                	mov    %ebx,(%eax)
     57a:	89 df                	mov    %ebx,%edi
     57c:	be 61 00 00 00       	mov    $0x61,%esi
     581:	e9 37 ff ff ff       	jmp    4bd <gettoken+0x89>
     586:	66 90                	xchg   %ax,%ax

00000588 <peek>:
     588:	55                   	push   %ebp
     589:	89 e5                	mov    %esp,%ebp
     58b:	57                   	push   %edi
     58c:	56                   	push   %esi
     58d:	53                   	push   %ebx
     58e:	83 ec 0c             	sub    $0xc,%esp
     591:	8b 7d 08             	mov    0x8(%ebp),%edi
     594:	8b 75 0c             	mov    0xc(%ebp),%esi
     597:	8b 1f                	mov    (%edi),%ebx
     599:	39 f3                	cmp    %esi,%ebx
     59b:	72 08                	jb     5a5 <peek+0x1d>
     59d:	eb 1e                	jmp    5bd <peek+0x35>
     59f:	90                   	nop
     5a0:	43                   	inc    %ebx
     5a1:	39 de                	cmp    %ebx,%esi
     5a3:	74 18                	je     5bd <peek+0x35>
     5a5:	83 ec 08             	sub    $0x8,%esp
     5a8:	0f be 03             	movsbl (%ebx),%eax
     5ab:	50                   	push   %eax
     5ac:	68 30 12 00 00       	push   $0x1230
     5b1:	e8 de 05 00 00       	call   b94 <strchr>
     5b6:	83 c4 10             	add    $0x10,%esp
     5b9:	85 c0                	test   %eax,%eax
     5bb:	75 e3                	jne    5a0 <peek+0x18>
     5bd:	89 1f                	mov    %ebx,(%edi)
     5bf:	0f be 03             	movsbl (%ebx),%eax
     5c2:	84 c0                	test   %al,%al
     5c4:	75 0a                	jne    5d0 <peek+0x48>
     5c6:	31 c0                	xor    %eax,%eax
     5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5cb:	5b                   	pop    %ebx
     5cc:	5e                   	pop    %esi
     5cd:	5f                   	pop    %edi
     5ce:	5d                   	pop    %ebp
     5cf:	c3                   	ret    
     5d0:	83 ec 08             	sub    $0x8,%esp
     5d3:	50                   	push   %eax
     5d4:	ff 75 10             	pushl  0x10(%ebp)
     5d7:	e8 b8 05 00 00       	call   b94 <strchr>
     5dc:	83 c4 10             	add    $0x10,%esp
     5df:	85 c0                	test   %eax,%eax
     5e1:	0f 95 c0             	setne  %al
     5e4:	0f b6 c0             	movzbl %al,%eax
     5e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5ea:	5b                   	pop    %ebx
     5eb:	5e                   	pop    %esi
     5ec:	5f                   	pop    %edi
     5ed:	5d                   	pop    %ebp
     5ee:	c3                   	ret    
     5ef:	90                   	nop

000005f0 <parseredirs>:
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	57                   	push   %edi
     5f4:	56                   	push   %esi
     5f5:	53                   	push   %ebx
     5f6:	83 ec 2c             	sub    $0x2c,%esp
     5f9:	8b 75 0c             	mov    0xc(%ebp),%esi
     5fc:	8b 5d 10             	mov    0x10(%ebp),%ebx
     5ff:	90                   	nop
     600:	50                   	push   %eax
     601:	68 1d 11 00 00       	push   $0x111d
     606:	53                   	push   %ebx
     607:	56                   	push   %esi
     608:	e8 7b ff ff ff       	call   588 <peek>
     60d:	83 c4 10             	add    $0x10,%esp
     610:	85 c0                	test   %eax,%eax
     612:	0f 84 e8 00 00 00    	je     700 <parseredirs+0x110>
     618:	6a 00                	push   $0x0
     61a:	6a 00                	push   $0x0
     61c:	53                   	push   %ebx
     61d:	56                   	push   %esi
     61e:	e8 11 fe ff ff       	call   434 <gettoken>
     623:	89 c7                	mov    %eax,%edi
     625:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     628:	50                   	push   %eax
     629:	8d 45 e0             	lea    -0x20(%ebp),%eax
     62c:	50                   	push   %eax
     62d:	53                   	push   %ebx
     62e:	56                   	push   %esi
     62f:	e8 00 fe ff ff       	call   434 <gettoken>
     634:	83 c4 20             	add    $0x20,%esp
     637:	83 f8 61             	cmp    $0x61,%eax
     63a:	0f 85 cb 00 00 00    	jne    70b <parseredirs+0x11b>
     640:	83 ff 3c             	cmp    $0x3c,%edi
     643:	74 63                	je     6a8 <parseredirs+0xb8>
     645:	83 ff 3e             	cmp    $0x3e,%edi
     648:	74 05                	je     64f <parseredirs+0x5f>
     64a:	83 ff 2b             	cmp    $0x2b,%edi
     64d:	75 b1                	jne    600 <parseredirs+0x10>
     64f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     652:	89 55 d0             	mov    %edx,-0x30(%ebp)
     655:	8b 4d e0             	mov    -0x20(%ebp),%ecx
     658:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     65b:	83 ec 0c             	sub    $0xc,%esp
     65e:	6a 18                	push   $0x18
     660:	e8 83 09 00 00       	call   fe8 <malloc>
     665:	89 c7                	mov    %eax,%edi
     667:	83 c4 0c             	add    $0xc,%esp
     66a:	6a 18                	push   $0x18
     66c:	6a 00                	push   $0x0
     66e:	50                   	push   %eax
     66f:	e8 08 05 00 00       	call   b7c <memset>
     674:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
     67a:	8b 45 08             	mov    0x8(%ebp),%eax
     67d:	89 47 04             	mov    %eax,0x4(%edi)
     680:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     683:	89 4f 08             	mov    %ecx,0x8(%edi)
     686:	8b 55 d0             	mov    -0x30(%ebp),%edx
     689:	89 57 0c             	mov    %edx,0xc(%edi)
     68c:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
     693:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
     69a:	83 c4 10             	add    $0x10,%esp
     69d:	89 7d 08             	mov    %edi,0x8(%ebp)
     6a0:	e9 5b ff ff ff       	jmp    600 <parseredirs+0x10>
     6a5:	8d 76 00             	lea    0x0(%esi),%esi
     6a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6ab:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6ae:	8b 4d e0             	mov    -0x20(%ebp),%ecx
     6b1:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
     6b4:	83 ec 0c             	sub    $0xc,%esp
     6b7:	6a 18                	push   $0x18
     6b9:	e8 2a 09 00 00       	call   fe8 <malloc>
     6be:	89 c7                	mov    %eax,%edi
     6c0:	83 c4 0c             	add    $0xc,%esp
     6c3:	6a 18                	push   $0x18
     6c5:	6a 00                	push   $0x0
     6c7:	50                   	push   %eax
     6c8:	e8 af 04 00 00       	call   b7c <memset>
     6cd:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
     6d3:	8b 45 08             	mov    0x8(%ebp),%eax
     6d6:	89 47 04             	mov    %eax,0x4(%edi)
     6d9:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6dc:	89 4f 08             	mov    %ecx,0x8(%edi)
     6df:	8b 55 d0             	mov    -0x30(%ebp),%edx
     6e2:	89 57 0c             	mov    %edx,0xc(%edi)
     6e5:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
     6ec:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
     6f3:	83 c4 10             	add    $0x10,%esp
     6f6:	89 7d 08             	mov    %edi,0x8(%ebp)
     6f9:	e9 02 ff ff ff       	jmp    600 <parseredirs+0x10>
     6fe:	66 90                	xchg   %ax,%ax
     700:	8b 45 08             	mov    0x8(%ebp),%eax
     703:	8d 65 f4             	lea    -0xc(%ebp),%esp
     706:	5b                   	pop    %ebx
     707:	5e                   	pop    %esi
     708:	5f                   	pop    %edi
     709:	5d                   	pop    %ebp
     70a:	c3                   	ret    
     70b:	83 ec 0c             	sub    $0xc,%esp
     70e:	68 00 11 00 00       	push   $0x1100
     713:	e8 4c fa ff ff       	call   164 <panic>

00000718 <parseexec>:
     718:	55                   	push   %ebp
     719:	89 e5                	mov    %esp,%ebp
     71b:	57                   	push   %edi
     71c:	56                   	push   %esi
     71d:	53                   	push   %ebx
     71e:	83 ec 30             	sub    $0x30,%esp
     721:	8b 5d 08             	mov    0x8(%ebp),%ebx
     724:	8b 75 0c             	mov    0xc(%ebp),%esi
     727:	68 20 11 00 00       	push   $0x1120
     72c:	56                   	push   %esi
     72d:	53                   	push   %ebx
     72e:	e8 55 fe ff ff       	call   588 <peek>
     733:	83 c4 10             	add    $0x10,%esp
     736:	85 c0                	test   %eax,%eax
     738:	0f 85 9e 00 00 00    	jne    7dc <parseexec+0xc4>
     73e:	89 c7                	mov    %eax,%edi
     740:	83 ec 0c             	sub    $0xc,%esp
     743:	6a 54                	push   $0x54
     745:	e8 9e 08 00 00       	call   fe8 <malloc>
     74a:	83 c4 0c             	add    $0xc,%esp
     74d:	6a 54                	push   $0x54
     74f:	6a 00                	push   $0x0
     751:	89 45 d0             	mov    %eax,-0x30(%ebp)
     754:	50                   	push   %eax
     755:	e8 22 04 00 00       	call   b7c <memset>
     75a:	8b 45 d0             	mov    -0x30(%ebp),%eax
     75d:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
     763:	83 c4 0c             	add    $0xc,%esp
     766:	56                   	push   %esi
     767:	53                   	push   %ebx
     768:	50                   	push   %eax
     769:	e8 82 fe ff ff       	call   5f0 <parseredirs>
     76e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     771:	83 c4 10             	add    $0x10,%esp
     774:	eb 13                	jmp    789 <parseexec+0x71>
     776:	66 90                	xchg   %ax,%ax
     778:	52                   	push   %edx
     779:	56                   	push   %esi
     77a:	53                   	push   %ebx
     77b:	ff 75 d4             	pushl  -0x2c(%ebp)
     77e:	e8 6d fe ff ff       	call   5f0 <parseredirs>
     783:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     786:	83 c4 10             	add    $0x10,%esp
     789:	50                   	push   %eax
     78a:	68 37 11 00 00       	push   $0x1137
     78f:	56                   	push   %esi
     790:	53                   	push   %ebx
     791:	e8 f2 fd ff ff       	call   588 <peek>
     796:	83 c4 10             	add    $0x10,%esp
     799:	85 c0                	test   %eax,%eax
     79b:	75 53                	jne    7f0 <parseexec+0xd8>
     79d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7a0:	50                   	push   %eax
     7a1:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7a4:	50                   	push   %eax
     7a5:	56                   	push   %esi
     7a6:	53                   	push   %ebx
     7a7:	e8 88 fc ff ff       	call   434 <gettoken>
     7ac:	83 c4 10             	add    $0x10,%esp
     7af:	85 c0                	test   %eax,%eax
     7b1:	74 3d                	je     7f0 <parseexec+0xd8>
     7b3:	83 f8 61             	cmp    $0x61,%eax
     7b6:	75 56                	jne    80e <parseexec+0xf6>
     7b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7bb:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7be:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
     7c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7c5:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
     7c9:	47                   	inc    %edi
     7ca:	83 ff 0a             	cmp    $0xa,%edi
     7cd:	75 a9                	jne    778 <parseexec+0x60>
     7cf:	83 ec 0c             	sub    $0xc,%esp
     7d2:	68 29 11 00 00       	push   $0x1129
     7d7:	e8 88 f9 ff ff       	call   164 <panic>
     7dc:	89 75 0c             	mov    %esi,0xc(%ebp)
     7df:	89 5d 08             	mov    %ebx,0x8(%ebp)
     7e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e5:	5b                   	pop    %ebx
     7e6:	5e                   	pop    %esi
     7e7:	5f                   	pop    %edi
     7e8:	5d                   	pop    %ebp
     7e9:	e9 8a 01 00 00       	jmp    978 <parseblock>
     7ee:	66 90                	xchg   %ax,%ax
     7f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7f3:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     7fa:	00 
     7fb:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     802:	00 
     803:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     806:	8d 65 f4             	lea    -0xc(%ebp),%esp
     809:	5b                   	pop    %ebx
     80a:	5e                   	pop    %esi
     80b:	5f                   	pop    %edi
     80c:	5d                   	pop    %ebp
     80d:	c3                   	ret    
     80e:	83 ec 0c             	sub    $0xc,%esp
     811:	68 22 11 00 00       	push   $0x1122
     816:	e8 49 f9 ff ff       	call   164 <panic>
     81b:	90                   	nop

0000081c <parsepipe>:
     81c:	55                   	push   %ebp
     81d:	89 e5                	mov    %esp,%ebp
     81f:	57                   	push   %edi
     820:	56                   	push   %esi
     821:	53                   	push   %ebx
     822:	83 ec 14             	sub    $0x14,%esp
     825:	8b 75 08             	mov    0x8(%ebp),%esi
     828:	8b 7d 0c             	mov    0xc(%ebp),%edi
     82b:	57                   	push   %edi
     82c:	56                   	push   %esi
     82d:	e8 e6 fe ff ff       	call   718 <parseexec>
     832:	89 c3                	mov    %eax,%ebx
     834:	83 c4 0c             	add    $0xc,%esp
     837:	68 3c 11 00 00       	push   $0x113c
     83c:	57                   	push   %edi
     83d:	56                   	push   %esi
     83e:	e8 45 fd ff ff       	call   588 <peek>
     843:	83 c4 10             	add    $0x10,%esp
     846:	85 c0                	test   %eax,%eax
     848:	75 0a                	jne    854 <parsepipe+0x38>
     84a:	89 d8                	mov    %ebx,%eax
     84c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     84f:	5b                   	pop    %ebx
     850:	5e                   	pop    %esi
     851:	5f                   	pop    %edi
     852:	5d                   	pop    %ebp
     853:	c3                   	ret    
     854:	6a 00                	push   $0x0
     856:	6a 00                	push   $0x0
     858:	57                   	push   %edi
     859:	56                   	push   %esi
     85a:	e8 d5 fb ff ff       	call   434 <gettoken>
     85f:	58                   	pop    %eax
     860:	5a                   	pop    %edx
     861:	57                   	push   %edi
     862:	56                   	push   %esi
     863:	e8 b4 ff ff ff       	call   81c <parsepipe>
     868:	89 c7                	mov    %eax,%edi
     86a:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     871:	e8 72 07 00 00       	call   fe8 <malloc>
     876:	89 c6                	mov    %eax,%esi
     878:	83 c4 0c             	add    $0xc,%esp
     87b:	6a 0c                	push   $0xc
     87d:	6a 00                	push   $0x0
     87f:	50                   	push   %eax
     880:	e8 f7 02 00 00       	call   b7c <memset>
     885:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
     88b:	89 5e 04             	mov    %ebx,0x4(%esi)
     88e:	89 7e 08             	mov    %edi,0x8(%esi)
     891:	83 c4 10             	add    $0x10,%esp
     894:	89 f3                	mov    %esi,%ebx
     896:	89 d8                	mov    %ebx,%eax
     898:	8d 65 f4             	lea    -0xc(%ebp),%esp
     89b:	5b                   	pop    %ebx
     89c:	5e                   	pop    %esi
     89d:	5f                   	pop    %edi
     89e:	5d                   	pop    %ebp
     89f:	c3                   	ret    

000008a0 <parseline>:
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 24             	sub    $0x24,%esp
     8a9:	8b 75 08             	mov    0x8(%ebp),%esi
     8ac:	8b 7d 0c             	mov    0xc(%ebp),%edi
     8af:	57                   	push   %edi
     8b0:	56                   	push   %esi
     8b1:	e8 66 ff ff ff       	call   81c <parsepipe>
     8b6:	89 c3                	mov    %eax,%ebx
     8b8:	83 c4 10             	add    $0x10,%esp
     8bb:	eb 3b                	jmp    8f8 <parseline+0x58>
     8bd:	8d 76 00             	lea    0x0(%esi),%esi
     8c0:	6a 00                	push   $0x0
     8c2:	6a 00                	push   $0x0
     8c4:	57                   	push   %edi
     8c5:	56                   	push   %esi
     8c6:	e8 69 fb ff ff       	call   434 <gettoken>
     8cb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     8d2:	e8 11 07 00 00       	call   fe8 <malloc>
     8d7:	83 c4 0c             	add    $0xc,%esp
     8da:	6a 08                	push   $0x8
     8dc:	6a 00                	push   $0x0
     8de:	50                   	push   %eax
     8df:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     8e2:	e8 95 02 00 00       	call   b7c <memset>
     8e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     8ea:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
     8f0:	89 5a 04             	mov    %ebx,0x4(%edx)
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	89 d3                	mov    %edx,%ebx
     8f8:	50                   	push   %eax
     8f9:	68 3e 11 00 00       	push   $0x113e
     8fe:	57                   	push   %edi
     8ff:	56                   	push   %esi
     900:	e8 83 fc ff ff       	call   588 <peek>
     905:	83 c4 10             	add    $0x10,%esp
     908:	85 c0                	test   %eax,%eax
     90a:	75 b4                	jne    8c0 <parseline+0x20>
     90c:	51                   	push   %ecx
     90d:	68 3a 11 00 00       	push   $0x113a
     912:	57                   	push   %edi
     913:	56                   	push   %esi
     914:	e8 6f fc ff ff       	call   588 <peek>
     919:	83 c4 10             	add    $0x10,%esp
     91c:	85 c0                	test   %eax,%eax
     91e:	75 0c                	jne    92c <parseline+0x8c>
     920:	89 d8                	mov    %ebx,%eax
     922:	8d 65 f4             	lea    -0xc(%ebp),%esp
     925:	5b                   	pop    %ebx
     926:	5e                   	pop    %esi
     927:	5f                   	pop    %edi
     928:	5d                   	pop    %ebp
     929:	c3                   	ret    
     92a:	66 90                	xchg   %ax,%ax
     92c:	6a 00                	push   $0x0
     92e:	6a 00                	push   $0x0
     930:	57                   	push   %edi
     931:	56                   	push   %esi
     932:	e8 fd fa ff ff       	call   434 <gettoken>
     937:	58                   	pop    %eax
     938:	5a                   	pop    %edx
     939:	57                   	push   %edi
     93a:	56                   	push   %esi
     93b:	e8 60 ff ff ff       	call   8a0 <parseline>
     940:	89 c7                	mov    %eax,%edi
     942:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     949:	e8 9a 06 00 00       	call   fe8 <malloc>
     94e:	89 c6                	mov    %eax,%esi
     950:	83 c4 0c             	add    $0xc,%esp
     953:	6a 0c                	push   $0xc
     955:	6a 00                	push   $0x0
     957:	50                   	push   %eax
     958:	e8 1f 02 00 00       	call   b7c <memset>
     95d:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
     963:	89 5e 04             	mov    %ebx,0x4(%esi)
     966:	89 7e 08             	mov    %edi,0x8(%esi)
     969:	83 c4 10             	add    $0x10,%esp
     96c:	89 f3                	mov    %esi,%ebx
     96e:	89 d8                	mov    %ebx,%eax
     970:	8d 65 f4             	lea    -0xc(%ebp),%esp
     973:	5b                   	pop    %ebx
     974:	5e                   	pop    %esi
     975:	5f                   	pop    %edi
     976:	5d                   	pop    %ebp
     977:	c3                   	ret    

00000978 <parseblock>:
     978:	55                   	push   %ebp
     979:	89 e5                	mov    %esp,%ebp
     97b:	57                   	push   %edi
     97c:	56                   	push   %esi
     97d:	53                   	push   %ebx
     97e:	83 ec 10             	sub    $0x10,%esp
     981:	8b 5d 08             	mov    0x8(%ebp),%ebx
     984:	8b 75 0c             	mov    0xc(%ebp),%esi
     987:	68 20 11 00 00       	push   $0x1120
     98c:	56                   	push   %esi
     98d:	53                   	push   %ebx
     98e:	e8 f5 fb ff ff       	call   588 <peek>
     993:	83 c4 10             	add    $0x10,%esp
     996:	85 c0                	test   %eax,%eax
     998:	74 4a                	je     9e4 <parseblock+0x6c>
     99a:	6a 00                	push   $0x0
     99c:	6a 00                	push   $0x0
     99e:	56                   	push   %esi
     99f:	53                   	push   %ebx
     9a0:	e8 8f fa ff ff       	call   434 <gettoken>
     9a5:	58                   	pop    %eax
     9a6:	5a                   	pop    %edx
     9a7:	56                   	push   %esi
     9a8:	53                   	push   %ebx
     9a9:	e8 f2 fe ff ff       	call   8a0 <parseline>
     9ae:	89 c7                	mov    %eax,%edi
     9b0:	83 c4 0c             	add    $0xc,%esp
     9b3:	68 5c 11 00 00       	push   $0x115c
     9b8:	56                   	push   %esi
     9b9:	53                   	push   %ebx
     9ba:	e8 c9 fb ff ff       	call   588 <peek>
     9bf:	83 c4 10             	add    $0x10,%esp
     9c2:	85 c0                	test   %eax,%eax
     9c4:	74 2b                	je     9f1 <parseblock+0x79>
     9c6:	6a 00                	push   $0x0
     9c8:	6a 00                	push   $0x0
     9ca:	56                   	push   %esi
     9cb:	53                   	push   %ebx
     9cc:	e8 63 fa ff ff       	call   434 <gettoken>
     9d1:	83 c4 0c             	add    $0xc,%esp
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	57                   	push   %edi
     9d7:	e8 14 fc ff ff       	call   5f0 <parseredirs>
     9dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9df:	5b                   	pop    %ebx
     9e0:	5e                   	pop    %esi
     9e1:	5f                   	pop    %edi
     9e2:	5d                   	pop    %ebp
     9e3:	c3                   	ret    
     9e4:	83 ec 0c             	sub    $0xc,%esp
     9e7:	68 40 11 00 00       	push   $0x1140
     9ec:	e8 73 f7 ff ff       	call   164 <panic>
     9f1:	83 ec 0c             	sub    $0xc,%esp
     9f4:	68 4b 11 00 00       	push   $0x114b
     9f9:	e8 66 f7 ff ff       	call   164 <panic>
     9fe:	66 90                	xchg   %ax,%ax

00000a00 <nulterminate>:
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	53                   	push   %ebx
     a04:	53                   	push   %ebx
     a05:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a08:	85 db                	test   %ebx,%ebx
     a0a:	74 78                	je     a84 <nulterminate+0x84>
     a0c:	83 3b 05             	cmpl   $0x5,(%ebx)
     a0f:	77 22                	ja     a33 <nulterminate+0x33>
     a11:	8b 03                	mov    (%ebx),%eax
     a13:	ff 24 85 9c 11 00 00 	jmp    *0x119c(,%eax,4)
     a1a:	66 90                	xchg   %ax,%ax
     a1c:	83 ec 0c             	sub    $0xc,%esp
     a1f:	ff 73 04             	pushl  0x4(%ebx)
     a22:	e8 d9 ff ff ff       	call   a00 <nulterminate>
     a27:	58                   	pop    %eax
     a28:	ff 73 08             	pushl  0x8(%ebx)
     a2b:	e8 d0 ff ff ff       	call   a00 <nulterminate>
     a30:	83 c4 10             	add    $0x10,%esp
     a33:	89 d8                	mov    %ebx,%eax
     a35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a38:	c9                   	leave  
     a39:	c3                   	ret    
     a3a:	66 90                	xchg   %ax,%ax
     a3c:	83 ec 0c             	sub    $0xc,%esp
     a3f:	ff 73 04             	pushl  0x4(%ebx)
     a42:	e8 b9 ff ff ff       	call   a00 <nulterminate>
     a47:	83 c4 10             	add    $0x10,%esp
     a4a:	eb e7                	jmp    a33 <nulterminate+0x33>
     a4c:	8d 43 08             	lea    0x8(%ebx),%eax
     a4f:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a52:	85 c9                	test   %ecx,%ecx
     a54:	74 dd                	je     a33 <nulterminate+0x33>
     a56:	66 90                	xchg   %ax,%ax
     a58:	8b 50 24             	mov    0x24(%eax),%edx
     a5b:	c6 02 00             	movb   $0x0,(%edx)
     a5e:	83 c0 04             	add    $0x4,%eax
     a61:	8b 50 fc             	mov    -0x4(%eax),%edx
     a64:	85 d2                	test   %edx,%edx
     a66:	75 f0                	jne    a58 <nulterminate+0x58>
     a68:	eb c9                	jmp    a33 <nulterminate+0x33>
     a6a:	66 90                	xchg   %ax,%ax
     a6c:	83 ec 0c             	sub    $0xc,%esp
     a6f:	ff 73 04             	pushl  0x4(%ebx)
     a72:	e8 89 ff ff ff       	call   a00 <nulterminate>
     a77:	8b 43 0c             	mov    0xc(%ebx),%eax
     a7a:	c6 00 00             	movb   $0x0,(%eax)
     a7d:	83 c4 10             	add    $0x10,%esp
     a80:	eb b1                	jmp    a33 <nulterminate+0x33>
     a82:	66 90                	xchg   %ax,%ax
     a84:	31 c0                	xor    %eax,%eax
     a86:	eb ad                	jmp    a35 <nulterminate+0x35>

00000a88 <parsecmd>:
     a88:	55                   	push   %ebp
     a89:	89 e5                	mov    %esp,%ebp
     a8b:	57                   	push   %edi
     a8c:	56                   	push   %esi
     a8d:	53                   	push   %ebx
     a8e:	83 ec 18             	sub    $0x18,%esp
     a91:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a94:	53                   	push   %ebx
     a95:	e8 ba 00 00 00       	call   b54 <strlen>
     a9a:	01 c3                	add    %eax,%ebx
     a9c:	59                   	pop    %ecx
     a9d:	5e                   	pop    %esi
     a9e:	53                   	push   %ebx
     a9f:	8d 7d 08             	lea    0x8(%ebp),%edi
     aa2:	57                   	push   %edi
     aa3:	e8 f8 fd ff ff       	call   8a0 <parseline>
     aa8:	89 c6                	mov    %eax,%esi
     aaa:	83 c4 0c             	add    $0xc,%esp
     aad:	68 ea 10 00 00       	push   $0x10ea
     ab2:	53                   	push   %ebx
     ab3:	57                   	push   %edi
     ab4:	e8 cf fa ff ff       	call   588 <peek>
     ab9:	8b 45 08             	mov    0x8(%ebp),%eax
     abc:	83 c4 10             	add    $0x10,%esp
     abf:	39 d8                	cmp    %ebx,%eax
     ac1:	75 13                	jne    ad6 <parsecmd+0x4e>
     ac3:	83 ec 0c             	sub    $0xc,%esp
     ac6:	56                   	push   %esi
     ac7:	e8 34 ff ff ff       	call   a00 <nulterminate>
     acc:	89 f0                	mov    %esi,%eax
     ace:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ad1:	5b                   	pop    %ebx
     ad2:	5e                   	pop    %esi
     ad3:	5f                   	pop    %edi
     ad4:	5d                   	pop    %ebp
     ad5:	c3                   	ret    
     ad6:	52                   	push   %edx
     ad7:	50                   	push   %eax
     ad8:	68 5e 11 00 00       	push   $0x115e
     add:	6a 02                	push   $0x2
     adf:	e8 04 03 00 00       	call   de8 <printf>
     ae4:	c7 04 24 22 11 00 00 	movl   $0x1122,(%esp)
     aeb:	e8 74 f6 ff ff       	call   164 <panic>

00000af0 <strcpy>:
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	53                   	push   %ebx
     af4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     af7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     afa:	31 c0                	xor    %eax,%eax
     afc:	8a 14 03             	mov    (%ebx,%eax,1),%dl
     aff:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b02:	40                   	inc    %eax
     b03:	84 d2                	test   %dl,%dl
     b05:	75 f5                	jne    afc <strcpy+0xc>
     b07:	89 c8                	mov    %ecx,%eax
     b09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b0c:	c9                   	leave  
     b0d:	c3                   	ret    
     b0e:	66 90                	xchg   %ax,%ax

00000b10 <strcmp>:
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	53                   	push   %ebx
     b14:	8b 55 08             	mov    0x8(%ebp),%edx
     b17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     b1a:	0f b6 02             	movzbl (%edx),%eax
     b1d:	84 c0                	test   %al,%al
     b1f:	75 10                	jne    b31 <strcmp+0x21>
     b21:	eb 2a                	jmp    b4d <strcmp+0x3d>
     b23:	90                   	nop
     b24:	42                   	inc    %edx
     b25:	8d 4b 01             	lea    0x1(%ebx),%ecx
     b28:	0f b6 02             	movzbl (%edx),%eax
     b2b:	84 c0                	test   %al,%al
     b2d:	74 11                	je     b40 <strcmp+0x30>
     b2f:	89 cb                	mov    %ecx,%ebx
     b31:	0f b6 0b             	movzbl (%ebx),%ecx
     b34:	38 c1                	cmp    %al,%cl
     b36:	74 ec                	je     b24 <strcmp+0x14>
     b38:	29 c8                	sub    %ecx,%eax
     b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b3d:	c9                   	leave  
     b3e:	c3                   	ret    
     b3f:	90                   	nop
     b40:	0f b6 4b 01          	movzbl 0x1(%ebx),%ecx
     b44:	31 c0                	xor    %eax,%eax
     b46:	29 c8                	sub    %ecx,%eax
     b48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b4b:	c9                   	leave  
     b4c:	c3                   	ret    
     b4d:	0f b6 0b             	movzbl (%ebx),%ecx
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb e4                	jmp    b38 <strcmp+0x28>

00000b54 <strlen>:
     b54:	55                   	push   %ebp
     b55:	89 e5                	mov    %esp,%ebp
     b57:	8b 55 08             	mov    0x8(%ebp),%edx
     b5a:	80 3a 00             	cmpb   $0x0,(%edx)
     b5d:	74 15                	je     b74 <strlen+0x20>
     b5f:	31 c0                	xor    %eax,%eax
     b61:	8d 76 00             	lea    0x0(%esi),%esi
     b64:	40                   	inc    %eax
     b65:	89 c1                	mov    %eax,%ecx
     b67:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     b6b:	75 f7                	jne    b64 <strlen+0x10>
     b6d:	89 c8                	mov    %ecx,%eax
     b6f:	5d                   	pop    %ebp
     b70:	c3                   	ret    
     b71:	8d 76 00             	lea    0x0(%esi),%esi
     b74:	31 c9                	xor    %ecx,%ecx
     b76:	89 c8                	mov    %ecx,%eax
     b78:	5d                   	pop    %ebp
     b79:	c3                   	ret    
     b7a:	66 90                	xchg   %ax,%ax

00000b7c <memset>:
     b7c:	55                   	push   %ebp
     b7d:	89 e5                	mov    %esp,%ebp
     b7f:	57                   	push   %edi
     b80:	8b 7d 08             	mov    0x8(%ebp),%edi
     b83:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b86:	8b 45 0c             	mov    0xc(%ebp),%eax
     b89:	fc                   	cld    
     b8a:	f3 aa                	rep stos %al,%es:(%edi)
     b8c:	8b 45 08             	mov    0x8(%ebp),%eax
     b8f:	8b 7d fc             	mov    -0x4(%ebp),%edi
     b92:	c9                   	leave  
     b93:	c3                   	ret    

00000b94 <strchr>:
     b94:	55                   	push   %ebp
     b95:	89 e5                	mov    %esp,%ebp
     b97:	8b 45 08             	mov    0x8(%ebp),%eax
     b9a:	8a 4d 0c             	mov    0xc(%ebp),%cl
     b9d:	8a 10                	mov    (%eax),%dl
     b9f:	84 d2                	test   %dl,%dl
     ba1:	75 0c                	jne    baf <strchr+0x1b>
     ba3:	eb 13                	jmp    bb8 <strchr+0x24>
     ba5:	8d 76 00             	lea    0x0(%esi),%esi
     ba8:	40                   	inc    %eax
     ba9:	8a 10                	mov    (%eax),%dl
     bab:	84 d2                	test   %dl,%dl
     bad:	74 09                	je     bb8 <strchr+0x24>
     baf:	38 d1                	cmp    %dl,%cl
     bb1:	75 f5                	jne    ba8 <strchr+0x14>
     bb3:	5d                   	pop    %ebp
     bb4:	c3                   	ret    
     bb5:	8d 76 00             	lea    0x0(%esi),%esi
     bb8:	31 c0                	xor    %eax,%eax
     bba:	5d                   	pop    %ebp
     bbb:	c3                   	ret    

00000bbc <gets>:
     bbc:	55                   	push   %ebp
     bbd:	89 e5                	mov    %esp,%ebp
     bbf:	57                   	push   %edi
     bc0:	56                   	push   %esi
     bc1:	53                   	push   %ebx
     bc2:	83 ec 1c             	sub    $0x1c,%esp
     bc5:	31 db                	xor    %ebx,%ebx
     bc7:	8d 75 e7             	lea    -0x19(%ebp),%esi
     bca:	eb 24                	jmp    bf0 <gets+0x34>
     bcc:	50                   	push   %eax
     bcd:	6a 01                	push   $0x1
     bcf:	56                   	push   %esi
     bd0:	6a 00                	push   $0x0
     bd2:	e8 f4 00 00 00       	call   ccb <read>
     bd7:	83 c4 10             	add    $0x10,%esp
     bda:	85 c0                	test   %eax,%eax
     bdc:	7e 1a                	jle    bf8 <gets+0x3c>
     bde:	8a 45 e7             	mov    -0x19(%ebp),%al
     be1:	8b 55 08             	mov    0x8(%ebp),%edx
     be4:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
     be8:	3c 0a                	cmp    $0xa,%al
     bea:	74 0e                	je     bfa <gets+0x3e>
     bec:	3c 0d                	cmp    $0xd,%al
     bee:	74 0a                	je     bfa <gets+0x3e>
     bf0:	89 df                	mov    %ebx,%edi
     bf2:	43                   	inc    %ebx
     bf3:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     bf6:	7c d4                	jl     bcc <gets+0x10>
     bf8:	89 fb                	mov    %edi,%ebx
     bfa:	8b 45 08             	mov    0x8(%ebp),%eax
     bfd:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
     c01:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c04:	5b                   	pop    %ebx
     c05:	5e                   	pop    %esi
     c06:	5f                   	pop    %edi
     c07:	5d                   	pop    %ebp
     c08:	c3                   	ret    
     c09:	8d 76 00             	lea    0x0(%esi),%esi

00000c0c <stat>:
     c0c:	55                   	push   %ebp
     c0d:	89 e5                	mov    %esp,%ebp
     c0f:	56                   	push   %esi
     c10:	53                   	push   %ebx
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	6a 00                	push   $0x0
     c16:	ff 75 08             	pushl  0x8(%ebp)
     c19:	e8 d5 00 00 00       	call   cf3 <open>
     c1e:	83 c4 10             	add    $0x10,%esp
     c21:	85 c0                	test   %eax,%eax
     c23:	78 27                	js     c4c <stat+0x40>
     c25:	89 c3                	mov    %eax,%ebx
     c27:	83 ec 08             	sub    $0x8,%esp
     c2a:	ff 75 0c             	pushl  0xc(%ebp)
     c2d:	50                   	push   %eax
     c2e:	e8 d8 00 00 00       	call   d0b <fstat>
     c33:	89 c6                	mov    %eax,%esi
     c35:	89 1c 24             	mov    %ebx,(%esp)
     c38:	e8 9e 00 00 00       	call   cdb <close>
     c3d:	83 c4 10             	add    $0x10,%esp
     c40:	89 f0                	mov    %esi,%eax
     c42:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c45:	5b                   	pop    %ebx
     c46:	5e                   	pop    %esi
     c47:	5d                   	pop    %ebp
     c48:	c3                   	ret    
     c49:	8d 76 00             	lea    0x0(%esi),%esi
     c4c:	be ff ff ff ff       	mov    $0xffffffff,%esi
     c51:	eb ed                	jmp    c40 <stat+0x34>
     c53:	90                   	nop

00000c54 <atoi>:
     c54:	55                   	push   %ebp
     c55:	89 e5                	mov    %esp,%ebp
     c57:	53                   	push   %ebx
     c58:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c5b:	0f be 01             	movsbl (%ecx),%eax
     c5e:	8d 50 d0             	lea    -0x30(%eax),%edx
     c61:	80 fa 09             	cmp    $0x9,%dl
     c64:	ba 00 00 00 00       	mov    $0x0,%edx
     c69:	77 16                	ja     c81 <atoi+0x2d>
     c6b:	90                   	nop
     c6c:	41                   	inc    %ecx
     c6d:	8d 14 92             	lea    (%edx,%edx,4),%edx
     c70:	01 d2                	add    %edx,%edx
     c72:	8d 54 02 d0          	lea    -0x30(%edx,%eax,1),%edx
     c76:	0f be 01             	movsbl (%ecx),%eax
     c79:	8d 58 d0             	lea    -0x30(%eax),%ebx
     c7c:	80 fb 09             	cmp    $0x9,%bl
     c7f:	76 eb                	jbe    c6c <atoi+0x18>
     c81:	89 d0                	mov    %edx,%eax
     c83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c86:	c9                   	leave  
     c87:	c3                   	ret    

00000c88 <memmove>:
     c88:	55                   	push   %ebp
     c89:	89 e5                	mov    %esp,%ebp
     c8b:	57                   	push   %edi
     c8c:	56                   	push   %esi
     c8d:	8b 55 08             	mov    0x8(%ebp),%edx
     c90:	8b 75 0c             	mov    0xc(%ebp),%esi
     c93:	8b 45 10             	mov    0x10(%ebp),%eax
     c96:	85 c0                	test   %eax,%eax
     c98:	7e 0b                	jle    ca5 <memmove+0x1d>
     c9a:	01 d0                	add    %edx,%eax
     c9c:	89 d7                	mov    %edx,%edi
     c9e:	66 90                	xchg   %ax,%ax
     ca0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
     ca1:	39 f8                	cmp    %edi,%eax
     ca3:	75 fb                	jne    ca0 <memmove+0x18>
     ca5:	89 d0                	mov    %edx,%eax
     ca7:	5e                   	pop    %esi
     ca8:	5f                   	pop    %edi
     ca9:	5d                   	pop    %ebp
     caa:	c3                   	ret    

00000cab <fork>:
     cab:	b8 01 00 00 00       	mov    $0x1,%eax
     cb0:	cd 40                	int    $0x40
     cb2:	c3                   	ret    

00000cb3 <exit>:
     cb3:	b8 02 00 00 00       	mov    $0x2,%eax
     cb8:	cd 40                	int    $0x40
     cba:	c3                   	ret    

00000cbb <wait>:
     cbb:	b8 03 00 00 00       	mov    $0x3,%eax
     cc0:	cd 40                	int    $0x40
     cc2:	c3                   	ret    

00000cc3 <pipe>:
     cc3:	b8 04 00 00 00       	mov    $0x4,%eax
     cc8:	cd 40                	int    $0x40
     cca:	c3                   	ret    

00000ccb <read>:
     ccb:	b8 05 00 00 00       	mov    $0x5,%eax
     cd0:	cd 40                	int    $0x40
     cd2:	c3                   	ret    

00000cd3 <write>:
     cd3:	b8 10 00 00 00       	mov    $0x10,%eax
     cd8:	cd 40                	int    $0x40
     cda:	c3                   	ret    

00000cdb <close>:
     cdb:	b8 15 00 00 00       	mov    $0x15,%eax
     ce0:	cd 40                	int    $0x40
     ce2:	c3                   	ret    

00000ce3 <kill>:
     ce3:	b8 06 00 00 00       	mov    $0x6,%eax
     ce8:	cd 40                	int    $0x40
     cea:	c3                   	ret    

00000ceb <exec>:
     ceb:	b8 07 00 00 00       	mov    $0x7,%eax
     cf0:	cd 40                	int    $0x40
     cf2:	c3                   	ret    

00000cf3 <open>:
     cf3:	b8 0f 00 00 00       	mov    $0xf,%eax
     cf8:	cd 40                	int    $0x40
     cfa:	c3                   	ret    

00000cfb <mknod>:
     cfb:	b8 11 00 00 00       	mov    $0x11,%eax
     d00:	cd 40                	int    $0x40
     d02:	c3                   	ret    

00000d03 <unlink>:
     d03:	b8 12 00 00 00       	mov    $0x12,%eax
     d08:	cd 40                	int    $0x40
     d0a:	c3                   	ret    

00000d0b <fstat>:
     d0b:	b8 08 00 00 00       	mov    $0x8,%eax
     d10:	cd 40                	int    $0x40
     d12:	c3                   	ret    

00000d13 <link>:
     d13:	b8 13 00 00 00       	mov    $0x13,%eax
     d18:	cd 40                	int    $0x40
     d1a:	c3                   	ret    

00000d1b <mkdir>:
     d1b:	b8 14 00 00 00       	mov    $0x14,%eax
     d20:	cd 40                	int    $0x40
     d22:	c3                   	ret    

00000d23 <chdir>:
     d23:	b8 09 00 00 00       	mov    $0x9,%eax
     d28:	cd 40                	int    $0x40
     d2a:	c3                   	ret    

00000d2b <dup>:
     d2b:	b8 0a 00 00 00       	mov    $0xa,%eax
     d30:	cd 40                	int    $0x40
     d32:	c3                   	ret    

00000d33 <getpid>:
     d33:	b8 0b 00 00 00       	mov    $0xb,%eax
     d38:	cd 40                	int    $0x40
     d3a:	c3                   	ret    

00000d3b <sbrk>:
     d3b:	b8 0c 00 00 00       	mov    $0xc,%eax
     d40:	cd 40                	int    $0x40
     d42:	c3                   	ret    

00000d43 <sleep>:
     d43:	b8 0d 00 00 00       	mov    $0xd,%eax
     d48:	cd 40                	int    $0x40
     d4a:	c3                   	ret    

00000d4b <uptime>:
     d4b:	b8 0e 00 00 00       	mov    $0xe,%eax
     d50:	cd 40                	int    $0x40
     d52:	c3                   	ret    

00000d53 <getreadcount>:
     d53:	b8 16 00 00 00       	mov    $0x16,%eax
     d58:	cd 40                	int    $0x40
     d5a:	c3                   	ret    
     d5b:	90                   	nop

00000d5c <printint>:
     d5c:	55                   	push   %ebp
     d5d:	89 e5                	mov    %esp,%ebp
     d5f:	57                   	push   %edi
     d60:	56                   	push   %esi
     d61:	53                   	push   %ebx
     d62:	83 ec 3c             	sub    $0x3c,%esp
     d65:	89 45 c0             	mov    %eax,-0x40(%ebp)
     d68:	89 cb                	mov    %ecx,%ebx
     d6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d6d:	85 c9                	test   %ecx,%ecx
     d6f:	74 04                	je     d75 <printint+0x19>
     d71:	85 d2                	test   %edx,%edx
     d73:	78 6b                	js     de0 <printint+0x84>
     d75:	89 55 c4             	mov    %edx,-0x3c(%ebp)
     d78:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
     d7f:	31 c9                	xor    %ecx,%ecx
     d81:	8d 75 d7             	lea    -0x29(%ebp),%esi
     d84:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     d87:	31 d2                	xor    %edx,%edx
     d89:	f7 f3                	div    %ebx
     d8b:	89 cf                	mov    %ecx,%edi
     d8d:	8d 49 01             	lea    0x1(%ecx),%ecx
     d90:	8a 92 14 12 00 00    	mov    0x1214(%edx),%dl
     d96:	88 54 3e 01          	mov    %dl,0x1(%esi,%edi,1)
     d9a:	8b 55 c4             	mov    -0x3c(%ebp),%edx
     d9d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     da0:	39 da                	cmp    %ebx,%edx
     da2:	73 e0                	jae    d84 <printint+0x28>
     da4:	8b 55 08             	mov    0x8(%ebp),%edx
     da7:	85 d2                	test   %edx,%edx
     da9:	74 07                	je     db2 <printint+0x56>
     dab:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     db0:	89 cf                	mov    %ecx,%edi
     db2:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     db5:	8d 7c 3d d8          	lea    -0x28(%ebp,%edi,1),%edi
     db9:	8d 76 00             	lea    0x0(%esi),%esi
     dbc:	8a 07                	mov    (%edi),%al
     dbe:	88 45 d7             	mov    %al,-0x29(%ebp)
     dc1:	50                   	push   %eax
     dc2:	6a 01                	push   $0x1
     dc4:	56                   	push   %esi
     dc5:	ff 75 c0             	pushl  -0x40(%ebp)
     dc8:	e8 06 ff ff ff       	call   cd3 <write>
     dcd:	89 f8                	mov    %edi,%eax
     dcf:	4f                   	dec    %edi
     dd0:	83 c4 10             	add    $0x10,%esp
     dd3:	39 d8                	cmp    %ebx,%eax
     dd5:	75 e5                	jne    dbc <printint+0x60>
     dd7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     dda:	5b                   	pop    %ebx
     ddb:	5e                   	pop    %esi
     ddc:	5f                   	pop    %edi
     ddd:	5d                   	pop    %ebp
     dde:	c3                   	ret    
     ddf:	90                   	nop
     de0:	f7 da                	neg    %edx
     de2:	89 55 c4             	mov    %edx,-0x3c(%ebp)
     de5:	eb 98                	jmp    d7f <printint+0x23>
     de7:	90                   	nop

00000de8 <printf>:
     de8:	55                   	push   %ebp
     de9:	89 e5                	mov    %esp,%ebp
     deb:	57                   	push   %edi
     dec:	56                   	push   %esi
     ded:	53                   	push   %ebx
     dee:	83 ec 2c             	sub    $0x2c,%esp
     df1:	8b 75 08             	mov    0x8(%ebp),%esi
     df4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     df7:	8a 13                	mov    (%ebx),%dl
     df9:	84 d2                	test   %dl,%dl
     dfb:	74 5c                	je     e59 <printf+0x71>
     dfd:	43                   	inc    %ebx
     dfe:	8d 45 10             	lea    0x10(%ebp),%eax
     e01:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     e04:	31 ff                	xor    %edi,%edi
     e06:	eb 20                	jmp    e28 <printf+0x40>
     e08:	83 f8 25             	cmp    $0x25,%eax
     e0b:	74 3f                	je     e4c <printf+0x64>
     e0d:	88 55 e7             	mov    %dl,-0x19(%ebp)
     e10:	50                   	push   %eax
     e11:	6a 01                	push   $0x1
     e13:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e16:	50                   	push   %eax
     e17:	56                   	push   %esi
     e18:	e8 b6 fe ff ff       	call   cd3 <write>
     e1d:	83 c4 10             	add    $0x10,%esp
     e20:	43                   	inc    %ebx
     e21:	8a 53 ff             	mov    -0x1(%ebx),%dl
     e24:	84 d2                	test   %dl,%dl
     e26:	74 31                	je     e59 <printf+0x71>
     e28:	0f b6 c2             	movzbl %dl,%eax
     e2b:	85 ff                	test   %edi,%edi
     e2d:	74 d9                	je     e08 <printf+0x20>
     e2f:	83 ff 25             	cmp    $0x25,%edi
     e32:	75 ec                	jne    e20 <printf+0x38>
     e34:	83 f8 25             	cmp    $0x25,%eax
     e37:	0f 84 03 01 00 00    	je     f40 <printf+0x158>
     e3d:	83 e8 63             	sub    $0x63,%eax
     e40:	83 f8 15             	cmp    $0x15,%eax
     e43:	77 1f                	ja     e64 <printf+0x7c>
     e45:	ff 24 85 bc 11 00 00 	jmp    *0x11bc(,%eax,4)
     e4c:	bf 25 00 00 00       	mov    $0x25,%edi
     e51:	43                   	inc    %ebx
     e52:	8a 53 ff             	mov    -0x1(%ebx),%dl
     e55:	84 d2                	test   %dl,%dl
     e57:	75 cf                	jne    e28 <printf+0x40>
     e59:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e5c:	5b                   	pop    %ebx
     e5d:	5e                   	pop    %esi
     e5e:	5f                   	pop    %edi
     e5f:	5d                   	pop    %ebp
     e60:	c3                   	ret    
     e61:	8d 76 00             	lea    0x0(%esi),%esi
     e64:	88 55 d0             	mov    %dl,-0x30(%ebp)
     e67:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     e6b:	50                   	push   %eax
     e6c:	6a 01                	push   $0x1
     e6e:	8d 7d e7             	lea    -0x19(%ebp),%edi
     e71:	57                   	push   %edi
     e72:	56                   	push   %esi
     e73:	e8 5b fe ff ff       	call   cd3 <write>
     e78:	8a 55 d0             	mov    -0x30(%ebp),%dl
     e7b:	88 55 e7             	mov    %dl,-0x19(%ebp)
     e7e:	83 c4 0c             	add    $0xc,%esp
     e81:	6a 01                	push   $0x1
     e83:	57                   	push   %edi
     e84:	56                   	push   %esi
     e85:	e8 49 fe ff ff       	call   cd3 <write>
     e8a:	83 c4 10             	add    $0x10,%esp
     e8d:	31 ff                	xor    %edi,%edi
     e8f:	eb 8f                	jmp    e20 <printf+0x38>
     e91:	8d 76 00             	lea    0x0(%esi),%esi
     e94:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     e97:	8b 17                	mov    (%edi),%edx
     e99:	83 ec 0c             	sub    $0xc,%esp
     e9c:	6a 00                	push   $0x0
     e9e:	b9 10 00 00 00       	mov    $0x10,%ecx
     ea3:	89 f0                	mov    %esi,%eax
     ea5:	e8 b2 fe ff ff       	call   d5c <printint>
     eaa:	83 c7 04             	add    $0x4,%edi
     ead:	89 7d d4             	mov    %edi,-0x2c(%ebp)
     eb0:	83 c4 10             	add    $0x10,%esp
     eb3:	31 ff                	xor    %edi,%edi
     eb5:	e9 66 ff ff ff       	jmp    e20 <printf+0x38>
     eba:	66 90                	xchg   %ax,%ax
     ebc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     ebf:	8b 10                	mov    (%eax),%edx
     ec1:	83 c0 04             	add    $0x4,%eax
     ec4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     ec7:	85 d2                	test   %edx,%edx
     ec9:	0f 84 81 00 00 00    	je     f50 <printf+0x168>
     ecf:	8a 02                	mov    (%edx),%al
     ed1:	84 c0                	test   %al,%al
     ed3:	0f 84 80 00 00 00    	je     f59 <printf+0x171>
     ed9:	8d 7d e7             	lea    -0x19(%ebp),%edi
     edc:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     edf:	89 d3                	mov    %edx,%ebx
     ee1:	8d 76 00             	lea    0x0(%esi),%esi
     ee4:	88 45 e7             	mov    %al,-0x19(%ebp)
     ee7:	50                   	push   %eax
     ee8:	6a 01                	push   $0x1
     eea:	57                   	push   %edi
     eeb:	56                   	push   %esi
     eec:	e8 e2 fd ff ff       	call   cd3 <write>
     ef1:	43                   	inc    %ebx
     ef2:	8a 03                	mov    (%ebx),%al
     ef4:	83 c4 10             	add    $0x10,%esp
     ef7:	84 c0                	test   %al,%al
     ef9:	75 e9                	jne    ee4 <printf+0xfc>
     efb:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     efe:	31 ff                	xor    %edi,%edi
     f00:	e9 1b ff ff ff       	jmp    e20 <printf+0x38>
     f05:	8d 76 00             	lea    0x0(%esi),%esi
     f08:	8b 7d d4             	mov    -0x2c(%ebp),%edi
     f0b:	8b 17                	mov    (%edi),%edx
     f0d:	83 ec 0c             	sub    $0xc,%esp
     f10:	6a 01                	push   $0x1
     f12:	b9 0a 00 00 00       	mov    $0xa,%ecx
     f17:	eb 8a                	jmp    ea3 <printf+0xbb>
     f19:	8d 76 00             	lea    0x0(%esi),%esi
     f1c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     f1f:	8b 00                	mov    (%eax),%eax
     f21:	88 45 e7             	mov    %al,-0x19(%ebp)
     f24:	51                   	push   %ecx
     f25:	6a 01                	push   $0x1
     f27:	8d 7d e7             	lea    -0x19(%ebp),%edi
     f2a:	57                   	push   %edi
     f2b:	56                   	push   %esi
     f2c:	e8 a2 fd ff ff       	call   cd3 <write>
     f31:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
     f35:	83 c4 10             	add    $0x10,%esp
     f38:	31 ff                	xor    %edi,%edi
     f3a:	e9 e1 fe ff ff       	jmp    e20 <printf+0x38>
     f3f:	90                   	nop
     f40:	88 55 e7             	mov    %dl,-0x19(%ebp)
     f43:	52                   	push   %edx
     f44:	6a 01                	push   $0x1
     f46:	8d 7d e7             	lea    -0x19(%ebp),%edi
     f49:	e9 35 ff ff ff       	jmp    e83 <printf+0x9b>
     f4e:	66 90                	xchg   %ax,%ax
     f50:	b0 28                	mov    $0x28,%al
     f52:	ba b4 11 00 00       	mov    $0x11b4,%edx
     f57:	eb 80                	jmp    ed9 <printf+0xf1>
     f59:	31 ff                	xor    %edi,%edi
     f5b:	e9 c0 fe ff ff       	jmp    e20 <printf+0x38>

00000f60 <free>:
     f60:	55                   	push   %ebp
     f61:	89 e5                	mov    %esp,%ebp
     f63:	57                   	push   %edi
     f64:	56                   	push   %esi
     f65:	53                   	push   %ebx
     f66:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f69:	8d 4b f8             	lea    -0x8(%ebx),%ecx
     f6c:	a1 a4 12 00 00       	mov    0x12a4,%eax
     f71:	8d 76 00             	lea    0x0(%esi),%esi
     f74:	89 c2                	mov    %eax,%edx
     f76:	8b 00                	mov    (%eax),%eax
     f78:	39 ca                	cmp    %ecx,%edx
     f7a:	73 2c                	jae    fa8 <free+0x48>
     f7c:	39 c1                	cmp    %eax,%ecx
     f7e:	72 04                	jb     f84 <free+0x24>
     f80:	39 c2                	cmp    %eax,%edx
     f82:	72 f0                	jb     f74 <free+0x14>
     f84:	8b 73 fc             	mov    -0x4(%ebx),%esi
     f87:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     f8a:	39 f8                	cmp    %edi,%eax
     f8c:	74 2c                	je     fba <free+0x5a>
     f8e:	89 43 f8             	mov    %eax,-0x8(%ebx)
     f91:	8b 42 04             	mov    0x4(%edx),%eax
     f94:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     f97:	39 f1                	cmp    %esi,%ecx
     f99:	74 36                	je     fd1 <free+0x71>
     f9b:	89 0a                	mov    %ecx,(%edx)
     f9d:	89 15 a4 12 00 00    	mov    %edx,0x12a4
     fa3:	5b                   	pop    %ebx
     fa4:	5e                   	pop    %esi
     fa5:	5f                   	pop    %edi
     fa6:	5d                   	pop    %ebp
     fa7:	c3                   	ret    
     fa8:	39 c2                	cmp    %eax,%edx
     faa:	72 c8                	jb     f74 <free+0x14>
     fac:	39 c1                	cmp    %eax,%ecx
     fae:	73 c4                	jae    f74 <free+0x14>
     fb0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     fb3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     fb6:	39 f8                	cmp    %edi,%eax
     fb8:	75 d4                	jne    f8e <free+0x2e>
     fba:	03 70 04             	add    0x4(%eax),%esi
     fbd:	89 73 fc             	mov    %esi,-0x4(%ebx)
     fc0:	8b 02                	mov    (%edx),%eax
     fc2:	8b 00                	mov    (%eax),%eax
     fc4:	89 43 f8             	mov    %eax,-0x8(%ebx)
     fc7:	8b 42 04             	mov    0x4(%edx),%eax
     fca:	8d 34 c2             	lea    (%edx,%eax,8),%esi
     fcd:	39 f1                	cmp    %esi,%ecx
     fcf:	75 ca                	jne    f9b <free+0x3b>
     fd1:	03 43 fc             	add    -0x4(%ebx),%eax
     fd4:	89 42 04             	mov    %eax,0x4(%edx)
     fd7:	8b 4b f8             	mov    -0x8(%ebx),%ecx
     fda:	89 0a                	mov    %ecx,(%edx)
     fdc:	89 15 a4 12 00 00    	mov    %edx,0x12a4
     fe2:	5b                   	pop    %ebx
     fe3:	5e                   	pop    %esi
     fe4:	5f                   	pop    %edi
     fe5:	5d                   	pop    %ebp
     fe6:	c3                   	ret    
     fe7:	90                   	nop

00000fe8 <malloc>:
     fe8:	55                   	push   %ebp
     fe9:	89 e5                	mov    %esp,%ebp
     feb:	57                   	push   %edi
     fec:	56                   	push   %esi
     fed:	53                   	push   %ebx
     fee:	83 ec 0c             	sub    $0xc,%esp
     ff1:	8b 45 08             	mov    0x8(%ebp),%eax
     ff4:	8d 78 07             	lea    0x7(%eax),%edi
     ff7:	c1 ef 03             	shr    $0x3,%edi
     ffa:	47                   	inc    %edi
     ffb:	8b 15 a4 12 00 00    	mov    0x12a4,%edx
    1001:	85 d2                	test   %edx,%edx
    1003:	0f 84 93 00 00 00    	je     109c <malloc+0xb4>
    1009:	8b 02                	mov    (%edx),%eax
    100b:	8b 48 04             	mov    0x4(%eax),%ecx
    100e:	39 f9                	cmp    %edi,%ecx
    1010:	73 62                	jae    1074 <malloc+0x8c>
    1012:	89 fb                	mov    %edi,%ebx
    1014:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    101a:	72 78                	jb     1094 <malloc+0xac>
    101c:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    1023:	eb 0e                	jmp    1033 <malloc+0x4b>
    1025:	8d 76 00             	lea    0x0(%esi),%esi
    1028:	89 c2                	mov    %eax,%edx
    102a:	8b 02                	mov    (%edx),%eax
    102c:	8b 48 04             	mov    0x4(%eax),%ecx
    102f:	39 f9                	cmp    %edi,%ecx
    1031:	73 41                	jae    1074 <malloc+0x8c>
    1033:	39 05 a4 12 00 00    	cmp    %eax,0x12a4
    1039:	75 ed                	jne    1028 <malloc+0x40>
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	56                   	push   %esi
    103f:	e8 f7 fc ff ff       	call   d3b <sbrk>
    1044:	83 c4 10             	add    $0x10,%esp
    1047:	83 f8 ff             	cmp    $0xffffffff,%eax
    104a:	74 1c                	je     1068 <malloc+0x80>
    104c:	89 58 04             	mov    %ebx,0x4(%eax)
    104f:	83 ec 0c             	sub    $0xc,%esp
    1052:	83 c0 08             	add    $0x8,%eax
    1055:	50                   	push   %eax
    1056:	e8 05 ff ff ff       	call   f60 <free>
    105b:	8b 15 a4 12 00 00    	mov    0x12a4,%edx
    1061:	83 c4 10             	add    $0x10,%esp
    1064:	85 d2                	test   %edx,%edx
    1066:	75 c2                	jne    102a <malloc+0x42>
    1068:	31 c0                	xor    %eax,%eax
    106a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    106d:	5b                   	pop    %ebx
    106e:	5e                   	pop    %esi
    106f:	5f                   	pop    %edi
    1070:	5d                   	pop    %ebp
    1071:	c3                   	ret    
    1072:	66 90                	xchg   %ax,%ax
    1074:	39 cf                	cmp    %ecx,%edi
    1076:	74 4c                	je     10c4 <malloc+0xdc>
    1078:	29 f9                	sub    %edi,%ecx
    107a:	89 48 04             	mov    %ecx,0x4(%eax)
    107d:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    1080:	89 78 04             	mov    %edi,0x4(%eax)
    1083:	89 15 a4 12 00 00    	mov    %edx,0x12a4
    1089:	83 c0 08             	add    $0x8,%eax
    108c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    108f:	5b                   	pop    %ebx
    1090:	5e                   	pop    %esi
    1091:	5f                   	pop    %edi
    1092:	5d                   	pop    %ebp
    1093:	c3                   	ret    
    1094:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1099:	eb 81                	jmp    101c <malloc+0x34>
    109b:	90                   	nop
    109c:	c7 05 a4 12 00 00 a8 	movl   $0x12a8,0x12a4
    10a3:	12 00 00 
    10a6:	c7 05 a8 12 00 00 a8 	movl   $0x12a8,0x12a8
    10ad:	12 00 00 
    10b0:	c7 05 ac 12 00 00 00 	movl   $0x0,0x12ac
    10b7:	00 00 00 
    10ba:	b8 a8 12 00 00       	mov    $0x12a8,%eax
    10bf:	e9 4e ff ff ff       	jmp    1012 <malloc+0x2a>
    10c4:	8b 08                	mov    (%eax),%ecx
    10c6:	89 0a                	mov    %ecx,(%edx)
    10c8:	eb b9                	jmp    1083 <malloc+0x9b>
