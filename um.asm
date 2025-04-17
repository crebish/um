
um:     file format elf64-x86-64


Disassembly of section .init:

0000000000400970 <_init>:
  400970:	f3 0f 1e fa          	endbr64 
  400974:	48 83 ec 08          	sub    $0x8,%rsp
  400978:	48 8b 05 69 26 20 00 	mov    0x202669(%rip),%rax        # 602fe8 <__gmon_start__@Base>
  40097f:	48 85 c0             	test   %rax,%rax
  400982:	74 02                	je     400986 <_init+0x16>
  400984:	ff d0                	callq  *%rax
  400986:	48 83 c4 08          	add    $0x8,%rsp
  40098a:	c3                   	retq   

Disassembly of section .plt:

0000000000400990 <.plt>:
  400990:	ff 35 72 26 20 00    	pushq  0x202672(%rip)        # 603008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400996:	ff 25 74 26 20 00    	jmpq   *0x202674(%rip)        # 603010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40099c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004009a0 <free@plt>:
  4009a0:	ff 25 72 26 20 00    	jmpq   *0x202672(%rip)        # 603018 <free@GLIBC_2.2.5>
  4009a6:	68 00 00 00 00       	pushq  $0x0
  4009ab:	e9 e0 ff ff ff       	jmpq   400990 <.plt>

00000000004009b0 <abort@plt>:
  4009b0:	ff 25 6a 26 20 00    	jmpq   *0x20266a(%rip)        # 603020 <abort@GLIBC_2.2.5>
  4009b6:	68 01 00 00 00       	pushq  $0x1
  4009bb:	e9 d0 ff ff ff       	jmpq   400990 <.plt>

00000000004009c0 <fclose@plt>:
  4009c0:	ff 25 62 26 20 00    	jmpq   *0x202662(%rip)        # 603028 <fclose@GLIBC_2.2.5>
  4009c6:	68 02 00 00 00       	pushq  $0x2
  4009cb:	e9 c0 ff ff ff       	jmpq   400990 <.plt>

00000000004009d0 <memset@plt>:
  4009d0:	ff 25 5a 26 20 00    	jmpq   *0x20265a(%rip)        # 603030 <memset@GLIBC_2.2.5>
  4009d6:	68 03 00 00 00       	pushq  $0x3
  4009db:	e9 b0 ff ff ff       	jmpq   400990 <.plt>

00000000004009e0 <fgetc@plt>:
  4009e0:	ff 25 52 26 20 00    	jmpq   *0x202652(%rip)        # 603038 <fgetc@GLIBC_2.2.5>
  4009e6:	68 04 00 00 00       	pushq  $0x4
  4009eb:	e9 a0 ff ff ff       	jmpq   400990 <.plt>

00000000004009f0 <calloc@plt>:
  4009f0:	ff 25 4a 26 20 00    	jmpq   *0x20264a(%rip)        # 603040 <calloc@GLIBC_2.2.5>
  4009f6:	68 05 00 00 00       	pushq  $0x5
  4009fb:	e9 90 ff ff ff       	jmpq   400990 <.plt>

0000000000400a00 <putc@plt>:
  400a00:	ff 25 42 26 20 00    	jmpq   *0x202642(%rip)        # 603048 <putc@GLIBC_2.2.5>
  400a06:	68 06 00 00 00       	pushq  $0x6
  400a0b:	e9 80 ff ff ff       	jmpq   400990 <.plt>

0000000000400a10 <fprintf@plt>:
  400a10:	ff 25 3a 26 20 00    	jmpq   *0x20263a(%rip)        # 603050 <fprintf@GLIBC_2.2.5>
  400a16:	68 07 00 00 00       	pushq  $0x7
  400a1b:	e9 70 ff ff ff       	jmpq   400990 <.plt>

0000000000400a20 <memcpy@plt>:
  400a20:	ff 25 32 26 20 00    	jmpq   *0x202632(%rip)        # 603058 <memcpy@GLIBC_2.14>
  400a26:	68 08 00 00 00       	pushq  $0x8
  400a2b:	e9 60 ff ff ff       	jmpq   400990 <.plt>

0000000000400a30 <malloc@plt>:
  400a30:	ff 25 2a 26 20 00    	jmpq   *0x20262a(%rip)        # 603060 <malloc@GLIBC_2.2.5>
  400a36:	68 09 00 00 00       	pushq  $0x9
  400a3b:	e9 50 ff ff ff       	jmpq   400990 <.plt>

0000000000400a40 <fflush@plt>:
  400a40:	ff 25 22 26 20 00    	jmpq   *0x202622(%rip)        # 603068 <fflush@GLIBC_2.2.5>
  400a46:	68 0a 00 00 00       	pushq  $0xa
  400a4b:	e9 40 ff ff ff       	jmpq   400990 <.plt>

0000000000400a50 <realloc@plt>:
  400a50:	ff 25 1a 26 20 00    	jmpq   *0x20261a(%rip)        # 603070 <realloc@GLIBC_2.2.5>
  400a56:	68 0b 00 00 00       	pushq  $0xb
  400a5b:	e9 30 ff ff ff       	jmpq   400990 <.plt>

0000000000400a60 <longjmp@plt>:
  400a60:	ff 25 12 26 20 00    	jmpq   *0x202612(%rip)        # 603078 <longjmp@GLIBC_2.2.5>
  400a66:	68 0c 00 00 00       	pushq  $0xc
  400a6b:	e9 20 ff ff ff       	jmpq   400990 <.plt>

0000000000400a70 <fopen@plt>:
  400a70:	ff 25 0a 26 20 00    	jmpq   *0x20260a(%rip)        # 603080 <fopen@GLIBC_2.2.5>
  400a76:	68 0d 00 00 00       	pushq  $0xd
  400a7b:	e9 10 ff ff ff       	jmpq   400990 <.plt>

0000000000400a80 <exit@plt>:
  400a80:	ff 25 02 26 20 00    	jmpq   *0x202602(%rip)        # 603088 <exit@GLIBC_2.2.5>
  400a86:	68 0e 00 00 00       	pushq  $0xe
  400a8b:	e9 00 ff ff ff       	jmpq   400990 <.plt>

0000000000400a90 <fwrite@plt>:
  400a90:	ff 25 fa 25 20 00    	jmpq   *0x2025fa(%rip)        # 603090 <fwrite@GLIBC_2.2.5>
  400a96:	68 0f 00 00 00       	pushq  $0xf
  400a9b:	e9 f0 fe ff ff       	jmpq   400990 <.plt>

0000000000400aa0 <getc@plt>:
  400aa0:	ff 25 f2 25 20 00    	jmpq   *0x2025f2(%rip)        # 603098 <getc@GLIBC_2.2.5>
  400aa6:	68 10 00 00 00       	pushq  $0x10
  400aab:	e9 e0 fe ff ff       	jmpq   400990 <.plt>

Disassembly of section .text:

0000000000400ab0 <main>:
  400ab0:	55                   	push   %rbp
  400ab1:	48 83 ec 10          	sub    $0x10,%rsp
  400ab5:	83 ff 02             	cmp    $0x2,%edi
  400ab8:	74 26                	je     400ae0 <main+0x30>
  400aba:	ba 17 00 00 00       	mov    $0x17,%edx
  400abf:	be 01 00 00 00       	mov    $0x1,%esi
  400ac4:	bf f0 22 40 00       	mov    $0x4022f0,%edi
  400ac9:	48 8b 0d 10 26 20 00 	mov    0x202610(%rip),%rcx        # 6030e0 <stderr@@GLIBC_2.2.5>
  400ad0:	e8 bb ff ff ff       	callq  400a90 <fwrite@plt>
  400ad5:	b8 01 00 00 00       	mov    $0x1,%eax
  400ada:	48 83 c4 10          	add    $0x10,%rsp
  400ade:	5d                   	pop    %rbp
  400adf:	c3                   	retq   
  400ae0:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400ae4:	be 08 23 40 00       	mov    $0x402308,%esi
  400ae9:	e8 82 ff ff ff       	callq  400a70 <fopen@plt>
  400aee:	48 89 c5             	mov    %rax,%rbp
  400af1:	48 85 c0             	test   %rax,%rax
  400af4:	74 3e                	je     400b34 <main+0x84>
  400af6:	48 89 ef             	mov    %rbp,%rdi
  400af9:	e8 f2 03 00 00       	callq  400ef0 <initialize_data>
  400afe:	48 89 ef             	mov    %rbp,%rdi
  400b01:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  400b06:	e8 b5 fe ff ff       	callq  4009c0 <fclose@plt>
  400b0b:	ba 00 31 60 00       	mov    $0x603100,%edx
  400b10:	31 c0                	xor    %eax,%eax
  400b12:	b9 08 00 00 00       	mov    $0x8,%ecx
  400b17:	48 89 d7             	mov    %rdx,%rdi
  400b1a:	f3 ab                	rep stos %eax,%es:(%rdi)
  400b1c:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  400b21:	e8 1a 01 00 00       	callq  400c40 <run_um>
  400b26:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  400b2b:	e8 30 08 00 00       	callq  401360 <data_free>
  400b30:	31 c0                	xor    %eax,%eax
  400b32:	eb a6                	jmp    400ada <main+0x2a>
  400b34:	ba 39 00 00 00       	mov    $0x39,%edx
  400b39:	be 0b 23 40 00       	mov    $0x40230b,%esi
  400b3e:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  400b43:	e8 b8 08 00 00       	callq  401400 <Except_raise>
  400b48:	eb ac                	jmp    400af6 <main+0x46>

0000000000400b4a <.annobin_elf_init.c.hot>:
  400b4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400b50 <_start>:
  400b50:	f3 0f 1e fa          	endbr64 
  400b54:	31 ed                	xor    %ebp,%ebp
  400b56:	49 89 d1             	mov    %rdx,%r9
  400b59:	5e                   	pop    %rsi
  400b5a:	48 89 e2             	mov    %rsp,%rdx
  400b5d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400b61:	50                   	push   %rax
  400b62:	54                   	push   %rsp
  400b63:	49 c7 c0 60 22 40 00 	mov    $0x402260,%r8
  400b6a:	48 c7 c1 f0 21 40 00 	mov    $0x4021f0,%rcx
  400b71:	48 c7 c7 b0 0a 40 00 	mov    $0x400ab0,%rdi
  400b78:	ff 15 62 24 20 00    	callq  *0x202462(%rip)        # 602fe0 <__libc_start_main@GLIBC_2.2.5>
  400b7e:	f4                   	hlt    

0000000000400b7f <.annobin_init.c>:
  400b7f:	90                   	nop

0000000000400b80 <_dl_relocate_static_pie>:
  400b80:	f3 0f 1e fa          	endbr64 
  400b84:	c3                   	retq   

0000000000400b85 <.annobin__dl_relocate_static_pie.end>:
  400b85:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b8c:	00 00 00 
  400b8f:	90                   	nop

0000000000400b90 <deregister_tm_clones>:
  400b90:	48 8d 3d 19 25 20 00 	lea    0x202519(%rip),%rdi        # 6030b0 <__TMC_END__>
  400b97:	48 8d 05 12 25 20 00 	lea    0x202512(%rip),%rax        # 6030b0 <__TMC_END__>
  400b9e:	48 39 f8             	cmp    %rdi,%rax
  400ba1:	74 15                	je     400bb8 <deregister_tm_clones+0x28>
  400ba3:	48 8b 05 2e 24 20 00 	mov    0x20242e(%rip),%rax        # 602fd8 <_ITM_deregisterTMCloneTable@Base>
  400baa:	48 85 c0             	test   %rax,%rax
  400bad:	74 09                	je     400bb8 <deregister_tm_clones+0x28>
  400baf:	ff e0                	jmpq   *%rax
  400bb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400bb8:	c3                   	retq   
  400bb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400bc0 <register_tm_clones>:
  400bc0:	48 8d 3d e9 24 20 00 	lea    0x2024e9(%rip),%rdi        # 6030b0 <__TMC_END__>
  400bc7:	48 8d 35 e2 24 20 00 	lea    0x2024e2(%rip),%rsi        # 6030b0 <__TMC_END__>
  400bce:	48 29 fe             	sub    %rdi,%rsi
  400bd1:	48 89 f0             	mov    %rsi,%rax
  400bd4:	48 c1 ee 3f          	shr    $0x3f,%rsi
  400bd8:	48 c1 f8 03          	sar    $0x3,%rax
  400bdc:	48 01 c6             	add    %rax,%rsi
  400bdf:	48 d1 fe             	sar    %rsi
  400be2:	74 14                	je     400bf8 <register_tm_clones+0x38>
  400be4:	48 8b 05 05 24 20 00 	mov    0x202405(%rip),%rax        # 602ff0 <_ITM_registerTMCloneTable@Base>
  400beb:	48 85 c0             	test   %rax,%rax
  400bee:	74 08                	je     400bf8 <register_tm_clones+0x38>
  400bf0:	ff e0                	jmpq   *%rax
  400bf2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400bf8:	c3                   	retq   
  400bf9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400c00 <__do_global_dtors_aux>:
  400c00:	f3 0f 1e fa          	endbr64 
  400c04:	80 3d dd 24 20 00 00 	cmpb   $0x0,0x2024dd(%rip)        # 6030e8 <completed.0>
  400c0b:	75 13                	jne    400c20 <__do_global_dtors_aux+0x20>
  400c0d:	55                   	push   %rbp
  400c0e:	48 89 e5             	mov    %rsp,%rbp
  400c11:	e8 7a ff ff ff       	callq  400b90 <deregister_tm_clones>
  400c16:	c6 05 cb 24 20 00 01 	movb   $0x1,0x2024cb(%rip)        # 6030e8 <completed.0>
  400c1d:	5d                   	pop    %rbp
  400c1e:	c3                   	retq   
  400c1f:	90                   	nop
  400c20:	c3                   	retq   
  400c21:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  400c28:	00 00 00 00 
  400c2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c30 <frame_dummy>:
  400c30:	f3 0f 1e fa          	endbr64 
  400c34:	eb 8a                	jmp    400bc0 <register_tm_clones>
  400c36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400c3d:	00 00 00 

0000000000400c40 <run_um>:
  400c40:	55                   	push   %rbp
  400c41:	48 89 fd             	mov    %rdi,%rbp
  400c44:	53                   	push   %rbx
  400c45:	48 83 ec 08          	sub    $0x8,%rsp
  400c49:	e8 72 04 00 00       	callq  4010c0 <extract_word>
  400c4e:	89 c3                	mov    %eax,%ebx
  400c50:	c1 e8 1c             	shr    $0x1c,%eax
  400c53:	83 f8 07             	cmp    $0x7,%eax
  400c56:	74 42                	je     400c9a <run_um+0x5a>
  400c58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400c5f:	00 
  400c60:	83 f8 0d             	cmp    $0xd,%eax
  400c63:	77 23                	ja     400c88 <run_um+0x48>
  400c65:	ff 24 c5 80 22 40 00 	jmpq   *0x402280(,%rax,8)
  400c6c:	0f 1f 40 00          	nopl   0x0(%rax)
  400c70:	89 d8                	mov    %ebx,%eax
  400c72:	81 e3 ff ff ff 01    	and    $0x1ffffff,%ebx
  400c78:	c1 e8 19             	shr    $0x19,%eax
  400c7b:	83 e0 07             	and    $0x7,%eax
  400c7e:	89 1c 85 00 31 60 00 	mov    %ebx,0x603100(,%rax,4)
  400c85:	0f 1f 00             	nopl   (%rax)
  400c88:	48 89 ef             	mov    %rbp,%rdi
  400c8b:	e8 30 04 00 00       	callq  4010c0 <extract_word>
  400c90:	89 c3                	mov    %eax,%ebx
  400c92:	c1 e8 1c             	shr    $0x1c,%eax
  400c95:	83 f8 07             	cmp    $0x7,%eax
  400c98:	75 c6                	jne    400c60 <run_um+0x20>
  400c9a:	48 83 c4 08          	add    $0x8,%rsp
  400c9e:	5b                   	pop    %rbx
  400c9f:	5d                   	pop    %rbp
  400ca0:	c3                   	retq   
  400ca1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400ca8:	89 d8                	mov    %ebx,%eax
  400caa:	c1 eb 03             	shr    $0x3,%ebx
  400cad:	48 89 ef             	mov    %rbp,%rdi
  400cb0:	83 e0 07             	and    $0x7,%eax
  400cb3:	83 e3 07             	and    $0x7,%ebx
  400cb6:	8b 14 85 00 31 60 00 	mov    0x603100(,%rax,4),%edx
  400cbd:	8b 34 9d 00 31 60 00 	mov    0x603100(,%rbx,4),%esi
  400cc4:	e8 87 04 00 00       	callq  401150 <replace_segment_0>
  400cc9:	eb bd                	jmp    400c88 <run_um+0x48>
  400ccb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400cd0:	48 8b 3d f9 23 20 00 	mov    0x2023f9(%rip),%rdi        # 6030d0 <stdin@@GLIBC_2.2.5>
  400cd7:	e8 c4 fd ff ff       	callq  400aa0 <getc@plt>
  400cdc:	83 f8 ff             	cmp    $0xffffffff,%eax
  400cdf:	0f 84 f3 01 00 00    	je     400ed8 <run_um+0x298>
  400ce5:	3d ff 00 00 00       	cmp    $0xff,%eax
  400cea:	77 9c                	ja     400c88 <run_um+0x48>
  400cec:	83 e3 07             	and    $0x7,%ebx
  400cef:	89 04 9d 00 31 60 00 	mov    %eax,0x603100(,%rbx,4)
  400cf6:	eb 90                	jmp    400c88 <run_um+0x48>
  400cf8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400cff:	00 
  400d00:	83 e3 07             	and    $0x7,%ebx
  400d03:	48 8b 35 b6 23 20 00 	mov    0x2023b6(%rip),%rsi        # 6030c0 <stdout@@GLIBC_2.2.5>
  400d0a:	0f be 3c 9d 00 31 60 	movsbl 0x603100(,%rbx,4),%edi
  400d11:	00 
  400d12:	e8 e9 fc ff ff       	callq  400a00 <putc@plt>
  400d17:	e9 6c ff ff ff       	jmpq   400c88 <run_um+0x48>
  400d1c:	0f 1f 40 00          	nopl   0x0(%rax)
  400d20:	83 e3 07             	and    $0x7,%ebx
  400d23:	48 89 ef             	mov    %rbp,%rdi
  400d26:	8b 34 9d 00 31 60 00 	mov    0x603100(,%rbx,4),%esi
  400d2d:	e8 0e 04 00 00       	callq  401140 <set_segment_false>
  400d32:	e9 51 ff ff ff       	jmpq   400c88 <run_um+0x48>
  400d37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400d3e:	00 00 
  400d40:	89 d8                	mov    %ebx,%eax
  400d42:	48 89 ef             	mov    %rbp,%rdi
  400d45:	c1 eb 03             	shr    $0x3,%ebx
  400d48:	83 e0 07             	and    $0x7,%eax
  400d4b:	83 e3 07             	and    $0x7,%ebx
  400d4e:	8b 34 85 00 31 60 00 	mov    0x603100(,%rax,4),%esi
  400d55:	e8 a6 04 00 00       	callq  401200 <insert_segment>
  400d5a:	89 04 9d 00 31 60 00 	mov    %eax,0x603100(,%rbx,4)
  400d61:	e9 22 ff ff ff       	jmpq   400c88 <run_um+0x48>
  400d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400d6d:	00 00 00 
  400d70:	89 d8                	mov    %ebx,%eax
  400d72:	89 da                	mov    %ebx,%edx
  400d74:	83 e3 07             	and    $0x7,%ebx
  400d77:	c1 e8 03             	shr    $0x3,%eax
  400d7a:	c1 ea 06             	shr    $0x6,%edx
  400d7d:	83 e0 07             	and    $0x7,%eax
  400d80:	83 e2 07             	and    $0x7,%edx
  400d83:	8b 04 85 00 31 60 00 	mov    0x603100(,%rax,4),%eax
  400d8a:	23 04 9d 00 31 60 00 	and    0x603100(,%rbx,4),%eax
  400d91:	f7 d0                	not    %eax
  400d93:	89 04 95 00 31 60 00 	mov    %eax,0x603100(,%rdx,4)
  400d9a:	e9 e9 fe ff ff       	jmpq   400c88 <run_um+0x48>
  400d9f:	90                   	nop
  400da0:	89 d8                	mov    %ebx,%eax
  400da2:	89 d9                	mov    %ebx,%ecx
  400da4:	31 d2                	xor    %edx,%edx
  400da6:	83 e3 07             	and    $0x7,%ebx
  400da9:	c1 e8 03             	shr    $0x3,%eax
  400dac:	c1 e9 06             	shr    $0x6,%ecx
  400daf:	83 e0 07             	and    $0x7,%eax
  400db2:	83 e1 07             	and    $0x7,%ecx
  400db5:	8b 04 85 00 31 60 00 	mov    0x603100(,%rax,4),%eax
  400dbc:	f7 34 9d 00 31 60 00 	divl   0x603100(,%rbx,4)
  400dc3:	89 04 8d 00 31 60 00 	mov    %eax,0x603100(,%rcx,4)
  400dca:	e9 b9 fe ff ff       	jmpq   400c88 <run_um+0x48>
  400dcf:	90                   	nop
  400dd0:	89 da                	mov    %ebx,%edx
  400dd2:	89 d8                	mov    %ebx,%eax
  400dd4:	83 e3 07             	and    $0x7,%ebx
  400dd7:	c1 ea 03             	shr    $0x3,%edx
  400dda:	c1 e8 06             	shr    $0x6,%eax
  400ddd:	83 e2 07             	and    $0x7,%edx
  400de0:	83 e0 07             	and    $0x7,%eax
  400de3:	8b 14 95 00 31 60 00 	mov    0x603100(,%rdx,4),%edx
  400dea:	0f af 14 9d 00 31 60 	imul   0x603100(,%rbx,4),%edx
  400df1:	00 
  400df2:	89 14 85 00 31 60 00 	mov    %edx,0x603100(,%rax,4)
  400df9:	e9 8a fe ff ff       	jmpq   400c88 <run_um+0x48>
  400dfe:	66 90                	xchg   %ax,%ax
  400e00:	89 d8                	mov    %ebx,%eax
  400e02:	48 89 ef             	mov    %rbp,%rdi
  400e05:	83 e0 07             	and    $0x7,%eax
  400e08:	8b 14 85 00 31 60 00 	mov    0x603100(,%rax,4),%edx
  400e0f:	89 d8                	mov    %ebx,%eax
  400e11:	c1 eb 06             	shr    $0x6,%ebx
  400e14:	c1 e8 03             	shr    $0x3,%eax
  400e17:	83 e3 07             	and    $0x7,%ebx
  400e1a:	83 e0 07             	and    $0x7,%eax
  400e1d:	8b 34 85 00 31 60 00 	mov    0x603100(,%rax,4),%esi
  400e24:	e8 b7 02 00 00       	callq  4010e0 <get_word>
  400e29:	89 04 9d 00 31 60 00 	mov    %eax,0x603100(,%rbx,4)
  400e30:	e9 53 fe ff ff       	jmpq   400c88 <run_um+0x48>
  400e35:	0f 1f 00             	nopl   (%rax)
  400e38:	89 d8                	mov    %ebx,%eax
  400e3a:	83 e0 07             	and    $0x7,%eax
  400e3d:	8b 04 85 00 31 60 00 	mov    0x603100(,%rax,4),%eax
  400e44:	85 c0                	test   %eax,%eax
  400e46:	0f 84 3c fe ff ff    	je     400c88 <run_um+0x48>
  400e4c:	89 d8                	mov    %ebx,%eax
  400e4e:	c1 eb 06             	shr    $0x6,%ebx
  400e51:	c1 e8 03             	shr    $0x3,%eax
  400e54:	83 e3 07             	and    $0x7,%ebx
  400e57:	83 e0 07             	and    $0x7,%eax
  400e5a:	8b 04 85 00 31 60 00 	mov    0x603100(,%rax,4),%eax
  400e61:	89 04 9d 00 31 60 00 	mov    %eax,0x603100(,%rbx,4)
  400e68:	e9 1b fe ff ff       	jmpq   400c88 <run_um+0x48>
  400e6d:	0f 1f 00             	nopl   (%rax)
  400e70:	89 d9                	mov    %ebx,%ecx
  400e72:	89 d8                	mov    %ebx,%eax
  400e74:	83 e3 07             	and    $0x7,%ebx
  400e77:	c1 e9 03             	shr    $0x3,%ecx
  400e7a:	c1 e8 06             	shr    $0x6,%eax
  400e7d:	8b 14 9d 00 31 60 00 	mov    0x603100(,%rbx,4),%edx
  400e84:	83 e1 07             	and    $0x7,%ecx
  400e87:	83 e0 07             	and    $0x7,%eax
  400e8a:	03 14 8d 00 31 60 00 	add    0x603100(,%rcx,4),%edx
  400e91:	89 14 85 00 31 60 00 	mov    %edx,0x603100(,%rax,4)
  400e98:	e9 eb fd ff ff       	jmpq   400c88 <run_um+0x48>
  400e9d:	0f 1f 00             	nopl   (%rax)
  400ea0:	89 d8                	mov    %ebx,%eax
  400ea2:	48 89 ef             	mov    %rbp,%rdi
  400ea5:	83 e0 07             	and    $0x7,%eax
  400ea8:	8b 0c 85 00 31 60 00 	mov    0x603100(,%rax,4),%ecx
  400eaf:	89 d8                	mov    %ebx,%eax
  400eb1:	c1 eb 06             	shr    $0x6,%ebx
  400eb4:	c1 e8 03             	shr    $0x3,%eax
  400eb7:	83 e3 07             	and    $0x7,%ebx
  400eba:	83 e0 07             	and    $0x7,%eax
  400ebd:	8b 34 9d 00 31 60 00 	mov    0x603100(,%rbx,4),%esi
  400ec4:	8b 14 85 00 31 60 00 	mov    0x603100(,%rax,4),%edx
  400ecb:	e8 30 02 00 00       	callq  401100 <set_word>
  400ed0:	e9 b3 fd ff ff       	jmpq   400c88 <run_um+0x48>
  400ed5:	0f 1f 00             	nopl   (%rax)
  400ed8:	83 e3 07             	and    $0x7,%ebx
  400edb:	c7 04 9d 00 31 60 00 	movl   $0xffffffff,0x603100(,%rbx,4)
  400ee2:	ff ff ff ff 
  400ee6:	e9 9d fd ff ff       	jmpq   400c88 <run_um+0x48>
  400eeb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400ef0 <initialize_data>:
  400ef0:	41 57                	push   %r15
  400ef2:	41 56                	push   %r14
  400ef4:	41 55                	push   %r13
  400ef6:	41 54                	push   %r12
  400ef8:	55                   	push   %rbp
  400ef9:	48 89 fd             	mov    %rdi,%rbp
  400efc:	bf 28 00 00 00       	mov    $0x28,%edi
  400f01:	53                   	push   %rbx
  400f02:	48 83 ec 18          	sub    $0x18,%rsp
  400f06:	e8 25 fb ff ff       	callq  400a30 <malloc@plt>
  400f0b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  400f10:	48 85 c0             	test   %rax,%rax
  400f13:	0f 84 81 01 00 00    	je     40109a <initialize_data+0x1aa>
  400f19:	bf 50 00 00 00       	mov    $0x50,%edi
  400f1e:	e8 0d fb ff ff       	callq  400a30 <malloc@plt>
  400f23:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  400f28:	48 89 02             	mov    %rax,(%rdx)
  400f2b:	48 85 c0             	test   %rax,%rax
  400f2e:	0f 84 4d 01 00 00    	je     401081 <initialize_data+0x191>
  400f34:	31 ff                	xor    %edi,%edi
  400f36:	e8 65 06 00 00       	callq  4015a0 <Seq_new>
  400f3b:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  400f40:	bf 28 00 00 00       	mov    $0x28,%edi
  400f45:	48 89 43 08          	mov    %rax,0x8(%rbx)
  400f49:	e8 e2 fa ff ff       	callq  400a30 <malloc@plt>
  400f4e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  400f52:	48 85 c0             	test   %rax,%rax
  400f55:	0f 84 0d 01 00 00    	je     401068 <initialize_data+0x178>
  400f5b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  400f60:	bf 90 01 00 00       	mov    $0x190,%edi
  400f65:	48 ba 00 00 00 00 01 	movabs $0x100000000,%rdx
  400f6c:	00 00 00 
  400f6f:	48 89 50 18          	mov    %rdx,0x18(%rax)
  400f73:	c7 40 20 0a 00 00 00 	movl   $0xa,0x20(%rax)
  400f7a:	e8 b1 fa ff ff       	callq  400a30 <malloc@plt>
  400f7f:	49 89 c5             	mov    %rax,%r13
  400f82:	48 85 c0             	test   %rax,%rax
  400f85:	0f 84 c4 00 00 00    	je     40104f <initialize_data+0x15f>
  400f8b:	48 89 ef             	mov    %rbp,%rdi
  400f8e:	45 31 e4             	xor    %r12d,%r12d
  400f91:	31 db                	xor    %ebx,%ebx
  400f93:	41 be 64 00 00 00    	mov    $0x64,%r14d
  400f99:	e8 42 fa ff ff       	callq  4009e0 <fgetc@plt>
  400f9e:	83 f8 ff             	cmp    $0xffffffff,%eax
  400fa1:	74 6d                	je     401010 <initialize_data+0x120>
  400fa3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400fa8:	41 bf 03 00 00 00    	mov    $0x3,%r15d
  400fae:	c1 e3 08             	shl    $0x8,%ebx
  400fb1:	48 89 ef             	mov    %rbp,%rdi
  400fb4:	09 c3                	or     %eax,%ebx
  400fb6:	e8 25 fa ff ff       	callq  4009e0 <fgetc@plt>
  400fbb:	41 83 ef 01          	sub    $0x1,%r15d
  400fbf:	74 2f                	je     400ff0 <initialize_data+0x100>
  400fc1:	83 f8 ff             	cmp    $0xffffffff,%eax
  400fc4:	75 e8                	jne    400fae <initialize_data+0xbe>
  400fc6:	bf 1a 23 40 00       	mov    $0x40231a,%edi
  400fcb:	ba 10 00 00 00       	mov    $0x10,%edx
  400fd0:	be 01 00 00 00       	mov    $0x1,%esi
  400fd5:	48 8b 0d 04 21 20 00 	mov    0x202104(%rip),%rcx        # 6030e0 <stderr@@GLIBC_2.2.5>
  400fdc:	e8 af fa ff ff       	callq  400a90 <fwrite@plt>
  400fe1:	bf 01 00 00 00       	mov    $0x1,%edi
  400fe6:	e8 95 fa ff ff       	callq  400a80 <exit@plt>
  400feb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400ff0:	c1 e3 08             	shl    $0x8,%ebx
  400ff3:	09 c3                	or     %eax,%ebx
  400ff5:	45 39 e6             	cmp    %r12d,%r14d
  400ff8:	7e 3e                	jle    401038 <initialize_data+0x148>
  400ffa:	43 89 5c a5 00       	mov    %ebx,0x0(%r13,%r12,4)
  400fff:	48 89 ef             	mov    %rbp,%rdi
  401002:	49 83 c4 01          	add    $0x1,%r12
  401006:	e8 d5 f9 ff ff       	callq  4009e0 <fgetc@plt>
  40100b:	83 f8 ff             	cmp    $0xffffffff,%eax
  40100e:	75 98                	jne    400fa8 <initialize_data+0xb8>
  401010:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401015:	48 8b 01             	mov    (%rcx),%rax
  401018:	4c 89 28             	mov    %r13,(%rax)
  40101b:	48 8b 41 10          	mov    0x10(%rcx),%rax
  40101f:	44 89 20             	mov    %r12d,(%rax)
  401022:	48 83 c4 18          	add    $0x18,%rsp
  401026:	48 89 c8             	mov    %rcx,%rax
  401029:	5b                   	pop    %rbx
  40102a:	5d                   	pop    %rbp
  40102b:	41 5c                	pop    %r12
  40102d:	41 5d                	pop    %r13
  40102f:	41 5e                	pop    %r14
  401031:	41 5f                	pop    %r15
  401033:	c3                   	retq   
  401034:	0f 1f 40 00          	nopl   0x0(%rax)
  401038:	45 01 f6             	add    %r14d,%r14d
  40103b:	4c 89 ef             	mov    %r13,%rdi
  40103e:	49 63 f6             	movslq %r14d,%rsi
  401041:	48 c1 e6 02          	shl    $0x2,%rsi
  401045:	e8 06 fa ff ff       	callq  400a50 <realloc@plt>
  40104a:	49 89 c5             	mov    %rax,%r13
  40104d:	eb ab                	jmp    400ffa <initialize_data+0x10a>
  40104f:	ba 3e 00 00 00       	mov    $0x3e,%edx
  401054:	be 10 23 40 00       	mov    $0x402310,%esi
  401059:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  40105e:	e8 9d 03 00 00       	callq  401400 <Except_raise>
  401063:	e9 23 ff ff ff       	jmpq   400f8b <initialize_data+0x9b>
  401068:	ba 82 00 00 00       	mov    $0x82,%edx
  40106d:	be 10 23 40 00       	mov    $0x402310,%esi
  401072:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  401077:	e8 84 03 00 00       	callq  401400 <Except_raise>
  40107c:	e9 da fe ff ff       	jmpq   400f5b <initialize_data+0x6b>
  401081:	ba 7c 00 00 00       	mov    $0x7c,%edx
  401086:	be 10 23 40 00       	mov    $0x402310,%esi
  40108b:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  401090:	e8 6b 03 00 00       	callq  401400 <Except_raise>
  401095:	e9 9a fe ff ff       	jmpq   400f34 <initialize_data+0x44>
  40109a:	ba 79 00 00 00       	mov    $0x79,%edx
  40109f:	be 10 23 40 00       	mov    $0x402310,%esi
  4010a4:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  4010a9:	e8 52 03 00 00       	callq  401400 <Except_raise>
  4010ae:	e9 66 fe ff ff       	jmpq   400f19 <initialize_data+0x29>
  4010b3:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010ba:	00 00 00 00 
  4010be:	66 90                	xchg   %ax,%ax

00000000004010c0 <extract_word>:
  4010c0:	8b 47 18             	mov    0x18(%rdi),%eax
  4010c3:	48 8b 17             	mov    (%rdi),%rdx
  4010c6:	83 c0 01             	add    $0x1,%eax
  4010c9:	48 8b 12             	mov    (%rdx),%rdx
  4010cc:	89 47 18             	mov    %eax,0x18(%rdi)
  4010cf:	48 98                	cltq   
  4010d1:	8b 44 82 fc          	mov    -0x4(%rdx,%rax,4),%eax
  4010d5:	c3                   	retq   
  4010d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4010dd:	00 00 00 

00000000004010e0 <get_word>:
  4010e0:	48 8b 07             	mov    (%rdi),%rax
  4010e3:	48 63 f6             	movslq %esi,%rsi
  4010e6:	48 63 d2             	movslq %edx,%rdx
  4010e9:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
  4010ed:	8b 04 90             	mov    (%rax,%rdx,4),%eax
  4010f0:	c3                   	retq   
  4010f1:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  4010f8:	00 00 00 00 
  4010fc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401100 <set_word>:
  401100:	48 8b 07             	mov    (%rdi),%rax
  401103:	48 63 f6             	movslq %esi,%rsi
  401106:	48 63 d2             	movslq %edx,%rdx
  401109:	48 8b 04 f0          	mov    (%rax,%rsi,8),%rax
  40110d:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
  401110:	c3                   	retq   
  401111:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401118:	00 00 00 00 
  40111c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401120 <get_register>:
  401120:	b8 01 00 00 00       	mov    $0x1,%eax
  401125:	c3                   	retq   
  401126:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40112d:	00 00 00 

0000000000401130 <set_register>:
  401130:	c3                   	retq   
  401131:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  401138:	00 00 00 00 
  40113c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401140 <set_segment_false>:
  401140:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401144:	48 63 f6             	movslq %esi,%rsi
  401147:	e9 a4 07 00 00       	jmpq   4018f0 <Seq_addhi>
  40114c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401150 <replace_segment_0>:
  401150:	41 55                	push   %r13
  401152:	41 54                	push   %r12
  401154:	55                   	push   %rbp
  401155:	48 63 ee             	movslq %esi,%rbp
  401158:	53                   	push   %rbx
  401159:	48 83 ec 18          	sub    $0x18,%rsp
  40115d:	89 57 18             	mov    %edx,0x18(%rdi)
  401160:	85 ed                	test   %ebp,%ebp
  401162:	75 0c                	jne    401170 <replace_segment_0+0x20>
  401164:	48 83 c4 18          	add    $0x18,%rsp
  401168:	5b                   	pop    %rbx
  401169:	5d                   	pop    %rbp
  40116a:	41 5c                	pop    %r12
  40116c:	41 5d                	pop    %r13
  40116e:	c3                   	retq   
  40116f:	90                   	nop
  401170:	48 8b 07             	mov    (%rdi),%rax
  401173:	48 89 fb             	mov    %rdi,%rbx
  401176:	48 8b 38             	mov    (%rax),%rdi
  401179:	e8 22 f8 ff ff       	callq  4009a0 <free@plt>
  40117e:	48 8b 43 10          	mov    0x10(%rbx),%rax
  401182:	4c 8b 2b             	mov    (%rbx),%r13
  401185:	48 63 3c a8          	movslq (%rax,%rbp,4),%rdi
  401189:	4d 8b 64 ed 00       	mov    0x0(%r13,%rbp,8),%r12
  40118e:	48 89 fd             	mov    %rdi,%rbp
  401191:	48 c1 e7 02          	shl    $0x2,%rdi
  401195:	e8 96 f8 ff ff       	callq  400a30 <malloc@plt>
  40119a:	48 85 c0             	test   %rax,%rax
  40119d:	74 36                	je     4011d5 <replace_segment_0+0x85>
  40119f:	89 ee                	mov    %ebp,%esi
  4011a1:	31 d2                	xor    %edx,%edx
  4011a3:	85 ed                	test   %ebp,%ebp
  4011a5:	7e 19                	jle    4011c0 <replace_segment_0+0x70>
  4011a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4011ae:	00 00 
  4011b0:	41 8b 0c 94          	mov    (%r12,%rdx,4),%ecx
  4011b4:	89 0c 90             	mov    %ecx,(%rax,%rdx,4)
  4011b7:	48 83 c2 01          	add    $0x1,%rdx
  4011bb:	48 39 d6             	cmp    %rdx,%rsi
  4011be:	75 f0                	jne    4011b0 <replace_segment_0+0x60>
  4011c0:	49 89 45 00          	mov    %rax,0x0(%r13)
  4011c4:	48 8b 43 10          	mov    0x10(%rbx),%rax
  4011c8:	89 28                	mov    %ebp,(%rax)
  4011ca:	48 83 c4 18          	add    $0x18,%rsp
  4011ce:	5b                   	pop    %rbx
  4011cf:	5d                   	pop    %rbp
  4011d0:	41 5c                	pop    %r12
  4011d2:	41 5d                	pop    %r13
  4011d4:	c3                   	retq   
  4011d5:	ba 62 01 00 00       	mov    $0x162,%edx
  4011da:	be 10 23 40 00       	mov    $0x402310,%esi
  4011df:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  4011e4:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4011e9:	e8 12 02 00 00       	callq  401400 <Except_raise>
  4011ee:	4c 8b 2b             	mov    (%rbx),%r13
  4011f1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4011f6:	eb a7                	jmp    40119f <replace_segment_0+0x4f>
  4011f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4011ff:	00 

0000000000401200 <insert_segment>:
  401200:	41 57                	push   %r15
  401202:	41 56                	push   %r14
  401204:	41 55                	push   %r13
  401206:	41 54                	push   %r12
  401208:	4c 63 e6             	movslq %esi,%r12
  40120b:	55                   	push   %rbp
  40120c:	4e 8d 34 a5 00 00 00 	lea    0x0(,%r12,4),%r14
  401213:	00 
  401214:	4c 89 e5             	mov    %r12,%rbp
  401217:	53                   	push   %rbx
  401218:	48 89 fb             	mov    %rdi,%rbx
  40121b:	48 83 ec 08          	sub    $0x8,%rsp
  40121f:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401223:	e8 78 04 00 00       	callq  4016a0 <Seq_length>
  401228:	85 c0                	test   %eax,%eax
  40122a:	74 6c                	je     401298 <insert_segment+0x98>
  40122c:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  401230:	e8 2b 06 00 00       	callq  401860 <Seq_remlo>
  401235:	41 89 c7             	mov    %eax,%r15d
  401238:	49 89 c5             	mov    %rax,%r13
  40123b:	48 8b 03             	mov    (%rbx),%rax
  40123e:	4a 8b 3c f8          	mov    (%rax,%r15,8),%rdi
  401242:	e8 59 f7 ff ff       	callq  4009a0 <free@plt>
  401247:	4c 89 f7             	mov    %r14,%rdi
  40124a:	e8 e1 f7 ff ff       	callq  400a30 <malloc@plt>
  40124f:	49 89 c6             	mov    %rax,%r14
  401252:	48 85 c0             	test   %rax,%rax
  401255:	0f 84 e4 00 00 00    	je     40133f <insert_segment+0x13f>
  40125b:	85 ed                	test   %ebp,%ebp
  40125d:	7e 12                	jle    401271 <insert_segment+0x71>
  40125f:	4a 8d 14 a5 00 00 00 	lea    0x0(,%r12,4),%rdx
  401266:	00 
  401267:	31 f6                	xor    %esi,%esi
  401269:	4c 89 f7             	mov    %r14,%rdi
  40126c:	e8 5f f7 ff ff       	callq  4009d0 <memset@plt>
  401271:	48 8b 03             	mov    (%rbx),%rax
  401274:	4e 89 34 f8          	mov    %r14,(%rax,%r15,8)
  401278:	48 8b 43 10          	mov    0x10(%rbx),%rax
  40127c:	42 89 2c b8          	mov    %ebp,(%rax,%r15,4)
  401280:	48 83 c4 08          	add    $0x8,%rsp
  401284:	44 89 e8             	mov    %r13d,%eax
  401287:	5b                   	pop    %rbx
  401288:	5d                   	pop    %rbp
  401289:	41 5c                	pop    %r12
  40128b:	41 5d                	pop    %r13
  40128d:	41 5e                	pop    %r14
  40128f:	41 5f                	pop    %r15
  401291:	c3                   	retq   
  401292:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401298:	4c 89 f7             	mov    %r14,%rdi
  40129b:	e8 90 f7 ff ff       	callq  400a30 <malloc@plt>
  4012a0:	49 89 c5             	mov    %rax,%r13
  4012a3:	48 85 c0             	test   %rax,%rax
  4012a6:	74 7e                	je     401326 <insert_segment+0x126>
  4012a8:	85 ed                	test   %ebp,%ebp
  4012aa:	7e 12                	jle    4012be <insert_segment+0xbe>
  4012ac:	4a 8d 14 a5 00 00 00 	lea    0x0(,%r12,4),%rdx
  4012b3:	00 
  4012b4:	31 f6                	xor    %esi,%esi
  4012b6:	4c 89 ef             	mov    %r13,%rdi
  4012b9:	e8 12 f7 ff ff       	callq  4009d0 <memset@plt>
  4012be:	48 63 43 1c          	movslq 0x1c(%rbx),%rax
  4012c2:	8b 53 20             	mov    0x20(%rbx),%edx
  4012c5:	39 d0                	cmp    %edx,%eax
  4012c7:	7d 27                	jge    4012f0 <insert_segment+0xf0>
  4012c9:	48 8b 13             	mov    (%rbx),%rdx
  4012cc:	4c 89 2c c2          	mov    %r13,(%rdx,%rax,8)
  4012d0:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  4012d4:	89 2c 82             	mov    %ebp,(%rdx,%rax,4)
  4012d7:	8b 43 1c             	mov    0x1c(%rbx),%eax
  4012da:	8d 50 01             	lea    0x1(%rax),%edx
  4012dd:	89 53 1c             	mov    %edx,0x1c(%rbx)
  4012e0:	48 83 c4 08          	add    $0x8,%rsp
  4012e4:	5b                   	pop    %rbx
  4012e5:	5d                   	pop    %rbp
  4012e6:	41 5c                	pop    %r12
  4012e8:	41 5d                	pop    %r13
  4012ea:	41 5e                	pop    %r14
  4012ec:	41 5f                	pop    %r15
  4012ee:	c3                   	retq   
  4012ef:	90                   	nop
  4012f0:	01 d2                	add    %edx,%edx
  4012f2:	48 8b 3b             	mov    (%rbx),%rdi
  4012f5:	89 53 20             	mov    %edx,0x20(%rbx)
  4012f8:	48 63 d2             	movslq %edx,%rdx
  4012fb:	48 8d 34 d5 00 00 00 	lea    0x0(,%rdx,8),%rsi
  401302:	00 
  401303:	e8 48 f7 ff ff       	callq  400a50 <realloc@plt>
  401308:	48 63 73 20          	movslq 0x20(%rbx),%rsi
  40130c:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  401310:	48 89 03             	mov    %rax,(%rbx)
  401313:	48 c1 e6 02          	shl    $0x2,%rsi
  401317:	e8 34 f7 ff ff       	callq  400a50 <realloc@plt>
  40131c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401320:	48 63 43 1c          	movslq 0x1c(%rbx),%rax
  401324:	eb a3                	jmp    4012c9 <insert_segment+0xc9>
  401326:	ba 86 01 00 00       	mov    $0x186,%edx
  40132b:	be 10 23 40 00       	mov    $0x402310,%esi
  401330:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  401335:	e8 c6 00 00 00       	callq  401400 <Except_raise>
  40133a:	e9 69 ff ff ff       	jmpq   4012a8 <insert_segment+0xa8>
  40133f:	ba c2 01 00 00       	mov    $0x1c2,%edx
  401344:	be 10 23 40 00       	mov    $0x402310,%esi
  401349:	bf d8 2d 60 00       	mov    $0x602dd8,%edi
  40134e:	e8 ad 00 00 00       	callq  401400 <Except_raise>
  401353:	e9 03 ff ff ff       	jmpq   40125b <insert_segment+0x5b>
  401358:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40135f:	00 

0000000000401360 <data_free>:
  401360:	41 54                	push   %r12
  401362:	55                   	push   %rbp
  401363:	48 89 fd             	mov    %rdi,%rbp
  401366:	53                   	push   %rbx
  401367:	48 8b 07             	mov    (%rdi),%rax
  40136a:	8b 50 1c             	mov    0x1c(%rax),%edx
  40136d:	85 d2                	test   %edx,%edx
  40136f:	7e 28                	jle    401399 <data_free+0x39>
  401371:	44 8d 62 ff          	lea    -0x1(%rdx),%r12d
  401375:	31 db                	xor    %ebx,%ebx
  401377:	49 c1 e4 03          	shl    $0x3,%r12
  40137b:	eb 07                	jmp    401384 <data_free+0x24>
  40137d:	0f 1f 00             	nopl   (%rax)
  401380:	48 83 c3 08          	add    $0x8,%rbx
  401384:	48 8b 00             	mov    (%rax),%rax
  401387:	48 8b 3c 18          	mov    (%rax,%rbx,1),%rdi
  40138b:	e8 10 f6 ff ff       	callq  4009a0 <free@plt>
  401390:	48 8b 45 00          	mov    0x0(%rbp),%rax
  401394:	49 39 dc             	cmp    %rbx,%r12
  401397:	75 e7                	jne    401380 <data_free+0x20>
  401399:	48 8b 38             	mov    (%rax),%rdi
  40139c:	e8 ff f5 ff ff       	callq  4009a0 <free@plt>
  4013a1:	48 8b 45 00          	mov    0x0(%rbp),%rax
  4013a5:	48 8b 78 10          	mov    0x10(%rax),%rdi
  4013a9:	e8 f2 f5 ff ff       	callq  4009a0 <free@plt>
  4013ae:	48 8b 45 00          	mov    0x0(%rbp),%rax
  4013b2:	48 8d 78 08          	lea    0x8(%rax),%rdi
  4013b6:	e8 95 02 00 00       	callq  401650 <Seq_free>
  4013bb:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
  4013bf:	5b                   	pop    %rbx
  4013c0:	5d                   	pop    %rbp
  4013c1:	41 5c                	pop    %r12
  4013c3:	e9 d8 f5 ff ff       	jmpq   4009a0 <free@plt>
  4013c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4013cf:	00 

00000000004013d0 <assert>:
  4013d0:	85 ff                	test   %edi,%edi
  4013d2:	74 0c                	je     4013e0 <assert+0x10>
  4013d4:	f3 c3                	repz retq 
  4013d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4013dd:	00 00 00 
  4013e0:	48 8d 3d f1 19 20 00 	lea    0x2019f1(%rip),%rdi        # 602dd8 <Assert_Failed>
  4013e7:	48 8d 35 3d 0f 00 00 	lea    0xf3d(%rip),%rsi        # 40232b <_IO_stdin_used+0xb3>
  4013ee:	ba 05 00 00 00       	mov    $0x5,%edx
  4013f3:	e9 08 00 00 00       	jmpq   401400 <Except_raise>
  4013f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4013ff:	00 

0000000000401400 <Except_raise>:
  401400:	48 89 5c 24 d8       	mov    %rbx,-0x28(%rsp)
  401405:	48 89 6c 24 e0       	mov    %rbp,-0x20(%rsp)
  40140a:	48 89 fb             	mov    %rdi,%rbx
  40140d:	4c 89 64 24 e8       	mov    %r12,-0x18(%rsp)
  401412:	4c 89 74 24 f8       	mov    %r14,-0x8(%rsp)
  401417:	49 89 f4             	mov    %rsi,%r12
  40141a:	4c 89 6c 24 f0       	mov    %r13,-0x10(%rsp)
  40141f:	48 83 ec 28          	sub    $0x28,%rsp
  401423:	4c 8d 35 f6 1c 20 00 	lea    0x201cf6(%rip),%r14        # 603120 <Except_stack>
  40142a:	48 85 ff             	test   %rdi,%rdi
  40142d:	89 d5                	mov    %edx,%ebp
  40142f:	4d 8b 2e             	mov    (%r14),%r13
  401432:	0f 84 a8 00 00 00    	je     4014e0 <Except_raise+0xe0>
  401438:	4d 85 ed             	test   %r13,%r13
  40143b:	74 33                	je     401470 <Except_raise+0x70>
  40143d:	49 8b 06             	mov    (%r14),%rax
  401440:	49 8d 7d 08          	lea    0x8(%r13),%rdi
  401444:	49 89 9d e0 00 00 00 	mov    %rbx,0xe0(%r13)
  40144b:	4d 89 a5 d0 00 00 00 	mov    %r12,0xd0(%r13)
  401452:	41 89 ad d8 00 00 00 	mov    %ebp,0xd8(%r13)
  401459:	be 01 00 00 00       	mov    $0x1,%esi
  40145e:	48 8b 00             	mov    (%rax),%rax
  401461:	49 89 06             	mov    %rax,(%r14)
  401464:	e8 f7 f5 ff ff       	callq  400a60 <longjmp@plt>
  401469:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401470:	4c 8b 2d 81 1b 20 00 	mov    0x201b81(%rip),%r13        # 602ff8 <stderr@@GLIBC_2.2.5-0xe8>
  401477:	48 8d 3d d8 0e 00 00 	lea    0xed8(%rip),%rdi        # 402356 <_IO_stdin_used+0xde>
  40147e:	ba 12 00 00 00       	mov    $0x12,%edx
  401483:	be 01 00 00 00       	mov    $0x1,%esi
  401488:	49 8b 4d 00          	mov    0x0(%r13),%rcx
  40148c:	e8 ff f5 ff ff       	callq  400a90 <fwrite@plt>
  401491:	48 8b 13             	mov    (%rbx),%rdx
  401494:	48 85 d2             	test   %rdx,%rdx
  401497:	0f 84 83 00 00 00    	je     401520 <Except_raise+0x120>
  40149d:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  4014a1:	48 8d 35 c1 0e 00 00 	lea    0xec1(%rip),%rsi        # 402369 <_IO_stdin_used+0xf1>
  4014a8:	31 c0                	xor    %eax,%eax
  4014aa:	e8 61 f5 ff ff       	callq  400a10 <fprintf@plt>
  4014af:	85 ed                	test   %ebp,%ebp
  4014b1:	7f 4d                	jg     401500 <Except_raise+0x100>
  4014b3:	49 8b 4d 00          	mov    0x0(%r13),%rcx
  4014b7:	48 8d 3d ca 0e 00 00 	lea    0xeca(%rip),%rdi        # 402388 <_IO_stdin_used+0x110>
  4014be:	ba 0c 00 00 00       	mov    $0xc,%edx
  4014c3:	be 01 00 00 00       	mov    $0x1,%esi
  4014c8:	e8 c3 f5 ff ff       	callq  400a90 <fwrite@plt>
  4014cd:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  4014d1:	e8 6a f5 ff ff       	callq  400a40 <fflush@plt>
  4014d6:	e8 d5 f4 ff ff       	callq  4009b0 <abort@plt>
  4014db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4014e0:	48 8d 3d f1 18 20 00 	lea    0x2018f1(%rip),%rdi        # 602dd8 <Assert_Failed>
  4014e7:	48 8d 35 5b 0e 00 00 	lea    0xe5b(%rip),%rsi        # 402349 <_IO_stdin_used+0xd1>
  4014ee:	ba 13 00 00 00       	mov    $0x13,%edx
  4014f3:	e8 08 ff ff ff       	callq  401400 <Except_raise>
  4014f8:	e9 3b ff ff ff       	jmpq   401438 <Except_raise+0x38>
  4014fd:	0f 1f 00             	nopl   (%rax)
  401500:	4d 85 e4             	test   %r12,%r12
  401503:	74 ae                	je     4014b3 <Except_raise+0xb3>
  401505:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  401509:	48 8d 35 66 0e 00 00 	lea    0xe66(%rip),%rsi        # 402376 <_IO_stdin_used+0xfe>
  401510:	89 e9                	mov    %ebp,%ecx
  401512:	4c 89 e2             	mov    %r12,%rdx
  401515:	31 c0                	xor    %eax,%eax
  401517:	e8 f4 f4 ff ff       	callq  400a10 <fprintf@plt>
  40151c:	eb 95                	jmp    4014b3 <Except_raise+0xb3>
  40151e:	66 90                	xchg   %ax,%ax
  401520:	49 8b 7d 00          	mov    0x0(%r13),%rdi
  401524:	48 8d 35 42 0e 00 00 	lea    0xe42(%rip),%rsi        # 40236d <_IO_stdin_used+0xf5>
  40152b:	48 89 da             	mov    %rbx,%rdx
  40152e:	31 c0                	xor    %eax,%eax
  401530:	e8 db f4 ff ff       	callq  400a10 <fprintf@plt>
  401535:	e9 75 ff ff ff       	jmpq   4014af <Except_raise+0xaf>
  40153a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401540 <expand>:
  401540:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  401545:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  40154a:	48 83 ec 18          	sub    $0x18,%rsp
  40154e:	8b 2f                	mov    (%rdi),%ebp
  401550:	48 89 fb             	mov    %rdi,%rbx
  401553:	8d 74 2d 00          	lea    0x0(%rbp,%rbp,1),%esi
  401557:	e8 24 08 00 00       	callq  401d80 <UArray_resize>
  40155c:	8b 43 14             	mov    0x14(%rbx),%eax
  40155f:	85 c0                	test   %eax,%eax
  401561:	7e 25                	jle    401588 <expand+0x48>
  401563:	48 63 f0             	movslq %eax,%rsi
  401566:	48 63 d5             	movslq %ebp,%rdx
  401569:	48 c1 e6 03          	shl    $0x3,%rsi
  40156d:	48 03 73 08          	add    0x8(%rbx),%rsi
  401571:	48 8d 3c d6          	lea    (%rsi,%rdx,8),%rdi
  401575:	89 ea                	mov    %ebp,%edx
  401577:	29 c2                	sub    %eax,%edx
  401579:	48 63 d2             	movslq %edx,%rdx
  40157c:	48 c1 e2 03          	shl    $0x3,%rdx
  401580:	e8 9b f4 ff ff       	callq  400a20 <memcpy@plt>
  401585:	01 6b 14             	add    %ebp,0x14(%rbx)
  401588:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40158d:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  401592:	48 83 c4 18          	add    $0x18,%rsp
  401596:	c3                   	retq   
  401597:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40159e:	00 00 

00000000004015a0 <Seq_new>:
  4015a0:	55                   	push   %rbp
  4015a1:	53                   	push   %rbx
  4015a2:	89 fb                	mov    %edi,%ebx
  4015a4:	48 83 ec 08          	sub    $0x8,%rsp
  4015a8:	85 ff                	test   %edi,%edi
  4015aa:	78 5c                	js     401608 <Seq_new+0x68>
  4015ac:	48 8d 15 e2 0d 00 00 	lea    0xde2(%rip),%rdx        # 402395 <_IO_stdin_used+0x11d>
  4015b3:	b9 1d 00 00 00       	mov    $0x1d,%ecx
  4015b8:	be 18 00 00 00       	mov    $0x18,%esi
  4015bd:	bf 01 00 00 00       	mov    $0x1,%edi
  4015c2:	e8 29 0a 00 00       	callq  401ff0 <Mem_calloc>
  4015c7:	85 db                	test   %ebx,%ebx
  4015c9:	48 89 c5             	mov    %rax,%rbp
  4015cc:	75 70                	jne    40163e <Seq_new+0x9e>
  4015ce:	bf 80 00 00 00       	mov    $0x80,%edi
  4015d3:	bb 10 00 00 00       	mov    $0x10,%ebx
  4015d8:	48 8d 35 b6 0d 00 00 	lea    0xdb6(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4015df:	ba 21 00 00 00       	mov    $0x21,%edx
  4015e4:	e8 47 09 00 00       	callq  401f30 <Mem_alloc>
  4015e9:	89 de                	mov    %ebx,%esi
  4015eb:	48 89 c1             	mov    %rax,%rcx
  4015ee:	48 89 ef             	mov    %rbp,%rdi
  4015f1:	ba 08 00 00 00       	mov    $0x8,%edx
  4015f6:	e8 a5 04 00 00       	callq  401aa0 <UArrayRep_init>
  4015fb:	48 83 c4 08          	add    $0x8,%rsp
  4015ff:	48 89 e8             	mov    %rbp,%rax
  401602:	5b                   	pop    %rbx
  401603:	5d                   	pop    %rbp
  401604:	c3                   	retq   
  401605:	0f 1f 00             	nopl   (%rax)
  401608:	48 8d 3d c9 17 20 00 	lea    0x2017c9(%rip),%rdi        # 602dd8 <Assert_Failed>
  40160f:	48 8d 35 7f 0d 00 00 	lea    0xd7f(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  401616:	ba 1c 00 00 00       	mov    $0x1c,%edx
  40161b:	e8 e0 fd ff ff       	callq  401400 <Except_raise>
  401620:	48 8d 15 6e 0d 00 00 	lea    0xd6e(%rip),%rdx        # 402395 <_IO_stdin_used+0x11d>
  401627:	b9 1d 00 00 00       	mov    $0x1d,%ecx
  40162c:	be 18 00 00 00       	mov    $0x18,%esi
  401631:	bf 01 00 00 00       	mov    $0x1,%edi
  401636:	e8 b5 09 00 00       	callq  401ff0 <Mem_calloc>
  40163b:	48 89 c5             	mov    %rax,%rbp
  40163e:	48 63 fb             	movslq %ebx,%rdi
  401641:	48 c1 e7 03          	shl    $0x3,%rdi
  401645:	eb 91                	jmp    4015d8 <Seq_new+0x38>
  401647:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40164e:	00 00 

0000000000401650 <Seq_free>:
  401650:	48 85 ff             	test   %rdi,%rdi
  401653:	53                   	push   %rbx
  401654:	48 89 fb             	mov    %rdi,%rbx
  401657:	74 17                	je     401670 <Seq_free+0x20>
  401659:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  40165d:	74 11                	je     401670 <Seq_free+0x20>
  40165f:	48 89 df             	mov    %rbx,%rdi
  401662:	5b                   	pop    %rbx
  401663:	e9 c8 05 00 00       	jmpq   401c30 <UArray_free>
  401668:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40166f:	00 
  401670:	48 8d 3d 61 17 20 00 	lea    0x201761(%rip),%rdi        # 602dd8 <Assert_Failed>
  401677:	48 8d 35 17 0d 00 00 	lea    0xd17(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40167e:	ba 2e 00 00 00       	mov    $0x2e,%edx
  401683:	e8 78 fd ff ff       	callq  401400 <Except_raise>
  401688:	48 89 df             	mov    %rbx,%rdi
  40168b:	5b                   	pop    %rbx
  40168c:	e9 9f 05 00 00       	jmpq   401c30 <UArray_free>
  401691:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401698:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40169f:	00 

00000000004016a0 <Seq_length>:
  4016a0:	48 85 ff             	test   %rdi,%rdi
  4016a3:	53                   	push   %rbx
  4016a4:	48 89 fb             	mov    %rdi,%rbx
  4016a7:	74 07                	je     4016b0 <Seq_length+0x10>
  4016a9:	8b 43 10             	mov    0x10(%rbx),%eax
  4016ac:	5b                   	pop    %rbx
  4016ad:	c3                   	retq   
  4016ae:	66 90                	xchg   %ax,%ax
  4016b0:	48 8d 3d 21 17 20 00 	lea    0x201721(%rip),%rdi        # 602dd8 <Assert_Failed>
  4016b7:	48 8d 35 d7 0c 00 00 	lea    0xcd7(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4016be:	ba 33 00 00 00       	mov    $0x33,%edx
  4016c3:	e8 38 fd ff ff       	callq  401400 <Except_raise>
  4016c8:	8b 43 10             	mov    0x10(%rbx),%eax
  4016cb:	5b                   	pop    %rbx
  4016cc:	c3                   	retq   
  4016cd:	0f 1f 00             	nopl   (%rax)

00000000004016d0 <Seq_get>:
  4016d0:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  4016d5:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  4016da:	48 83 ec 18          	sub    $0x18,%rsp
  4016de:	48 85 ff             	test   %rdi,%rdi
  4016e1:	48 89 fb             	mov    %rdi,%rbx
  4016e4:	89 f5                	mov    %esi,%ebp
  4016e6:	74 48                	je     401730 <Seq_get+0x60>
  4016e8:	85 ed                	test   %ebp,%ebp
  4016ea:	78 05                	js     4016f1 <Seq_get+0x21>
  4016ec:	3b 6b 10             	cmp    0x10(%rbx),%ebp
  4016ef:	7c 18                	jl     401709 <Seq_get+0x39>
  4016f1:	48 8d 3d e0 16 20 00 	lea    0x2016e0(%rip),%rdi        # 602dd8 <Assert_Failed>
  4016f8:	48 8d 35 96 0c 00 00 	lea    0xc96(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4016ff:	ba 38 00 00 00       	mov    $0x38,%edx
  401704:	e8 f7 fc ff ff       	callq  401400 <Except_raise>
  401709:	8b 43 14             	mov    0x14(%rbx),%eax
  40170c:	01 e8                	add    %ebp,%eax
  40170e:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  401713:	89 c2                	mov    %eax,%edx
  401715:	c1 fa 1f             	sar    $0x1f,%edx
  401718:	f7 3b                	idivl  (%rbx)
  40171a:	48 8b 43 08          	mov    0x8(%rbx),%rax
  40171e:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  401723:	48 63 d2             	movslq %edx,%rdx
  401726:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  40172a:	48 83 c4 18          	add    $0x18,%rsp
  40172e:	c3                   	retq   
  40172f:	90                   	nop
  401730:	48 8d 3d a1 16 20 00 	lea    0x2016a1(%rip),%rdi        # 602dd8 <Assert_Failed>
  401737:	48 8d 35 57 0c 00 00 	lea    0xc57(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40173e:	ba 37 00 00 00       	mov    $0x37,%edx
  401743:	e8 b8 fc ff ff       	callq  401400 <Except_raise>
  401748:	eb 9e                	jmp    4016e8 <Seq_get+0x18>
  40174a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401750 <Seq_put>:
  401750:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  401755:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  40175a:	48 89 fb             	mov    %rdi,%rbx
  40175d:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  401762:	48 83 ec 18          	sub    $0x18,%rsp
  401766:	48 85 ff             	test   %rdi,%rdi
  401769:	41 89 f4             	mov    %esi,%r12d
  40176c:	48 89 d5             	mov    %rdx,%rbp
  40176f:	74 57                	je     4017c8 <Seq_put+0x78>
  401771:	45 85 e4             	test   %r12d,%r12d
  401774:	78 06                	js     40177c <Seq_put+0x2c>
  401776:	44 3b 63 10          	cmp    0x10(%rbx),%r12d
  40177a:	7c 18                	jl     401794 <Seq_put+0x44>
  40177c:	48 8d 3d 55 16 20 00 	lea    0x201655(%rip),%rdi        # 602dd8 <Assert_Failed>
  401783:	48 8d 35 0b 0c 00 00 	lea    0xc0b(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40178a:	ba 3f 00 00 00       	mov    $0x3f,%edx
  40178f:	e8 6c fc ff ff       	callq  401400 <Except_raise>
  401794:	8b 43 14             	mov    0x14(%rbx),%eax
  401797:	44 01 e0             	add    %r12d,%eax
  40179a:	89 c2                	mov    %eax,%edx
  40179c:	c1 fa 1f             	sar    $0x1f,%edx
  40179f:	f7 3b                	idivl  (%rbx)
  4017a1:	48 63 d2             	movslq %edx,%rdx
  4017a4:	48 c1 e2 03          	shl    $0x3,%rdx
  4017a8:	48 03 53 08          	add    0x8(%rbx),%rdx
  4017ac:	48 8b 02             	mov    (%rdx),%rax
  4017af:	48 89 2a             	mov    %rbp,(%rdx)
  4017b2:	48 8b 1c 24          	mov    (%rsp),%rbx
  4017b6:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  4017bb:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  4017c0:	48 83 c4 18          	add    $0x18,%rsp
  4017c4:	c3                   	retq   
  4017c5:	0f 1f 00             	nopl   (%rax)
  4017c8:	48 8d 3d 09 16 20 00 	lea    0x201609(%rip),%rdi        # 602dd8 <Assert_Failed>
  4017cf:	48 8d 35 bf 0b 00 00 	lea    0xbbf(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4017d6:	ba 3e 00 00 00       	mov    $0x3e,%edx
  4017db:	e8 20 fc ff ff       	callq  401400 <Except_raise>
  4017e0:	eb 8f                	jmp    401771 <Seq_put+0x21>
  4017e2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4017e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004017f0 <Seq_remhi>:
  4017f0:	48 85 ff             	test   %rdi,%rdi
  4017f3:	53                   	push   %rbx
  4017f4:	48 89 fb             	mov    %rdi,%rbx
  4017f7:	74 47                	je     401840 <Seq_remhi+0x50>
  4017f9:	8b 43 10             	mov    0x10(%rbx),%eax
  4017fc:	85 c0                	test   %eax,%eax
  4017fe:	7e 20                	jle    401820 <Seq_remhi+0x30>
  401800:	83 e8 01             	sub    $0x1,%eax
  401803:	89 43 10             	mov    %eax,0x10(%rbx)
  401806:	03 43 14             	add    0x14(%rbx),%eax
  401809:	89 c2                	mov    %eax,%edx
  40180b:	c1 fa 1f             	sar    $0x1f,%edx
  40180e:	f7 3b                	idivl  (%rbx)
  401810:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401814:	5b                   	pop    %rbx
  401815:	48 63 d2             	movslq %edx,%rdx
  401818:	48 8b 04 d0          	mov    (%rax,%rdx,8),%rax
  40181c:	c3                   	retq   
  40181d:	0f 1f 00             	nopl   (%rax)
  401820:	48 8d 3d b1 15 20 00 	lea    0x2015b1(%rip),%rdi        # 602dd8 <Assert_Failed>
  401827:	48 8d 35 67 0b 00 00 	lea    0xb67(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40182e:	ba 49 00 00 00       	mov    $0x49,%edx
  401833:	e8 c8 fb ff ff       	callq  401400 <Except_raise>
  401838:	8b 43 10             	mov    0x10(%rbx),%eax
  40183b:	eb c3                	jmp    401800 <Seq_remhi+0x10>
  40183d:	0f 1f 00             	nopl   (%rax)
  401840:	48 8d 3d 91 15 20 00 	lea    0x201591(%rip),%rdi        # 602dd8 <Assert_Failed>
  401847:	48 8d 35 47 0b 00 00 	lea    0xb47(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40184e:	ba 48 00 00 00       	mov    $0x48,%edx
  401853:	e8 a8 fb ff ff       	callq  401400 <Except_raise>
  401858:	eb 9f                	jmp    4017f9 <Seq_remhi+0x9>
  40185a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401860 <Seq_remlo>:
  401860:	48 85 ff             	test   %rdi,%rdi
  401863:	53                   	push   %rbx
  401864:	48 89 fb             	mov    %rdi,%rbx
  401867:	74 5f                	je     4018c8 <Seq_remlo+0x68>
  401869:	8b 7b 10             	mov    0x10(%rbx),%edi
  40186c:	85 ff                	test   %edi,%edi
  40186e:	7e 38                	jle    4018a8 <Seq_remlo+0x48>
  401870:	8b 73 14             	mov    0x14(%rbx),%esi
  401873:	8b 0b                	mov    (%rbx),%ecx
  401875:	83 ef 01             	sub    $0x1,%edi
  401878:	89 f2                	mov    %esi,%edx
  40187a:	89 f0                	mov    %esi,%eax
  40187c:	c1 fa 1f             	sar    $0x1f,%edx
  40187f:	f7 f9                	idiv   %ecx
  401881:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401885:	48 63 d2             	movslq %edx,%rdx
  401888:	4c 8b 04 d0          	mov    (%rax,%rdx,8),%r8
  40188c:	8d 46 01             	lea    0x1(%rsi),%eax
  40188f:	89 7b 10             	mov    %edi,0x10(%rbx)
  401892:	89 c2                	mov    %eax,%edx
  401894:	c1 fa 1f             	sar    $0x1f,%edx
  401897:	f7 f9                	idiv   %ecx
  401899:	4c 89 c0             	mov    %r8,%rax
  40189c:	89 53 14             	mov    %edx,0x14(%rbx)
  40189f:	5b                   	pop    %rbx
  4018a0:	c3                   	retq   
  4018a1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4018a8:	48 8d 3d 29 15 20 00 	lea    0x201529(%rip),%rdi        # 602dd8 <Assert_Failed>
  4018af:	48 8d 35 df 0a 00 00 	lea    0xadf(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4018b6:	ba 52 00 00 00       	mov    $0x52,%edx
  4018bb:	e8 40 fb ff ff       	callq  401400 <Except_raise>
  4018c0:	8b 7b 10             	mov    0x10(%rbx),%edi
  4018c3:	eb ab                	jmp    401870 <Seq_remlo+0x10>
  4018c5:	0f 1f 00             	nopl   (%rax)
  4018c8:	48 8d 3d 09 15 20 00 	lea    0x201509(%rip),%rdi        # 602dd8 <Assert_Failed>
  4018cf:	48 8d 35 bf 0a 00 00 	lea    0xabf(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  4018d6:	ba 51 00 00 00       	mov    $0x51,%edx
  4018db:	e8 20 fb ff ff       	callq  401400 <Except_raise>
  4018e0:	eb 87                	jmp    401869 <Seq_remlo+0x9>
  4018e2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4018e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004018f0 <Seq_addhi>:
  4018f0:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  4018f5:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  4018fa:	48 83 ec 18          	sub    $0x18,%rsp
  4018fe:	48 85 ff             	test   %rdi,%rdi
  401901:	48 89 fb             	mov    %rdi,%rbx
  401904:	48 89 f5             	mov    %rsi,%rbp
  401907:	74 47                	je     401950 <Seq_addhi+0x60>
  401909:	8b 43 10             	mov    0x10(%rbx),%eax
  40190c:	8b 0b                	mov    (%rbx),%ecx
  40190e:	39 c8                	cmp    %ecx,%eax
  401910:	74 2e                	je     401940 <Seq_addhi+0x50>
  401912:	8d 50 01             	lea    0x1(%rax),%edx
  401915:	03 43 14             	add    0x14(%rbx),%eax
  401918:	89 53 10             	mov    %edx,0x10(%rbx)
  40191b:	89 c2                	mov    %eax,%edx
  40191d:	c1 fa 1f             	sar    $0x1f,%edx
  401920:	f7 f9                	idiv   %ecx
  401922:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401926:	48 63 d2             	movslq %edx,%rdx
  401929:	48 89 2c d0          	mov    %rbp,(%rax,%rdx,8)
  40192d:	48 89 e8             	mov    %rbp,%rax
  401930:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  401935:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  40193a:	48 83 c4 18          	add    $0x18,%rsp
  40193e:	c3                   	retq   
  40193f:	90                   	nop
  401940:	48 89 df             	mov    %rbx,%rdi
  401943:	e8 f8 fb ff ff       	callq  401540 <expand>
  401948:	8b 43 10             	mov    0x10(%rbx),%eax
  40194b:	8b 0b                	mov    (%rbx),%ecx
  40194d:	eb c3                	jmp    401912 <Seq_addhi+0x22>
  40194f:	90                   	nop
  401950:	48 8d 3d 81 14 20 00 	lea    0x201481(%rip),%rdi        # 602dd8 <Assert_Failed>
  401957:	48 8d 35 37 0a 00 00 	lea    0xa37(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  40195e:	ba 5b 00 00 00       	mov    $0x5b,%edx
  401963:	e8 98 fa ff ff       	callq  401400 <Except_raise>
  401968:	eb 9f                	jmp    401909 <Seq_addhi+0x19>
  40196a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401970 <Seq_seq>:
  401970:	53                   	push   %rbx
  401971:	48 83 ec 60          	sub    $0x60,%rsp
  401975:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
  40197a:	48 89 fe             	mov    %rdi,%rsi
  40197d:	31 ff                	xor    %edi,%edi
  40197f:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  401984:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
  401989:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
  40198e:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
  401993:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
  401998:	e8 03 fc ff ff       	callq  4015a0 <Seq_new>
  40199d:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4019a2:	48 89 c3             	mov    %rax,%rbx
  4019a5:	48 8d 44 24 70       	lea    0x70(%rsp),%rax
  4019aa:	c7 44 24 10 08 00 00 	movl   $0x8,0x10(%rsp)
  4019b1:	00 
  4019b2:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4019b7:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
  4019bc:	48 85 f6             	test   %rsi,%rsi
  4019bf:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  4019c4:	75 20                	jne    4019e6 <Seq_seq+0x76>
  4019c6:	eb 45                	jmp    401a0d <Seq_seq+0x9d>
  4019c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4019cf:	00 
  4019d0:	89 d0                	mov    %edx,%eax
  4019d2:	48 03 44 24 20       	add    0x20(%rsp),%rax
  4019d7:	83 c2 08             	add    $0x8,%edx
  4019da:	89 54 24 10          	mov    %edx,0x10(%rsp)
  4019de:	48 8b 30             	mov    (%rax),%rsi
  4019e1:	48 85 f6             	test   %rsi,%rsi
  4019e4:	74 27                	je     401a0d <Seq_seq+0x9d>
  4019e6:	48 89 df             	mov    %rbx,%rdi
  4019e9:	e8 02 ff ff ff       	callq  4018f0 <Seq_addhi>
  4019ee:	8b 54 24 10          	mov    0x10(%rsp),%edx
  4019f2:	83 fa 30             	cmp    $0x30,%edx
  4019f5:	72 d9                	jb     4019d0 <Seq_seq+0x60>
  4019f7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4019fc:	48 8d 50 08          	lea    0x8(%rax),%rdx
  401a00:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  401a05:	48 8b 30             	mov    (%rax),%rsi
  401a08:	48 85 f6             	test   %rsi,%rsi
  401a0b:	75 d9                	jne    4019e6 <Seq_seq+0x76>
  401a0d:	48 89 d8             	mov    %rbx,%rax
  401a10:	48 83 c4 60          	add    $0x60,%rsp
  401a14:	5b                   	pop    %rbx
  401a15:	c3                   	retq   
  401a16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401a1d:	00 00 00 

0000000000401a20 <Seq_addlo>:
  401a20:	55                   	push   %rbp
  401a21:	48 89 f5             	mov    %rsi,%rbp
  401a24:	53                   	push   %rbx
  401a25:	48 89 fb             	mov    %rdi,%rbx
  401a28:	48 83 ec 08          	sub    $0x8,%rsp
  401a2c:	48 85 ff             	test   %rdi,%rdi
  401a2f:	74 4f                	je     401a80 <Seq_addlo+0x60>
  401a31:	8b 0b                	mov    (%rbx),%ecx
  401a33:	39 4b 10             	cmp    %ecx,0x10(%rbx)
  401a36:	74 38                	je     401a70 <Seq_addlo+0x50>
  401a38:	8b 43 14             	mov    0x14(%rbx),%eax
  401a3b:	83 e8 01             	sub    $0x1,%eax
  401a3e:	85 c0                	test   %eax,%eax
  401a40:	89 43 14             	mov    %eax,0x14(%rbx)
  401a43:	79 06                	jns    401a4b <Seq_addlo+0x2b>
  401a45:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401a48:	89 43 14             	mov    %eax,0x14(%rbx)
  401a4b:	89 c2                	mov    %eax,%edx
  401a4d:	83 43 10 01          	addl   $0x1,0x10(%rbx)
  401a51:	c1 fa 1f             	sar    $0x1f,%edx
  401a54:	f7 f9                	idiv   %ecx
  401a56:	48 8b 43 08          	mov    0x8(%rbx),%rax
  401a5a:	48 63 d2             	movslq %edx,%rdx
  401a5d:	48 89 2c d0          	mov    %rbp,(%rax,%rdx,8)
  401a61:	48 83 c4 08          	add    $0x8,%rsp
  401a65:	48 89 e8             	mov    %rbp,%rax
  401a68:	5b                   	pop    %rbx
  401a69:	5d                   	pop    %rbp
  401a6a:	c3                   	retq   
  401a6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401a70:	48 89 df             	mov    %rbx,%rdi
  401a73:	e8 c8 fa ff ff       	callq  401540 <expand>
  401a78:	8b 0b                	mov    (%rbx),%ecx
  401a7a:	eb bc                	jmp    401a38 <Seq_addlo+0x18>
  401a7c:	0f 1f 40 00          	nopl   0x0(%rax)
  401a80:	48 8d 3d 51 13 20 00 	lea    0x201351(%rip),%rdi        # 602dd8 <Assert_Failed>
  401a87:	48 8d 35 07 09 00 00 	lea    0x907(%rip),%rsi        # 402395 <_IO_stdin_used+0x11d>
  401a8e:	ba 64 00 00 00       	mov    $0x64,%edx
  401a93:	e8 68 f9 ff ff       	callq  401400 <Except_raise>
  401a98:	eb 97                	jmp    401a31 <Seq_addlo+0x11>
  401a9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000401aa0 <UArrayRep_init>:
  401aa0:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
  401aa5:	48 89 6c 24 e8       	mov    %rbp,-0x18(%rsp)
  401aaa:	48 89 fb             	mov    %rdi,%rbx
  401aad:	4c 89 64 24 f0       	mov    %r12,-0x10(%rsp)
  401ab2:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
  401ab7:	48 83 ec 38          	sub    $0x38,%rsp
  401abb:	48 85 ff             	test   %rdi,%rdi
  401abe:	89 f5                	mov    %esi,%ebp
  401ac0:	41 89 d4             	mov    %edx,%r12d
  401ac3:	0f 84 a7 00 00 00    	je     401b70 <UArrayRep_init+0xd0>
  401ac9:	85 ed                	test   %ebp,%ebp
  401acb:	41 0f 9f c5          	setg   %r13b
  401acf:	48 85 c9             	test   %rcx,%rcx
  401ad2:	74 3c                	je     401b10 <UArrayRep_init+0x70>
  401ad4:	45 84 ed             	test   %r13b,%r13b
  401ad7:	74 37                	je     401b10 <UArrayRep_init+0x70>
  401ad9:	45 85 e4             	test   %r12d,%r12d
  401adc:	7e 62                	jle    401b40 <UArrayRep_init+0xa0>
  401ade:	31 c0                	xor    %eax,%eax
  401ae0:	45 84 ed             	test   %r13b,%r13b
  401ae3:	89 2b                	mov    %ebp,(%rbx)
  401ae5:	48 0f 45 c1          	cmovne %rcx,%rax
  401ae9:	44 89 63 04          	mov    %r12d,0x4(%rbx)
  401aed:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
  401af2:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401af6:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
  401afb:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  401b00:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
  401b05:	48 83 c4 38          	add    $0x38,%rsp
  401b09:	c3                   	retq   
  401b0a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401b10:	48 85 c9             	test   %rcx,%rcx
  401b13:	75 04                	jne    401b19 <UArrayRep_init+0x79>
  401b15:	85 ed                	test   %ebp,%ebp
  401b17:	74 c0                	je     401ad9 <UArrayRep_init+0x39>
  401b19:	48 8d 3d b8 12 20 00 	lea    0x2012b8(%rip),%rdi        # 602dd8 <Assert_Failed>
  401b20:	48 8d 35 78 08 00 00 	lea    0x878(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401b27:	ba 14 00 00 00       	mov    $0x14,%edx
  401b2c:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401b31:	e8 ca f8 ff ff       	callq  401400 <Except_raise>
  401b36:	45 85 e4             	test   %r12d,%r12d
  401b39:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401b3e:	7f 9e                	jg     401ade <UArrayRep_init+0x3e>
  401b40:	48 8d 3d 91 12 20 00 	lea    0x201291(%rip),%rdi        # 602dd8 <Assert_Failed>
  401b47:	48 8d 35 51 08 00 00 	lea    0x851(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401b4e:	ba 15 00 00 00       	mov    $0x15,%edx
  401b53:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401b58:	e8 a3 f8 ff ff       	callq  401400 <Except_raise>
  401b5d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401b62:	e9 77 ff ff ff       	jmpq   401ade <UArrayRep_init+0x3e>
  401b67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401b6e:	00 00 
  401b70:	48 8d 3d 61 12 20 00 	lea    0x201261(%rip),%rdi        # 602dd8 <Assert_Failed>
  401b77:	48 8d 35 21 08 00 00 	lea    0x821(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401b7e:	ba 13 00 00 00       	mov    $0x13,%edx
  401b83:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401b88:	e8 73 f8 ff ff       	callq  401400 <Except_raise>
  401b8d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401b92:	e9 32 ff ff ff       	jmpq   401ac9 <UArrayRep_init+0x29>
  401b97:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401b9e:	00 00 

0000000000401ba0 <UArray_new>:
  401ba0:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  401ba5:	41 89 f4             	mov    %esi,%r12d
  401ba8:	48 8d 35 f0 07 00 00 	lea    0x7f0(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401baf:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  401bb4:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  401bb9:	89 fb                	mov    %edi,%ebx
  401bbb:	48 83 ec 18          	sub    $0x18,%rsp
  401bbf:	ba 0b 00 00 00       	mov    $0xb,%edx
  401bc4:	bf 10 00 00 00       	mov    $0x10,%edi
  401bc9:	e8 62 03 00 00       	callq  401f30 <Mem_alloc>
  401bce:	85 db                	test   %ebx,%ebx
  401bd0:	48 89 c5             	mov    %rax,%rbp
  401bd3:	7e 43                	jle    401c18 <UArray_new+0x78>
  401bd5:	48 8d 15 c3 07 00 00 	lea    0x7c3(%rip),%rdx        # 40239f <_IO_stdin_used+0x127>
  401bdc:	49 63 f4             	movslq %r12d,%rsi
  401bdf:	48 63 fb             	movslq %ebx,%rdi
  401be2:	b9 0d 00 00 00       	mov    $0xd,%ecx
  401be7:	e8 04 04 00 00       	callq  401ff0 <Mem_calloc>
  401bec:	44 89 e2             	mov    %r12d,%edx
  401bef:	48 89 c1             	mov    %rax,%rcx
  401bf2:	89 de                	mov    %ebx,%esi
  401bf4:	48 89 ef             	mov    %rbp,%rdi
  401bf7:	e8 a4 fe ff ff       	callq  401aa0 <UArrayRep_init>
  401bfc:	48 89 e8             	mov    %rbp,%rax
  401bff:	48 8b 1c 24          	mov    (%rsp),%rbx
  401c03:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  401c08:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
  401c0d:	48 83 c4 18          	add    $0x18,%rsp
  401c11:	c3                   	retq   
  401c12:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401c18:	31 c9                	xor    %ecx,%ecx
  401c1a:	44 89 e2             	mov    %r12d,%edx
  401c1d:	89 de                	mov    %ebx,%esi
  401c1f:	48 89 c7             	mov    %rax,%rdi
  401c22:	e8 79 fe ff ff       	callq  401aa0 <UArrayRep_init>
  401c27:	eb d3                	jmp    401bfc <UArray_new+0x5c>
  401c29:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401c30 <UArray_free>:
  401c30:	48 85 ff             	test   %rdi,%rdi
  401c33:	53                   	push   %rbx
  401c34:	48 89 fb             	mov    %rdi,%rbx
  401c37:	74 47                	je     401c80 <UArray_free+0x50>
  401c39:	48 8b 07             	mov    (%rdi),%rax
  401c3c:	48 85 c0             	test   %rax,%rax
  401c3f:	74 3f                	je     401c80 <UArray_free+0x50>
  401c41:	48 8b 78 08          	mov    0x8(%rax),%rdi
  401c45:	48 8d 35 53 07 00 00 	lea    0x753(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401c4c:	ba 1f 00 00 00       	mov    $0x1f,%edx
  401c51:	e8 8a 04 00 00       	callq  4020e0 <Mem_free>
  401c56:	48 8b 3b             	mov    (%rbx),%rdi
  401c59:	48 8d 35 3f 07 00 00 	lea    0x73f(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401c60:	ba 20 00 00 00       	mov    $0x20,%edx
  401c65:	48 c7 47 08 00 00 00 	movq   $0x0,0x8(%rdi)
  401c6c:	00 
  401c6d:	e8 6e 04 00 00       	callq  4020e0 <Mem_free>
  401c72:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
  401c79:	5b                   	pop    %rbx
  401c7a:	c3                   	retq   
  401c7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401c80:	48 8d 3d 51 11 20 00 	lea    0x201151(%rip),%rdi        # 602dd8 <Assert_Failed>
  401c87:	48 8d 35 11 07 00 00 	lea    0x711(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401c8e:	ba 1e 00 00 00       	mov    $0x1e,%edx
  401c93:	e8 68 f7 ff ff       	callq  401400 <Except_raise>
  401c98:	48 8b 03             	mov    (%rbx),%rax
  401c9b:	eb a4                	jmp    401c41 <UArray_free+0x11>
  401c9d:	0f 1f 00             	nopl   (%rax)

0000000000401ca0 <UArray_at>:
  401ca0:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  401ca5:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  401caa:	48 83 ec 18          	sub    $0x18,%rsp
  401cae:	48 85 ff             	test   %rdi,%rdi
  401cb1:	48 89 fb             	mov    %rdi,%rbx
  401cb4:	89 f5                	mov    %esi,%ebp
  401cb6:	74 40                	je     401cf8 <UArray_at+0x58>
  401cb8:	85 ed                	test   %ebp,%ebp
  401cba:	78 04                	js     401cc0 <UArray_at+0x20>
  401cbc:	3b 2b                	cmp    (%rbx),%ebp
  401cbe:	7c 18                	jl     401cd8 <UArray_at+0x38>
  401cc0:	48 8d 3d 11 11 20 00 	lea    0x201111(%rip),%rdi        # 602dd8 <Assert_Failed>
  401cc7:	48 8d 35 d1 06 00 00 	lea    0x6d1(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401cce:	ba 24 00 00 00       	mov    $0x24,%edx
  401cd3:	e8 28 f7 ff ff       	callq  401400 <Except_raise>
  401cd8:	0f af 6b 04          	imul   0x4(%rbx),%ebp
  401cdc:	48 63 c5             	movslq %ebp,%rax
  401cdf:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  401ce4:	48 03 43 08          	add    0x8(%rbx),%rax
  401ce8:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  401ced:	48 83 c4 18          	add    $0x18,%rsp
  401cf1:	c3                   	retq   
  401cf2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401cf8:	48 8d 3d d9 10 20 00 	lea    0x2010d9(%rip),%rdi        # 602dd8 <Assert_Failed>
  401cff:	48 8d 35 99 06 00 00 	lea    0x699(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401d06:	ba 23 00 00 00       	mov    $0x23,%edx
  401d0b:	e8 f0 f6 ff ff       	callq  401400 <Except_raise>
  401d10:	eb a6                	jmp    401cb8 <UArray_at+0x18>
  401d12:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401d19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000401d20 <UArray_length>:
  401d20:	48 85 ff             	test   %rdi,%rdi
  401d23:	53                   	push   %rbx
  401d24:	48 89 fb             	mov    %rdi,%rbx
  401d27:	74 07                	je     401d30 <UArray_length+0x10>
  401d29:	8b 03                	mov    (%rbx),%eax
  401d2b:	5b                   	pop    %rbx
  401d2c:	c3                   	retq   
  401d2d:	0f 1f 00             	nopl   (%rax)
  401d30:	48 8d 3d a1 10 20 00 	lea    0x2010a1(%rip),%rdi        # 602dd8 <Assert_Failed>
  401d37:	48 8d 35 61 06 00 00 	lea    0x661(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401d3e:	ba 28 00 00 00       	mov    $0x28,%edx
  401d43:	e8 b8 f6 ff ff       	callq  401400 <Except_raise>
  401d48:	8b 03                	mov    (%rbx),%eax
  401d4a:	5b                   	pop    %rbx
  401d4b:	c3                   	retq   
  401d4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401d50 <UArray_size>:
  401d50:	48 85 ff             	test   %rdi,%rdi
  401d53:	53                   	push   %rbx
  401d54:	48 89 fb             	mov    %rdi,%rbx
  401d57:	74 07                	je     401d60 <UArray_size+0x10>
  401d59:	8b 43 04             	mov    0x4(%rbx),%eax
  401d5c:	5b                   	pop    %rbx
  401d5d:	c3                   	retq   
  401d5e:	66 90                	xchg   %ax,%ax
  401d60:	48 8d 3d 71 10 20 00 	lea    0x201071(%rip),%rdi        # 602dd8 <Assert_Failed>
  401d67:	48 8d 35 31 06 00 00 	lea    0x631(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401d6e:	ba 2c 00 00 00       	mov    $0x2c,%edx
  401d73:	e8 88 f6 ff ff       	callq  401400 <Except_raise>
  401d78:	8b 43 04             	mov    0x4(%rbx),%eax
  401d7b:	5b                   	pop    %rbx
  401d7c:	c3                   	retq   
  401d7d:	0f 1f 00             	nopl   (%rax)

0000000000401d80 <UArray_resize>:
  401d80:	48 89 5c 24 f0       	mov    %rbx,-0x10(%rsp)
  401d85:	48 89 6c 24 f8       	mov    %rbp,-0x8(%rsp)
  401d8a:	48 83 ec 18          	sub    $0x18,%rsp
  401d8e:	48 85 ff             	test   %rdi,%rdi
  401d91:	48 89 fb             	mov    %rdi,%rbx
  401d94:	89 f5                	mov    %esi,%ebp
  401d96:	0f 84 a4 00 00 00    	je     401e40 <UArray_resize+0xc0>
  401d9c:	83 fd 00             	cmp    $0x0,%ebp
  401d9f:	0f 8c 7b 00 00 00    	jl     401e20 <UArray_resize+0xa0>
  401da5:	74 59                	je     401e00 <UArray_resize+0x80>
  401da7:	8b 03                	mov    (%rbx),%eax
  401da9:	85 c0                	test   %eax,%eax
  401dab:	74 33                	je     401de0 <UArray_resize+0x60>
  401dad:	8b 73 04             	mov    0x4(%rbx),%esi
  401db0:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  401db4:	48 8d 15 e4 05 00 00 	lea    0x5e4(%rip),%rdx        # 40239f <_IO_stdin_used+0x127>
  401dbb:	b9 37 00 00 00       	mov    $0x37,%ecx
  401dc0:	0f af f5             	imul   %ebp,%esi
  401dc3:	48 63 f6             	movslq %esi,%rsi
  401dc6:	e8 35 03 00 00       	callq  402100 <Mem_resize>
  401dcb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401dcf:	89 2b                	mov    %ebp,(%rbx)
  401dd1:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  401dd6:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  401ddb:	48 83 c4 18          	add    $0x18,%rsp
  401ddf:	c3                   	retq   
  401de0:	8b 7b 04             	mov    0x4(%rbx),%edi
  401de3:	48 8d 35 b5 05 00 00 	lea    0x5b5(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401dea:	ba 35 00 00 00       	mov    $0x35,%edx
  401def:	0f af fd             	imul   %ebp,%edi
  401df2:	48 63 ff             	movslq %edi,%rdi
  401df5:	e8 36 01 00 00       	callq  401f30 <Mem_alloc>
  401dfa:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401dfe:	eb cf                	jmp    401dcf <UArray_resize+0x4f>
  401e00:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  401e04:	48 8d 35 94 05 00 00 	lea    0x594(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401e0b:	ba 33 00 00 00       	mov    $0x33,%edx
  401e10:	e8 cb 02 00 00       	callq  4020e0 <Mem_free>
  401e15:	48 c7 43 08 00 00 00 	movq   $0x0,0x8(%rbx)
  401e1c:	00 
  401e1d:	eb b0                	jmp    401dcf <UArray_resize+0x4f>
  401e1f:	90                   	nop
  401e20:	48 8d 3d b1 0f 20 00 	lea    0x200fb1(%rip),%rdi        # 602dd8 <Assert_Failed>
  401e27:	48 8d 35 71 05 00 00 	lea    0x571(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401e2e:	ba 31 00 00 00       	mov    $0x31,%edx
  401e33:	e8 c8 f5 ff ff       	callq  401400 <Except_raise>
  401e38:	e9 6a ff ff ff       	jmpq   401da7 <UArray_resize+0x27>
  401e3d:	0f 1f 00             	nopl   (%rax)
  401e40:	48 8d 3d 91 0f 20 00 	lea    0x200f91(%rip),%rdi        # 602dd8 <Assert_Failed>
  401e47:	48 8d 35 51 05 00 00 	lea    0x551(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401e4e:	ba 30 00 00 00       	mov    $0x30,%edx
  401e53:	e8 a8 f5 ff ff       	callq  401400 <Except_raise>
  401e58:	e9 3f ff ff ff       	jmpq   401d9c <UArray_resize+0x1c>
  401e5d:	0f 1f 00             	nopl   (%rax)

0000000000401e60 <UArray_copy>:
  401e60:	55                   	push   %rbp
  401e61:	89 f5                	mov    %esi,%ebp
  401e63:	53                   	push   %rbx
  401e64:	48 89 fb             	mov    %rdi,%rbx
  401e67:	48 83 ec 08          	sub    $0x8,%rsp
  401e6b:	48 85 ff             	test   %rdi,%rdi
  401e6e:	0f 84 94 00 00 00    	je     401f08 <UArray_copy+0xa8>
  401e74:	85 ed                	test   %ebp,%ebp
  401e76:	78 70                	js     401ee8 <UArray_copy+0x88>
  401e78:	8b 73 04             	mov    0x4(%rbx),%esi
  401e7b:	89 ef                	mov    %ebp,%edi
  401e7d:	e8 1e fd ff ff       	callq  401ba0 <UArray_new>
  401e82:	8b 10                	mov    (%rax),%edx
  401e84:	48 89 c5             	mov    %rax,%rbp
  401e87:	8b 03                	mov    (%rbx),%eax
  401e89:	39 c2                	cmp    %eax,%edx
  401e8b:	7c 33                	jl     401ec0 <UArray_copy+0x60>
  401e8d:	85 c0                	test   %eax,%eax
  401e8f:	7f 0f                	jg     401ea0 <UArray_copy+0x40>
  401e91:	48 83 c4 08          	add    $0x8,%rsp
  401e95:	48 89 e8             	mov    %rbp,%rax
  401e98:	5b                   	pop    %rbx
  401e99:	5d                   	pop    %rbp
  401e9a:	c3                   	retq   
  401e9b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401ea0:	0f af 43 04          	imul   0x4(%rbx),%eax
  401ea4:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
  401ea8:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  401eac:	48 63 d0             	movslq %eax,%rdx
  401eaf:	e8 6c eb ff ff       	callq  400a20 <memcpy@plt>
  401eb4:	48 83 c4 08          	add    $0x8,%rsp
  401eb8:	48 89 e8             	mov    %rbp,%rax
  401ebb:	5b                   	pop    %rbx
  401ebc:	5d                   	pop    %rbp
  401ebd:	c3                   	retq   
  401ebe:	66 90                	xchg   %ax,%ax
  401ec0:	85 d2                	test   %edx,%edx
  401ec2:	7e cd                	jle    401e91 <UArray_copy+0x31>
  401ec4:	0f af 53 04          	imul   0x4(%rbx),%edx
  401ec8:	48 8b 7d 08          	mov    0x8(%rbp),%rdi
  401ecc:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  401ed0:	48 63 d2             	movslq %edx,%rdx
  401ed3:	e8 48 eb ff ff       	callq  400a20 <memcpy@plt>
  401ed8:	48 83 c4 08          	add    $0x8,%rsp
  401edc:	48 89 e8             	mov    %rbp,%rax
  401edf:	5b                   	pop    %rbx
  401ee0:	5d                   	pop    %rbp
  401ee1:	c3                   	retq   
  401ee2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401ee8:	48 8d 3d e9 0e 20 00 	lea    0x200ee9(%rip),%rdi        # 602dd8 <Assert_Failed>
  401eef:	48 8d 35 a9 04 00 00 	lea    0x4a9(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401ef6:	ba 3d 00 00 00       	mov    $0x3d,%edx
  401efb:	e8 00 f5 ff ff       	callq  401400 <Except_raise>
  401f00:	e9 73 ff ff ff       	jmpq   401e78 <UArray_copy+0x18>
  401f05:	0f 1f 00             	nopl   (%rax)
  401f08:	48 8d 3d c9 0e 20 00 	lea    0x200ec9(%rip),%rdi        # 602dd8 <Assert_Failed>
  401f0f:	48 8d 35 89 04 00 00 	lea    0x489(%rip),%rsi        # 40239f <_IO_stdin_used+0x127>
  401f16:	ba 3c 00 00 00       	mov    $0x3c,%edx
  401f1b:	e8 e0 f4 ff ff       	callq  401400 <Except_raise>
  401f20:	e9 4f ff ff ff       	jmpq   401e74 <UArray_copy+0x14>
  401f25:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401f2c:	00 00 00 
  401f2f:	90                   	nop

0000000000401f30 <Mem_alloc>:
  401f30:	48 89 5c 24 e8       	mov    %rbx,-0x18(%rsp)
  401f35:	48 89 6c 24 f0       	mov    %rbp,-0x10(%rsp)
  401f3a:	48 89 f3             	mov    %rsi,%rbx
  401f3d:	4c 89 64 24 f8       	mov    %r12,-0x8(%rsp)
  401f42:	48 83 ec 28          	sub    $0x28,%rsp
  401f46:	48 85 ff             	test   %rdi,%rdi
  401f49:	49 89 fc             	mov    %rdi,%r12
  401f4c:	89 d5                	mov    %edx,%ebp
  401f4e:	7e 50                	jle    401fa0 <Mem_alloc+0x70>
  401f50:	4c 89 e7             	mov    %r12,%rdi
  401f53:	e8 d8 ea ff ff       	callq  400a30 <malloc@plt>
  401f58:	48 85 c0             	test   %rax,%rax
  401f5b:	74 1b                	je     401f78 <Mem_alloc+0x48>
  401f5d:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
  401f62:	48 8b 6c 24 18       	mov    0x18(%rsp),%rbp
  401f67:	4c 8b 64 24 20       	mov    0x20(%rsp),%r12
  401f6c:	48 83 c4 28          	add    $0x28,%rsp
  401f70:	c3                   	retq   
  401f71:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401f78:	48 85 db             	test   %rbx,%rbx
  401f7b:	74 43                	je     401fc0 <Mem_alloc+0x90>
  401f7d:	48 8d 3d 5c 0e 20 00 	lea    0x200e5c(%rip),%rdi        # 602de0 <Mem_Failed>
  401f84:	89 ea                	mov    %ebp,%edx
  401f86:	48 89 de             	mov    %rbx,%rsi
  401f89:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401f8e:	e8 6d f4 ff ff       	callq  401400 <Except_raise>
  401f93:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401f98:	eb c3                	jmp    401f5d <Mem_alloc+0x2d>
  401f9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401fa0:	48 8d 3d 31 0e 20 00 	lea    0x200e31(%rip),%rdi        # 602dd8 <Assert_Failed>
  401fa7:	48 8d 35 fe 03 00 00 	lea    0x3fe(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  401fae:	ba 0a 00 00 00       	mov    $0xa,%edx
  401fb3:	e8 48 f4 ff ff       	callq  401400 <Except_raise>
  401fb8:	eb 96                	jmp    401f50 <Mem_alloc+0x20>
  401fba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401fc0:	48 8d 3d 19 0e 20 00 	lea    0x200e19(%rip),%rdi        # 602de0 <Mem_Failed>
  401fc7:	48 8d 35 de 03 00 00 	lea    0x3de(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  401fce:	ba 0f 00 00 00       	mov    $0xf,%edx
  401fd3:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401fd8:	e8 23 f4 ff ff       	callq  401400 <Except_raise>
  401fdd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  401fe2:	e9 76 ff ff ff       	jmpq   401f5d <Mem_alloc+0x2d>
  401fe7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  401fee:	00 00 

0000000000401ff0 <Mem_calloc>:
  401ff0:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
  401ff5:	48 89 6c 24 e8       	mov    %rbp,-0x18(%rsp)
  401ffa:	48 89 d3             	mov    %rdx,%rbx
  401ffd:	4c 89 64 24 f0       	mov    %r12,-0x10(%rsp)
  402002:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
  402007:	48 83 ec 38          	sub    $0x38,%rsp
  40200b:	48 85 ff             	test   %rdi,%rdi
  40200e:	48 89 fd             	mov    %rdi,%rbp
  402011:	49 89 f4             	mov    %rsi,%r12
  402014:	41 89 cd             	mov    %ecx,%r13d
  402017:	7e 5f                	jle    402078 <Mem_calloc+0x88>
  402019:	4d 85 e4             	test   %r12,%r12
  40201c:	7e 7a                	jle    402098 <Mem_calloc+0xa8>
  40201e:	4c 89 e6             	mov    %r12,%rsi
  402021:	48 89 ef             	mov    %rbp,%rdi
  402024:	e8 c7 e9 ff ff       	callq  4009f0 <calloc@plt>
  402029:	48 85 c0             	test   %rax,%rax
  40202c:	74 22                	je     402050 <Mem_calloc+0x60>
  40202e:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  402033:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
  402038:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
  40203d:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
  402042:	48 83 c4 38          	add    $0x38,%rsp
  402046:	c3                   	retq   
  402047:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40204e:	00 00 
  402050:	48 85 db             	test   %rbx,%rbx
  402053:	74 63                	je     4020b8 <Mem_calloc+0xc8>
  402055:	48 8d 3d 84 0d 20 00 	lea    0x200d84(%rip),%rdi        # 602de0 <Mem_Failed>
  40205c:	44 89 ea             	mov    %r13d,%edx
  40205f:	48 89 de             	mov    %rbx,%rsi
  402062:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402067:	e8 94 f3 ff ff       	callq  401400 <Except_raise>
  40206c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  402071:	eb bb                	jmp    40202e <Mem_calloc+0x3e>
  402073:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402078:	48 8d 3d 59 0d 20 00 	lea    0x200d59(%rip),%rdi        # 602dd8 <Assert_Failed>
  40207f:	48 8d 35 26 03 00 00 	lea    0x326(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  402086:	ba 18 00 00 00       	mov    $0x18,%edx
  40208b:	e8 70 f3 ff ff       	callq  401400 <Except_raise>
  402090:	4d 85 e4             	test   %r12,%r12
  402093:	7f 89                	jg     40201e <Mem_calloc+0x2e>
  402095:	0f 1f 00             	nopl   (%rax)
  402098:	48 8d 3d 39 0d 20 00 	lea    0x200d39(%rip),%rdi        # 602dd8 <Assert_Failed>
  40209f:	48 8d 35 06 03 00 00 	lea    0x306(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  4020a6:	ba 19 00 00 00       	mov    $0x19,%edx
  4020ab:	e8 50 f3 ff ff       	callq  401400 <Except_raise>
  4020b0:	e9 69 ff ff ff       	jmpq   40201e <Mem_calloc+0x2e>
  4020b5:	0f 1f 00             	nopl   (%rax)
  4020b8:	48 8d 3d 21 0d 20 00 	lea    0x200d21(%rip),%rdi        # 602de0 <Mem_Failed>
  4020bf:	48 8d 35 e6 02 00 00 	lea    0x2e6(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  4020c6:	ba 1e 00 00 00       	mov    $0x1e,%edx
  4020cb:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4020d0:	e8 2b f3 ff ff       	callq  401400 <Except_raise>
  4020d5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4020da:	e9 4f ff ff ff       	jmpq   40202e <Mem_calloc+0x3e>
  4020df:	90                   	nop

00000000004020e0 <Mem_free>:
  4020e0:	48 85 ff             	test   %rdi,%rdi
  4020e3:	74 0b                	je     4020f0 <Mem_free+0x10>
  4020e5:	e9 b6 e8 ff ff       	jmpq   4009a0 <free@plt>
  4020ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4020f0:	f3 c3                	repz retq 
  4020f2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4020f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402100 <Mem_resize>:
  402100:	48 89 5c 24 e0       	mov    %rbx,-0x20(%rsp)
  402105:	48 89 6c 24 e8       	mov    %rbp,-0x18(%rsp)
  40210a:	48 89 d3             	mov    %rdx,%rbx
  40210d:	4c 89 64 24 f0       	mov    %r12,-0x10(%rsp)
  402112:	4c 89 6c 24 f8       	mov    %r13,-0x8(%rsp)
  402117:	48 83 ec 38          	sub    $0x38,%rsp
  40211b:	48 85 ff             	test   %rdi,%rdi
  40211e:	48 89 fd             	mov    %rdi,%rbp
  402121:	49 89 f4             	mov    %rsi,%r12
  402124:	41 89 cd             	mov    %ecx,%r13d
  402127:	74 7f                	je     4021a8 <Mem_resize+0xa8>
  402129:	4d 85 e4             	test   %r12,%r12
  40212c:	7e 5a                	jle    402188 <Mem_resize+0x88>
  40212e:	4c 89 e6             	mov    %r12,%rsi
  402131:	48 89 ef             	mov    %rbp,%rdi
  402134:	e8 17 e9 ff ff       	callq  400a50 <realloc@plt>
  402139:	48 85 c0             	test   %rax,%rax
  40213c:	74 22                	je     402160 <Mem_resize+0x60>
  40213e:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
  402143:	48 8b 6c 24 20       	mov    0x20(%rsp),%rbp
  402148:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
  40214d:	4c 8b 6c 24 30       	mov    0x30(%rsp),%r13
  402152:	48 83 c4 38          	add    $0x38,%rsp
  402156:	c3                   	retq   
  402157:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40215e:	00 00 
  402160:	48 85 db             	test   %rbx,%rbx
  402163:	74 63                	je     4021c8 <Mem_resize+0xc8>
  402165:	48 8d 3d 74 0c 20 00 	lea    0x200c74(%rip),%rdi        # 602de0 <Mem_Failed>
  40216c:	44 89 ea             	mov    %r13d,%edx
  40216f:	48 89 de             	mov    %rbx,%rsi
  402172:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402177:	e8 84 f2 ff ff       	callq  401400 <Except_raise>
  40217c:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  402181:	eb bb                	jmp    40213e <Mem_resize+0x3e>
  402183:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402188:	48 8d 3d 49 0c 20 00 	lea    0x200c49(%rip),%rdi        # 602dd8 <Assert_Failed>
  40218f:	48 8d 35 16 02 00 00 	lea    0x216(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  402196:	ba 2b 00 00 00       	mov    $0x2b,%edx
  40219b:	e8 60 f2 ff ff       	callq  401400 <Except_raise>
  4021a0:	eb 8c                	jmp    40212e <Mem_resize+0x2e>
  4021a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4021a8:	48 8d 3d 29 0c 20 00 	lea    0x200c29(%rip),%rdi        # 602dd8 <Assert_Failed>
  4021af:	48 8d 35 f6 01 00 00 	lea    0x1f6(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  4021b6:	ba 2a 00 00 00       	mov    $0x2a,%edx
  4021bb:	e8 40 f2 ff ff       	callq  401400 <Except_raise>
  4021c0:	e9 64 ff ff ff       	jmpq   402129 <Mem_resize+0x29>
  4021c5:	0f 1f 00             	nopl   (%rax)
  4021c8:	48 8d 3d 11 0c 20 00 	lea    0x200c11(%rip),%rdi        # 602de0 <Mem_Failed>
  4021cf:	48 8d 35 d6 01 00 00 	lea    0x1d6(%rip),%rsi        # 4023ac <_IO_stdin_used+0x134>
  4021d6:	ba 30 00 00 00       	mov    $0x30,%edx
  4021db:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021e0:	e8 1b f2 ff ff       	callq  401400 <Except_raise>
  4021e5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4021ea:	e9 4f ff ff ff       	jmpq   40213e <Mem_resize+0x3e>
  4021ef:	90                   	nop

00000000004021f0 <__libc_csu_init>:
  4021f0:	f3 0f 1e fa          	endbr64 
  4021f4:	41 57                	push   %r15
  4021f6:	49 89 d7             	mov    %rdx,%r15
  4021f9:	41 56                	push   %r14
  4021fb:	49 89 f6             	mov    %rsi,%r14
  4021fe:	41 55                	push   %r13
  402200:	41 89 fd             	mov    %edi,%r13d
  402203:	41 54                	push   %r12
  402205:	4c 8d 25 bc 0b 20 00 	lea    0x200bbc(%rip),%r12        # 602dc8 <__frame_dummy_init_array_entry>
  40220c:	55                   	push   %rbp
  40220d:	48 8d 2d bc 0b 20 00 	lea    0x200bbc(%rip),%rbp        # 602dd0 <__init_array_end>
  402214:	53                   	push   %rbx
  402215:	4c 29 e5             	sub    %r12,%rbp
  402218:	48 83 ec 08          	sub    $0x8,%rsp
  40221c:	e8 4f e7 ff ff       	callq  400970 <_init>
  402221:	48 c1 fd 03          	sar    $0x3,%rbp
  402225:	74 1f                	je     402246 <__libc_csu_init+0x56>
  402227:	31 db                	xor    %ebx,%ebx
  402229:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402230:	4c 89 fa             	mov    %r15,%rdx
  402233:	4c 89 f6             	mov    %r14,%rsi
  402236:	44 89 ef             	mov    %r13d,%edi
  402239:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40223d:	48 83 c3 01          	add    $0x1,%rbx
  402241:	48 39 dd             	cmp    %rbx,%rbp
  402244:	75 ea                	jne    402230 <__libc_csu_init+0x40>
  402246:	48 83 c4 08          	add    $0x8,%rsp
  40224a:	5b                   	pop    %rbx
  40224b:	5d                   	pop    %rbp
  40224c:	41 5c                	pop    %r12
  40224e:	41 5d                	pop    %r13
  402250:	41 5e                	pop    %r14
  402252:	41 5f                	pop    %r15
  402254:	c3                   	retq   

0000000000402255 <.annobin___libc_csu_fini.start>:
  402255:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40225c:	00 00 00 00 

0000000000402260 <__libc_csu_fini>:
  402260:	f3 0f 1e fa          	endbr64 
  402264:	c3                   	retq   

Disassembly of section .fini:

0000000000402268 <_fini>:
  402268:	f3 0f 1e fa          	endbr64 
  40226c:	48 83 ec 08          	sub    $0x8,%rsp
  402270:	48 83 c4 08          	add    $0x8,%rsp
  402274:	c3                   	retq   
