
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
void kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

void
kern_init(void){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 18 ea 10 00       	mov    $0x10ea18,%eax
  100010:	89 d1                	mov    %edx,%ecx
  100012:	29 c1                	sub    %eax,%ecx
  100014:	89 c8                	mov    %ecx,%eax
  100016:	89 44 24 08          	mov    %eax,0x8(%esp)
  10001a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100021:	00 
  100022:	c7 04 24 18 ea 10 00 	movl   $0x10ea18,(%esp)
  100029:	e8 ad 34 00 00       	call   1034db <memset>

    cons_init();                // init the console
  10002e:	e8 cb 15 00 00       	call   1015fe <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100033:	c7 45 f4 a0 36 10 00 	movl   $0x1036a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10003a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100041:	c7 04 24 bc 36 10 00 	movl   $0x1036bc,(%esp)
  100048:	e8 de 02 00 00       	call   10032b <cprintf>

    print_kerninfo();
  10004d:	e8 e8 07 00 00       	call   10083a <print_kerninfo>

    grade_backtrace();
  100052:	e8 8b 00 00 00       	call   1000e2 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100057:	e8 71 2a 00 00       	call   102acd <pmm_init>

    pic_init();                 // init interrupt controller
  10005c:	e8 e8 16 00 00       	call   101749 <pic_init>
    idt_init();                 // init interrupt descriptor table
  100061:	e8 3a 18 00 00       	call   1018a0 <idt_init>

    clock_init();               // init clock interrupt
  100066:	e8 e5 0c 00 00       	call   100d50 <clock_init>
    intr_enable();              // enable irq interrupt
  10006b:	e8 40 16 00 00       	call   1016b0 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  100070:	e8 6d 01 00 00       	call   1001e2 <lab1_switch_test>

    /* do nothing */
    while (1);
  100075:	eb fe                	jmp    100075 <kern_init+0x75>

00100077 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100077:	55                   	push   %ebp
  100078:	89 e5                	mov    %esp,%ebp
  10007a:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007d:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100084:	00 
  100085:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008c:	00 
  10008d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100094:	e8 e1 0b 00 00       	call   100c7a <mon_backtrace>
}
  100099:	c9                   	leave  
  10009a:	c3                   	ret    

0010009b <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009b:	55                   	push   %ebp
  10009c:	89 e5                	mov    %esp,%ebp
  10009e:	53                   	push   %ebx
  10009f:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a2:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a8:	8d 55 08             	lea    0x8(%ebp),%edx
  1000ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ae:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000b2:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b6:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000ba:	89 04 24             	mov    %eax,(%esp)
  1000bd:	e8 b5 ff ff ff       	call   100077 <grade_backtrace2>
}
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 bb ff ff ff       	call   10009b <grade_backtrace1>
}
  1000e0:	c9                   	leave  
  1000e1:	c3                   	ret    

001000e2 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e2:	55                   	push   %ebp
  1000e3:	89 e5                	mov    %esp,%ebp
  1000e5:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e8:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ed:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f4:	ff 
  1000f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100100:	e8 c3 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100105:	c9                   	leave  
  100106:	c3                   	ret    

00100107 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100107:	55                   	push   %ebp
  100108:	89 e5                	mov    %esp,%ebp
  10010a:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010d:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100110:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100113:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100116:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100119:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011d:	0f b7 c0             	movzwl %ax,%eax
  100120:	89 c2                	mov    %eax,%edx
  100122:	83 e2 03             	and    $0x3,%edx
  100125:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10012a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100132:	c7 04 24 c1 36 10 00 	movl   $0x1036c1,(%esp)
  100139:	e8 ed 01 00 00       	call   10032b <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100142:	0f b7 d0             	movzwl %ax,%edx
  100145:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10014a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100152:	c7 04 24 cf 36 10 00 	movl   $0x1036cf,(%esp)
  100159:	e8 cd 01 00 00       	call   10032b <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015e:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100162:	0f b7 d0             	movzwl %ax,%edx
  100165:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10016a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100172:	c7 04 24 dd 36 10 00 	movl   $0x1036dd,(%esp)
  100179:	e8 ad 01 00 00       	call   10032b <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100182:	0f b7 d0             	movzwl %ax,%edx
  100185:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  10018a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100192:	c7 04 24 eb 36 10 00 	movl   $0x1036eb,(%esp)
  100199:	e8 8d 01 00 00       	call   10032b <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019e:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001a2:	0f b7 d0             	movzwl %ax,%edx
  1001a5:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001aa:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001b2:	c7 04 24 f9 36 10 00 	movl   $0x1036f9,(%esp)
  1001b9:	e8 6d 01 00 00       	call   10032b <cprintf>
    round ++;
  1001be:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001c3:	83 c0 01             	add    $0x1,%eax
  1001c6:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001cb:	c9                   	leave  
  1001cc:	c3                   	ret    

001001cd <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001cd:	55                   	push   %ebp
  1001ce:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
	asm volatile (
  1001d0:	83 ec 08             	sub    $0x8,%esp
  1001d3:	cd 78                	int    $0x78
  1001d5:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001d7:	5d                   	pop    %ebp
  1001d8:	c3                   	ret    

001001d9 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d9:	55                   	push   %ebp
  1001da:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
	asm volatile (
  1001dc:	cd 79                	int    $0x79
  1001de:	89 ec                	mov    %ebp,%esp
	    "int %0 \n"
	    "movl %%ebp, %%esp \n"
	    : 
	    : "i"(T_SWITCH_TOK)
	);
}
  1001e0:	5d                   	pop    %ebp
  1001e1:	c3                   	ret    

001001e2 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001e2:	55                   	push   %ebp
  1001e3:	89 e5                	mov    %esp,%ebp
  1001e5:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e8:	e8 1a ff ff ff       	call   100107 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001ed:	c7 04 24 08 37 10 00 	movl   $0x103708,(%esp)
  1001f4:	e8 32 01 00 00       	call   10032b <cprintf>
    lab1_switch_to_user();
  1001f9:	e8 cf ff ff ff       	call   1001cd <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fe:	e8 04 ff ff ff       	call   100107 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  100203:	c7 04 24 28 37 10 00 	movl   $0x103728,(%esp)
  10020a:	e8 1c 01 00 00       	call   10032b <cprintf>
    lab1_switch_to_kernel();
  10020f:	e8 c5 ff ff ff       	call   1001d9 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100214:	e8 ee fe ff ff       	call   100107 <lab1_print_cur_status>
}
  100219:	c9                   	leave  
  10021a:	c3                   	ret    
	...

0010021c <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10021c:	55                   	push   %ebp
  10021d:	89 e5                	mov    %esp,%ebp
  10021f:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100222:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100226:	74 13                	je     10023b <readline+0x1f>
        cprintf("%s", prompt);
  100228:	8b 45 08             	mov    0x8(%ebp),%eax
  10022b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10022f:	c7 04 24 47 37 10 00 	movl   $0x103747,(%esp)
  100236:	e8 f0 00 00 00       	call   10032b <cprintf>
    }
    int i = 0, c;
  10023b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100242:	eb 01                	jmp    100245 <readline+0x29>
        else if (c == '\n' || c == '\r') {
            cputchar(c);
            buf[i] = '\0';
            return buf;
        }
    }
  100244:	90                   	nop
    if (prompt != NULL) {
        cprintf("%s", prompt);
    }
    int i = 0, c;
    while (1) {
        c = getchar();
  100245:	e8 6e 01 00 00       	call   1003b8 <getchar>
  10024a:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10024d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100251:	79 07                	jns    10025a <readline+0x3e>
            return NULL;
  100253:	b8 00 00 00 00       	mov    $0x0,%eax
  100258:	eb 79                	jmp    1002d3 <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10025a:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10025e:	7e 28                	jle    100288 <readline+0x6c>
  100260:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100267:	7f 1f                	jg     100288 <readline+0x6c>
            cputchar(c);
  100269:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10026c:	89 04 24             	mov    %eax,(%esp)
  10026f:	e8 df 00 00 00       	call   100353 <cputchar>
            buf[i ++] = c;
  100274:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100277:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10027a:	81 c2 40 ea 10 00    	add    $0x10ea40,%edx
  100280:	88 02                	mov    %al,(%edx)
  100282:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100286:	eb 46                	jmp    1002ce <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  100288:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10028c:	75 17                	jne    1002a5 <readline+0x89>
  10028e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100292:	7e 11                	jle    1002a5 <readline+0x89>
            cputchar(c);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 04 24             	mov    %eax,(%esp)
  10029a:	e8 b4 00 00 00       	call   100353 <cputchar>
            i --;
  10029f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1002a3:	eb 29                	jmp    1002ce <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1002a5:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1002a9:	74 06                	je     1002b1 <readline+0x95>
  1002ab:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1002af:	75 93                	jne    100244 <readline+0x28>
            cputchar(c);
  1002b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002b4:	89 04 24             	mov    %eax,(%esp)
  1002b7:	e8 97 00 00 00       	call   100353 <cputchar>
            buf[i] = '\0';
  1002bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002bf:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002c4:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002c7:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002cc:	eb 05                	jmp    1002d3 <readline+0xb7>
        }
    }
  1002ce:	e9 71 ff ff ff       	jmp    100244 <readline+0x28>
}
  1002d3:	c9                   	leave  
  1002d4:	c3                   	ret    
  1002d5:	00 00                	add    %al,(%eax)
	...

001002d8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002d8:	55                   	push   %ebp
  1002d9:	89 e5                	mov    %esp,%ebp
  1002db:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002de:	8b 45 08             	mov    0x8(%ebp),%eax
  1002e1:	89 04 24             	mov    %eax,(%esp)
  1002e4:	e8 41 13 00 00       	call   10162a <cons_putc>
    (*cnt) ++;
  1002e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ec:	8b 00                	mov    (%eax),%eax
  1002ee:	8d 50 01             	lea    0x1(%eax),%edx
  1002f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002f4:	89 10                	mov    %edx,(%eax)
}
  1002f6:	c9                   	leave  
  1002f7:	c3                   	ret    

001002f8 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002f8:	55                   	push   %ebp
  1002f9:	89 e5                	mov    %esp,%ebp
  1002fb:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100305:	8b 45 0c             	mov    0xc(%ebp),%eax
  100308:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10030c:	8b 45 08             	mov    0x8(%ebp),%eax
  10030f:	89 44 24 08          	mov    %eax,0x8(%esp)
  100313:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100316:	89 44 24 04          	mov    %eax,0x4(%esp)
  10031a:	c7 04 24 d8 02 10 00 	movl   $0x1002d8,(%esp)
  100321:	e8 b8 29 00 00       	call   102cde <vprintfmt>
    return cnt;
  100326:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100329:	c9                   	leave  
  10032a:	c3                   	ret    

0010032b <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10032b:	55                   	push   %ebp
  10032c:	89 e5                	mov    %esp,%ebp
  10032e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100331:	8d 55 0c             	lea    0xc(%ebp),%edx
  100334:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100337:	89 10                	mov    %edx,(%eax)
    cnt = vcprintf(fmt, ap);
  100339:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10033c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100340:	8b 45 08             	mov    0x8(%ebp),%eax
  100343:	89 04 24             	mov    %eax,(%esp)
  100346:	e8 ad ff ff ff       	call   1002f8 <vcprintf>
  10034b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10034e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100351:	c9                   	leave  
  100352:	c3                   	ret    

00100353 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100353:	55                   	push   %ebp
  100354:	89 e5                	mov    %esp,%ebp
  100356:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100359:	8b 45 08             	mov    0x8(%ebp),%eax
  10035c:	89 04 24             	mov    %eax,(%esp)
  10035f:	e8 c6 12 00 00       	call   10162a <cons_putc>
}
  100364:	c9                   	leave  
  100365:	c3                   	ret    

00100366 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100366:	55                   	push   %ebp
  100367:	89 e5                	mov    %esp,%ebp
  100369:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10036c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100373:	eb 13                	jmp    100388 <cputs+0x22>
        cputch(c, &cnt);
  100375:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100379:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10037c:	89 54 24 04          	mov    %edx,0x4(%esp)
  100380:	89 04 24             	mov    %eax,(%esp)
  100383:	e8 50 ff ff ff       	call   1002d8 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100388:	8b 45 08             	mov    0x8(%ebp),%eax
  10038b:	0f b6 00             	movzbl (%eax),%eax
  10038e:	88 45 f7             	mov    %al,-0x9(%ebp)
  100391:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100395:	0f 95 c0             	setne  %al
  100398:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10039c:	84 c0                	test   %al,%al
  10039e:	75 d5                	jne    100375 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1003a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1003a3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003a7:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1003ae:	e8 25 ff ff ff       	call   1002d8 <cputch>
    return cnt;
  1003b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003b6:	c9                   	leave  
  1003b7:	c3                   	ret    

001003b8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003b8:	55                   	push   %ebp
  1003b9:	89 e5                	mov    %esp,%ebp
  1003bb:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003be:	e8 90 12 00 00       	call   101653 <cons_getc>
  1003c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ca:	74 f2                	je     1003be <getchar+0x6>
        /* do nothing */;
    return c;
  1003cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003cf:	c9                   	leave  
  1003d0:	c3                   	ret    
  1003d1:	00 00                	add    %al,(%eax)
	...

001003d4 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003d4:	55                   	push   %ebp
  1003d5:	89 e5                	mov    %esp,%ebp
  1003d7:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003dd:	8b 00                	mov    (%eax),%eax
  1003df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003e2:	8b 45 10             	mov    0x10(%ebp),%eax
  1003e5:	8b 00                	mov    (%eax),%eax
  1003e7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003f1:	e9 c6 00 00 00       	jmp    1004bc <stab_binsearch+0xe8>
        int true_m = (l + r) / 2, m = true_m;
  1003f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003fc:	01 d0                	add    %edx,%eax
  1003fe:	89 c2                	mov    %eax,%edx
  100400:	c1 ea 1f             	shr    $0x1f,%edx
  100403:	01 d0                	add    %edx,%eax
  100405:	d1 f8                	sar    %eax
  100407:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10040a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10040d:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100410:	eb 04                	jmp    100416 <stab_binsearch+0x42>
            m --;
  100412:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100416:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100419:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10041c:	7c 1b                	jl     100439 <stab_binsearch+0x65>
  10041e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100421:	89 d0                	mov    %edx,%eax
  100423:	01 c0                	add    %eax,%eax
  100425:	01 d0                	add    %edx,%eax
  100427:	c1 e0 02             	shl    $0x2,%eax
  10042a:	03 45 08             	add    0x8(%ebp),%eax
  10042d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100431:	0f b6 c0             	movzbl %al,%eax
  100434:	3b 45 14             	cmp    0x14(%ebp),%eax
  100437:	75 d9                	jne    100412 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100439:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10043c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10043f:	7d 0b                	jge    10044c <stab_binsearch+0x78>
            l = true_m + 1;
  100441:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100444:	83 c0 01             	add    $0x1,%eax
  100447:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10044a:	eb 70                	jmp    1004bc <stab_binsearch+0xe8>
        }

        // actual binary search
        any_matches = 1;
  10044c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100453:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100456:	89 d0                	mov    %edx,%eax
  100458:	01 c0                	add    %eax,%eax
  10045a:	01 d0                	add    %edx,%eax
  10045c:	c1 e0 02             	shl    $0x2,%eax
  10045f:	03 45 08             	add    0x8(%ebp),%eax
  100462:	8b 40 08             	mov    0x8(%eax),%eax
  100465:	3b 45 18             	cmp    0x18(%ebp),%eax
  100468:	73 13                	jae    10047d <stab_binsearch+0xa9>
            *region_left = m;
  10046a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10046d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100470:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100472:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100475:	83 c0 01             	add    $0x1,%eax
  100478:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10047b:	eb 3f                	jmp    1004bc <stab_binsearch+0xe8>
        } else if (stabs[m].n_value > addr) {
  10047d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100480:	89 d0                	mov    %edx,%eax
  100482:	01 c0                	add    %eax,%eax
  100484:	01 d0                	add    %edx,%eax
  100486:	c1 e0 02             	shl    $0x2,%eax
  100489:	03 45 08             	add    0x8(%ebp),%eax
  10048c:	8b 40 08             	mov    0x8(%eax),%eax
  10048f:	3b 45 18             	cmp    0x18(%ebp),%eax
  100492:	76 16                	jbe    1004aa <stab_binsearch+0xd6>
            *region_right = m - 1;
  100494:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100497:	8d 50 ff             	lea    -0x1(%eax),%edx
  10049a:	8b 45 10             	mov    0x10(%ebp),%eax
  10049d:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10049f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a2:	83 e8 01             	sub    $0x1,%eax
  1004a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a8:	eb 12                	jmp    1004bc <stab_binsearch+0xe8>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1004aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1004b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004b8:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004c2:	0f 8e 2e ff ff ff    	jle    1003f6 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004cc:	75 0f                	jne    1004dd <stab_binsearch+0x109>
        *region_right = *region_left - 1;
  1004ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d1:	8b 00                	mov    (%eax),%eax
  1004d3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004d6:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d9:	89 10                	mov    %edx,(%eax)
  1004db:	eb 3b                	jmp    100518 <stab_binsearch+0x144>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004e5:	eb 04                	jmp    1004eb <stab_binsearch+0x117>
  1004e7:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004ee:	8b 00                	mov    (%eax),%eax
  1004f0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004f3:	7d 1b                	jge    100510 <stab_binsearch+0x13c>
  1004f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f8:	89 d0                	mov    %edx,%eax
  1004fa:	01 c0                	add    %eax,%eax
  1004fc:	01 d0                	add    %edx,%eax
  1004fe:	c1 e0 02             	shl    $0x2,%eax
  100501:	03 45 08             	add    0x8(%ebp),%eax
  100504:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100508:	0f b6 c0             	movzbl %al,%eax
  10050b:	3b 45 14             	cmp    0x14(%ebp),%eax
  10050e:	75 d7                	jne    1004e7 <stab_binsearch+0x113>
            /* do nothing */;
        *region_left = l;
  100510:	8b 45 0c             	mov    0xc(%ebp),%eax
  100513:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100516:	89 10                	mov    %edx,(%eax)
    }
}
  100518:	c9                   	leave  
  100519:	c3                   	ret    

0010051a <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10051a:	55                   	push   %ebp
  10051b:	89 e5                	mov    %esp,%ebp
  10051d:	53                   	push   %ebx
  10051e:	83 ec 54             	sub    $0x54,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100521:	8b 45 0c             	mov    0xc(%ebp),%eax
  100524:	c7 00 4c 37 10 00    	movl   $0x10374c,(%eax)
    info->eip_line = 0;
  10052a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100534:	8b 45 0c             	mov    0xc(%ebp),%eax
  100537:	c7 40 08 4c 37 10 00 	movl   $0x10374c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10053e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100541:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100548:	8b 45 0c             	mov    0xc(%ebp),%eax
  10054b:	8b 55 08             	mov    0x8(%ebp),%edx
  10054e:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100551:	8b 45 0c             	mov    0xc(%ebp),%eax
  100554:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10055b:	c7 45 f4 ac 3f 10 00 	movl   $0x103fac,-0xc(%ebp)
    stab_end = __STAB_END__;
  100562:	c7 45 f0 20 b9 10 00 	movl   $0x10b920,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100569:	c7 45 ec 21 b9 10 00 	movl   $0x10b921,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100570:	c7 45 e8 f8 d8 10 00 	movl   $0x10d8f8,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100577:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10057a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10057d:	76 0d                	jbe    10058c <debuginfo_eip+0x72>
  10057f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100582:	83 e8 01             	sub    $0x1,%eax
  100585:	0f b6 00             	movzbl (%eax),%eax
  100588:	84 c0                	test   %al,%al
  10058a:	74 0a                	je     100596 <debuginfo_eip+0x7c>
        return -1;
  10058c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100591:	e9 9e 02 00 00       	jmp    100834 <debuginfo_eip+0x31a>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100596:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10059d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005a3:	89 d1                	mov    %edx,%ecx
  1005a5:	29 c1                	sub    %eax,%ecx
  1005a7:	89 c8                	mov    %ecx,%eax
  1005a9:	c1 f8 02             	sar    $0x2,%eax
  1005ac:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005b2:	83 e8 01             	sub    $0x1,%eax
  1005b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005bb:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005bf:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005c6:	00 
  1005c7:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005ca:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ce:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005d8:	89 04 24             	mov    %eax,(%esp)
  1005db:	e8 f4 fd ff ff       	call   1003d4 <stab_binsearch>
    if (lfile == 0)
  1005e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e3:	85 c0                	test   %eax,%eax
  1005e5:	75 0a                	jne    1005f1 <debuginfo_eip+0xd7>
        return -1;
  1005e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005ec:	e9 43 02 00 00       	jmp    100834 <debuginfo_eip+0x31a>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005f4:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005fd:	8b 45 08             	mov    0x8(%ebp),%eax
  100600:	89 44 24 10          	mov    %eax,0x10(%esp)
  100604:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  10060b:	00 
  10060c:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10060f:	89 44 24 08          	mov    %eax,0x8(%esp)
  100613:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100616:	89 44 24 04          	mov    %eax,0x4(%esp)
  10061a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10061d:	89 04 24             	mov    %eax,(%esp)
  100620:	e8 af fd ff ff       	call   1003d4 <stab_binsearch>

    if (lfun <= rfun) {
  100625:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100628:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10062b:	39 c2                	cmp    %eax,%edx
  10062d:	7f 72                	jg     1006a1 <debuginfo_eip+0x187>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10062f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100632:	89 c2                	mov    %eax,%edx
  100634:	89 d0                	mov    %edx,%eax
  100636:	01 c0                	add    %eax,%eax
  100638:	01 d0                	add    %edx,%eax
  10063a:	c1 e0 02             	shl    $0x2,%eax
  10063d:	03 45 f4             	add    -0xc(%ebp),%eax
  100640:	8b 10                	mov    (%eax),%edx
  100642:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100645:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100648:	89 cb                	mov    %ecx,%ebx
  10064a:	29 c3                	sub    %eax,%ebx
  10064c:	89 d8                	mov    %ebx,%eax
  10064e:	39 c2                	cmp    %eax,%edx
  100650:	73 1e                	jae    100670 <debuginfo_eip+0x156>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100652:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100655:	89 c2                	mov    %eax,%edx
  100657:	89 d0                	mov    %edx,%eax
  100659:	01 c0                	add    %eax,%eax
  10065b:	01 d0                	add    %edx,%eax
  10065d:	c1 e0 02             	shl    $0x2,%eax
  100660:	03 45 f4             	add    -0xc(%ebp),%eax
  100663:	8b 00                	mov    (%eax),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	03 55 ec             	add    -0x14(%ebp),%edx
  10066a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10066d:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100670:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100673:	89 c2                	mov    %eax,%edx
  100675:	89 d0                	mov    %edx,%eax
  100677:	01 c0                	add    %eax,%eax
  100679:	01 d0                	add    %edx,%eax
  10067b:	c1 e0 02             	shl    $0x2,%eax
  10067e:	03 45 f4             	add    -0xc(%ebp),%eax
  100681:	8b 50 08             	mov    0x8(%eax),%edx
  100684:	8b 45 0c             	mov    0xc(%ebp),%eax
  100687:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10068a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10068d:	8b 40 10             	mov    0x10(%eax),%eax
  100690:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100693:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100696:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100699:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10069c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10069f:	eb 15                	jmp    1006b6 <debuginfo_eip+0x19c>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1006a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a4:	8b 55 08             	mov    0x8(%ebp),%edx
  1006a7:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b3:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006b9:	8b 40 08             	mov    0x8(%eax),%eax
  1006bc:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006c3:	00 
  1006c4:	89 04 24             	mov    %eax,(%esp)
  1006c7:	e8 87 2c 00 00       	call   103353 <strfind>
  1006cc:	89 c2                	mov    %eax,%edx
  1006ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d1:	8b 40 08             	mov    0x8(%eax),%eax
  1006d4:	29 c2                	sub    %eax,%edx
  1006d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006d9:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006df:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006e3:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006ea:	00 
  1006eb:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006ee:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006f2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006fc:	89 04 24             	mov    %eax,(%esp)
  1006ff:	e8 d0 fc ff ff       	call   1003d4 <stab_binsearch>
    if (lline <= rline) {
  100704:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100707:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10070a:	39 c2                	cmp    %eax,%edx
  10070c:	7f 20                	jg     10072e <debuginfo_eip+0x214>
        info->eip_line = stabs[rline].n_desc;
  10070e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100711:	89 c2                	mov    %eax,%edx
  100713:	89 d0                	mov    %edx,%eax
  100715:	01 c0                	add    %eax,%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	c1 e0 02             	shl    $0x2,%eax
  10071c:	03 45 f4             	add    -0xc(%ebp),%eax
  10071f:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100723:	0f b7 d0             	movzwl %ax,%edx
  100726:	8b 45 0c             	mov    0xc(%ebp),%eax
  100729:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10072c:	eb 13                	jmp    100741 <debuginfo_eip+0x227>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10072e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100733:	e9 fc 00 00 00       	jmp    100834 <debuginfo_eip+0x31a>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100738:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073b:	83 e8 01             	sub    $0x1,%eax
  10073e:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100741:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100744:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100747:	39 c2                	cmp    %eax,%edx
  100749:	7c 4a                	jl     100795 <debuginfo_eip+0x27b>
           && stabs[lline].n_type != N_SOL
  10074b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10074e:	89 c2                	mov    %eax,%edx
  100750:	89 d0                	mov    %edx,%eax
  100752:	01 c0                	add    %eax,%eax
  100754:	01 d0                	add    %edx,%eax
  100756:	c1 e0 02             	shl    $0x2,%eax
  100759:	03 45 f4             	add    -0xc(%ebp),%eax
  10075c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100760:	3c 84                	cmp    $0x84,%al
  100762:	74 31                	je     100795 <debuginfo_eip+0x27b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100764:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100767:	89 c2                	mov    %eax,%edx
  100769:	89 d0                	mov    %edx,%eax
  10076b:	01 c0                	add    %eax,%eax
  10076d:	01 d0                	add    %edx,%eax
  10076f:	c1 e0 02             	shl    $0x2,%eax
  100772:	03 45 f4             	add    -0xc(%ebp),%eax
  100775:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100779:	3c 64                	cmp    $0x64,%al
  10077b:	75 bb                	jne    100738 <debuginfo_eip+0x21e>
  10077d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100780:	89 c2                	mov    %eax,%edx
  100782:	89 d0                	mov    %edx,%eax
  100784:	01 c0                	add    %eax,%eax
  100786:	01 d0                	add    %edx,%eax
  100788:	c1 e0 02             	shl    $0x2,%eax
  10078b:	03 45 f4             	add    -0xc(%ebp),%eax
  10078e:	8b 40 08             	mov    0x8(%eax),%eax
  100791:	85 c0                	test   %eax,%eax
  100793:	74 a3                	je     100738 <debuginfo_eip+0x21e>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100795:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100798:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10079b:	39 c2                	cmp    %eax,%edx
  10079d:	7c 40                	jl     1007df <debuginfo_eip+0x2c5>
  10079f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a2:	89 c2                	mov    %eax,%edx
  1007a4:	89 d0                	mov    %edx,%eax
  1007a6:	01 c0                	add    %eax,%eax
  1007a8:	01 d0                	add    %edx,%eax
  1007aa:	c1 e0 02             	shl    $0x2,%eax
  1007ad:	03 45 f4             	add    -0xc(%ebp),%eax
  1007b0:	8b 10                	mov    (%eax),%edx
  1007b2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007b8:	89 cb                	mov    %ecx,%ebx
  1007ba:	29 c3                	sub    %eax,%ebx
  1007bc:	89 d8                	mov    %ebx,%eax
  1007be:	39 c2                	cmp    %eax,%edx
  1007c0:	73 1d                	jae    1007df <debuginfo_eip+0x2c5>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007c5:	89 c2                	mov    %eax,%edx
  1007c7:	89 d0                	mov    %edx,%eax
  1007c9:	01 c0                	add    %eax,%eax
  1007cb:	01 d0                	add    %edx,%eax
  1007cd:	c1 e0 02             	shl    $0x2,%eax
  1007d0:	03 45 f4             	add    -0xc(%ebp),%eax
  1007d3:	8b 00                	mov    (%eax),%eax
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	03 55 ec             	add    -0x14(%ebp),%edx
  1007da:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007dd:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007df:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007e5:	39 c2                	cmp    %eax,%edx
  1007e7:	7d 46                	jge    10082f <debuginfo_eip+0x315>
        for (lline = lfun + 1;
  1007e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007ec:	83 c0 01             	add    $0x1,%eax
  1007ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007f2:	eb 18                	jmp    10080c <debuginfo_eip+0x2f2>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f7:	8b 40 14             	mov    0x14(%eax),%eax
  1007fa:	8d 50 01             	lea    0x1(%eax),%edx
  1007fd:	8b 45 0c             	mov    0xc(%ebp),%eax
  100800:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  100803:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100806:	83 c0 01             	add    $0x1,%eax
  100809:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  10080c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080f:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100812:	39 c2                	cmp    %eax,%edx
  100814:	7d 19                	jge    10082f <debuginfo_eip+0x315>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100816:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100819:	89 c2                	mov    %eax,%edx
  10081b:	89 d0                	mov    %edx,%eax
  10081d:	01 c0                	add    %eax,%eax
  10081f:	01 d0                	add    %edx,%eax
  100821:	c1 e0 02             	shl    $0x2,%eax
  100824:	03 45 f4             	add    -0xc(%ebp),%eax
  100827:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082b:	3c a0                	cmp    $0xa0,%al
  10082d:	74 c5                	je     1007f4 <debuginfo_eip+0x2da>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10082f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100834:	83 c4 54             	add    $0x54,%esp
  100837:	5b                   	pop    %ebx
  100838:	5d                   	pop    %ebp
  100839:	c3                   	ret    

0010083a <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10083a:	55                   	push   %ebp
  10083b:	89 e5                	mov    %esp,%ebp
  10083d:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100840:	c7 04 24 56 37 10 00 	movl   $0x103756,(%esp)
  100847:	e8 df fa ff ff       	call   10032b <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10084c:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100853:	00 
  100854:	c7 04 24 6f 37 10 00 	movl   $0x10376f,(%esp)
  10085b:	e8 cb fa ff ff       	call   10032b <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100860:	c7 44 24 04 93 36 10 	movl   $0x103693,0x4(%esp)
  100867:	00 
  100868:	c7 04 24 87 37 10 00 	movl   $0x103787,(%esp)
  10086f:	e8 b7 fa ff ff       	call   10032b <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100874:	c7 44 24 04 18 ea 10 	movl   $0x10ea18,0x4(%esp)
  10087b:	00 
  10087c:	c7 04 24 9f 37 10 00 	movl   $0x10379f,(%esp)
  100883:	e8 a3 fa ff ff       	call   10032b <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100888:	c7 44 24 04 80 fd 10 	movl   $0x10fd80,0x4(%esp)
  10088f:	00 
  100890:	c7 04 24 b7 37 10 00 	movl   $0x1037b7,(%esp)
  100897:	e8 8f fa ff ff       	call   10032b <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  10089c:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  1008a1:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008a7:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008ac:	89 d1                	mov    %edx,%ecx
  1008ae:	29 c1                	sub    %eax,%ecx
  1008b0:	89 c8                	mov    %ecx,%eax
  1008b2:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b8:	85 c0                	test   %eax,%eax
  1008ba:	0f 48 c2             	cmovs  %edx,%eax
  1008bd:	c1 f8 0a             	sar    $0xa,%eax
  1008c0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008c4:	c7 04 24 d0 37 10 00 	movl   $0x1037d0,(%esp)
  1008cb:	e8 5b fa ff ff       	call   10032b <cprintf>
}
  1008d0:	c9                   	leave  
  1008d1:	c3                   	ret    

001008d2 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008d2:	55                   	push   %ebp
  1008d3:	89 e5                	mov    %esp,%ebp
  1008d5:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008db:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008de:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e5:	89 04 24             	mov    %eax,(%esp)
  1008e8:	e8 2d fc ff ff       	call   10051a <debuginfo_eip>
  1008ed:	85 c0                	test   %eax,%eax
  1008ef:	74 15                	je     100906 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008f8:	c7 04 24 fa 37 10 00 	movl   $0x1037fa,(%esp)
  1008ff:	e8 27 fa ff ff       	call   10032b <cprintf>
  100904:	eb 69                	jmp    10096f <print_debuginfo+0x9d>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100906:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10090d:	eb 1a                	jmp    100929 <print_debuginfo+0x57>
            fnname[j] = info.eip_fn_name[j];
  10090f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100912:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100915:	01 d0                	add    %edx,%eax
  100917:	0f b6 10             	movzbl (%eax),%edx
  10091a:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100920:	03 45 f4             	add    -0xc(%ebp),%eax
  100923:	88 10                	mov    %dl,(%eax)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100925:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100929:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10092c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10092f:	7f de                	jg     10090f <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100931:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100937:	03 45 f4             	add    -0xc(%ebp),%eax
  10093a:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10093d:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100940:	8b 55 08             	mov    0x8(%ebp),%edx
  100943:	89 d1                	mov    %edx,%ecx
  100945:	29 c1                	sub    %eax,%ecx
  100947:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10094a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10094d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
                fnname, eip - info.eip_fn_addr);
  100951:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100957:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10095b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10095f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100963:	c7 04 24 16 38 10 00 	movl   $0x103816,(%esp)
  10096a:	e8 bc f9 ff ff       	call   10032b <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10096f:	c9                   	leave  
  100970:	c3                   	ret    

00100971 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100971:	55                   	push   %ebp
  100972:	89 e5                	mov    %esp,%ebp
  100974:	53                   	push   %ebx
  100975:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100978:	8b 5d 04             	mov    0x4(%ebp),%ebx
  10097b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    return eip;
  10097e:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  100981:	83 c4 10             	add    $0x10,%esp
  100984:	5b                   	pop    %ebx
  100985:	5d                   	pop    %ebp
  100986:	c3                   	ret    

00100987 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100987:	55                   	push   %ebp
  100988:	89 e5                	mov    %esp,%ebp
  10098a:	53                   	push   %ebx
  10098b:	83 ec 34             	sub    $0x34,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10098e:	89 eb                	mov    %ebp,%ebx
  100990:	89 5d e0             	mov    %ebx,-0x20(%ebp)
    return ebp;
  100993:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100996:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100999:	e8 d3 ff ff ff       	call   100971 <read_eip>
  10099e:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  1009a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009a8:	e9 82 00 00 00       	jmp    100a2f <print_stackframe+0xa8>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  1009ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009b0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009bb:	c7 04 24 28 38 10 00 	movl   $0x103828,(%esp)
  1009c2:	e8 64 f9 ff ff       	call   10032b <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  1009c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ca:	83 c0 08             	add    $0x8,%eax
  1009cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  1009d0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009d7:	eb 1f                	jmp    1009f8 <print_stackframe+0x71>
            cprintf("0x%08x ", args[j]);
  1009d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009dc:	c1 e0 02             	shl    $0x2,%eax
  1009df:	03 45 e4             	add    -0x1c(%ebp),%eax
  1009e2:	8b 00                	mov    (%eax),%eax
  1009e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009e8:	c7 04 24 44 38 10 00 	movl   $0x103844,(%esp)
  1009ef:	e8 37 f9 ff ff       	call   10032b <cprintf>

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
        uint32_t *args = (uint32_t *)ebp + 2;
        for (j = 0; j < 4; j ++) {
  1009f4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  1009f8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1009fc:	7e db                	jle    1009d9 <print_stackframe+0x52>
            cprintf("0x%08x ", args[j]);
        }
        cprintf("\n");
  1009fe:	c7 04 24 4c 38 10 00 	movl   $0x10384c,(%esp)
  100a05:	e8 21 f9 ff ff       	call   10032b <cprintf>
        print_debuginfo(eip - 1);
  100a0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a0d:	83 e8 01             	sub    $0x1,%eax
  100a10:	89 04 24             	mov    %eax,(%esp)
  100a13:	e8 ba fe ff ff       	call   1008d2 <print_debuginfo>
        eip = ((uint32_t *)ebp)[1];
  100a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a1b:	83 c0 04             	add    $0x4,%eax
  100a1e:	8b 00                	mov    (%eax),%eax
  100a20:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a26:	8b 00                	mov    (%eax),%eax
  100a28:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a2b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a33:	74 0a                	je     100a3f <print_stackframe+0xb8>
  100a35:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a39:	0f 8e 6e ff ff ff    	jle    1009ad <print_stackframe+0x26>
        cprintf("\n");
        print_debuginfo(eip - 1);
        eip = ((uint32_t *)ebp)[1];
        ebp = ((uint32_t *)ebp)[0];
    }
}
  100a3f:	83 c4 34             	add    $0x34,%esp
  100a42:	5b                   	pop    %ebx
  100a43:	5d                   	pop    %ebp
  100a44:	c3                   	ret    
  100a45:	00 00                	add    %al,(%eax)
	...

00100a48 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a48:	55                   	push   %ebp
  100a49:	89 e5                	mov    %esp,%ebp
  100a4b:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a55:	eb 0d                	jmp    100a64 <parse+0x1c>
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
  100a57:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a58:	eb 0a                	jmp    100a64 <parse+0x1c>
            *buf ++ = '\0';
  100a5a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5d:	c6 00 00             	movb   $0x0,(%eax)
  100a60:	83 45 08 01          	addl   $0x1,0x8(%ebp)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a64:	8b 45 08             	mov    0x8(%ebp),%eax
  100a67:	0f b6 00             	movzbl (%eax),%eax
  100a6a:	84 c0                	test   %al,%al
  100a6c:	74 1d                	je     100a8b <parse+0x43>
  100a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a71:	0f b6 00             	movzbl (%eax),%eax
  100a74:	0f be c0             	movsbl %al,%eax
  100a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a7b:	c7 04 24 d0 38 10 00 	movl   $0x1038d0,(%esp)
  100a82:	e8 99 28 00 00       	call   103320 <strchr>
  100a87:	85 c0                	test   %eax,%eax
  100a89:	75 cf                	jne    100a5a <parse+0x12>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8e:	0f b6 00             	movzbl (%eax),%eax
  100a91:	84 c0                	test   %al,%al
  100a93:	74 5e                	je     100af3 <parse+0xab>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a95:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a99:	75 14                	jne    100aaf <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a9b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aa2:	00 
  100aa3:	c7 04 24 d5 38 10 00 	movl   $0x1038d5,(%esp)
  100aaa:	e8 7c f8 ff ff       	call   10032b <cprintf>
        }
        argv[argc ++] = buf;
  100aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab2:	c1 e0 02             	shl    $0x2,%eax
  100ab5:	03 45 0c             	add    0xc(%ebp),%eax
  100ab8:	8b 55 08             	mov    0x8(%ebp),%edx
  100abb:	89 10                	mov    %edx,(%eax)
  100abd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac1:	eb 04                	jmp    100ac7 <parse+0x7f>
            buf ++;
  100ac3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ac7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aca:	0f b6 00             	movzbl (%eax),%eax
  100acd:	84 c0                	test   %al,%al
  100acf:	74 86                	je     100a57 <parse+0xf>
  100ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad4:	0f b6 00             	movzbl (%eax),%eax
  100ad7:	0f be c0             	movsbl %al,%eax
  100ada:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ade:	c7 04 24 d0 38 10 00 	movl   $0x1038d0,(%esp)
  100ae5:	e8 36 28 00 00       	call   103320 <strchr>
  100aea:	85 c0                	test   %eax,%eax
  100aec:	74 d5                	je     100ac3 <parse+0x7b>
            buf ++;
        }
    }
  100aee:	e9 64 ff ff ff       	jmp    100a57 <parse+0xf>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100af3:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100af7:	c9                   	leave  
  100af8:	c3                   	ret    

00100af9 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100af9:	55                   	push   %ebp
  100afa:	89 e5                	mov    %esp,%ebp
  100afc:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100aff:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b02:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b06:	8b 45 08             	mov    0x8(%ebp),%eax
  100b09:	89 04 24             	mov    %eax,(%esp)
  100b0c:	e8 37 ff ff ff       	call   100a48 <parse>
  100b11:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b14:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b18:	75 0a                	jne    100b24 <runcmd+0x2b>
        return 0;
  100b1a:	b8 00 00 00 00       	mov    $0x0,%eax
  100b1f:	e9 85 00 00 00       	jmp    100ba9 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b2b:	eb 5c                	jmp    100b89 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b2d:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b30:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b33:	89 d0                	mov    %edx,%eax
  100b35:	01 c0                	add    %eax,%eax
  100b37:	01 d0                	add    %edx,%eax
  100b39:	c1 e0 02             	shl    $0x2,%eax
  100b3c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b41:	8b 00                	mov    (%eax),%eax
  100b43:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b47:	89 04 24             	mov    %eax,(%esp)
  100b4a:	e8 2c 27 00 00       	call   10327b <strcmp>
  100b4f:	85 c0                	test   %eax,%eax
  100b51:	75 32                	jne    100b85 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b53:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b56:	89 d0                	mov    %edx,%eax
  100b58:	01 c0                	add    %eax,%eax
  100b5a:	01 d0                	add    %edx,%eax
  100b5c:	c1 e0 02             	shl    $0x2,%eax
  100b5f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b64:	8b 50 08             	mov    0x8(%eax),%edx
  100b67:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b6a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b70:	89 44 24 08          	mov    %eax,0x8(%esp)
  100b74:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b77:	83 c0 04             	add    $0x4,%eax
  100b7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b7e:	89 0c 24             	mov    %ecx,(%esp)
  100b81:	ff d2                	call   *%edx
  100b83:	eb 24                	jmp    100ba9 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b85:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b89:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b8c:	83 f8 02             	cmp    $0x2,%eax
  100b8f:	76 9c                	jbe    100b2d <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b91:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b94:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b98:	c7 04 24 f3 38 10 00 	movl   $0x1038f3,(%esp)
  100b9f:	e8 87 f7 ff ff       	call   10032b <cprintf>
    return 0;
  100ba4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ba9:	c9                   	leave  
  100baa:	c3                   	ret    

00100bab <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bab:	55                   	push   %ebp
  100bac:	89 e5                	mov    %esp,%ebp
  100bae:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bb1:	c7 04 24 0c 39 10 00 	movl   $0x10390c,(%esp)
  100bb8:	e8 6e f7 ff ff       	call   10032b <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bbd:	c7 04 24 34 39 10 00 	movl   $0x103934,(%esp)
  100bc4:	e8 62 f7 ff ff       	call   10032b <cprintf>

    if (tf != NULL) {
  100bc9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bcd:	74 0e                	je     100bdd <kmonitor+0x32>
        print_trapframe(tf);
  100bcf:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd2:	89 04 24             	mov    %eax,(%esp)
  100bd5:	e8 7e 0e 00 00       	call   101a58 <print_trapframe>
  100bda:	eb 01                	jmp    100bdd <kmonitor+0x32>
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
            }
        }
    }
  100bdc:	90                   	nop
        print_trapframe(tf);
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bdd:	c7 04 24 59 39 10 00 	movl   $0x103959,(%esp)
  100be4:	e8 33 f6 ff ff       	call   10021c <readline>
  100be9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bf0:	74 ea                	je     100bdc <kmonitor+0x31>
            if (runcmd(buf, tf) < 0) {
  100bf2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bfc:	89 04 24             	mov    %eax,(%esp)
  100bff:	e8 f5 fe ff ff       	call   100af9 <runcmd>
  100c04:	85 c0                	test   %eax,%eax
  100c06:	79 d4                	jns    100bdc <kmonitor+0x31>
                break;
  100c08:	90                   	nop
            }
        }
    }
}
  100c09:	c9                   	leave  
  100c0a:	c3                   	ret    

00100c0b <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c0b:	55                   	push   %ebp
  100c0c:	89 e5                	mov    %esp,%ebp
  100c0e:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c18:	eb 3f                	jmp    100c59 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c1a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c1d:	89 d0                	mov    %edx,%eax
  100c1f:	01 c0                	add    %eax,%eax
  100c21:	01 d0                	add    %edx,%eax
  100c23:	c1 e0 02             	shl    $0x2,%eax
  100c26:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c2b:	8b 48 04             	mov    0x4(%eax),%ecx
  100c2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c31:	89 d0                	mov    %edx,%eax
  100c33:	01 c0                	add    %eax,%eax
  100c35:	01 d0                	add    %edx,%eax
  100c37:	c1 e0 02             	shl    $0x2,%eax
  100c3a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c3f:	8b 00                	mov    (%eax),%eax
  100c41:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c45:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c49:	c7 04 24 5d 39 10 00 	movl   $0x10395d,(%esp)
  100c50:	e8 d6 f6 ff ff       	call   10032b <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c5c:	83 f8 02             	cmp    $0x2,%eax
  100c5f:	76 b9                	jbe    100c1a <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c61:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c66:	c9                   	leave  
  100c67:	c3                   	ret    

00100c68 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c68:	55                   	push   %ebp
  100c69:	89 e5                	mov    %esp,%ebp
  100c6b:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c6e:	e8 c7 fb ff ff       	call   10083a <print_kerninfo>
    return 0;
  100c73:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c78:	c9                   	leave  
  100c79:	c3                   	ret    

00100c7a <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c7a:	55                   	push   %ebp
  100c7b:	89 e5                	mov    %esp,%ebp
  100c7d:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c80:	e8 02 fd ff ff       	call   100987 <print_stackframe>
    return 0;
  100c85:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c8a:	c9                   	leave  
  100c8b:	c3                   	ret    

00100c8c <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c8c:	55                   	push   %ebp
  100c8d:	89 e5                	mov    %esp,%ebp
  100c8f:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c92:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c97:	85 c0                	test   %eax,%eax
  100c99:	75 4c                	jne    100ce7 <__panic+0x5b>
        goto panic_dead;
    }
    is_panic = 1;
  100c9b:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100ca2:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100ca5:	8d 55 14             	lea    0x14(%ebp),%edx
  100ca8:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100cab:	89 10                	mov    %edx,(%eax)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cad:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cb0:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cb4:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cbb:	c7 04 24 66 39 10 00 	movl   $0x103966,(%esp)
  100cc2:	e8 64 f6 ff ff       	call   10032b <cprintf>
    vcprintf(fmt, ap);
  100cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cca:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cce:	8b 45 10             	mov    0x10(%ebp),%eax
  100cd1:	89 04 24             	mov    %eax,(%esp)
  100cd4:	e8 1f f6 ff ff       	call   1002f8 <vcprintf>
    cprintf("\n");
  100cd9:	c7 04 24 82 39 10 00 	movl   $0x103982,(%esp)
  100ce0:	e8 46 f6 ff ff       	call   10032b <cprintf>
  100ce5:	eb 01                	jmp    100ce8 <__panic+0x5c>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100ce7:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  100ce8:	e8 c9 09 00 00       	call   1016b6 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100ced:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cf4:	e8 b2 fe ff ff       	call   100bab <kmonitor>
    }
  100cf9:	eb f2                	jmp    100ced <__panic+0x61>

00100cfb <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100cfb:	55                   	push   %ebp
  100cfc:	89 e5                	mov    %esp,%ebp
  100cfe:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d01:	8d 55 14             	lea    0x14(%ebp),%edx
  100d04:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100d07:	89 10                	mov    %edx,(%eax)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d09:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d0c:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d10:	8b 45 08             	mov    0x8(%ebp),%eax
  100d13:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d17:	c7 04 24 84 39 10 00 	movl   $0x103984,(%esp)
  100d1e:	e8 08 f6 ff ff       	call   10032b <cprintf>
    vcprintf(fmt, ap);
  100d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d26:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2a:	8b 45 10             	mov    0x10(%ebp),%eax
  100d2d:	89 04 24             	mov    %eax,(%esp)
  100d30:	e8 c3 f5 ff ff       	call   1002f8 <vcprintf>
    cprintf("\n");
  100d35:	c7 04 24 82 39 10 00 	movl   $0x103982,(%esp)
  100d3c:	e8 ea f5 ff ff       	call   10032b <cprintf>
    va_end(ap);
}
  100d41:	c9                   	leave  
  100d42:	c3                   	ret    

00100d43 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d43:	55                   	push   %ebp
  100d44:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d46:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d4b:	5d                   	pop    %ebp
  100d4c:	c3                   	ret    
  100d4d:	00 00                	add    %al,(%eax)
	...

00100d50 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d50:	55                   	push   %ebp
  100d51:	89 e5                	mov    %esp,%ebp
  100d53:	83 ec 28             	sub    $0x28,%esp
  100d56:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d5c:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d60:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d64:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d68:	ee                   	out    %al,(%dx)
  100d69:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d6f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d73:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d77:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d7b:	ee                   	out    %al,(%dx)
  100d7c:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d82:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d86:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d8a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d8e:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d8f:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d96:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d99:	c7 04 24 a2 39 10 00 	movl   $0x1039a2,(%esp)
  100da0:	e8 86 f5 ff ff       	call   10032b <cprintf>
    pic_enable(IRQ_TIMER);
  100da5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dac:	e8 63 09 00 00       	call   101714 <pic_enable>
}
  100db1:	c9                   	leave  
  100db2:	c3                   	ret    
	...

00100db4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100db4:	55                   	push   %ebp
  100db5:	89 e5                	mov    %esp,%ebp
  100db7:	53                   	push   %ebx
  100db8:	83 ec 14             	sub    $0x14,%esp
  100dbb:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100dc5:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100dc9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100dcd:	ec                   	in     (%dx),%al
  100dce:	89 c3                	mov    %eax,%ebx
  100dd0:	88 5d f9             	mov    %bl,-0x7(%ebp)
    return data;
  100dd3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100ddd:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100de1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100de5:	ec                   	in     (%dx),%al
  100de6:	89 c3                	mov    %eax,%ebx
  100de8:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  100deb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100df1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100df5:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100df9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100dfd:	ec                   	in     (%dx),%al
  100dfe:	89 c3                	mov    %eax,%ebx
  100e00:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  100e03:	66 c7 45 ee 84 00    	movw   $0x84,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e09:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e0d:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e11:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e15:	ec                   	in     (%dx),%al
  100e16:	89 c3                	mov    %eax,%ebx
  100e18:	88 5d ed             	mov    %bl,-0x13(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e1b:	83 c4 14             	add    $0x14,%esp
  100e1e:	5b                   	pop    %ebx
  100e1f:	5d                   	pop    %ebp
  100e20:	c3                   	ret    

00100e21 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100e21:	55                   	push   %ebp
  100e22:	89 e5                	mov    %esp,%ebp
  100e24:	53                   	push   %ebx
  100e25:	83 ec 24             	sub    $0x24,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e28:	c7 45 f8 00 80 0b 00 	movl   $0xb8000,-0x8(%ebp)
    uint16_t was = *cp;
  100e2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e32:	0f b7 00             	movzwl (%eax),%eax
  100e35:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e39:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e3c:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e41:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e44:	0f b7 00             	movzwl (%eax),%eax
  100e47:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e4b:	74 12                	je     100e5f <cga_init+0x3e>
        cp = (uint16_t*)MONO_BUF;
  100e4d:	c7 45 f8 00 00 0b 00 	movl   $0xb0000,-0x8(%ebp)
        addr_6845 = MONO_BASE;
  100e54:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e5b:	b4 03 
  100e5d:	eb 13                	jmp    100e72 <cga_init+0x51>
    } else {
        *cp = was;
  100e5f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e62:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e66:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e69:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e70:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e72:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e79:	0f b7 c0             	movzwl %ax,%eax
  100e7c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e80:	c6 45 ed 0e          	movb   $0xe,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e84:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e88:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e8c:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e8d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e94:	83 c0 01             	add    $0x1,%eax
  100e97:	0f b7 c0             	movzwl %ax,%eax
  100e9a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e9e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ea2:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100ea6:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100eaa:	ec                   	in     (%dx),%al
  100eab:	89 c3                	mov    %eax,%ebx
  100ead:	88 5d e9             	mov    %bl,-0x17(%ebp)
    return data;
  100eb0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb4:	0f b6 c0             	movzbl %al,%eax
  100eb7:	c1 e0 08             	shl    $0x8,%eax
  100eba:	89 45 f0             	mov    %eax,-0x10(%ebp)
    outb(addr_6845, 15);
  100ebd:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec4:	0f b7 c0             	movzwl %ax,%eax
  100ec7:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ecb:	c6 45 e5 0f          	movb   $0xf,-0x1b(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ecf:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ed3:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ed7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100ed8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100edf:	83 c0 01             	add    $0x1,%eax
  100ee2:	0f b7 c0             	movzwl %ax,%eax
  100ee5:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee9:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100eed:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100ef1:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100ef5:	ec                   	in     (%dx),%al
  100ef6:	89 c3                	mov    %eax,%ebx
  100ef8:	88 5d e1             	mov    %bl,-0x1f(%ebp)
    return data;
  100efb:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100eff:	0f b6 c0             	movzbl %al,%eax
  100f02:	09 45 f0             	or     %eax,-0x10(%ebp)

    crt_buf = (uint16_t*) cp;
  100f05:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100f08:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100f0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100f10:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100f16:	83 c4 24             	add    $0x24,%esp
  100f19:	5b                   	pop    %ebx
  100f1a:	5d                   	pop    %ebp
  100f1b:	c3                   	ret    

00100f1c <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f1c:	55                   	push   %ebp
  100f1d:	89 e5                	mov    %esp,%ebp
  100f1f:	53                   	push   %ebx
  100f20:	83 ec 54             	sub    $0x54,%esp
  100f23:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f29:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f2d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f31:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f35:	ee                   	out    %al,(%dx)
  100f36:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f3c:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f40:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f44:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f48:	ee                   	out    %al,(%dx)
  100f49:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f4f:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f53:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f57:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f5b:	ee                   	out    %al,(%dx)
  100f5c:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f62:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f66:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f6a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f6e:	ee                   	out    %al,(%dx)
  100f6f:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f75:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f79:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f7d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f81:	ee                   	out    %al,(%dx)
  100f82:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f88:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f8c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f90:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f94:	ee                   	out    %al,(%dx)
  100f95:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f9b:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f9f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fa3:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fa7:	ee                   	out    %al,(%dx)
  100fa8:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fae:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fb2:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fb6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100fba:	ec                   	in     (%dx),%al
  100fbb:	89 c3                	mov    %eax,%ebx
  100fbd:	88 5d d9             	mov    %bl,-0x27(%ebp)
    return data;
  100fc0:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fc4:	3c ff                	cmp    $0xff,%al
  100fc6:	0f 95 c0             	setne  %al
  100fc9:	0f b6 c0             	movzbl %al,%eax
  100fcc:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fd1:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fd7:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100fdb:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fdf:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100fe3:	ec                   	in     (%dx),%al
  100fe4:	89 c3                	mov    %eax,%ebx
  100fe6:	88 5d d5             	mov    %bl,-0x2b(%ebp)
    return data;
  100fe9:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fef:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100ff3:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100ff7:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100ffb:	ec                   	in     (%dx),%al
  100ffc:	89 c3                	mov    %eax,%ebx
  100ffe:	88 5d d1             	mov    %bl,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101001:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101006:	85 c0                	test   %eax,%eax
  101008:	74 0c                	je     101016 <serial_init+0xfa>
        pic_enable(IRQ_COM1);
  10100a:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101011:	e8 fe 06 00 00       	call   101714 <pic_enable>
    }
}
  101016:	83 c4 54             	add    $0x54,%esp
  101019:	5b                   	pop    %ebx
  10101a:	5d                   	pop    %ebp
  10101b:	c3                   	ret    

0010101c <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10101c:	55                   	push   %ebp
  10101d:	89 e5                	mov    %esp,%ebp
  10101f:	53                   	push   %ebx
  101020:	83 ec 24             	sub    $0x24,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101023:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10102a:	eb 09                	jmp    101035 <lpt_putc_sub+0x19>
        delay();
  10102c:	e8 83 fd ff ff       	call   100db4 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101031:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101035:	66 c7 45 f6 79 03    	movw   $0x379,-0xa(%ebp)
  10103b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10103f:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  101043:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101047:	ec                   	in     (%dx),%al
  101048:	89 c3                	mov    %eax,%ebx
  10104a:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  10104d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101051:	84 c0                	test   %al,%al
  101053:	78 09                	js     10105e <lpt_putc_sub+0x42>
  101055:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  10105c:	7e ce                	jle    10102c <lpt_putc_sub+0x10>
        delay();
    }
    outb(LPTPORT + 0, c);
  10105e:	8b 45 08             	mov    0x8(%ebp),%eax
  101061:	0f b6 c0             	movzbl %al,%eax
  101064:	66 c7 45 f2 78 03    	movw   $0x378,-0xe(%ebp)
  10106a:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10106d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101071:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101075:	ee                   	out    %al,(%dx)
  101076:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10107c:	c6 45 ed 0d          	movb   $0xd,-0x13(%ebp)
  101080:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101084:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101088:	ee                   	out    %al,(%dx)
  101089:	66 c7 45 ea 7a 03    	movw   $0x37a,-0x16(%ebp)
  10108f:	c6 45 e9 08          	movb   $0x8,-0x17(%ebp)
  101093:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101097:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10109b:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10109c:	83 c4 24             	add    $0x24,%esp
  10109f:	5b                   	pop    %ebx
  1010a0:	5d                   	pop    %ebp
  1010a1:	c3                   	ret    

001010a2 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010a2:	55                   	push   %ebp
  1010a3:	89 e5                	mov    %esp,%ebp
  1010a5:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010a8:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010ac:	74 0d                	je     1010bb <lpt_putc+0x19>
        lpt_putc_sub(c);
  1010ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b1:	89 04 24             	mov    %eax,(%esp)
  1010b4:	e8 63 ff ff ff       	call   10101c <lpt_putc_sub>
  1010b9:	eb 24                	jmp    1010df <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  1010bb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010c2:	e8 55 ff ff ff       	call   10101c <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010c7:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010ce:	e8 49 ff ff ff       	call   10101c <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010d3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010da:	e8 3d ff ff ff       	call   10101c <lpt_putc_sub>
    }
}
  1010df:	c9                   	leave  
  1010e0:	c3                   	ret    

001010e1 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010e1:	55                   	push   %ebp
  1010e2:	89 e5                	mov    %esp,%ebp
  1010e4:	53                   	push   %ebx
  1010e5:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010eb:	b0 00                	mov    $0x0,%al
  1010ed:	85 c0                	test   %eax,%eax
  1010ef:	75 07                	jne    1010f8 <cga_putc+0x17>
        c |= 0x0700;
  1010f1:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010f8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010fb:	25 ff 00 00 00       	and    $0xff,%eax
  101100:	83 f8 0a             	cmp    $0xa,%eax
  101103:	74 4e                	je     101153 <cga_putc+0x72>
  101105:	83 f8 0d             	cmp    $0xd,%eax
  101108:	74 59                	je     101163 <cga_putc+0x82>
  10110a:	83 f8 08             	cmp    $0x8,%eax
  10110d:	0f 85 8c 00 00 00    	jne    10119f <cga_putc+0xbe>
    case '\b':
        if (crt_pos > 0) {
  101113:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10111a:	66 85 c0             	test   %ax,%ax
  10111d:	0f 84 a1 00 00 00    	je     1011c4 <cga_putc+0xe3>
            crt_pos --;
  101123:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10112a:	83 e8 01             	sub    $0x1,%eax
  10112d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101133:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101138:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  10113f:	0f b7 d2             	movzwl %dx,%edx
  101142:	01 d2                	add    %edx,%edx
  101144:	01 c2                	add    %eax,%edx
  101146:	8b 45 08             	mov    0x8(%ebp),%eax
  101149:	b0 00                	mov    $0x0,%al
  10114b:	83 c8 20             	or     $0x20,%eax
  10114e:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101151:	eb 71                	jmp    1011c4 <cga_putc+0xe3>
    case '\n':
        crt_pos += CRT_COLS;
  101153:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10115a:	83 c0 50             	add    $0x50,%eax
  10115d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101163:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10116a:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101171:	0f b7 c1             	movzwl %cx,%eax
  101174:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10117a:	c1 e8 10             	shr    $0x10,%eax
  10117d:	89 c2                	mov    %eax,%edx
  10117f:	66 c1 ea 06          	shr    $0x6,%dx
  101183:	89 d0                	mov    %edx,%eax
  101185:	c1 e0 02             	shl    $0x2,%eax
  101188:	01 d0                	add    %edx,%eax
  10118a:	c1 e0 04             	shl    $0x4,%eax
  10118d:	89 ca                	mov    %ecx,%edx
  10118f:	66 29 c2             	sub    %ax,%dx
  101192:	89 d8                	mov    %ebx,%eax
  101194:	66 29 d0             	sub    %dx,%ax
  101197:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10119d:	eb 26                	jmp    1011c5 <cga_putc+0xe4>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10119f:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  1011a5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011ac:	0f b7 c8             	movzwl %ax,%ecx
  1011af:	01 c9                	add    %ecx,%ecx
  1011b1:	01 d1                	add    %edx,%ecx
  1011b3:	8b 55 08             	mov    0x8(%ebp),%edx
  1011b6:	66 89 11             	mov    %dx,(%ecx)
  1011b9:	83 c0 01             	add    $0x1,%eax
  1011bc:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  1011c2:	eb 01                	jmp    1011c5 <cga_putc+0xe4>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  1011c4:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011c5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011cc:	66 3d cf 07          	cmp    $0x7cf,%ax
  1011d0:	76 5b                	jbe    10122d <cga_putc+0x14c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011d2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011d7:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011dd:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011e2:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011e9:	00 
  1011ea:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011ee:	89 04 24             	mov    %eax,(%esp)
  1011f1:	e8 30 23 00 00       	call   103526 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011f6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011fd:	eb 15                	jmp    101214 <cga_putc+0x133>
            crt_buf[i] = 0x0700 | ' ';
  1011ff:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101204:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101207:	01 d2                	add    %edx,%edx
  101209:	01 d0                	add    %edx,%eax
  10120b:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101210:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101214:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10121b:	7e e2                	jle    1011ff <cga_putc+0x11e>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  10121d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101224:	83 e8 50             	sub    $0x50,%eax
  101227:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10122d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101234:	0f b7 c0             	movzwl %ax,%eax
  101237:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10123b:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  10123f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101243:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101247:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101248:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10124f:	66 c1 e8 08          	shr    $0x8,%ax
  101253:	0f b6 c0             	movzbl %al,%eax
  101256:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10125d:	83 c2 01             	add    $0x1,%edx
  101260:	0f b7 d2             	movzwl %dx,%edx
  101263:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101267:	88 45 ed             	mov    %al,-0x13(%ebp)
  10126a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10126e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101272:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101273:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10127a:	0f b7 c0             	movzwl %ax,%eax
  10127d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101281:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101285:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101289:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10128d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10128e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101295:	0f b6 c0             	movzbl %al,%eax
  101298:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10129f:	83 c2 01             	add    $0x1,%edx
  1012a2:	0f b7 d2             	movzwl %dx,%edx
  1012a5:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  1012a9:	88 45 e5             	mov    %al,-0x1b(%ebp)
  1012ac:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1012b0:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1012b4:	ee                   	out    %al,(%dx)
}
  1012b5:	83 c4 34             	add    $0x34,%esp
  1012b8:	5b                   	pop    %ebx
  1012b9:	5d                   	pop    %ebp
  1012ba:	c3                   	ret    

001012bb <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012bb:	55                   	push   %ebp
  1012bc:	89 e5                	mov    %esp,%ebp
  1012be:	53                   	push   %ebx
  1012bf:	83 ec 14             	sub    $0x14,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1012c9:	eb 09                	jmp    1012d4 <serial_putc_sub+0x19>
        delay();
  1012cb:	e8 e4 fa ff ff       	call   100db4 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012d0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1012d4:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012da:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012de:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012e2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012e6:	ec                   	in     (%dx),%al
  1012e7:	89 c3                	mov    %eax,%ebx
  1012e9:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1012ec:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012f0:	0f b6 c0             	movzbl %al,%eax
  1012f3:	83 e0 20             	and    $0x20,%eax
  1012f6:	85 c0                	test   %eax,%eax
  1012f8:	75 09                	jne    101303 <serial_putc_sub+0x48>
  1012fa:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  101301:	7e c8                	jle    1012cb <serial_putc_sub+0x10>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101303:	8b 45 08             	mov    0x8(%ebp),%eax
  101306:	0f b6 c0             	movzbl %al,%eax
  101309:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  10130f:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101312:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101316:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10131a:	ee                   	out    %al,(%dx)
}
  10131b:	83 c4 14             	add    $0x14,%esp
  10131e:	5b                   	pop    %ebx
  10131f:	5d                   	pop    %ebp
  101320:	c3                   	ret    

00101321 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101321:	55                   	push   %ebp
  101322:	89 e5                	mov    %esp,%ebp
  101324:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101327:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10132b:	74 0d                	je     10133a <serial_putc+0x19>
        serial_putc_sub(c);
  10132d:	8b 45 08             	mov    0x8(%ebp),%eax
  101330:	89 04 24             	mov    %eax,(%esp)
  101333:	e8 83 ff ff ff       	call   1012bb <serial_putc_sub>
  101338:	eb 24                	jmp    10135e <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  10133a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101341:	e8 75 ff ff ff       	call   1012bb <serial_putc_sub>
        serial_putc_sub(' ');
  101346:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10134d:	e8 69 ff ff ff       	call   1012bb <serial_putc_sub>
        serial_putc_sub('\b');
  101352:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101359:	e8 5d ff ff ff       	call   1012bb <serial_putc_sub>
    }
}
  10135e:	c9                   	leave  
  10135f:	c3                   	ret    

00101360 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101360:	55                   	push   %ebp
  101361:	89 e5                	mov    %esp,%ebp
  101363:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101366:	eb 32                	jmp    10139a <cons_intr+0x3a>
        if (c != 0) {
  101368:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10136c:	74 2c                	je     10139a <cons_intr+0x3a>
            cons.buf[cons.wpos ++] = c;
  10136e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101373:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101376:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
  10137c:	83 c0 01             	add    $0x1,%eax
  10137f:	a3 84 f0 10 00       	mov    %eax,0x10f084
            if (cons.wpos == CONSBUFSIZE) {
  101384:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101389:	3d 00 02 00 00       	cmp    $0x200,%eax
  10138e:	75 0a                	jne    10139a <cons_intr+0x3a>
                cons.wpos = 0;
  101390:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101397:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10139a:	8b 45 08             	mov    0x8(%ebp),%eax
  10139d:	ff d0                	call   *%eax
  10139f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013a2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013a6:	75 c0                	jne    101368 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  1013a8:	c9                   	leave  
  1013a9:	c3                   	ret    

001013aa <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013aa:	55                   	push   %ebp
  1013ab:	89 e5                	mov    %esp,%ebp
  1013ad:	53                   	push   %ebx
  1013ae:	83 ec 14             	sub    $0x14,%esp
  1013b1:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013b7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1013bb:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1013bf:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1013c3:	ec                   	in     (%dx),%al
  1013c4:	89 c3                	mov    %eax,%ebx
  1013c6:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1013c9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013cd:	0f b6 c0             	movzbl %al,%eax
  1013d0:	83 e0 01             	and    $0x1,%eax
  1013d3:	85 c0                	test   %eax,%eax
  1013d5:	75 07                	jne    1013de <serial_proc_data+0x34>
        return -1;
  1013d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013dc:	eb 32                	jmp    101410 <serial_proc_data+0x66>
  1013de:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013e4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1013e8:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1013ec:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1013f0:	ec                   	in     (%dx),%al
  1013f1:	89 c3                	mov    %eax,%ebx
  1013f3:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  1013f6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013fa:	0f b6 c0             	movzbl %al,%eax
  1013fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
    if (c == 127) {
  101400:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  101404:	75 07                	jne    10140d <serial_proc_data+0x63>
        c = '\b';
  101406:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%ebp)
    }
    return c;
  10140d:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  101410:	83 c4 14             	add    $0x14,%esp
  101413:	5b                   	pop    %ebx
  101414:	5d                   	pop    %ebp
  101415:	c3                   	ret    

00101416 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101416:	55                   	push   %ebp
  101417:	89 e5                	mov    %esp,%ebp
  101419:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10141c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101421:	85 c0                	test   %eax,%eax
  101423:	74 0c                	je     101431 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101425:	c7 04 24 aa 13 10 00 	movl   $0x1013aa,(%esp)
  10142c:	e8 2f ff ff ff       	call   101360 <cons_intr>
    }
}
  101431:	c9                   	leave  
  101432:	c3                   	ret    

00101433 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101433:	55                   	push   %ebp
  101434:	89 e5                	mov    %esp,%ebp
  101436:	53                   	push   %ebx
  101437:	83 ec 44             	sub    $0x44,%esp
  10143a:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101440:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101444:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101448:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10144c:	ec                   	in     (%dx),%al
  10144d:	89 c3                	mov    %eax,%ebx
  10144f:	88 5d ef             	mov    %bl,-0x11(%ebp)
    return data;
  101452:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101456:	0f b6 c0             	movzbl %al,%eax
  101459:	83 e0 01             	and    $0x1,%eax
  10145c:	85 c0                	test   %eax,%eax
  10145e:	75 0a                	jne    10146a <kbd_proc_data+0x37>
        return -1;
  101460:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101465:	e9 61 01 00 00       	jmp    1015cb <kbd_proc_data+0x198>
  10146a:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101470:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101474:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101478:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10147c:	ec                   	in     (%dx),%al
  10147d:	89 c3                	mov    %eax,%ebx
  10147f:	88 5d eb             	mov    %bl,-0x15(%ebp)
    return data;
  101482:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101486:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101489:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10148d:	75 17                	jne    1014a6 <kbd_proc_data+0x73>
        // E0 escape character
        shift |= E0ESC;
  10148f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101494:	83 c8 40             	or     $0x40,%eax
  101497:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10149c:	b8 00 00 00 00       	mov    $0x0,%eax
  1014a1:	e9 25 01 00 00       	jmp    1015cb <kbd_proc_data+0x198>
    } else if (data & 0x80) {
  1014a6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014aa:	84 c0                	test   %al,%al
  1014ac:	79 47                	jns    1014f5 <kbd_proc_data+0xc2>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014ae:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b3:	83 e0 40             	and    $0x40,%eax
  1014b6:	85 c0                	test   %eax,%eax
  1014b8:	75 09                	jne    1014c3 <kbd_proc_data+0x90>
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	83 e0 7f             	and    $0x7f,%eax
  1014c1:	eb 04                	jmp    1014c7 <kbd_proc_data+0x94>
  1014c3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c7:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ce:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014d5:	83 c8 40             	or     $0x40,%eax
  1014d8:	0f b6 c0             	movzbl %al,%eax
  1014db:	f7 d0                	not    %eax
  1014dd:	89 c2                	mov    %eax,%edx
  1014df:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e4:	21 d0                	and    %edx,%eax
  1014e6:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1014eb:	b8 00 00 00 00       	mov    $0x0,%eax
  1014f0:	e9 d6 00 00 00       	jmp    1015cb <kbd_proc_data+0x198>
    } else if (shift & E0ESC) {
  1014f5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fa:	83 e0 40             	and    $0x40,%eax
  1014fd:	85 c0                	test   %eax,%eax
  1014ff:	74 11                	je     101512 <kbd_proc_data+0xdf>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101501:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101505:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10150a:	83 e0 bf             	and    $0xffffffbf,%eax
  10150d:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101512:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101516:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10151d:	0f b6 d0             	movzbl %al,%edx
  101520:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101525:	09 d0                	or     %edx,%eax
  101527:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10152c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101530:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101537:	0f b6 d0             	movzbl %al,%edx
  10153a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10153f:	31 d0                	xor    %edx,%eax
  101541:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101546:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10154b:	83 e0 03             	and    $0x3,%eax
  10154e:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101555:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101559:	01 d0                	add    %edx,%eax
  10155b:	0f b6 00             	movzbl (%eax),%eax
  10155e:	0f b6 c0             	movzbl %al,%eax
  101561:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101564:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101569:	83 e0 08             	and    $0x8,%eax
  10156c:	85 c0                	test   %eax,%eax
  10156e:	74 22                	je     101592 <kbd_proc_data+0x15f>
        if ('a' <= c && c <= 'z')
  101570:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101574:	7e 0c                	jle    101582 <kbd_proc_data+0x14f>
  101576:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10157a:	7f 06                	jg     101582 <kbd_proc_data+0x14f>
            c += 'A' - 'a';
  10157c:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101580:	eb 10                	jmp    101592 <kbd_proc_data+0x15f>
        else if ('A' <= c && c <= 'Z')
  101582:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101586:	7e 0a                	jle    101592 <kbd_proc_data+0x15f>
  101588:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10158c:	7f 04                	jg     101592 <kbd_proc_data+0x15f>
            c += 'a' - 'A';
  10158e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101592:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101597:	f7 d0                	not    %eax
  101599:	83 e0 06             	and    $0x6,%eax
  10159c:	85 c0                	test   %eax,%eax
  10159e:	75 28                	jne    1015c8 <kbd_proc_data+0x195>
  1015a0:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015a7:	75 1f                	jne    1015c8 <kbd_proc_data+0x195>
        cprintf("Rebooting!\n");
  1015a9:	c7 04 24 bd 39 10 00 	movl   $0x1039bd,(%esp)
  1015b0:	e8 76 ed ff ff       	call   10032b <cprintf>
  1015b5:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015bb:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015bf:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015c3:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1015c7:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015cb:	83 c4 44             	add    $0x44,%esp
  1015ce:	5b                   	pop    %ebx
  1015cf:	5d                   	pop    %ebp
  1015d0:	c3                   	ret    

001015d1 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015d1:	55                   	push   %ebp
  1015d2:	89 e5                	mov    %esp,%ebp
  1015d4:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015d7:	c7 04 24 33 14 10 00 	movl   $0x101433,(%esp)
  1015de:	e8 7d fd ff ff       	call   101360 <cons_intr>
}
  1015e3:	c9                   	leave  
  1015e4:	c3                   	ret    

001015e5 <kbd_init>:

static void
kbd_init(void) {
  1015e5:	55                   	push   %ebp
  1015e6:	89 e5                	mov    %esp,%ebp
  1015e8:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015eb:	e8 e1 ff ff ff       	call   1015d1 <kbd_intr>
    pic_enable(IRQ_KBD);
  1015f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015f7:	e8 18 01 00 00       	call   101714 <pic_enable>
}
  1015fc:	c9                   	leave  
  1015fd:	c3                   	ret    

001015fe <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015fe:	55                   	push   %ebp
  1015ff:	89 e5                	mov    %esp,%ebp
  101601:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101604:	e8 18 f8 ff ff       	call   100e21 <cga_init>
    serial_init();
  101609:	e8 0e f9 ff ff       	call   100f1c <serial_init>
    kbd_init();
  10160e:	e8 d2 ff ff ff       	call   1015e5 <kbd_init>
    if (!serial_exists) {
  101613:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101618:	85 c0                	test   %eax,%eax
  10161a:	75 0c                	jne    101628 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10161c:	c7 04 24 c9 39 10 00 	movl   $0x1039c9,(%esp)
  101623:	e8 03 ed ff ff       	call   10032b <cprintf>
    }
}
  101628:	c9                   	leave  
  101629:	c3                   	ret    

0010162a <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10162a:	55                   	push   %ebp
  10162b:	89 e5                	mov    %esp,%ebp
  10162d:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101630:	8b 45 08             	mov    0x8(%ebp),%eax
  101633:	89 04 24             	mov    %eax,(%esp)
  101636:	e8 67 fa ff ff       	call   1010a2 <lpt_putc>
    cga_putc(c);
  10163b:	8b 45 08             	mov    0x8(%ebp),%eax
  10163e:	89 04 24             	mov    %eax,(%esp)
  101641:	e8 9b fa ff ff       	call   1010e1 <cga_putc>
    serial_putc(c);
  101646:	8b 45 08             	mov    0x8(%ebp),%eax
  101649:	89 04 24             	mov    %eax,(%esp)
  10164c:	e8 d0 fc ff ff       	call   101321 <serial_putc>
}
  101651:	c9                   	leave  
  101652:	c3                   	ret    

00101653 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101653:	55                   	push   %ebp
  101654:	89 e5                	mov    %esp,%ebp
  101656:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101659:	e8 b8 fd ff ff       	call   101416 <serial_intr>
    kbd_intr();
  10165e:	e8 6e ff ff ff       	call   1015d1 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101663:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101669:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10166e:	39 c2                	cmp    %eax,%edx
  101670:	74 35                	je     1016a7 <cons_getc+0x54>
        c = cons.buf[cons.rpos ++];
  101672:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101677:	0f b6 90 80 ee 10 00 	movzbl 0x10ee80(%eax),%edx
  10167e:	0f b6 d2             	movzbl %dl,%edx
  101681:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101684:	83 c0 01             	add    $0x1,%eax
  101687:	a3 80 f0 10 00       	mov    %eax,0x10f080
        if (cons.rpos == CONSBUFSIZE) {
  10168c:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101691:	3d 00 02 00 00       	cmp    $0x200,%eax
  101696:	75 0a                	jne    1016a2 <cons_getc+0x4f>
            cons.rpos = 0;
  101698:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10169f:	00 00 00 
        }
        return c;
  1016a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016a5:	eb 05                	jmp    1016ac <cons_getc+0x59>
    }
    return 0;
  1016a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016ac:	c9                   	leave  
  1016ad:	c3                   	ret    
	...

001016b0 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1016b0:	55                   	push   %ebp
  1016b1:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1016b3:	fb                   	sti    
    sti();
}
  1016b4:	5d                   	pop    %ebp
  1016b5:	c3                   	ret    

001016b6 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1016b6:	55                   	push   %ebp
  1016b7:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1016b9:	fa                   	cli    
    cli();
}
  1016ba:	5d                   	pop    %ebp
  1016bb:	c3                   	ret    

001016bc <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016bc:	55                   	push   %ebp
  1016bd:	89 e5                	mov    %esp,%ebp
  1016bf:	83 ec 14             	sub    $0x14,%esp
  1016c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1016c5:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016c9:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016cd:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1016d3:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  1016d8:	85 c0                	test   %eax,%eax
  1016da:	74 36                	je     101712 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  1016dc:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016e0:	0f b6 c0             	movzbl %al,%eax
  1016e3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016e9:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016ec:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016f0:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016f4:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1016f5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016f9:	66 c1 e8 08          	shr    $0x8,%ax
  1016fd:	0f b6 c0             	movzbl %al,%eax
  101700:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101706:	88 45 f9             	mov    %al,-0x7(%ebp)
  101709:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10170d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101711:	ee                   	out    %al,(%dx)
    }
}
  101712:	c9                   	leave  
  101713:	c3                   	ret    

00101714 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101714:	55                   	push   %ebp
  101715:	89 e5                	mov    %esp,%ebp
  101717:	53                   	push   %ebx
  101718:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10171b:	8b 45 08             	mov    0x8(%ebp),%eax
  10171e:	ba 01 00 00 00       	mov    $0x1,%edx
  101723:	89 d3                	mov    %edx,%ebx
  101725:	89 c1                	mov    %eax,%ecx
  101727:	d3 e3                	shl    %cl,%ebx
  101729:	89 d8                	mov    %ebx,%eax
  10172b:	89 c2                	mov    %eax,%edx
  10172d:	f7 d2                	not    %edx
  10172f:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101736:	21 d0                	and    %edx,%eax
  101738:	0f b7 c0             	movzwl %ax,%eax
  10173b:	89 04 24             	mov    %eax,(%esp)
  10173e:	e8 79 ff ff ff       	call   1016bc <pic_setmask>
}
  101743:	83 c4 04             	add    $0x4,%esp
  101746:	5b                   	pop    %ebx
  101747:	5d                   	pop    %ebp
  101748:	c3                   	ret    

00101749 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101749:	55                   	push   %ebp
  10174a:	89 e5                	mov    %esp,%ebp
  10174c:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10174f:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101756:	00 00 00 
  101759:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10175f:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  101763:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101767:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10176b:	ee                   	out    %al,(%dx)
  10176c:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101772:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  101776:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10177a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10177e:	ee                   	out    %al,(%dx)
  10177f:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101785:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  101789:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10178d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101791:	ee                   	out    %al,(%dx)
  101792:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  101798:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  10179c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017a0:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017a4:	ee                   	out    %al,(%dx)
  1017a5:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  1017ab:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  1017af:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017b3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017b7:	ee                   	out    %al,(%dx)
  1017b8:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  1017be:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  1017c2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1017c6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1017ca:	ee                   	out    %al,(%dx)
  1017cb:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017d1:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1017d5:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017d9:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017dd:	ee                   	out    %al,(%dx)
  1017de:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  1017e4:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  1017e8:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017ec:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017f0:	ee                   	out    %al,(%dx)
  1017f1:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  1017f7:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  1017fb:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017ff:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101803:	ee                   	out    %al,(%dx)
  101804:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  10180a:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  10180e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101812:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101816:	ee                   	out    %al,(%dx)
  101817:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10181d:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101821:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101825:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101829:	ee                   	out    %al,(%dx)
  10182a:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101830:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101834:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101838:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10183c:	ee                   	out    %al,(%dx)
  10183d:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  101843:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101847:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10184b:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10184f:	ee                   	out    %al,(%dx)
  101850:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  101856:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  10185a:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10185e:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101862:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101863:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10186a:	66 83 f8 ff          	cmp    $0xffff,%ax
  10186e:	74 12                	je     101882 <pic_init+0x139>
        pic_setmask(irq_mask);
  101870:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101877:	0f b7 c0             	movzwl %ax,%eax
  10187a:	89 04 24             	mov    %eax,(%esp)
  10187d:	e8 3a fe ff ff       	call   1016bc <pic_setmask>
    }
}
  101882:	c9                   	leave  
  101883:	c3                   	ret    

00101884 <print_ticks>:
#include <console.h>
#include <kdebug.h>
#include <string.h>
#define TICK_NUM 100

static void print_ticks() {
  101884:	55                   	push   %ebp
  101885:	89 e5                	mov    %esp,%ebp
  101887:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10188a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101891:	00 
  101892:	c7 04 24 00 3a 10 00 	movl   $0x103a00,(%esp)
  101899:	e8 8d ea ff ff       	call   10032b <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10189e:	c9                   	leave  
  10189f:	c3                   	ret    

001018a0 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1018a0:	55                   	push   %ebp
  1018a1:	89 e5                	mov    %esp,%ebp
  1018a3:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1018a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1018ad:	e9 c3 00 00 00       	jmp    101975 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1018b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b5:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018bc:	89 c2                	mov    %eax,%edx
  1018be:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c1:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  1018c8:	00 
  1018c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018cc:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  1018d3:	00 08 00 
  1018d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d9:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018e0:	00 
  1018e1:	83 e2 e0             	and    $0xffffffe0,%edx
  1018e4:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ee:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018f5:	00 
  1018f6:	83 e2 1f             	and    $0x1f,%edx
  1018f9:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101900:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101903:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10190a:	00 
  10190b:	83 e2 f0             	and    $0xfffffff0,%edx
  10190e:	83 ca 0e             	or     $0xe,%edx
  101911:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101918:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10191b:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101922:	00 
  101923:	83 e2 ef             	and    $0xffffffef,%edx
  101926:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10192d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101930:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101937:	00 
  101938:	83 e2 9f             	and    $0xffffff9f,%edx
  10193b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101942:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101945:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10194c:	00 
  10194d:	83 ca 80             	or     $0xffffff80,%edx
  101950:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101957:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10195a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101961:	c1 e8 10             	shr    $0x10,%eax
  101964:	89 c2                	mov    %eax,%edx
  101966:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101969:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101970:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101971:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101975:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101978:	3d ff 00 00 00       	cmp    $0xff,%eax
  10197d:	0f 86 2f ff ff ff    	jbe    1018b2 <idt_init+0x12>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101983:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101988:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  10198e:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101995:	08 00 
  101997:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10199e:	83 e0 e0             	and    $0xffffffe0,%eax
  1019a1:	a2 6c f4 10 00       	mov    %al,0x10f46c
  1019a6:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  1019ad:	83 e0 1f             	and    $0x1f,%eax
  1019b0:	a2 6c f4 10 00       	mov    %al,0x10f46c
  1019b5:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019bc:	83 e0 f0             	and    $0xfffffff0,%eax
  1019bf:	83 c8 0e             	or     $0xe,%eax
  1019c2:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019c7:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019ce:	83 e0 ef             	and    $0xffffffef,%eax
  1019d1:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019d6:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019dd:	83 c8 60             	or     $0x60,%eax
  1019e0:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019e5:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019ec:	83 c8 80             	or     $0xffffff80,%eax
  1019ef:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019f4:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1019f9:	c1 e8 10             	shr    $0x10,%eax
  1019fc:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101a02:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a09:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a0c:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);
}
  101a0f:	c9                   	leave  
  101a10:	c3                   	ret    

00101a11 <trapname>:

static const char *
trapname(int trapno) {
  101a11:	55                   	push   %ebp
  101a12:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a14:	8b 45 08             	mov    0x8(%ebp),%eax
  101a17:	83 f8 13             	cmp    $0x13,%eax
  101a1a:	77 0c                	ja     101a28 <trapname+0x17>
        return excnames[trapno];
  101a1c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1f:	8b 04 85 60 3d 10 00 	mov    0x103d60(,%eax,4),%eax
  101a26:	eb 18                	jmp    101a40 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a28:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a2c:	7e 0d                	jle    101a3b <trapname+0x2a>
  101a2e:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a32:	7f 07                	jg     101a3b <trapname+0x2a>
        return "Hardware Interrupt";
  101a34:	b8 0a 3a 10 00       	mov    $0x103a0a,%eax
  101a39:	eb 05                	jmp    101a40 <trapname+0x2f>
    }
    return "(unknown trap)";
  101a3b:	b8 1d 3a 10 00       	mov    $0x103a1d,%eax
}
  101a40:	5d                   	pop    %ebp
  101a41:	c3                   	ret    

00101a42 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a42:	55                   	push   %ebp
  101a43:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a45:	8b 45 08             	mov    0x8(%ebp),%eax
  101a48:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a4c:	66 83 f8 08          	cmp    $0x8,%ax
  101a50:	0f 94 c0             	sete   %al
  101a53:	0f b6 c0             	movzbl %al,%eax
}
  101a56:	5d                   	pop    %ebp
  101a57:	c3                   	ret    

00101a58 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a58:	55                   	push   %ebp
  101a59:	89 e5                	mov    %esp,%ebp
  101a5b:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a61:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a65:	c7 04 24 5e 3a 10 00 	movl   $0x103a5e,(%esp)
  101a6c:	e8 ba e8 ff ff       	call   10032b <cprintf>
    print_regs(&tf->tf_regs);
  101a71:	8b 45 08             	mov    0x8(%ebp),%eax
  101a74:	89 04 24             	mov    %eax,(%esp)
  101a77:	e8 a1 01 00 00       	call   101c1d <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a7c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a83:	0f b7 c0             	movzwl %ax,%eax
  101a86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8a:	c7 04 24 6f 3a 10 00 	movl   $0x103a6f,(%esp)
  101a91:	e8 95 e8 ff ff       	call   10032b <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a96:	8b 45 08             	mov    0x8(%ebp),%eax
  101a99:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a9d:	0f b7 c0             	movzwl %ax,%eax
  101aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aa4:	c7 04 24 82 3a 10 00 	movl   $0x103a82,(%esp)
  101aab:	e8 7b e8 ff ff       	call   10032b <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101ab0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ab3:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101ab7:	0f b7 c0             	movzwl %ax,%eax
  101aba:	89 44 24 04          	mov    %eax,0x4(%esp)
  101abe:	c7 04 24 95 3a 10 00 	movl   $0x103a95,(%esp)
  101ac5:	e8 61 e8 ff ff       	call   10032b <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101aca:	8b 45 08             	mov    0x8(%ebp),%eax
  101acd:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101ad1:	0f b7 c0             	movzwl %ax,%eax
  101ad4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ad8:	c7 04 24 a8 3a 10 00 	movl   $0x103aa8,(%esp)
  101adf:	e8 47 e8 ff ff       	call   10032b <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101ae4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae7:	8b 40 30             	mov    0x30(%eax),%eax
  101aea:	89 04 24             	mov    %eax,(%esp)
  101aed:	e8 1f ff ff ff       	call   101a11 <trapname>
  101af2:	8b 55 08             	mov    0x8(%ebp),%edx
  101af5:	8b 52 30             	mov    0x30(%edx),%edx
  101af8:	89 44 24 08          	mov    %eax,0x8(%esp)
  101afc:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b00:	c7 04 24 bb 3a 10 00 	movl   $0x103abb,(%esp)
  101b07:	e8 1f e8 ff ff       	call   10032b <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0f:	8b 40 34             	mov    0x34(%eax),%eax
  101b12:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b16:	c7 04 24 cd 3a 10 00 	movl   $0x103acd,(%esp)
  101b1d:	e8 09 e8 ff ff       	call   10032b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b22:	8b 45 08             	mov    0x8(%ebp),%eax
  101b25:	8b 40 38             	mov    0x38(%eax),%eax
  101b28:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2c:	c7 04 24 dc 3a 10 00 	movl   $0x103adc,(%esp)
  101b33:	e8 f3 e7 ff ff       	call   10032b <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101b38:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b3f:	0f b7 c0             	movzwl %ax,%eax
  101b42:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b46:	c7 04 24 eb 3a 10 00 	movl   $0x103aeb,(%esp)
  101b4d:	e8 d9 e7 ff ff       	call   10032b <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b52:	8b 45 08             	mov    0x8(%ebp),%eax
  101b55:	8b 40 40             	mov    0x40(%eax),%eax
  101b58:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5c:	c7 04 24 fe 3a 10 00 	movl   $0x103afe,(%esp)
  101b63:	e8 c3 e7 ff ff       	call   10032b <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b6f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b76:	eb 3e                	jmp    101bb6 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b78:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7b:	8b 50 40             	mov    0x40(%eax),%edx
  101b7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b81:	21 d0                	and    %edx,%eax
  101b83:	85 c0                	test   %eax,%eax
  101b85:	74 28                	je     101baf <print_trapframe+0x157>
  101b87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b8a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b91:	85 c0                	test   %eax,%eax
  101b93:	74 1a                	je     101baf <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b98:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b9f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba3:	c7 04 24 0d 3b 10 00 	movl   $0x103b0d,(%esp)
  101baa:	e8 7c e7 ff ff       	call   10032b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101baf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101bb3:	d1 65 f0             	shll   -0x10(%ebp)
  101bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101bb9:	83 f8 17             	cmp    $0x17,%eax
  101bbc:	76 ba                	jbe    101b78 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101bbe:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc1:	8b 40 40             	mov    0x40(%eax),%eax
  101bc4:	25 00 30 00 00       	and    $0x3000,%eax
  101bc9:	c1 e8 0c             	shr    $0xc,%eax
  101bcc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd0:	c7 04 24 11 3b 10 00 	movl   $0x103b11,(%esp)
  101bd7:	e8 4f e7 ff ff       	call   10032b <cprintf>

    if (!trap_in_kernel(tf)) {
  101bdc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdf:	89 04 24             	mov    %eax,(%esp)
  101be2:	e8 5b fe ff ff       	call   101a42 <trap_in_kernel>
  101be7:	85 c0                	test   %eax,%eax
  101be9:	75 30                	jne    101c1b <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101beb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bee:	8b 40 44             	mov    0x44(%eax),%eax
  101bf1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf5:	c7 04 24 1a 3b 10 00 	movl   $0x103b1a,(%esp)
  101bfc:	e8 2a e7 ff ff       	call   10032b <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c01:	8b 45 08             	mov    0x8(%ebp),%eax
  101c04:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c08:	0f b7 c0             	movzwl %ax,%eax
  101c0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c0f:	c7 04 24 29 3b 10 00 	movl   $0x103b29,(%esp)
  101c16:	e8 10 e7 ff ff       	call   10032b <cprintf>
    }
}
  101c1b:	c9                   	leave  
  101c1c:	c3                   	ret    

00101c1d <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c1d:	55                   	push   %ebp
  101c1e:	89 e5                	mov    %esp,%ebp
  101c20:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c23:	8b 45 08             	mov    0x8(%ebp),%eax
  101c26:	8b 00                	mov    (%eax),%eax
  101c28:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2c:	c7 04 24 3c 3b 10 00 	movl   $0x103b3c,(%esp)
  101c33:	e8 f3 e6 ff ff       	call   10032b <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101c38:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3b:	8b 40 04             	mov    0x4(%eax),%eax
  101c3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c42:	c7 04 24 4b 3b 10 00 	movl   $0x103b4b,(%esp)
  101c49:	e8 dd e6 ff ff       	call   10032b <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c51:	8b 40 08             	mov    0x8(%eax),%eax
  101c54:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c58:	c7 04 24 5a 3b 10 00 	movl   $0x103b5a,(%esp)
  101c5f:	e8 c7 e6 ff ff       	call   10032b <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c64:	8b 45 08             	mov    0x8(%ebp),%eax
  101c67:	8b 40 0c             	mov    0xc(%eax),%eax
  101c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6e:	c7 04 24 69 3b 10 00 	movl   $0x103b69,(%esp)
  101c75:	e8 b1 e6 ff ff       	call   10032b <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7d:	8b 40 10             	mov    0x10(%eax),%eax
  101c80:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c84:	c7 04 24 78 3b 10 00 	movl   $0x103b78,(%esp)
  101c8b:	e8 9b e6 ff ff       	call   10032b <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c90:	8b 45 08             	mov    0x8(%ebp),%eax
  101c93:	8b 40 14             	mov    0x14(%eax),%eax
  101c96:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c9a:	c7 04 24 87 3b 10 00 	movl   $0x103b87,(%esp)
  101ca1:	e8 85 e6 ff ff       	call   10032b <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ca6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca9:	8b 40 18             	mov    0x18(%eax),%eax
  101cac:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb0:	c7 04 24 96 3b 10 00 	movl   $0x103b96,(%esp)
  101cb7:	e8 6f e6 ff ff       	call   10032b <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101cbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbf:	8b 40 1c             	mov    0x1c(%eax),%eax
  101cc2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc6:	c7 04 24 a5 3b 10 00 	movl   $0x103ba5,(%esp)
  101ccd:	e8 59 e6 ff ff       	call   10032b <cprintf>
}
  101cd2:	c9                   	leave  
  101cd3:	c3                   	ret    

00101cd4 <trap_dispatch>:
/* temporary trapframe or pointer to trapframe */
struct trapframe switchk2u, *switchu2k;

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101cd4:	55                   	push   %ebp
  101cd5:	89 e5                	mov    %esp,%ebp
  101cd7:	57                   	push   %edi
  101cd8:	56                   	push   %esi
  101cd9:	53                   	push   %ebx
  101cda:	83 ec 2c             	sub    $0x2c,%esp
    char c;

    switch (tf->tf_trapno) {
  101cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce0:	8b 40 30             	mov    0x30(%eax),%eax
  101ce3:	83 f8 2f             	cmp    $0x2f,%eax
  101ce6:	77 21                	ja     101d09 <trap_dispatch+0x35>
  101ce8:	83 f8 2e             	cmp    $0x2e,%eax
  101ceb:	0f 83 ee 01 00 00    	jae    101edf <trap_dispatch+0x20b>
  101cf1:	83 f8 21             	cmp    $0x21,%eax
  101cf4:	0f 84 8b 00 00 00    	je     101d85 <trap_dispatch+0xb1>
  101cfa:	83 f8 24             	cmp    $0x24,%eax
  101cfd:	74 5d                	je     101d5c <trap_dispatch+0x88>
  101cff:	83 f8 20             	cmp    $0x20,%eax
  101d02:	74 1c                	je     101d20 <trap_dispatch+0x4c>
  101d04:	e9 9e 01 00 00       	jmp    101ea7 <trap_dispatch+0x1d3>
  101d09:	83 f8 78             	cmp    $0x78,%eax
  101d0c:	0f 84 9c 00 00 00    	je     101dae <trap_dispatch+0xda>
  101d12:	83 f8 79             	cmp    $0x79,%eax
  101d15:	0f 84 11 01 00 00    	je     101e2c <trap_dispatch+0x158>
  101d1b:	e9 87 01 00 00       	jmp    101ea7 <trap_dispatch+0x1d3>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101d20:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101d25:	83 c0 01             	add    $0x1,%eax
  101d28:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101d2d:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101d33:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101d38:	89 c8                	mov    %ecx,%eax
  101d3a:	f7 e2                	mul    %edx
  101d3c:	89 d0                	mov    %edx,%eax
  101d3e:	c1 e8 05             	shr    $0x5,%eax
  101d41:	6b c0 64             	imul   $0x64,%eax,%eax
  101d44:	89 ca                	mov    %ecx,%edx
  101d46:	29 c2                	sub    %eax,%edx
  101d48:	89 d0                	mov    %edx,%eax
  101d4a:	85 c0                	test   %eax,%eax
  101d4c:	0f 85 90 01 00 00    	jne    101ee2 <trap_dispatch+0x20e>
            print_ticks();
  101d52:	e8 2d fb ff ff       	call   101884 <print_ticks>
        }
        break;
  101d57:	e9 86 01 00 00       	jmp    101ee2 <trap_dispatch+0x20e>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d5c:	e8 f2 f8 ff ff       	call   101653 <cons_getc>
  101d61:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d64:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d68:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d6c:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d70:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d74:	c7 04 24 b4 3b 10 00 	movl   $0x103bb4,(%esp)
  101d7b:	e8 ab e5 ff ff       	call   10032b <cprintf>
        break;
  101d80:	e9 64 01 00 00       	jmp    101ee9 <trap_dispatch+0x215>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d85:	e8 c9 f8 ff ff       	call   101653 <cons_getc>
  101d8a:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d8d:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d91:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d95:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d99:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d9d:	c7 04 24 c6 3b 10 00 	movl   $0x103bc6,(%esp)
  101da4:	e8 82 e5 ff ff       	call   10032b <cprintf>
        break;
  101da9:	e9 3b 01 00 00       	jmp    101ee9 <trap_dispatch+0x215>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
        if (tf->tf_cs != USER_CS) {
  101dae:	8b 45 08             	mov    0x8(%ebp),%eax
  101db1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101db5:	66 83 f8 1b          	cmp    $0x1b,%ax
  101db9:	0f 84 26 01 00 00    	je     101ee5 <trap_dispatch+0x211>
            switchk2u = *tf;
  101dbf:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc2:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101dc7:	89 c3                	mov    %eax,%ebx
  101dc9:	b8 13 00 00 00       	mov    $0x13,%eax
  101dce:	89 d7                	mov    %edx,%edi
  101dd0:	89 de                	mov    %ebx,%esi
  101dd2:	89 c1                	mov    %eax,%ecx
  101dd4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101dd6:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101ddd:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101ddf:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101de6:	23 00 
  101de8:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101def:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101df5:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101dfc:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101e02:	8b 45 08             	mov    0x8(%ebp),%eax
  101e05:	83 c0 44             	add    $0x44,%eax
  101e08:	a3 64 f9 10 00       	mov    %eax,0x10f964
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101e0d:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101e12:	80 cc 30             	or     $0x30,%ah
  101e15:	a3 60 f9 10 00       	mov    %eax,0x10f960
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101e1a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e1d:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e20:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101e25:	89 02                	mov    %eax,(%edx)
        }
        break;
  101e27:	e9 b9 00 00 00       	jmp    101ee5 <trap_dispatch+0x211>
    case T_SWITCH_TOK:
        if (tf->tf_cs != KERNEL_CS) {
  101e2c:	8b 45 08             	mov    0x8(%ebp),%eax
  101e2f:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e33:	66 83 f8 08          	cmp    $0x8,%ax
  101e37:	0f 84 ab 00 00 00    	je     101ee8 <trap_dispatch+0x214>
            tf->tf_cs = KERNEL_CS;
  101e3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e40:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101e46:	8b 45 08             	mov    0x8(%ebp),%eax
  101e49:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  101e52:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e56:	8b 45 08             	mov    0x8(%ebp),%eax
  101e59:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101e5d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e60:	8b 40 40             	mov    0x40(%eax),%eax
  101e63:	89 c2                	mov    %eax,%edx
  101e65:	80 e6 cf             	and    $0xcf,%dh
  101e68:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6b:	89 50 40             	mov    %edx,0x40(%eax)
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
  101e6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e71:	8b 40 44             	mov    0x44(%eax),%eax
  101e74:	83 e8 44             	sub    $0x44,%eax
  101e77:	a3 6c f9 10 00       	mov    %eax,0x10f96c
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
  101e7c:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101e81:	c7 44 24 08 44 00 00 	movl   $0x44,0x8(%esp)
  101e88:	00 
  101e89:	8b 55 08             	mov    0x8(%ebp),%edx
  101e8c:	89 54 24 04          	mov    %edx,0x4(%esp)
  101e90:	89 04 24             	mov    %eax,(%esp)
  101e93:	e8 8e 16 00 00       	call   103526 <memmove>
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
  101e98:	8b 45 08             	mov    0x8(%ebp),%eax
  101e9b:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e9e:	a1 6c f9 10 00       	mov    0x10f96c,%eax
  101ea3:	89 02                	mov    %eax,(%edx)
        }
        break;
  101ea5:	eb 41                	jmp    101ee8 <trap_dispatch+0x214>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ea7:	8b 45 08             	mov    0x8(%ebp),%eax
  101eaa:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101eae:	0f b7 c0             	movzwl %ax,%eax
  101eb1:	83 e0 03             	and    $0x3,%eax
  101eb4:	85 c0                	test   %eax,%eax
  101eb6:	75 31                	jne    101ee9 <trap_dispatch+0x215>
            print_trapframe(tf);
  101eb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ebb:	89 04 24             	mov    %eax,(%esp)
  101ebe:	e8 95 fb ff ff       	call   101a58 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101ec3:	c7 44 24 08 d5 3b 10 	movl   $0x103bd5,0x8(%esp)
  101eca:	00 
  101ecb:	c7 44 24 04 d2 00 00 	movl   $0xd2,0x4(%esp)
  101ed2:	00 
  101ed3:	c7 04 24 f1 3b 10 00 	movl   $0x103bf1,(%esp)
  101eda:	e8 ad ed ff ff       	call   100c8c <__panic>
        }
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101edf:	90                   	nop
  101ee0:	eb 07                	jmp    101ee9 <trap_dispatch+0x215>
         */
        ticks ++;
        if (ticks % TICK_NUM == 0) {
            print_ticks();
        }
        break;
  101ee2:	90                   	nop
  101ee3:	eb 04                	jmp    101ee9 <trap_dispatch+0x215>
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
        }
        break;
  101ee5:	90                   	nop
  101ee6:	eb 01                	jmp    101ee9 <trap_dispatch+0x215>
            tf->tf_eflags &= ~FL_IOPL_MASK;
            switchu2k = (struct trapframe *)(tf->tf_esp - (sizeof(struct trapframe) - 8));
            memmove(switchu2k, tf, sizeof(struct trapframe) - 8);
            *((uint32_t *)tf - 1) = (uint32_t)switchu2k;
        }
        break;
  101ee8:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101ee9:	83 c4 2c             	add    $0x2c,%esp
  101eec:	5b                   	pop    %ebx
  101eed:	5e                   	pop    %esi
  101eee:	5f                   	pop    %edi
  101eef:	5d                   	pop    %ebp
  101ef0:	c3                   	ret    

00101ef1 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101ef1:	55                   	push   %ebp
  101ef2:	89 e5                	mov    %esp,%ebp
  101ef4:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ef7:	8b 45 08             	mov    0x8(%ebp),%eax
  101efa:	89 04 24             	mov    %eax,(%esp)
  101efd:	e8 d2 fd ff ff       	call   101cd4 <trap_dispatch>
}
  101f02:	c9                   	leave  
  101f03:	c3                   	ret    

00101f04 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101f04:	1e                   	push   %ds
    pushl %es
  101f05:	06                   	push   %es
    pushl %fs
  101f06:	0f a0                	push   %fs
    pushl %gs
  101f08:	0f a8                	push   %gs
    pushal
  101f0a:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101f0b:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101f10:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101f12:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101f14:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101f15:	e8 d7 ff ff ff       	call   101ef1 <trap>

    # pop the pushed stack pointer
    popl %esp
  101f1a:	5c                   	pop    %esp

00101f1b <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101f1b:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101f1c:	0f a9                	pop    %gs
    popl %fs
  101f1e:	0f a1                	pop    %fs
    popl %es
  101f20:	07                   	pop    %es
    popl %ds
  101f21:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101f22:	83 c4 08             	add    $0x8,%esp
    iret
  101f25:	cf                   	iret   
	...

00101f28 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101f28:	6a 00                	push   $0x0
  pushl $0
  101f2a:	6a 00                	push   $0x0
  jmp __alltraps
  101f2c:	e9 d3 ff ff ff       	jmp    101f04 <__alltraps>

00101f31 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f31:	6a 00                	push   $0x0
  pushl $1
  101f33:	6a 01                	push   $0x1
  jmp __alltraps
  101f35:	e9 ca ff ff ff       	jmp    101f04 <__alltraps>

00101f3a <vector2>:
.globl vector2
vector2:
  pushl $0
  101f3a:	6a 00                	push   $0x0
  pushl $2
  101f3c:	6a 02                	push   $0x2
  jmp __alltraps
  101f3e:	e9 c1 ff ff ff       	jmp    101f04 <__alltraps>

00101f43 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f43:	6a 00                	push   $0x0
  pushl $3
  101f45:	6a 03                	push   $0x3
  jmp __alltraps
  101f47:	e9 b8 ff ff ff       	jmp    101f04 <__alltraps>

00101f4c <vector4>:
.globl vector4
vector4:
  pushl $0
  101f4c:	6a 00                	push   $0x0
  pushl $4
  101f4e:	6a 04                	push   $0x4
  jmp __alltraps
  101f50:	e9 af ff ff ff       	jmp    101f04 <__alltraps>

00101f55 <vector5>:
.globl vector5
vector5:
  pushl $0
  101f55:	6a 00                	push   $0x0
  pushl $5
  101f57:	6a 05                	push   $0x5
  jmp __alltraps
  101f59:	e9 a6 ff ff ff       	jmp    101f04 <__alltraps>

00101f5e <vector6>:
.globl vector6
vector6:
  pushl $0
  101f5e:	6a 00                	push   $0x0
  pushl $6
  101f60:	6a 06                	push   $0x6
  jmp __alltraps
  101f62:	e9 9d ff ff ff       	jmp    101f04 <__alltraps>

00101f67 <vector7>:
.globl vector7
vector7:
  pushl $0
  101f67:	6a 00                	push   $0x0
  pushl $7
  101f69:	6a 07                	push   $0x7
  jmp __alltraps
  101f6b:	e9 94 ff ff ff       	jmp    101f04 <__alltraps>

00101f70 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f70:	6a 08                	push   $0x8
  jmp __alltraps
  101f72:	e9 8d ff ff ff       	jmp    101f04 <__alltraps>

00101f77 <vector9>:
.globl vector9
vector9:
  pushl $9
  101f77:	6a 09                	push   $0x9
  jmp __alltraps
  101f79:	e9 86 ff ff ff       	jmp    101f04 <__alltraps>

00101f7e <vector10>:
.globl vector10
vector10:
  pushl $10
  101f7e:	6a 0a                	push   $0xa
  jmp __alltraps
  101f80:	e9 7f ff ff ff       	jmp    101f04 <__alltraps>

00101f85 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f85:	6a 0b                	push   $0xb
  jmp __alltraps
  101f87:	e9 78 ff ff ff       	jmp    101f04 <__alltraps>

00101f8c <vector12>:
.globl vector12
vector12:
  pushl $12
  101f8c:	6a 0c                	push   $0xc
  jmp __alltraps
  101f8e:	e9 71 ff ff ff       	jmp    101f04 <__alltraps>

00101f93 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f93:	6a 0d                	push   $0xd
  jmp __alltraps
  101f95:	e9 6a ff ff ff       	jmp    101f04 <__alltraps>

00101f9a <vector14>:
.globl vector14
vector14:
  pushl $14
  101f9a:	6a 0e                	push   $0xe
  jmp __alltraps
  101f9c:	e9 63 ff ff ff       	jmp    101f04 <__alltraps>

00101fa1 <vector15>:
.globl vector15
vector15:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $15
  101fa3:	6a 0f                	push   $0xf
  jmp __alltraps
  101fa5:	e9 5a ff ff ff       	jmp    101f04 <__alltraps>

00101faa <vector16>:
.globl vector16
vector16:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $16
  101fac:	6a 10                	push   $0x10
  jmp __alltraps
  101fae:	e9 51 ff ff ff       	jmp    101f04 <__alltraps>

00101fb3 <vector17>:
.globl vector17
vector17:
  pushl $17
  101fb3:	6a 11                	push   $0x11
  jmp __alltraps
  101fb5:	e9 4a ff ff ff       	jmp    101f04 <__alltraps>

00101fba <vector18>:
.globl vector18
vector18:
  pushl $0
  101fba:	6a 00                	push   $0x0
  pushl $18
  101fbc:	6a 12                	push   $0x12
  jmp __alltraps
  101fbe:	e9 41 ff ff ff       	jmp    101f04 <__alltraps>

00101fc3 <vector19>:
.globl vector19
vector19:
  pushl $0
  101fc3:	6a 00                	push   $0x0
  pushl $19
  101fc5:	6a 13                	push   $0x13
  jmp __alltraps
  101fc7:	e9 38 ff ff ff       	jmp    101f04 <__alltraps>

00101fcc <vector20>:
.globl vector20
vector20:
  pushl $0
  101fcc:	6a 00                	push   $0x0
  pushl $20
  101fce:	6a 14                	push   $0x14
  jmp __alltraps
  101fd0:	e9 2f ff ff ff       	jmp    101f04 <__alltraps>

00101fd5 <vector21>:
.globl vector21
vector21:
  pushl $0
  101fd5:	6a 00                	push   $0x0
  pushl $21
  101fd7:	6a 15                	push   $0x15
  jmp __alltraps
  101fd9:	e9 26 ff ff ff       	jmp    101f04 <__alltraps>

00101fde <vector22>:
.globl vector22
vector22:
  pushl $0
  101fde:	6a 00                	push   $0x0
  pushl $22
  101fe0:	6a 16                	push   $0x16
  jmp __alltraps
  101fe2:	e9 1d ff ff ff       	jmp    101f04 <__alltraps>

00101fe7 <vector23>:
.globl vector23
vector23:
  pushl $0
  101fe7:	6a 00                	push   $0x0
  pushl $23
  101fe9:	6a 17                	push   $0x17
  jmp __alltraps
  101feb:	e9 14 ff ff ff       	jmp    101f04 <__alltraps>

00101ff0 <vector24>:
.globl vector24
vector24:
  pushl $0
  101ff0:	6a 00                	push   $0x0
  pushl $24
  101ff2:	6a 18                	push   $0x18
  jmp __alltraps
  101ff4:	e9 0b ff ff ff       	jmp    101f04 <__alltraps>

00101ff9 <vector25>:
.globl vector25
vector25:
  pushl $0
  101ff9:	6a 00                	push   $0x0
  pushl $25
  101ffb:	6a 19                	push   $0x19
  jmp __alltraps
  101ffd:	e9 02 ff ff ff       	jmp    101f04 <__alltraps>

00102002 <vector26>:
.globl vector26
vector26:
  pushl $0
  102002:	6a 00                	push   $0x0
  pushl $26
  102004:	6a 1a                	push   $0x1a
  jmp __alltraps
  102006:	e9 f9 fe ff ff       	jmp    101f04 <__alltraps>

0010200b <vector27>:
.globl vector27
vector27:
  pushl $0
  10200b:	6a 00                	push   $0x0
  pushl $27
  10200d:	6a 1b                	push   $0x1b
  jmp __alltraps
  10200f:	e9 f0 fe ff ff       	jmp    101f04 <__alltraps>

00102014 <vector28>:
.globl vector28
vector28:
  pushl $0
  102014:	6a 00                	push   $0x0
  pushl $28
  102016:	6a 1c                	push   $0x1c
  jmp __alltraps
  102018:	e9 e7 fe ff ff       	jmp    101f04 <__alltraps>

0010201d <vector29>:
.globl vector29
vector29:
  pushl $0
  10201d:	6a 00                	push   $0x0
  pushl $29
  10201f:	6a 1d                	push   $0x1d
  jmp __alltraps
  102021:	e9 de fe ff ff       	jmp    101f04 <__alltraps>

00102026 <vector30>:
.globl vector30
vector30:
  pushl $0
  102026:	6a 00                	push   $0x0
  pushl $30
  102028:	6a 1e                	push   $0x1e
  jmp __alltraps
  10202a:	e9 d5 fe ff ff       	jmp    101f04 <__alltraps>

0010202f <vector31>:
.globl vector31
vector31:
  pushl $0
  10202f:	6a 00                	push   $0x0
  pushl $31
  102031:	6a 1f                	push   $0x1f
  jmp __alltraps
  102033:	e9 cc fe ff ff       	jmp    101f04 <__alltraps>

00102038 <vector32>:
.globl vector32
vector32:
  pushl $0
  102038:	6a 00                	push   $0x0
  pushl $32
  10203a:	6a 20                	push   $0x20
  jmp __alltraps
  10203c:	e9 c3 fe ff ff       	jmp    101f04 <__alltraps>

00102041 <vector33>:
.globl vector33
vector33:
  pushl $0
  102041:	6a 00                	push   $0x0
  pushl $33
  102043:	6a 21                	push   $0x21
  jmp __alltraps
  102045:	e9 ba fe ff ff       	jmp    101f04 <__alltraps>

0010204a <vector34>:
.globl vector34
vector34:
  pushl $0
  10204a:	6a 00                	push   $0x0
  pushl $34
  10204c:	6a 22                	push   $0x22
  jmp __alltraps
  10204e:	e9 b1 fe ff ff       	jmp    101f04 <__alltraps>

00102053 <vector35>:
.globl vector35
vector35:
  pushl $0
  102053:	6a 00                	push   $0x0
  pushl $35
  102055:	6a 23                	push   $0x23
  jmp __alltraps
  102057:	e9 a8 fe ff ff       	jmp    101f04 <__alltraps>

0010205c <vector36>:
.globl vector36
vector36:
  pushl $0
  10205c:	6a 00                	push   $0x0
  pushl $36
  10205e:	6a 24                	push   $0x24
  jmp __alltraps
  102060:	e9 9f fe ff ff       	jmp    101f04 <__alltraps>

00102065 <vector37>:
.globl vector37
vector37:
  pushl $0
  102065:	6a 00                	push   $0x0
  pushl $37
  102067:	6a 25                	push   $0x25
  jmp __alltraps
  102069:	e9 96 fe ff ff       	jmp    101f04 <__alltraps>

0010206e <vector38>:
.globl vector38
vector38:
  pushl $0
  10206e:	6a 00                	push   $0x0
  pushl $38
  102070:	6a 26                	push   $0x26
  jmp __alltraps
  102072:	e9 8d fe ff ff       	jmp    101f04 <__alltraps>

00102077 <vector39>:
.globl vector39
vector39:
  pushl $0
  102077:	6a 00                	push   $0x0
  pushl $39
  102079:	6a 27                	push   $0x27
  jmp __alltraps
  10207b:	e9 84 fe ff ff       	jmp    101f04 <__alltraps>

00102080 <vector40>:
.globl vector40
vector40:
  pushl $0
  102080:	6a 00                	push   $0x0
  pushl $40
  102082:	6a 28                	push   $0x28
  jmp __alltraps
  102084:	e9 7b fe ff ff       	jmp    101f04 <__alltraps>

00102089 <vector41>:
.globl vector41
vector41:
  pushl $0
  102089:	6a 00                	push   $0x0
  pushl $41
  10208b:	6a 29                	push   $0x29
  jmp __alltraps
  10208d:	e9 72 fe ff ff       	jmp    101f04 <__alltraps>

00102092 <vector42>:
.globl vector42
vector42:
  pushl $0
  102092:	6a 00                	push   $0x0
  pushl $42
  102094:	6a 2a                	push   $0x2a
  jmp __alltraps
  102096:	e9 69 fe ff ff       	jmp    101f04 <__alltraps>

0010209b <vector43>:
.globl vector43
vector43:
  pushl $0
  10209b:	6a 00                	push   $0x0
  pushl $43
  10209d:	6a 2b                	push   $0x2b
  jmp __alltraps
  10209f:	e9 60 fe ff ff       	jmp    101f04 <__alltraps>

001020a4 <vector44>:
.globl vector44
vector44:
  pushl $0
  1020a4:	6a 00                	push   $0x0
  pushl $44
  1020a6:	6a 2c                	push   $0x2c
  jmp __alltraps
  1020a8:	e9 57 fe ff ff       	jmp    101f04 <__alltraps>

001020ad <vector45>:
.globl vector45
vector45:
  pushl $0
  1020ad:	6a 00                	push   $0x0
  pushl $45
  1020af:	6a 2d                	push   $0x2d
  jmp __alltraps
  1020b1:	e9 4e fe ff ff       	jmp    101f04 <__alltraps>

001020b6 <vector46>:
.globl vector46
vector46:
  pushl $0
  1020b6:	6a 00                	push   $0x0
  pushl $46
  1020b8:	6a 2e                	push   $0x2e
  jmp __alltraps
  1020ba:	e9 45 fe ff ff       	jmp    101f04 <__alltraps>

001020bf <vector47>:
.globl vector47
vector47:
  pushl $0
  1020bf:	6a 00                	push   $0x0
  pushl $47
  1020c1:	6a 2f                	push   $0x2f
  jmp __alltraps
  1020c3:	e9 3c fe ff ff       	jmp    101f04 <__alltraps>

001020c8 <vector48>:
.globl vector48
vector48:
  pushl $0
  1020c8:	6a 00                	push   $0x0
  pushl $48
  1020ca:	6a 30                	push   $0x30
  jmp __alltraps
  1020cc:	e9 33 fe ff ff       	jmp    101f04 <__alltraps>

001020d1 <vector49>:
.globl vector49
vector49:
  pushl $0
  1020d1:	6a 00                	push   $0x0
  pushl $49
  1020d3:	6a 31                	push   $0x31
  jmp __alltraps
  1020d5:	e9 2a fe ff ff       	jmp    101f04 <__alltraps>

001020da <vector50>:
.globl vector50
vector50:
  pushl $0
  1020da:	6a 00                	push   $0x0
  pushl $50
  1020dc:	6a 32                	push   $0x32
  jmp __alltraps
  1020de:	e9 21 fe ff ff       	jmp    101f04 <__alltraps>

001020e3 <vector51>:
.globl vector51
vector51:
  pushl $0
  1020e3:	6a 00                	push   $0x0
  pushl $51
  1020e5:	6a 33                	push   $0x33
  jmp __alltraps
  1020e7:	e9 18 fe ff ff       	jmp    101f04 <__alltraps>

001020ec <vector52>:
.globl vector52
vector52:
  pushl $0
  1020ec:	6a 00                	push   $0x0
  pushl $52
  1020ee:	6a 34                	push   $0x34
  jmp __alltraps
  1020f0:	e9 0f fe ff ff       	jmp    101f04 <__alltraps>

001020f5 <vector53>:
.globl vector53
vector53:
  pushl $0
  1020f5:	6a 00                	push   $0x0
  pushl $53
  1020f7:	6a 35                	push   $0x35
  jmp __alltraps
  1020f9:	e9 06 fe ff ff       	jmp    101f04 <__alltraps>

001020fe <vector54>:
.globl vector54
vector54:
  pushl $0
  1020fe:	6a 00                	push   $0x0
  pushl $54
  102100:	6a 36                	push   $0x36
  jmp __alltraps
  102102:	e9 fd fd ff ff       	jmp    101f04 <__alltraps>

00102107 <vector55>:
.globl vector55
vector55:
  pushl $0
  102107:	6a 00                	push   $0x0
  pushl $55
  102109:	6a 37                	push   $0x37
  jmp __alltraps
  10210b:	e9 f4 fd ff ff       	jmp    101f04 <__alltraps>

00102110 <vector56>:
.globl vector56
vector56:
  pushl $0
  102110:	6a 00                	push   $0x0
  pushl $56
  102112:	6a 38                	push   $0x38
  jmp __alltraps
  102114:	e9 eb fd ff ff       	jmp    101f04 <__alltraps>

00102119 <vector57>:
.globl vector57
vector57:
  pushl $0
  102119:	6a 00                	push   $0x0
  pushl $57
  10211b:	6a 39                	push   $0x39
  jmp __alltraps
  10211d:	e9 e2 fd ff ff       	jmp    101f04 <__alltraps>

00102122 <vector58>:
.globl vector58
vector58:
  pushl $0
  102122:	6a 00                	push   $0x0
  pushl $58
  102124:	6a 3a                	push   $0x3a
  jmp __alltraps
  102126:	e9 d9 fd ff ff       	jmp    101f04 <__alltraps>

0010212b <vector59>:
.globl vector59
vector59:
  pushl $0
  10212b:	6a 00                	push   $0x0
  pushl $59
  10212d:	6a 3b                	push   $0x3b
  jmp __alltraps
  10212f:	e9 d0 fd ff ff       	jmp    101f04 <__alltraps>

00102134 <vector60>:
.globl vector60
vector60:
  pushl $0
  102134:	6a 00                	push   $0x0
  pushl $60
  102136:	6a 3c                	push   $0x3c
  jmp __alltraps
  102138:	e9 c7 fd ff ff       	jmp    101f04 <__alltraps>

0010213d <vector61>:
.globl vector61
vector61:
  pushl $0
  10213d:	6a 00                	push   $0x0
  pushl $61
  10213f:	6a 3d                	push   $0x3d
  jmp __alltraps
  102141:	e9 be fd ff ff       	jmp    101f04 <__alltraps>

00102146 <vector62>:
.globl vector62
vector62:
  pushl $0
  102146:	6a 00                	push   $0x0
  pushl $62
  102148:	6a 3e                	push   $0x3e
  jmp __alltraps
  10214a:	e9 b5 fd ff ff       	jmp    101f04 <__alltraps>

0010214f <vector63>:
.globl vector63
vector63:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $63
  102151:	6a 3f                	push   $0x3f
  jmp __alltraps
  102153:	e9 ac fd ff ff       	jmp    101f04 <__alltraps>

00102158 <vector64>:
.globl vector64
vector64:
  pushl $0
  102158:	6a 00                	push   $0x0
  pushl $64
  10215a:	6a 40                	push   $0x40
  jmp __alltraps
  10215c:	e9 a3 fd ff ff       	jmp    101f04 <__alltraps>

00102161 <vector65>:
.globl vector65
vector65:
  pushl $0
  102161:	6a 00                	push   $0x0
  pushl $65
  102163:	6a 41                	push   $0x41
  jmp __alltraps
  102165:	e9 9a fd ff ff       	jmp    101f04 <__alltraps>

0010216a <vector66>:
.globl vector66
vector66:
  pushl $0
  10216a:	6a 00                	push   $0x0
  pushl $66
  10216c:	6a 42                	push   $0x42
  jmp __alltraps
  10216e:	e9 91 fd ff ff       	jmp    101f04 <__alltraps>

00102173 <vector67>:
.globl vector67
vector67:
  pushl $0
  102173:	6a 00                	push   $0x0
  pushl $67
  102175:	6a 43                	push   $0x43
  jmp __alltraps
  102177:	e9 88 fd ff ff       	jmp    101f04 <__alltraps>

0010217c <vector68>:
.globl vector68
vector68:
  pushl $0
  10217c:	6a 00                	push   $0x0
  pushl $68
  10217e:	6a 44                	push   $0x44
  jmp __alltraps
  102180:	e9 7f fd ff ff       	jmp    101f04 <__alltraps>

00102185 <vector69>:
.globl vector69
vector69:
  pushl $0
  102185:	6a 00                	push   $0x0
  pushl $69
  102187:	6a 45                	push   $0x45
  jmp __alltraps
  102189:	e9 76 fd ff ff       	jmp    101f04 <__alltraps>

0010218e <vector70>:
.globl vector70
vector70:
  pushl $0
  10218e:	6a 00                	push   $0x0
  pushl $70
  102190:	6a 46                	push   $0x46
  jmp __alltraps
  102192:	e9 6d fd ff ff       	jmp    101f04 <__alltraps>

00102197 <vector71>:
.globl vector71
vector71:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $71
  102199:	6a 47                	push   $0x47
  jmp __alltraps
  10219b:	e9 64 fd ff ff       	jmp    101f04 <__alltraps>

001021a0 <vector72>:
.globl vector72
vector72:
  pushl $0
  1021a0:	6a 00                	push   $0x0
  pushl $72
  1021a2:	6a 48                	push   $0x48
  jmp __alltraps
  1021a4:	e9 5b fd ff ff       	jmp    101f04 <__alltraps>

001021a9 <vector73>:
.globl vector73
vector73:
  pushl $0
  1021a9:	6a 00                	push   $0x0
  pushl $73
  1021ab:	6a 49                	push   $0x49
  jmp __alltraps
  1021ad:	e9 52 fd ff ff       	jmp    101f04 <__alltraps>

001021b2 <vector74>:
.globl vector74
vector74:
  pushl $0
  1021b2:	6a 00                	push   $0x0
  pushl $74
  1021b4:	6a 4a                	push   $0x4a
  jmp __alltraps
  1021b6:	e9 49 fd ff ff       	jmp    101f04 <__alltraps>

001021bb <vector75>:
.globl vector75
vector75:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $75
  1021bd:	6a 4b                	push   $0x4b
  jmp __alltraps
  1021bf:	e9 40 fd ff ff       	jmp    101f04 <__alltraps>

001021c4 <vector76>:
.globl vector76
vector76:
  pushl $0
  1021c4:	6a 00                	push   $0x0
  pushl $76
  1021c6:	6a 4c                	push   $0x4c
  jmp __alltraps
  1021c8:	e9 37 fd ff ff       	jmp    101f04 <__alltraps>

001021cd <vector77>:
.globl vector77
vector77:
  pushl $0
  1021cd:	6a 00                	push   $0x0
  pushl $77
  1021cf:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021d1:	e9 2e fd ff ff       	jmp    101f04 <__alltraps>

001021d6 <vector78>:
.globl vector78
vector78:
  pushl $0
  1021d6:	6a 00                	push   $0x0
  pushl $78
  1021d8:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021da:	e9 25 fd ff ff       	jmp    101f04 <__alltraps>

001021df <vector79>:
.globl vector79
vector79:
  pushl $0
  1021df:	6a 00                	push   $0x0
  pushl $79
  1021e1:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021e3:	e9 1c fd ff ff       	jmp    101f04 <__alltraps>

001021e8 <vector80>:
.globl vector80
vector80:
  pushl $0
  1021e8:	6a 00                	push   $0x0
  pushl $80
  1021ea:	6a 50                	push   $0x50
  jmp __alltraps
  1021ec:	e9 13 fd ff ff       	jmp    101f04 <__alltraps>

001021f1 <vector81>:
.globl vector81
vector81:
  pushl $0
  1021f1:	6a 00                	push   $0x0
  pushl $81
  1021f3:	6a 51                	push   $0x51
  jmp __alltraps
  1021f5:	e9 0a fd ff ff       	jmp    101f04 <__alltraps>

001021fa <vector82>:
.globl vector82
vector82:
  pushl $0
  1021fa:	6a 00                	push   $0x0
  pushl $82
  1021fc:	6a 52                	push   $0x52
  jmp __alltraps
  1021fe:	e9 01 fd ff ff       	jmp    101f04 <__alltraps>

00102203 <vector83>:
.globl vector83
vector83:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $83
  102205:	6a 53                	push   $0x53
  jmp __alltraps
  102207:	e9 f8 fc ff ff       	jmp    101f04 <__alltraps>

0010220c <vector84>:
.globl vector84
vector84:
  pushl $0
  10220c:	6a 00                	push   $0x0
  pushl $84
  10220e:	6a 54                	push   $0x54
  jmp __alltraps
  102210:	e9 ef fc ff ff       	jmp    101f04 <__alltraps>

00102215 <vector85>:
.globl vector85
vector85:
  pushl $0
  102215:	6a 00                	push   $0x0
  pushl $85
  102217:	6a 55                	push   $0x55
  jmp __alltraps
  102219:	e9 e6 fc ff ff       	jmp    101f04 <__alltraps>

0010221e <vector86>:
.globl vector86
vector86:
  pushl $0
  10221e:	6a 00                	push   $0x0
  pushl $86
  102220:	6a 56                	push   $0x56
  jmp __alltraps
  102222:	e9 dd fc ff ff       	jmp    101f04 <__alltraps>

00102227 <vector87>:
.globl vector87
vector87:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $87
  102229:	6a 57                	push   $0x57
  jmp __alltraps
  10222b:	e9 d4 fc ff ff       	jmp    101f04 <__alltraps>

00102230 <vector88>:
.globl vector88
vector88:
  pushl $0
  102230:	6a 00                	push   $0x0
  pushl $88
  102232:	6a 58                	push   $0x58
  jmp __alltraps
  102234:	e9 cb fc ff ff       	jmp    101f04 <__alltraps>

00102239 <vector89>:
.globl vector89
vector89:
  pushl $0
  102239:	6a 00                	push   $0x0
  pushl $89
  10223b:	6a 59                	push   $0x59
  jmp __alltraps
  10223d:	e9 c2 fc ff ff       	jmp    101f04 <__alltraps>

00102242 <vector90>:
.globl vector90
vector90:
  pushl $0
  102242:	6a 00                	push   $0x0
  pushl $90
  102244:	6a 5a                	push   $0x5a
  jmp __alltraps
  102246:	e9 b9 fc ff ff       	jmp    101f04 <__alltraps>

0010224b <vector91>:
.globl vector91
vector91:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $91
  10224d:	6a 5b                	push   $0x5b
  jmp __alltraps
  10224f:	e9 b0 fc ff ff       	jmp    101f04 <__alltraps>

00102254 <vector92>:
.globl vector92
vector92:
  pushl $0
  102254:	6a 00                	push   $0x0
  pushl $92
  102256:	6a 5c                	push   $0x5c
  jmp __alltraps
  102258:	e9 a7 fc ff ff       	jmp    101f04 <__alltraps>

0010225d <vector93>:
.globl vector93
vector93:
  pushl $0
  10225d:	6a 00                	push   $0x0
  pushl $93
  10225f:	6a 5d                	push   $0x5d
  jmp __alltraps
  102261:	e9 9e fc ff ff       	jmp    101f04 <__alltraps>

00102266 <vector94>:
.globl vector94
vector94:
  pushl $0
  102266:	6a 00                	push   $0x0
  pushl $94
  102268:	6a 5e                	push   $0x5e
  jmp __alltraps
  10226a:	e9 95 fc ff ff       	jmp    101f04 <__alltraps>

0010226f <vector95>:
.globl vector95
vector95:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $95
  102271:	6a 5f                	push   $0x5f
  jmp __alltraps
  102273:	e9 8c fc ff ff       	jmp    101f04 <__alltraps>

00102278 <vector96>:
.globl vector96
vector96:
  pushl $0
  102278:	6a 00                	push   $0x0
  pushl $96
  10227a:	6a 60                	push   $0x60
  jmp __alltraps
  10227c:	e9 83 fc ff ff       	jmp    101f04 <__alltraps>

00102281 <vector97>:
.globl vector97
vector97:
  pushl $0
  102281:	6a 00                	push   $0x0
  pushl $97
  102283:	6a 61                	push   $0x61
  jmp __alltraps
  102285:	e9 7a fc ff ff       	jmp    101f04 <__alltraps>

0010228a <vector98>:
.globl vector98
vector98:
  pushl $0
  10228a:	6a 00                	push   $0x0
  pushl $98
  10228c:	6a 62                	push   $0x62
  jmp __alltraps
  10228e:	e9 71 fc ff ff       	jmp    101f04 <__alltraps>

00102293 <vector99>:
.globl vector99
vector99:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $99
  102295:	6a 63                	push   $0x63
  jmp __alltraps
  102297:	e9 68 fc ff ff       	jmp    101f04 <__alltraps>

0010229c <vector100>:
.globl vector100
vector100:
  pushl $0
  10229c:	6a 00                	push   $0x0
  pushl $100
  10229e:	6a 64                	push   $0x64
  jmp __alltraps
  1022a0:	e9 5f fc ff ff       	jmp    101f04 <__alltraps>

001022a5 <vector101>:
.globl vector101
vector101:
  pushl $0
  1022a5:	6a 00                	push   $0x0
  pushl $101
  1022a7:	6a 65                	push   $0x65
  jmp __alltraps
  1022a9:	e9 56 fc ff ff       	jmp    101f04 <__alltraps>

001022ae <vector102>:
.globl vector102
vector102:
  pushl $0
  1022ae:	6a 00                	push   $0x0
  pushl $102
  1022b0:	6a 66                	push   $0x66
  jmp __alltraps
  1022b2:	e9 4d fc ff ff       	jmp    101f04 <__alltraps>

001022b7 <vector103>:
.globl vector103
vector103:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $103
  1022b9:	6a 67                	push   $0x67
  jmp __alltraps
  1022bb:	e9 44 fc ff ff       	jmp    101f04 <__alltraps>

001022c0 <vector104>:
.globl vector104
vector104:
  pushl $0
  1022c0:	6a 00                	push   $0x0
  pushl $104
  1022c2:	6a 68                	push   $0x68
  jmp __alltraps
  1022c4:	e9 3b fc ff ff       	jmp    101f04 <__alltraps>

001022c9 <vector105>:
.globl vector105
vector105:
  pushl $0
  1022c9:	6a 00                	push   $0x0
  pushl $105
  1022cb:	6a 69                	push   $0x69
  jmp __alltraps
  1022cd:	e9 32 fc ff ff       	jmp    101f04 <__alltraps>

001022d2 <vector106>:
.globl vector106
vector106:
  pushl $0
  1022d2:	6a 00                	push   $0x0
  pushl $106
  1022d4:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022d6:	e9 29 fc ff ff       	jmp    101f04 <__alltraps>

001022db <vector107>:
.globl vector107
vector107:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $107
  1022dd:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022df:	e9 20 fc ff ff       	jmp    101f04 <__alltraps>

001022e4 <vector108>:
.globl vector108
vector108:
  pushl $0
  1022e4:	6a 00                	push   $0x0
  pushl $108
  1022e6:	6a 6c                	push   $0x6c
  jmp __alltraps
  1022e8:	e9 17 fc ff ff       	jmp    101f04 <__alltraps>

001022ed <vector109>:
.globl vector109
vector109:
  pushl $0
  1022ed:	6a 00                	push   $0x0
  pushl $109
  1022ef:	6a 6d                	push   $0x6d
  jmp __alltraps
  1022f1:	e9 0e fc ff ff       	jmp    101f04 <__alltraps>

001022f6 <vector110>:
.globl vector110
vector110:
  pushl $0
  1022f6:	6a 00                	push   $0x0
  pushl $110
  1022f8:	6a 6e                	push   $0x6e
  jmp __alltraps
  1022fa:	e9 05 fc ff ff       	jmp    101f04 <__alltraps>

001022ff <vector111>:
.globl vector111
vector111:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $111
  102301:	6a 6f                	push   $0x6f
  jmp __alltraps
  102303:	e9 fc fb ff ff       	jmp    101f04 <__alltraps>

00102308 <vector112>:
.globl vector112
vector112:
  pushl $0
  102308:	6a 00                	push   $0x0
  pushl $112
  10230a:	6a 70                	push   $0x70
  jmp __alltraps
  10230c:	e9 f3 fb ff ff       	jmp    101f04 <__alltraps>

00102311 <vector113>:
.globl vector113
vector113:
  pushl $0
  102311:	6a 00                	push   $0x0
  pushl $113
  102313:	6a 71                	push   $0x71
  jmp __alltraps
  102315:	e9 ea fb ff ff       	jmp    101f04 <__alltraps>

0010231a <vector114>:
.globl vector114
vector114:
  pushl $0
  10231a:	6a 00                	push   $0x0
  pushl $114
  10231c:	6a 72                	push   $0x72
  jmp __alltraps
  10231e:	e9 e1 fb ff ff       	jmp    101f04 <__alltraps>

00102323 <vector115>:
.globl vector115
vector115:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $115
  102325:	6a 73                	push   $0x73
  jmp __alltraps
  102327:	e9 d8 fb ff ff       	jmp    101f04 <__alltraps>

0010232c <vector116>:
.globl vector116
vector116:
  pushl $0
  10232c:	6a 00                	push   $0x0
  pushl $116
  10232e:	6a 74                	push   $0x74
  jmp __alltraps
  102330:	e9 cf fb ff ff       	jmp    101f04 <__alltraps>

00102335 <vector117>:
.globl vector117
vector117:
  pushl $0
  102335:	6a 00                	push   $0x0
  pushl $117
  102337:	6a 75                	push   $0x75
  jmp __alltraps
  102339:	e9 c6 fb ff ff       	jmp    101f04 <__alltraps>

0010233e <vector118>:
.globl vector118
vector118:
  pushl $0
  10233e:	6a 00                	push   $0x0
  pushl $118
  102340:	6a 76                	push   $0x76
  jmp __alltraps
  102342:	e9 bd fb ff ff       	jmp    101f04 <__alltraps>

00102347 <vector119>:
.globl vector119
vector119:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $119
  102349:	6a 77                	push   $0x77
  jmp __alltraps
  10234b:	e9 b4 fb ff ff       	jmp    101f04 <__alltraps>

00102350 <vector120>:
.globl vector120
vector120:
  pushl $0
  102350:	6a 00                	push   $0x0
  pushl $120
  102352:	6a 78                	push   $0x78
  jmp __alltraps
  102354:	e9 ab fb ff ff       	jmp    101f04 <__alltraps>

00102359 <vector121>:
.globl vector121
vector121:
  pushl $0
  102359:	6a 00                	push   $0x0
  pushl $121
  10235b:	6a 79                	push   $0x79
  jmp __alltraps
  10235d:	e9 a2 fb ff ff       	jmp    101f04 <__alltraps>

00102362 <vector122>:
.globl vector122
vector122:
  pushl $0
  102362:	6a 00                	push   $0x0
  pushl $122
  102364:	6a 7a                	push   $0x7a
  jmp __alltraps
  102366:	e9 99 fb ff ff       	jmp    101f04 <__alltraps>

0010236b <vector123>:
.globl vector123
vector123:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $123
  10236d:	6a 7b                	push   $0x7b
  jmp __alltraps
  10236f:	e9 90 fb ff ff       	jmp    101f04 <__alltraps>

00102374 <vector124>:
.globl vector124
vector124:
  pushl $0
  102374:	6a 00                	push   $0x0
  pushl $124
  102376:	6a 7c                	push   $0x7c
  jmp __alltraps
  102378:	e9 87 fb ff ff       	jmp    101f04 <__alltraps>

0010237d <vector125>:
.globl vector125
vector125:
  pushl $0
  10237d:	6a 00                	push   $0x0
  pushl $125
  10237f:	6a 7d                	push   $0x7d
  jmp __alltraps
  102381:	e9 7e fb ff ff       	jmp    101f04 <__alltraps>

00102386 <vector126>:
.globl vector126
vector126:
  pushl $0
  102386:	6a 00                	push   $0x0
  pushl $126
  102388:	6a 7e                	push   $0x7e
  jmp __alltraps
  10238a:	e9 75 fb ff ff       	jmp    101f04 <__alltraps>

0010238f <vector127>:
.globl vector127
vector127:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $127
  102391:	6a 7f                	push   $0x7f
  jmp __alltraps
  102393:	e9 6c fb ff ff       	jmp    101f04 <__alltraps>

00102398 <vector128>:
.globl vector128
vector128:
  pushl $0
  102398:	6a 00                	push   $0x0
  pushl $128
  10239a:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10239f:	e9 60 fb ff ff       	jmp    101f04 <__alltraps>

001023a4 <vector129>:
.globl vector129
vector129:
  pushl $0
  1023a4:	6a 00                	push   $0x0
  pushl $129
  1023a6:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1023ab:	e9 54 fb ff ff       	jmp    101f04 <__alltraps>

001023b0 <vector130>:
.globl vector130
vector130:
  pushl $0
  1023b0:	6a 00                	push   $0x0
  pushl $130
  1023b2:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1023b7:	e9 48 fb ff ff       	jmp    101f04 <__alltraps>

001023bc <vector131>:
.globl vector131
vector131:
  pushl $0
  1023bc:	6a 00                	push   $0x0
  pushl $131
  1023be:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1023c3:	e9 3c fb ff ff       	jmp    101f04 <__alltraps>

001023c8 <vector132>:
.globl vector132
vector132:
  pushl $0
  1023c8:	6a 00                	push   $0x0
  pushl $132
  1023ca:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023cf:	e9 30 fb ff ff       	jmp    101f04 <__alltraps>

001023d4 <vector133>:
.globl vector133
vector133:
  pushl $0
  1023d4:	6a 00                	push   $0x0
  pushl $133
  1023d6:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023db:	e9 24 fb ff ff       	jmp    101f04 <__alltraps>

001023e0 <vector134>:
.globl vector134
vector134:
  pushl $0
  1023e0:	6a 00                	push   $0x0
  pushl $134
  1023e2:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1023e7:	e9 18 fb ff ff       	jmp    101f04 <__alltraps>

001023ec <vector135>:
.globl vector135
vector135:
  pushl $0
  1023ec:	6a 00                	push   $0x0
  pushl $135
  1023ee:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1023f3:	e9 0c fb ff ff       	jmp    101f04 <__alltraps>

001023f8 <vector136>:
.globl vector136
vector136:
  pushl $0
  1023f8:	6a 00                	push   $0x0
  pushl $136
  1023fa:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1023ff:	e9 00 fb ff ff       	jmp    101f04 <__alltraps>

00102404 <vector137>:
.globl vector137
vector137:
  pushl $0
  102404:	6a 00                	push   $0x0
  pushl $137
  102406:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10240b:	e9 f4 fa ff ff       	jmp    101f04 <__alltraps>

00102410 <vector138>:
.globl vector138
vector138:
  pushl $0
  102410:	6a 00                	push   $0x0
  pushl $138
  102412:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102417:	e9 e8 fa ff ff       	jmp    101f04 <__alltraps>

0010241c <vector139>:
.globl vector139
vector139:
  pushl $0
  10241c:	6a 00                	push   $0x0
  pushl $139
  10241e:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102423:	e9 dc fa ff ff       	jmp    101f04 <__alltraps>

00102428 <vector140>:
.globl vector140
vector140:
  pushl $0
  102428:	6a 00                	push   $0x0
  pushl $140
  10242a:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10242f:	e9 d0 fa ff ff       	jmp    101f04 <__alltraps>

00102434 <vector141>:
.globl vector141
vector141:
  pushl $0
  102434:	6a 00                	push   $0x0
  pushl $141
  102436:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10243b:	e9 c4 fa ff ff       	jmp    101f04 <__alltraps>

00102440 <vector142>:
.globl vector142
vector142:
  pushl $0
  102440:	6a 00                	push   $0x0
  pushl $142
  102442:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102447:	e9 b8 fa ff ff       	jmp    101f04 <__alltraps>

0010244c <vector143>:
.globl vector143
vector143:
  pushl $0
  10244c:	6a 00                	push   $0x0
  pushl $143
  10244e:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102453:	e9 ac fa ff ff       	jmp    101f04 <__alltraps>

00102458 <vector144>:
.globl vector144
vector144:
  pushl $0
  102458:	6a 00                	push   $0x0
  pushl $144
  10245a:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10245f:	e9 a0 fa ff ff       	jmp    101f04 <__alltraps>

00102464 <vector145>:
.globl vector145
vector145:
  pushl $0
  102464:	6a 00                	push   $0x0
  pushl $145
  102466:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10246b:	e9 94 fa ff ff       	jmp    101f04 <__alltraps>

00102470 <vector146>:
.globl vector146
vector146:
  pushl $0
  102470:	6a 00                	push   $0x0
  pushl $146
  102472:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102477:	e9 88 fa ff ff       	jmp    101f04 <__alltraps>

0010247c <vector147>:
.globl vector147
vector147:
  pushl $0
  10247c:	6a 00                	push   $0x0
  pushl $147
  10247e:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102483:	e9 7c fa ff ff       	jmp    101f04 <__alltraps>

00102488 <vector148>:
.globl vector148
vector148:
  pushl $0
  102488:	6a 00                	push   $0x0
  pushl $148
  10248a:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10248f:	e9 70 fa ff ff       	jmp    101f04 <__alltraps>

00102494 <vector149>:
.globl vector149
vector149:
  pushl $0
  102494:	6a 00                	push   $0x0
  pushl $149
  102496:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10249b:	e9 64 fa ff ff       	jmp    101f04 <__alltraps>

001024a0 <vector150>:
.globl vector150
vector150:
  pushl $0
  1024a0:	6a 00                	push   $0x0
  pushl $150
  1024a2:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1024a7:	e9 58 fa ff ff       	jmp    101f04 <__alltraps>

001024ac <vector151>:
.globl vector151
vector151:
  pushl $0
  1024ac:	6a 00                	push   $0x0
  pushl $151
  1024ae:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1024b3:	e9 4c fa ff ff       	jmp    101f04 <__alltraps>

001024b8 <vector152>:
.globl vector152
vector152:
  pushl $0
  1024b8:	6a 00                	push   $0x0
  pushl $152
  1024ba:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1024bf:	e9 40 fa ff ff       	jmp    101f04 <__alltraps>

001024c4 <vector153>:
.globl vector153
vector153:
  pushl $0
  1024c4:	6a 00                	push   $0x0
  pushl $153
  1024c6:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1024cb:	e9 34 fa ff ff       	jmp    101f04 <__alltraps>

001024d0 <vector154>:
.globl vector154
vector154:
  pushl $0
  1024d0:	6a 00                	push   $0x0
  pushl $154
  1024d2:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024d7:	e9 28 fa ff ff       	jmp    101f04 <__alltraps>

001024dc <vector155>:
.globl vector155
vector155:
  pushl $0
  1024dc:	6a 00                	push   $0x0
  pushl $155
  1024de:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024e3:	e9 1c fa ff ff       	jmp    101f04 <__alltraps>

001024e8 <vector156>:
.globl vector156
vector156:
  pushl $0
  1024e8:	6a 00                	push   $0x0
  pushl $156
  1024ea:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1024ef:	e9 10 fa ff ff       	jmp    101f04 <__alltraps>

001024f4 <vector157>:
.globl vector157
vector157:
  pushl $0
  1024f4:	6a 00                	push   $0x0
  pushl $157
  1024f6:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1024fb:	e9 04 fa ff ff       	jmp    101f04 <__alltraps>

00102500 <vector158>:
.globl vector158
vector158:
  pushl $0
  102500:	6a 00                	push   $0x0
  pushl $158
  102502:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102507:	e9 f8 f9 ff ff       	jmp    101f04 <__alltraps>

0010250c <vector159>:
.globl vector159
vector159:
  pushl $0
  10250c:	6a 00                	push   $0x0
  pushl $159
  10250e:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102513:	e9 ec f9 ff ff       	jmp    101f04 <__alltraps>

00102518 <vector160>:
.globl vector160
vector160:
  pushl $0
  102518:	6a 00                	push   $0x0
  pushl $160
  10251a:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10251f:	e9 e0 f9 ff ff       	jmp    101f04 <__alltraps>

00102524 <vector161>:
.globl vector161
vector161:
  pushl $0
  102524:	6a 00                	push   $0x0
  pushl $161
  102526:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10252b:	e9 d4 f9 ff ff       	jmp    101f04 <__alltraps>

00102530 <vector162>:
.globl vector162
vector162:
  pushl $0
  102530:	6a 00                	push   $0x0
  pushl $162
  102532:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102537:	e9 c8 f9 ff ff       	jmp    101f04 <__alltraps>

0010253c <vector163>:
.globl vector163
vector163:
  pushl $0
  10253c:	6a 00                	push   $0x0
  pushl $163
  10253e:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102543:	e9 bc f9 ff ff       	jmp    101f04 <__alltraps>

00102548 <vector164>:
.globl vector164
vector164:
  pushl $0
  102548:	6a 00                	push   $0x0
  pushl $164
  10254a:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10254f:	e9 b0 f9 ff ff       	jmp    101f04 <__alltraps>

00102554 <vector165>:
.globl vector165
vector165:
  pushl $0
  102554:	6a 00                	push   $0x0
  pushl $165
  102556:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10255b:	e9 a4 f9 ff ff       	jmp    101f04 <__alltraps>

00102560 <vector166>:
.globl vector166
vector166:
  pushl $0
  102560:	6a 00                	push   $0x0
  pushl $166
  102562:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102567:	e9 98 f9 ff ff       	jmp    101f04 <__alltraps>

0010256c <vector167>:
.globl vector167
vector167:
  pushl $0
  10256c:	6a 00                	push   $0x0
  pushl $167
  10256e:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102573:	e9 8c f9 ff ff       	jmp    101f04 <__alltraps>

00102578 <vector168>:
.globl vector168
vector168:
  pushl $0
  102578:	6a 00                	push   $0x0
  pushl $168
  10257a:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10257f:	e9 80 f9 ff ff       	jmp    101f04 <__alltraps>

00102584 <vector169>:
.globl vector169
vector169:
  pushl $0
  102584:	6a 00                	push   $0x0
  pushl $169
  102586:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10258b:	e9 74 f9 ff ff       	jmp    101f04 <__alltraps>

00102590 <vector170>:
.globl vector170
vector170:
  pushl $0
  102590:	6a 00                	push   $0x0
  pushl $170
  102592:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102597:	e9 68 f9 ff ff       	jmp    101f04 <__alltraps>

0010259c <vector171>:
.globl vector171
vector171:
  pushl $0
  10259c:	6a 00                	push   $0x0
  pushl $171
  10259e:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1025a3:	e9 5c f9 ff ff       	jmp    101f04 <__alltraps>

001025a8 <vector172>:
.globl vector172
vector172:
  pushl $0
  1025a8:	6a 00                	push   $0x0
  pushl $172
  1025aa:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1025af:	e9 50 f9 ff ff       	jmp    101f04 <__alltraps>

001025b4 <vector173>:
.globl vector173
vector173:
  pushl $0
  1025b4:	6a 00                	push   $0x0
  pushl $173
  1025b6:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1025bb:	e9 44 f9 ff ff       	jmp    101f04 <__alltraps>

001025c0 <vector174>:
.globl vector174
vector174:
  pushl $0
  1025c0:	6a 00                	push   $0x0
  pushl $174
  1025c2:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1025c7:	e9 38 f9 ff ff       	jmp    101f04 <__alltraps>

001025cc <vector175>:
.globl vector175
vector175:
  pushl $0
  1025cc:	6a 00                	push   $0x0
  pushl $175
  1025ce:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025d3:	e9 2c f9 ff ff       	jmp    101f04 <__alltraps>

001025d8 <vector176>:
.globl vector176
vector176:
  pushl $0
  1025d8:	6a 00                	push   $0x0
  pushl $176
  1025da:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025df:	e9 20 f9 ff ff       	jmp    101f04 <__alltraps>

001025e4 <vector177>:
.globl vector177
vector177:
  pushl $0
  1025e4:	6a 00                	push   $0x0
  pushl $177
  1025e6:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1025eb:	e9 14 f9 ff ff       	jmp    101f04 <__alltraps>

001025f0 <vector178>:
.globl vector178
vector178:
  pushl $0
  1025f0:	6a 00                	push   $0x0
  pushl $178
  1025f2:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1025f7:	e9 08 f9 ff ff       	jmp    101f04 <__alltraps>

001025fc <vector179>:
.globl vector179
vector179:
  pushl $0
  1025fc:	6a 00                	push   $0x0
  pushl $179
  1025fe:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102603:	e9 fc f8 ff ff       	jmp    101f04 <__alltraps>

00102608 <vector180>:
.globl vector180
vector180:
  pushl $0
  102608:	6a 00                	push   $0x0
  pushl $180
  10260a:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10260f:	e9 f0 f8 ff ff       	jmp    101f04 <__alltraps>

00102614 <vector181>:
.globl vector181
vector181:
  pushl $0
  102614:	6a 00                	push   $0x0
  pushl $181
  102616:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10261b:	e9 e4 f8 ff ff       	jmp    101f04 <__alltraps>

00102620 <vector182>:
.globl vector182
vector182:
  pushl $0
  102620:	6a 00                	push   $0x0
  pushl $182
  102622:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102627:	e9 d8 f8 ff ff       	jmp    101f04 <__alltraps>

0010262c <vector183>:
.globl vector183
vector183:
  pushl $0
  10262c:	6a 00                	push   $0x0
  pushl $183
  10262e:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102633:	e9 cc f8 ff ff       	jmp    101f04 <__alltraps>

00102638 <vector184>:
.globl vector184
vector184:
  pushl $0
  102638:	6a 00                	push   $0x0
  pushl $184
  10263a:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10263f:	e9 c0 f8 ff ff       	jmp    101f04 <__alltraps>

00102644 <vector185>:
.globl vector185
vector185:
  pushl $0
  102644:	6a 00                	push   $0x0
  pushl $185
  102646:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10264b:	e9 b4 f8 ff ff       	jmp    101f04 <__alltraps>

00102650 <vector186>:
.globl vector186
vector186:
  pushl $0
  102650:	6a 00                	push   $0x0
  pushl $186
  102652:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102657:	e9 a8 f8 ff ff       	jmp    101f04 <__alltraps>

0010265c <vector187>:
.globl vector187
vector187:
  pushl $0
  10265c:	6a 00                	push   $0x0
  pushl $187
  10265e:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102663:	e9 9c f8 ff ff       	jmp    101f04 <__alltraps>

00102668 <vector188>:
.globl vector188
vector188:
  pushl $0
  102668:	6a 00                	push   $0x0
  pushl $188
  10266a:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10266f:	e9 90 f8 ff ff       	jmp    101f04 <__alltraps>

00102674 <vector189>:
.globl vector189
vector189:
  pushl $0
  102674:	6a 00                	push   $0x0
  pushl $189
  102676:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10267b:	e9 84 f8 ff ff       	jmp    101f04 <__alltraps>

00102680 <vector190>:
.globl vector190
vector190:
  pushl $0
  102680:	6a 00                	push   $0x0
  pushl $190
  102682:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102687:	e9 78 f8 ff ff       	jmp    101f04 <__alltraps>

0010268c <vector191>:
.globl vector191
vector191:
  pushl $0
  10268c:	6a 00                	push   $0x0
  pushl $191
  10268e:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102693:	e9 6c f8 ff ff       	jmp    101f04 <__alltraps>

00102698 <vector192>:
.globl vector192
vector192:
  pushl $0
  102698:	6a 00                	push   $0x0
  pushl $192
  10269a:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10269f:	e9 60 f8 ff ff       	jmp    101f04 <__alltraps>

001026a4 <vector193>:
.globl vector193
vector193:
  pushl $0
  1026a4:	6a 00                	push   $0x0
  pushl $193
  1026a6:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1026ab:	e9 54 f8 ff ff       	jmp    101f04 <__alltraps>

001026b0 <vector194>:
.globl vector194
vector194:
  pushl $0
  1026b0:	6a 00                	push   $0x0
  pushl $194
  1026b2:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1026b7:	e9 48 f8 ff ff       	jmp    101f04 <__alltraps>

001026bc <vector195>:
.globl vector195
vector195:
  pushl $0
  1026bc:	6a 00                	push   $0x0
  pushl $195
  1026be:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1026c3:	e9 3c f8 ff ff       	jmp    101f04 <__alltraps>

001026c8 <vector196>:
.globl vector196
vector196:
  pushl $0
  1026c8:	6a 00                	push   $0x0
  pushl $196
  1026ca:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026cf:	e9 30 f8 ff ff       	jmp    101f04 <__alltraps>

001026d4 <vector197>:
.globl vector197
vector197:
  pushl $0
  1026d4:	6a 00                	push   $0x0
  pushl $197
  1026d6:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026db:	e9 24 f8 ff ff       	jmp    101f04 <__alltraps>

001026e0 <vector198>:
.globl vector198
vector198:
  pushl $0
  1026e0:	6a 00                	push   $0x0
  pushl $198
  1026e2:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1026e7:	e9 18 f8 ff ff       	jmp    101f04 <__alltraps>

001026ec <vector199>:
.globl vector199
vector199:
  pushl $0
  1026ec:	6a 00                	push   $0x0
  pushl $199
  1026ee:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1026f3:	e9 0c f8 ff ff       	jmp    101f04 <__alltraps>

001026f8 <vector200>:
.globl vector200
vector200:
  pushl $0
  1026f8:	6a 00                	push   $0x0
  pushl $200
  1026fa:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1026ff:	e9 00 f8 ff ff       	jmp    101f04 <__alltraps>

00102704 <vector201>:
.globl vector201
vector201:
  pushl $0
  102704:	6a 00                	push   $0x0
  pushl $201
  102706:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10270b:	e9 f4 f7 ff ff       	jmp    101f04 <__alltraps>

00102710 <vector202>:
.globl vector202
vector202:
  pushl $0
  102710:	6a 00                	push   $0x0
  pushl $202
  102712:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102717:	e9 e8 f7 ff ff       	jmp    101f04 <__alltraps>

0010271c <vector203>:
.globl vector203
vector203:
  pushl $0
  10271c:	6a 00                	push   $0x0
  pushl $203
  10271e:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102723:	e9 dc f7 ff ff       	jmp    101f04 <__alltraps>

00102728 <vector204>:
.globl vector204
vector204:
  pushl $0
  102728:	6a 00                	push   $0x0
  pushl $204
  10272a:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10272f:	e9 d0 f7 ff ff       	jmp    101f04 <__alltraps>

00102734 <vector205>:
.globl vector205
vector205:
  pushl $0
  102734:	6a 00                	push   $0x0
  pushl $205
  102736:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10273b:	e9 c4 f7 ff ff       	jmp    101f04 <__alltraps>

00102740 <vector206>:
.globl vector206
vector206:
  pushl $0
  102740:	6a 00                	push   $0x0
  pushl $206
  102742:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102747:	e9 b8 f7 ff ff       	jmp    101f04 <__alltraps>

0010274c <vector207>:
.globl vector207
vector207:
  pushl $0
  10274c:	6a 00                	push   $0x0
  pushl $207
  10274e:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102753:	e9 ac f7 ff ff       	jmp    101f04 <__alltraps>

00102758 <vector208>:
.globl vector208
vector208:
  pushl $0
  102758:	6a 00                	push   $0x0
  pushl $208
  10275a:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10275f:	e9 a0 f7 ff ff       	jmp    101f04 <__alltraps>

00102764 <vector209>:
.globl vector209
vector209:
  pushl $0
  102764:	6a 00                	push   $0x0
  pushl $209
  102766:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10276b:	e9 94 f7 ff ff       	jmp    101f04 <__alltraps>

00102770 <vector210>:
.globl vector210
vector210:
  pushl $0
  102770:	6a 00                	push   $0x0
  pushl $210
  102772:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102777:	e9 88 f7 ff ff       	jmp    101f04 <__alltraps>

0010277c <vector211>:
.globl vector211
vector211:
  pushl $0
  10277c:	6a 00                	push   $0x0
  pushl $211
  10277e:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102783:	e9 7c f7 ff ff       	jmp    101f04 <__alltraps>

00102788 <vector212>:
.globl vector212
vector212:
  pushl $0
  102788:	6a 00                	push   $0x0
  pushl $212
  10278a:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10278f:	e9 70 f7 ff ff       	jmp    101f04 <__alltraps>

00102794 <vector213>:
.globl vector213
vector213:
  pushl $0
  102794:	6a 00                	push   $0x0
  pushl $213
  102796:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10279b:	e9 64 f7 ff ff       	jmp    101f04 <__alltraps>

001027a0 <vector214>:
.globl vector214
vector214:
  pushl $0
  1027a0:	6a 00                	push   $0x0
  pushl $214
  1027a2:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1027a7:	e9 58 f7 ff ff       	jmp    101f04 <__alltraps>

001027ac <vector215>:
.globl vector215
vector215:
  pushl $0
  1027ac:	6a 00                	push   $0x0
  pushl $215
  1027ae:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1027b3:	e9 4c f7 ff ff       	jmp    101f04 <__alltraps>

001027b8 <vector216>:
.globl vector216
vector216:
  pushl $0
  1027b8:	6a 00                	push   $0x0
  pushl $216
  1027ba:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1027bf:	e9 40 f7 ff ff       	jmp    101f04 <__alltraps>

001027c4 <vector217>:
.globl vector217
vector217:
  pushl $0
  1027c4:	6a 00                	push   $0x0
  pushl $217
  1027c6:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1027cb:	e9 34 f7 ff ff       	jmp    101f04 <__alltraps>

001027d0 <vector218>:
.globl vector218
vector218:
  pushl $0
  1027d0:	6a 00                	push   $0x0
  pushl $218
  1027d2:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027d7:	e9 28 f7 ff ff       	jmp    101f04 <__alltraps>

001027dc <vector219>:
.globl vector219
vector219:
  pushl $0
  1027dc:	6a 00                	push   $0x0
  pushl $219
  1027de:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027e3:	e9 1c f7 ff ff       	jmp    101f04 <__alltraps>

001027e8 <vector220>:
.globl vector220
vector220:
  pushl $0
  1027e8:	6a 00                	push   $0x0
  pushl $220
  1027ea:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1027ef:	e9 10 f7 ff ff       	jmp    101f04 <__alltraps>

001027f4 <vector221>:
.globl vector221
vector221:
  pushl $0
  1027f4:	6a 00                	push   $0x0
  pushl $221
  1027f6:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1027fb:	e9 04 f7 ff ff       	jmp    101f04 <__alltraps>

00102800 <vector222>:
.globl vector222
vector222:
  pushl $0
  102800:	6a 00                	push   $0x0
  pushl $222
  102802:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102807:	e9 f8 f6 ff ff       	jmp    101f04 <__alltraps>

0010280c <vector223>:
.globl vector223
vector223:
  pushl $0
  10280c:	6a 00                	push   $0x0
  pushl $223
  10280e:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102813:	e9 ec f6 ff ff       	jmp    101f04 <__alltraps>

00102818 <vector224>:
.globl vector224
vector224:
  pushl $0
  102818:	6a 00                	push   $0x0
  pushl $224
  10281a:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10281f:	e9 e0 f6 ff ff       	jmp    101f04 <__alltraps>

00102824 <vector225>:
.globl vector225
vector225:
  pushl $0
  102824:	6a 00                	push   $0x0
  pushl $225
  102826:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10282b:	e9 d4 f6 ff ff       	jmp    101f04 <__alltraps>

00102830 <vector226>:
.globl vector226
vector226:
  pushl $0
  102830:	6a 00                	push   $0x0
  pushl $226
  102832:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102837:	e9 c8 f6 ff ff       	jmp    101f04 <__alltraps>

0010283c <vector227>:
.globl vector227
vector227:
  pushl $0
  10283c:	6a 00                	push   $0x0
  pushl $227
  10283e:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102843:	e9 bc f6 ff ff       	jmp    101f04 <__alltraps>

00102848 <vector228>:
.globl vector228
vector228:
  pushl $0
  102848:	6a 00                	push   $0x0
  pushl $228
  10284a:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10284f:	e9 b0 f6 ff ff       	jmp    101f04 <__alltraps>

00102854 <vector229>:
.globl vector229
vector229:
  pushl $0
  102854:	6a 00                	push   $0x0
  pushl $229
  102856:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10285b:	e9 a4 f6 ff ff       	jmp    101f04 <__alltraps>

00102860 <vector230>:
.globl vector230
vector230:
  pushl $0
  102860:	6a 00                	push   $0x0
  pushl $230
  102862:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102867:	e9 98 f6 ff ff       	jmp    101f04 <__alltraps>

0010286c <vector231>:
.globl vector231
vector231:
  pushl $0
  10286c:	6a 00                	push   $0x0
  pushl $231
  10286e:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102873:	e9 8c f6 ff ff       	jmp    101f04 <__alltraps>

00102878 <vector232>:
.globl vector232
vector232:
  pushl $0
  102878:	6a 00                	push   $0x0
  pushl $232
  10287a:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10287f:	e9 80 f6 ff ff       	jmp    101f04 <__alltraps>

00102884 <vector233>:
.globl vector233
vector233:
  pushl $0
  102884:	6a 00                	push   $0x0
  pushl $233
  102886:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10288b:	e9 74 f6 ff ff       	jmp    101f04 <__alltraps>

00102890 <vector234>:
.globl vector234
vector234:
  pushl $0
  102890:	6a 00                	push   $0x0
  pushl $234
  102892:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102897:	e9 68 f6 ff ff       	jmp    101f04 <__alltraps>

0010289c <vector235>:
.globl vector235
vector235:
  pushl $0
  10289c:	6a 00                	push   $0x0
  pushl $235
  10289e:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1028a3:	e9 5c f6 ff ff       	jmp    101f04 <__alltraps>

001028a8 <vector236>:
.globl vector236
vector236:
  pushl $0
  1028a8:	6a 00                	push   $0x0
  pushl $236
  1028aa:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1028af:	e9 50 f6 ff ff       	jmp    101f04 <__alltraps>

001028b4 <vector237>:
.globl vector237
vector237:
  pushl $0
  1028b4:	6a 00                	push   $0x0
  pushl $237
  1028b6:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1028bb:	e9 44 f6 ff ff       	jmp    101f04 <__alltraps>

001028c0 <vector238>:
.globl vector238
vector238:
  pushl $0
  1028c0:	6a 00                	push   $0x0
  pushl $238
  1028c2:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1028c7:	e9 38 f6 ff ff       	jmp    101f04 <__alltraps>

001028cc <vector239>:
.globl vector239
vector239:
  pushl $0
  1028cc:	6a 00                	push   $0x0
  pushl $239
  1028ce:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028d3:	e9 2c f6 ff ff       	jmp    101f04 <__alltraps>

001028d8 <vector240>:
.globl vector240
vector240:
  pushl $0
  1028d8:	6a 00                	push   $0x0
  pushl $240
  1028da:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028df:	e9 20 f6 ff ff       	jmp    101f04 <__alltraps>

001028e4 <vector241>:
.globl vector241
vector241:
  pushl $0
  1028e4:	6a 00                	push   $0x0
  pushl $241
  1028e6:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1028eb:	e9 14 f6 ff ff       	jmp    101f04 <__alltraps>

001028f0 <vector242>:
.globl vector242
vector242:
  pushl $0
  1028f0:	6a 00                	push   $0x0
  pushl $242
  1028f2:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1028f7:	e9 08 f6 ff ff       	jmp    101f04 <__alltraps>

001028fc <vector243>:
.globl vector243
vector243:
  pushl $0
  1028fc:	6a 00                	push   $0x0
  pushl $243
  1028fe:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102903:	e9 fc f5 ff ff       	jmp    101f04 <__alltraps>

00102908 <vector244>:
.globl vector244
vector244:
  pushl $0
  102908:	6a 00                	push   $0x0
  pushl $244
  10290a:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10290f:	e9 f0 f5 ff ff       	jmp    101f04 <__alltraps>

00102914 <vector245>:
.globl vector245
vector245:
  pushl $0
  102914:	6a 00                	push   $0x0
  pushl $245
  102916:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10291b:	e9 e4 f5 ff ff       	jmp    101f04 <__alltraps>

00102920 <vector246>:
.globl vector246
vector246:
  pushl $0
  102920:	6a 00                	push   $0x0
  pushl $246
  102922:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102927:	e9 d8 f5 ff ff       	jmp    101f04 <__alltraps>

0010292c <vector247>:
.globl vector247
vector247:
  pushl $0
  10292c:	6a 00                	push   $0x0
  pushl $247
  10292e:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102933:	e9 cc f5 ff ff       	jmp    101f04 <__alltraps>

00102938 <vector248>:
.globl vector248
vector248:
  pushl $0
  102938:	6a 00                	push   $0x0
  pushl $248
  10293a:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10293f:	e9 c0 f5 ff ff       	jmp    101f04 <__alltraps>

00102944 <vector249>:
.globl vector249
vector249:
  pushl $0
  102944:	6a 00                	push   $0x0
  pushl $249
  102946:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10294b:	e9 b4 f5 ff ff       	jmp    101f04 <__alltraps>

00102950 <vector250>:
.globl vector250
vector250:
  pushl $0
  102950:	6a 00                	push   $0x0
  pushl $250
  102952:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102957:	e9 a8 f5 ff ff       	jmp    101f04 <__alltraps>

0010295c <vector251>:
.globl vector251
vector251:
  pushl $0
  10295c:	6a 00                	push   $0x0
  pushl $251
  10295e:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102963:	e9 9c f5 ff ff       	jmp    101f04 <__alltraps>

00102968 <vector252>:
.globl vector252
vector252:
  pushl $0
  102968:	6a 00                	push   $0x0
  pushl $252
  10296a:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10296f:	e9 90 f5 ff ff       	jmp    101f04 <__alltraps>

00102974 <vector253>:
.globl vector253
vector253:
  pushl $0
  102974:	6a 00                	push   $0x0
  pushl $253
  102976:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10297b:	e9 84 f5 ff ff       	jmp    101f04 <__alltraps>

00102980 <vector254>:
.globl vector254
vector254:
  pushl $0
  102980:	6a 00                	push   $0x0
  pushl $254
  102982:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102987:	e9 78 f5 ff ff       	jmp    101f04 <__alltraps>

0010298c <vector255>:
.globl vector255
vector255:
  pushl $0
  10298c:	6a 00                	push   $0x0
  pushl $255
  10298e:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102993:	e9 6c f5 ff ff       	jmp    101f04 <__alltraps>

00102998 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102998:	55                   	push   %ebp
  102999:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10299b:	8b 45 08             	mov    0x8(%ebp),%eax
  10299e:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1029a1:	b8 23 00 00 00       	mov    $0x23,%eax
  1029a6:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1029a8:	b8 23 00 00 00       	mov    $0x23,%eax
  1029ad:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1029af:	b8 10 00 00 00       	mov    $0x10,%eax
  1029b4:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1029b6:	b8 10 00 00 00       	mov    $0x10,%eax
  1029bb:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1029bd:	b8 10 00 00 00       	mov    $0x10,%eax
  1029c2:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1029c4:	ea cb 29 10 00 08 00 	ljmp   $0x8,$0x1029cb
}
  1029cb:	5d                   	pop    %ebp
  1029cc:	c3                   	ret    

001029cd <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1029cd:	55                   	push   %ebp
  1029ce:	89 e5                	mov    %esp,%ebp
  1029d0:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029d3:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  1029d8:	05 00 04 00 00       	add    $0x400,%eax
  1029dd:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1029e2:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1029e9:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1029eb:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1029f2:	68 00 
  1029f4:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1029f9:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1029ff:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a04:	c1 e8 10             	shr    $0x10,%eax
  102a07:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102a0c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a13:	83 e0 f0             	and    $0xfffffff0,%eax
  102a16:	83 c8 09             	or     $0x9,%eax
  102a19:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a1e:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a25:	83 c8 10             	or     $0x10,%eax
  102a28:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a2d:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a34:	83 e0 9f             	and    $0xffffff9f,%eax
  102a37:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a3c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a43:	83 c8 80             	or     $0xffffff80,%eax
  102a46:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a4b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a52:	83 e0 f0             	and    $0xfffffff0,%eax
  102a55:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a5a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a61:	83 e0 ef             	and    $0xffffffef,%eax
  102a64:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a69:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a70:	83 e0 df             	and    $0xffffffdf,%eax
  102a73:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a78:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a7f:	83 c8 40             	or     $0x40,%eax
  102a82:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a87:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a8e:	83 e0 7f             	and    $0x7f,%eax
  102a91:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a96:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a9b:	c1 e8 18             	shr    $0x18,%eax
  102a9e:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102aa3:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102aaa:	83 e0 ef             	and    $0xffffffef,%eax
  102aad:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102ab2:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102ab9:	e8 da fe ff ff       	call   102998 <lgdt>
  102abe:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102ac4:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102ac8:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102acb:	c9                   	leave  
  102acc:	c3                   	ret    

00102acd <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102acd:	55                   	push   %ebp
  102ace:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102ad0:	e8 f8 fe ff ff       	call   1029cd <gdt_init>
}
  102ad5:	5d                   	pop    %ebp
  102ad6:	c3                   	ret    
	...

00102ad8 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102ad8:	55                   	push   %ebp
  102ad9:	89 e5                	mov    %esp,%ebp
  102adb:	56                   	push   %esi
  102adc:	53                   	push   %ebx
  102add:	83 ec 60             	sub    $0x60,%esp
  102ae0:	8b 45 10             	mov    0x10(%ebp),%eax
  102ae3:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102ae6:	8b 45 14             	mov    0x14(%ebp),%eax
  102ae9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102aec:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102aef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102af2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102af5:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102af8:	8b 45 18             	mov    0x18(%ebp),%eax
  102afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102afe:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b01:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b04:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102b07:	89 55 cc             	mov    %edx,-0x34(%ebp)
  102b0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102b0d:	8b 55 cc             	mov    -0x34(%ebp),%edx
  102b10:	89 d3                	mov    %edx,%ebx
  102b12:	89 c6                	mov    %eax,%esi
  102b14:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102b17:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  102b1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b20:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102b24:	74 1c                	je     102b42 <printnum+0x6a>
  102b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b29:	ba 00 00 00 00       	mov    $0x0,%edx
  102b2e:	f7 75 e4             	divl   -0x1c(%ebp)
  102b31:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102b34:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b37:	ba 00 00 00 00       	mov    $0x0,%edx
  102b3c:	f7 75 e4             	divl   -0x1c(%ebp)
  102b3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b42:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b48:	89 d6                	mov    %edx,%esi
  102b4a:	89 c3                	mov    %eax,%ebx
  102b4c:	89 f0                	mov    %esi,%eax
  102b4e:	89 da                	mov    %ebx,%edx
  102b50:	f7 75 e4             	divl   -0x1c(%ebp)
  102b53:	89 d3                	mov    %edx,%ebx
  102b55:	89 c6                	mov    %eax,%esi
  102b57:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102b5a:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  102b5d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b60:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102b63:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b66:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  102b69:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102b6c:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  102b6f:	89 c3                	mov    %eax,%ebx
  102b71:	89 d6                	mov    %edx,%esi
  102b73:	89 5d e8             	mov    %ebx,-0x18(%ebp)
  102b76:	89 75 ec             	mov    %esi,-0x14(%ebp)
  102b79:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b7c:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102b7f:	8b 45 18             	mov    0x18(%ebp),%eax
  102b82:	ba 00 00 00 00       	mov    $0x0,%edx
  102b87:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b8a:	77 56                	ja     102be2 <printnum+0x10a>
  102b8c:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b8f:	72 05                	jb     102b96 <printnum+0xbe>
  102b91:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102b94:	77 4c                	ja     102be2 <printnum+0x10a>
        printnum(putch, putdat, result, base, width - 1, padc);
  102b96:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102b99:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b9c:	8b 45 20             	mov    0x20(%ebp),%eax
  102b9f:	89 44 24 18          	mov    %eax,0x18(%esp)
  102ba3:	89 54 24 14          	mov    %edx,0x14(%esp)
  102ba7:	8b 45 18             	mov    0x18(%ebp),%eax
  102baa:	89 44 24 10          	mov    %eax,0x10(%esp)
  102bae:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102bb1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102bb4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102bb8:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102bbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bbf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bc3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc6:	89 04 24             	mov    %eax,(%esp)
  102bc9:	e8 0a ff ff ff       	call   102ad8 <printnum>
  102bce:	eb 1c                	jmp    102bec <printnum+0x114>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102bd0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bd7:	8b 45 20             	mov    0x20(%ebp),%eax
  102bda:	89 04 24             	mov    %eax,(%esp)
  102bdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102be0:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102be2:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102be6:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102bea:	7f e4                	jg     102bd0 <printnum+0xf8>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102bec:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102bef:	05 30 3e 10 00       	add    $0x103e30,%eax
  102bf4:	0f b6 00             	movzbl (%eax),%eax
  102bf7:	0f be c0             	movsbl %al,%eax
  102bfa:	8b 55 0c             	mov    0xc(%ebp),%edx
  102bfd:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c01:	89 04 24             	mov    %eax,(%esp)
  102c04:	8b 45 08             	mov    0x8(%ebp),%eax
  102c07:	ff d0                	call   *%eax
}
  102c09:	83 c4 60             	add    $0x60,%esp
  102c0c:	5b                   	pop    %ebx
  102c0d:	5e                   	pop    %esi
  102c0e:	5d                   	pop    %ebp
  102c0f:	c3                   	ret    

00102c10 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102c10:	55                   	push   %ebp
  102c11:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102c13:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102c17:	7e 14                	jle    102c2d <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102c19:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1c:	8b 00                	mov    (%eax),%eax
  102c1e:	8d 48 08             	lea    0x8(%eax),%ecx
  102c21:	8b 55 08             	mov    0x8(%ebp),%edx
  102c24:	89 0a                	mov    %ecx,(%edx)
  102c26:	8b 50 04             	mov    0x4(%eax),%edx
  102c29:	8b 00                	mov    (%eax),%eax
  102c2b:	eb 30                	jmp    102c5d <getuint+0x4d>
    }
    else if (lflag) {
  102c2d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c31:	74 16                	je     102c49 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102c33:	8b 45 08             	mov    0x8(%ebp),%eax
  102c36:	8b 00                	mov    (%eax),%eax
  102c38:	8d 48 04             	lea    0x4(%eax),%ecx
  102c3b:	8b 55 08             	mov    0x8(%ebp),%edx
  102c3e:	89 0a                	mov    %ecx,(%edx)
  102c40:	8b 00                	mov    (%eax),%eax
  102c42:	ba 00 00 00 00       	mov    $0x0,%edx
  102c47:	eb 14                	jmp    102c5d <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102c49:	8b 45 08             	mov    0x8(%ebp),%eax
  102c4c:	8b 00                	mov    (%eax),%eax
  102c4e:	8d 48 04             	lea    0x4(%eax),%ecx
  102c51:	8b 55 08             	mov    0x8(%ebp),%edx
  102c54:	89 0a                	mov    %ecx,(%edx)
  102c56:	8b 00                	mov    (%eax),%eax
  102c58:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102c5d:	5d                   	pop    %ebp
  102c5e:	c3                   	ret    

00102c5f <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102c5f:	55                   	push   %ebp
  102c60:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102c62:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102c66:	7e 14                	jle    102c7c <getint+0x1d>
        return va_arg(*ap, long long);
  102c68:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6b:	8b 00                	mov    (%eax),%eax
  102c6d:	8d 48 08             	lea    0x8(%eax),%ecx
  102c70:	8b 55 08             	mov    0x8(%ebp),%edx
  102c73:	89 0a                	mov    %ecx,(%edx)
  102c75:	8b 50 04             	mov    0x4(%eax),%edx
  102c78:	8b 00                	mov    (%eax),%eax
  102c7a:	eb 30                	jmp    102cac <getint+0x4d>
    }
    else if (lflag) {
  102c7c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c80:	74 16                	je     102c98 <getint+0x39>
        return va_arg(*ap, long);
  102c82:	8b 45 08             	mov    0x8(%ebp),%eax
  102c85:	8b 00                	mov    (%eax),%eax
  102c87:	8d 48 04             	lea    0x4(%eax),%ecx
  102c8a:	8b 55 08             	mov    0x8(%ebp),%edx
  102c8d:	89 0a                	mov    %ecx,(%edx)
  102c8f:	8b 00                	mov    (%eax),%eax
  102c91:	89 c2                	mov    %eax,%edx
  102c93:	c1 fa 1f             	sar    $0x1f,%edx
  102c96:	eb 14                	jmp    102cac <getint+0x4d>
    }
    else {
        return va_arg(*ap, int);
  102c98:	8b 45 08             	mov    0x8(%ebp),%eax
  102c9b:	8b 00                	mov    (%eax),%eax
  102c9d:	8d 48 04             	lea    0x4(%eax),%ecx
  102ca0:	8b 55 08             	mov    0x8(%ebp),%edx
  102ca3:	89 0a                	mov    %ecx,(%edx)
  102ca5:	8b 00                	mov    (%eax),%eax
  102ca7:	89 c2                	mov    %eax,%edx
  102ca9:	c1 fa 1f             	sar    $0x1f,%edx
    }
}
  102cac:	5d                   	pop    %ebp
  102cad:	c3                   	ret    

00102cae <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102cae:	55                   	push   %ebp
  102caf:	89 e5                	mov    %esp,%ebp
  102cb1:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102cb4:	8d 55 14             	lea    0x14(%ebp),%edx
  102cb7:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102cba:	89 10                	mov    %edx,(%eax)
    vprintfmt(putch, putdat, fmt, ap);
  102cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cbf:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102cc3:	8b 45 10             	mov    0x10(%ebp),%eax
  102cc6:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cca:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ccd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd4:	89 04 24             	mov    %eax,(%esp)
  102cd7:	e8 02 00 00 00       	call   102cde <vprintfmt>
    va_end(ap);
}
  102cdc:	c9                   	leave  
  102cdd:	c3                   	ret    

00102cde <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102cde:	55                   	push   %ebp
  102cdf:	89 e5                	mov    %esp,%ebp
  102ce1:	56                   	push   %esi
  102ce2:	53                   	push   %ebx
  102ce3:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ce6:	eb 17                	jmp    102cff <vprintfmt+0x21>
            if (ch == '\0') {
  102ce8:	85 db                	test   %ebx,%ebx
  102cea:	0f 84 db 03 00 00    	je     1030cb <vprintfmt+0x3ed>
                return;
            }
            putch(ch, putdat);
  102cf0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf7:	89 1c 24             	mov    %ebx,(%esp)
  102cfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfd:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102cff:	8b 45 10             	mov    0x10(%ebp),%eax
  102d02:	0f b6 00             	movzbl (%eax),%eax
  102d05:	0f b6 d8             	movzbl %al,%ebx
  102d08:	83 fb 25             	cmp    $0x25,%ebx
  102d0b:	0f 95 c0             	setne  %al
  102d0e:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102d12:	84 c0                	test   %al,%al
  102d14:	75 d2                	jne    102ce8 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102d16:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102d1a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102d21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d24:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102d27:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102d2e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102d31:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102d34:	eb 04                	jmp    102d3a <vprintfmt+0x5c>
            goto process_precision;

        case '.':
            if (width < 0)
                width = 0;
            goto reswitch;
  102d36:	90                   	nop
  102d37:	eb 01                	jmp    102d3a <vprintfmt+0x5c>
            goto reswitch;

        process_precision:
            if (width < 0)
                width = precision, precision = -1;
            goto reswitch;
  102d39:	90                   	nop
        char padc = ' ';
        width = precision = -1;
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102d3a:	8b 45 10             	mov    0x10(%ebp),%eax
  102d3d:	0f b6 00             	movzbl (%eax),%eax
  102d40:	0f b6 d8             	movzbl %al,%ebx
  102d43:	89 d8                	mov    %ebx,%eax
  102d45:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102d49:	83 e8 23             	sub    $0x23,%eax
  102d4c:	83 f8 55             	cmp    $0x55,%eax
  102d4f:	0f 87 45 03 00 00    	ja     10309a <vprintfmt+0x3bc>
  102d55:	8b 04 85 54 3e 10 00 	mov    0x103e54(,%eax,4),%eax
  102d5c:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102d5e:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102d62:	eb d6                	jmp    102d3a <vprintfmt+0x5c>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102d64:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102d68:	eb d0                	jmp    102d3a <vprintfmt+0x5c>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d6a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102d71:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102d74:	89 d0                	mov    %edx,%eax
  102d76:	c1 e0 02             	shl    $0x2,%eax
  102d79:	01 d0                	add    %edx,%eax
  102d7b:	01 c0                	add    %eax,%eax
  102d7d:	01 d8                	add    %ebx,%eax
  102d7f:	83 e8 30             	sub    $0x30,%eax
  102d82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102d85:	8b 45 10             	mov    0x10(%ebp),%eax
  102d88:	0f b6 00             	movzbl (%eax),%eax
  102d8b:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102d8e:	83 fb 2f             	cmp    $0x2f,%ebx
  102d91:	7e 39                	jle    102dcc <vprintfmt+0xee>
  102d93:	83 fb 39             	cmp    $0x39,%ebx
  102d96:	7f 34                	jg     102dcc <vprintfmt+0xee>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d98:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102d9c:	eb d3                	jmp    102d71 <vprintfmt+0x93>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102d9e:	8b 45 14             	mov    0x14(%ebp),%eax
  102da1:	8d 50 04             	lea    0x4(%eax),%edx
  102da4:	89 55 14             	mov    %edx,0x14(%ebp)
  102da7:	8b 00                	mov    (%eax),%eax
  102da9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102dac:	eb 1f                	jmp    102dcd <vprintfmt+0xef>

        case '.':
            if (width < 0)
  102dae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102db2:	79 82                	jns    102d36 <vprintfmt+0x58>
                width = 0;
  102db4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102dbb:	e9 76 ff ff ff       	jmp    102d36 <vprintfmt+0x58>

        case '#':
            altflag = 1;
  102dc0:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102dc7:	e9 6e ff ff ff       	jmp    102d3a <vprintfmt+0x5c>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102dcc:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102dcd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102dd1:	0f 89 62 ff ff ff    	jns    102d39 <vprintfmt+0x5b>
                width = precision, precision = -1;
  102dd7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102dda:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ddd:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102de4:	e9 50 ff ff ff       	jmp    102d39 <vprintfmt+0x5b>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102de9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102ded:	e9 48 ff ff ff       	jmp    102d3a <vprintfmt+0x5c>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102df2:	8b 45 14             	mov    0x14(%ebp),%eax
  102df5:	8d 50 04             	lea    0x4(%eax),%edx
  102df8:	89 55 14             	mov    %edx,0x14(%ebp)
  102dfb:	8b 00                	mov    (%eax),%eax
  102dfd:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e00:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e04:	89 04 24             	mov    %eax,(%esp)
  102e07:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0a:	ff d0                	call   *%eax
            break;
  102e0c:	e9 b4 02 00 00       	jmp    1030c5 <vprintfmt+0x3e7>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102e11:	8b 45 14             	mov    0x14(%ebp),%eax
  102e14:	8d 50 04             	lea    0x4(%eax),%edx
  102e17:	89 55 14             	mov    %edx,0x14(%ebp)
  102e1a:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102e1c:	85 db                	test   %ebx,%ebx
  102e1e:	79 02                	jns    102e22 <vprintfmt+0x144>
                err = -err;
  102e20:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102e22:	83 fb 06             	cmp    $0x6,%ebx
  102e25:	7f 0b                	jg     102e32 <vprintfmt+0x154>
  102e27:	8b 34 9d 14 3e 10 00 	mov    0x103e14(,%ebx,4),%esi
  102e2e:	85 f6                	test   %esi,%esi
  102e30:	75 23                	jne    102e55 <vprintfmt+0x177>
                printfmt(putch, putdat, "error %d", err);
  102e32:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102e36:	c7 44 24 08 41 3e 10 	movl   $0x103e41,0x8(%esp)
  102e3d:	00 
  102e3e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e41:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e45:	8b 45 08             	mov    0x8(%ebp),%eax
  102e48:	89 04 24             	mov    %eax,(%esp)
  102e4b:	e8 5e fe ff ff       	call   102cae <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102e50:	e9 70 02 00 00       	jmp    1030c5 <vprintfmt+0x3e7>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102e55:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102e59:	c7 44 24 08 4a 3e 10 	movl   $0x103e4a,0x8(%esp)
  102e60:	00 
  102e61:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e64:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e68:	8b 45 08             	mov    0x8(%ebp),%eax
  102e6b:	89 04 24             	mov    %eax,(%esp)
  102e6e:	e8 3b fe ff ff       	call   102cae <printfmt>
            }
            break;
  102e73:	e9 4d 02 00 00       	jmp    1030c5 <vprintfmt+0x3e7>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102e78:	8b 45 14             	mov    0x14(%ebp),%eax
  102e7b:	8d 50 04             	lea    0x4(%eax),%edx
  102e7e:	89 55 14             	mov    %edx,0x14(%ebp)
  102e81:	8b 30                	mov    (%eax),%esi
  102e83:	85 f6                	test   %esi,%esi
  102e85:	75 05                	jne    102e8c <vprintfmt+0x1ae>
                p = "(null)";
  102e87:	be 4d 3e 10 00       	mov    $0x103e4d,%esi
            }
            if (width > 0 && padc != '-') {
  102e8c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e90:	7e 7c                	jle    102f0e <vprintfmt+0x230>
  102e92:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102e96:	74 76                	je     102f0e <vprintfmt+0x230>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e98:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102e9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ea2:	89 34 24             	mov    %esi,(%esp)
  102ea5:	e8 21 03 00 00       	call   1031cb <strnlen>
  102eaa:	89 da                	mov    %ebx,%edx
  102eac:	29 c2                	sub    %eax,%edx
  102eae:	89 d0                	mov    %edx,%eax
  102eb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102eb3:	eb 17                	jmp    102ecc <vprintfmt+0x1ee>
                    putch(padc, putdat);
  102eb5:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102eb9:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ebc:	89 54 24 04          	mov    %edx,0x4(%esp)
  102ec0:	89 04 24             	mov    %eax,(%esp)
  102ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec6:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ec8:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ecc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102ed0:	7f e3                	jg     102eb5 <vprintfmt+0x1d7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ed2:	eb 3a                	jmp    102f0e <vprintfmt+0x230>
                if (altflag && (ch < ' ' || ch > '~')) {
  102ed4:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102ed8:	74 1f                	je     102ef9 <vprintfmt+0x21b>
  102eda:	83 fb 1f             	cmp    $0x1f,%ebx
  102edd:	7e 05                	jle    102ee4 <vprintfmt+0x206>
  102edf:	83 fb 7e             	cmp    $0x7e,%ebx
  102ee2:	7e 15                	jle    102ef9 <vprintfmt+0x21b>
                    putch('?', putdat);
  102ee4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee7:	89 44 24 04          	mov    %eax,0x4(%esp)
  102eeb:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102ef2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef5:	ff d0                	call   *%eax
  102ef7:	eb 0f                	jmp    102f08 <vprintfmt+0x22a>
                }
                else {
                    putch(ch, putdat);
  102ef9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f00:	89 1c 24             	mov    %ebx,(%esp)
  102f03:	8b 45 08             	mov    0x8(%ebp),%eax
  102f06:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102f08:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102f0c:	eb 01                	jmp    102f0f <vprintfmt+0x231>
  102f0e:	90                   	nop
  102f0f:	0f b6 06             	movzbl (%esi),%eax
  102f12:	0f be d8             	movsbl %al,%ebx
  102f15:	85 db                	test   %ebx,%ebx
  102f17:	0f 95 c0             	setne  %al
  102f1a:	83 c6 01             	add    $0x1,%esi
  102f1d:	84 c0                	test   %al,%al
  102f1f:	74 29                	je     102f4a <vprintfmt+0x26c>
  102f21:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f25:	78 ad                	js     102ed4 <vprintfmt+0x1f6>
  102f27:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102f2b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102f2f:	79 a3                	jns    102ed4 <vprintfmt+0x1f6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102f31:	eb 17                	jmp    102f4a <vprintfmt+0x26c>
                putch(' ', putdat);
  102f33:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f36:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f3a:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102f41:	8b 45 08             	mov    0x8(%ebp),%eax
  102f44:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102f46:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102f4a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f4e:	7f e3                	jg     102f33 <vprintfmt+0x255>
                putch(' ', putdat);
            }
            break;
  102f50:	e9 70 01 00 00       	jmp    1030c5 <vprintfmt+0x3e7>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102f55:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f58:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f5c:	8d 45 14             	lea    0x14(%ebp),%eax
  102f5f:	89 04 24             	mov    %eax,(%esp)
  102f62:	e8 f8 fc ff ff       	call   102c5f <getint>
  102f67:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f6a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102f6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f70:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f73:	85 d2                	test   %edx,%edx
  102f75:	79 26                	jns    102f9d <vprintfmt+0x2bf>
                putch('-', putdat);
  102f77:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f7e:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102f85:	8b 45 08             	mov    0x8(%ebp),%eax
  102f88:	ff d0                	call   *%eax
                num = -(long long)num;
  102f8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f90:	f7 d8                	neg    %eax
  102f92:	83 d2 00             	adc    $0x0,%edx
  102f95:	f7 da                	neg    %edx
  102f97:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f9a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102f9d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102fa4:	e9 a8 00 00 00       	jmp    103051 <vprintfmt+0x373>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102fa9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fac:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fb0:	8d 45 14             	lea    0x14(%ebp),%eax
  102fb3:	89 04 24             	mov    %eax,(%esp)
  102fb6:	e8 55 fc ff ff       	call   102c10 <getuint>
  102fbb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fbe:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102fc1:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102fc8:	e9 84 00 00 00       	jmp    103051 <vprintfmt+0x373>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102fcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fd4:	8d 45 14             	lea    0x14(%ebp),%eax
  102fd7:	89 04 24             	mov    %eax,(%esp)
  102fda:	e8 31 fc ff ff       	call   102c10 <getuint>
  102fdf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fe2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102fe5:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102fec:	eb 63                	jmp    103051 <vprintfmt+0x373>

        // pointer
        case 'p':
            putch('0', putdat);
  102fee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ff1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ff5:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102ffc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fff:	ff d0                	call   *%eax
            putch('x', putdat);
  103001:	8b 45 0c             	mov    0xc(%ebp),%eax
  103004:	89 44 24 04          	mov    %eax,0x4(%esp)
  103008:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  10300f:	8b 45 08             	mov    0x8(%ebp),%eax
  103012:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103014:	8b 45 14             	mov    0x14(%ebp),%eax
  103017:	8d 50 04             	lea    0x4(%eax),%edx
  10301a:	89 55 14             	mov    %edx,0x14(%ebp)
  10301d:	8b 00                	mov    (%eax),%eax
  10301f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103022:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103029:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103030:	eb 1f                	jmp    103051 <vprintfmt+0x373>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103032:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103035:	89 44 24 04          	mov    %eax,0x4(%esp)
  103039:	8d 45 14             	lea    0x14(%ebp),%eax
  10303c:	89 04 24             	mov    %eax,(%esp)
  10303f:	e8 cc fb ff ff       	call   102c10 <getuint>
  103044:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103047:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10304a:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103051:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103055:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103058:	89 54 24 18          	mov    %edx,0x18(%esp)
  10305c:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10305f:	89 54 24 14          	mov    %edx,0x14(%esp)
  103063:	89 44 24 10          	mov    %eax,0x10(%esp)
  103067:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10306a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10306d:	89 44 24 08          	mov    %eax,0x8(%esp)
  103071:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103075:	8b 45 0c             	mov    0xc(%ebp),%eax
  103078:	89 44 24 04          	mov    %eax,0x4(%esp)
  10307c:	8b 45 08             	mov    0x8(%ebp),%eax
  10307f:	89 04 24             	mov    %eax,(%esp)
  103082:	e8 51 fa ff ff       	call   102ad8 <printnum>
            break;
  103087:	eb 3c                	jmp    1030c5 <vprintfmt+0x3e7>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103089:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103090:	89 1c 24             	mov    %ebx,(%esp)
  103093:	8b 45 08             	mov    0x8(%ebp),%eax
  103096:	ff d0                	call   *%eax
            break;
  103098:	eb 2b                	jmp    1030c5 <vprintfmt+0x3e7>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  10309a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10309d:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030a1:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1030a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ab:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1030ad:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1030b1:	eb 04                	jmp    1030b7 <vprintfmt+0x3d9>
  1030b3:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1030b7:	8b 45 10             	mov    0x10(%ebp),%eax
  1030ba:	83 e8 01             	sub    $0x1,%eax
  1030bd:	0f b6 00             	movzbl (%eax),%eax
  1030c0:	3c 25                	cmp    $0x25,%al
  1030c2:	75 ef                	jne    1030b3 <vprintfmt+0x3d5>
                /* do nothing */;
            break;
  1030c4:	90                   	nop
        }
    }
  1030c5:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1030c6:	e9 34 fc ff ff       	jmp    102cff <vprintfmt+0x21>
            if (ch == '\0') {
                return;
  1030cb:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  1030cc:	83 c4 40             	add    $0x40,%esp
  1030cf:	5b                   	pop    %ebx
  1030d0:	5e                   	pop    %esi
  1030d1:	5d                   	pop    %ebp
  1030d2:	c3                   	ret    

001030d3 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1030d3:	55                   	push   %ebp
  1030d4:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1030d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d9:	8b 40 08             	mov    0x8(%eax),%eax
  1030dc:	8d 50 01             	lea    0x1(%eax),%edx
  1030df:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e2:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1030e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e8:	8b 10                	mov    (%eax),%edx
  1030ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030ed:	8b 40 04             	mov    0x4(%eax),%eax
  1030f0:	39 c2                	cmp    %eax,%edx
  1030f2:	73 12                	jae    103106 <sprintputch+0x33>
        *b->buf ++ = ch;
  1030f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f7:	8b 00                	mov    (%eax),%eax
  1030f9:	8b 55 08             	mov    0x8(%ebp),%edx
  1030fc:	88 10                	mov    %dl,(%eax)
  1030fe:	8d 50 01             	lea    0x1(%eax),%edx
  103101:	8b 45 0c             	mov    0xc(%ebp),%eax
  103104:	89 10                	mov    %edx,(%eax)
    }
}
  103106:	5d                   	pop    %ebp
  103107:	c3                   	ret    

00103108 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103108:	55                   	push   %ebp
  103109:	89 e5                	mov    %esp,%ebp
  10310b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10310e:	8d 55 14             	lea    0x14(%ebp),%edx
  103111:	8d 45 f0             	lea    -0x10(%ebp),%eax
  103114:	89 10                	mov    %edx,(%eax)
    cnt = vsnprintf(str, size, fmt, ap);
  103116:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103119:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10311d:	8b 45 10             	mov    0x10(%ebp),%eax
  103120:	89 44 24 08          	mov    %eax,0x8(%esp)
  103124:	8b 45 0c             	mov    0xc(%ebp),%eax
  103127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10312b:	8b 45 08             	mov    0x8(%ebp),%eax
  10312e:	89 04 24             	mov    %eax,(%esp)
  103131:	e8 08 00 00 00       	call   10313e <vsnprintf>
  103136:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103139:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10313c:	c9                   	leave  
  10313d:	c3                   	ret    

0010313e <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10313e:	55                   	push   %ebp
  10313f:	89 e5                	mov    %esp,%ebp
  103141:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103144:	8b 45 08             	mov    0x8(%ebp),%eax
  103147:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10314a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314d:	83 e8 01             	sub    $0x1,%eax
  103150:	03 45 08             	add    0x8(%ebp),%eax
  103153:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103156:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10315d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103161:	74 0a                	je     10316d <vsnprintf+0x2f>
  103163:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103166:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103169:	39 c2                	cmp    %eax,%edx
  10316b:	76 07                	jbe    103174 <vsnprintf+0x36>
        return -E_INVAL;
  10316d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103172:	eb 2a                	jmp    10319e <vsnprintf+0x60>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103174:	8b 45 14             	mov    0x14(%ebp),%eax
  103177:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10317b:	8b 45 10             	mov    0x10(%ebp),%eax
  10317e:	89 44 24 08          	mov    %eax,0x8(%esp)
  103182:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103185:	89 44 24 04          	mov    %eax,0x4(%esp)
  103189:	c7 04 24 d3 30 10 00 	movl   $0x1030d3,(%esp)
  103190:	e8 49 fb ff ff       	call   102cde <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103195:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103198:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10319b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10319e:	c9                   	leave  
  10319f:	c3                   	ret    

001031a0 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1031a0:	55                   	push   %ebp
  1031a1:	89 e5                	mov    %esp,%ebp
  1031a3:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1031a6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1031ad:	eb 04                	jmp    1031b3 <strlen+0x13>
        cnt ++;
  1031af:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  1031b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b6:	0f b6 00             	movzbl (%eax),%eax
  1031b9:	84 c0                	test   %al,%al
  1031bb:	0f 95 c0             	setne  %al
  1031be:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031c2:	84 c0                	test   %al,%al
  1031c4:	75 e9                	jne    1031af <strlen+0xf>
        cnt ++;
    }
    return cnt;
  1031c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1031c9:	c9                   	leave  
  1031ca:	c3                   	ret    

001031cb <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1031cb:	55                   	push   %ebp
  1031cc:	89 e5                	mov    %esp,%ebp
  1031ce:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1031d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  1031d8:	eb 04                	jmp    1031de <strnlen+0x13>
        cnt ++;
  1031da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  1031de:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e1:	3b 45 0c             	cmp    0xc(%ebp),%eax
  1031e4:	73 13                	jae    1031f9 <strnlen+0x2e>
  1031e6:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e9:	0f b6 00             	movzbl (%eax),%eax
  1031ec:	84 c0                	test   %al,%al
  1031ee:	0f 95 c0             	setne  %al
  1031f1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031f5:	84 c0                	test   %al,%al
  1031f7:	75 e1                	jne    1031da <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  1031f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1031fc:	c9                   	leave  
  1031fd:	c3                   	ret    

001031fe <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  1031fe:	55                   	push   %ebp
  1031ff:	89 e5                	mov    %esp,%ebp
  103201:	57                   	push   %edi
  103202:	56                   	push   %esi
  103203:	53                   	push   %ebx
  103204:	83 ec 24             	sub    $0x24,%esp
  103207:	8b 45 08             	mov    0x8(%ebp),%eax
  10320a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10320d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103210:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  103213:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103216:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103219:	89 d6                	mov    %edx,%esi
  10321b:	89 c3                	mov    %eax,%ebx
  10321d:	89 df                	mov    %ebx,%edi
  10321f:	ac                   	lods   %ds:(%esi),%al
  103220:	aa                   	stos   %al,%es:(%edi)
  103221:	84 c0                	test   %al,%al
  103223:	75 fa                	jne    10321f <strcpy+0x21>
  103225:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103228:	89 fb                	mov    %edi,%ebx
  10322a:	89 75 e8             	mov    %esi,-0x18(%ebp)
  10322d:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  103230:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103233:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  103236:	8b 45 f0             	mov    -0x10(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  103239:	83 c4 24             	add    $0x24,%esp
  10323c:	5b                   	pop    %ebx
  10323d:	5e                   	pop    %esi
  10323e:	5f                   	pop    %edi
  10323f:	5d                   	pop    %ebp
  103240:	c3                   	ret    

00103241 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103241:	55                   	push   %ebp
  103242:	89 e5                	mov    %esp,%ebp
  103244:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  103247:	8b 45 08             	mov    0x8(%ebp),%eax
  10324a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10324d:	eb 21                	jmp    103270 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  10324f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103252:	0f b6 10             	movzbl (%eax),%edx
  103255:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103258:	88 10                	mov    %dl,(%eax)
  10325a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10325d:	0f b6 00             	movzbl (%eax),%eax
  103260:	84 c0                	test   %al,%al
  103262:	74 04                	je     103268 <strncpy+0x27>
            src ++;
  103264:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  103268:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10326c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103270:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103274:	75 d9                	jne    10324f <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  103276:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103279:	c9                   	leave  
  10327a:	c3                   	ret    

0010327b <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  10327b:	55                   	push   %ebp
  10327c:	89 e5                	mov    %esp,%ebp
  10327e:	57                   	push   %edi
  10327f:	56                   	push   %esi
  103280:	53                   	push   %ebx
  103281:	83 ec 24             	sub    $0x24,%esp
  103284:	8b 45 08             	mov    0x8(%ebp),%eax
  103287:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10328a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10328d:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103290:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103293:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103296:	89 d6                	mov    %edx,%esi
  103298:	89 c3                	mov    %eax,%ebx
  10329a:	89 df                	mov    %ebx,%edi
  10329c:	ac                   	lods   %ds:(%esi),%al
  10329d:	ae                   	scas   %es:(%edi),%al
  10329e:	75 08                	jne    1032a8 <strcmp+0x2d>
  1032a0:	84 c0                	test   %al,%al
  1032a2:	75 f8                	jne    10329c <strcmp+0x21>
  1032a4:	31 c0                	xor    %eax,%eax
  1032a6:	eb 04                	jmp    1032ac <strcmp+0x31>
  1032a8:	19 c0                	sbb    %eax,%eax
  1032aa:	0c 01                	or     $0x1,%al
  1032ac:	89 fb                	mov    %edi,%ebx
  1032ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1032b1:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1032b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032b7:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1032ba:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1032bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1032c0:	83 c4 24             	add    $0x24,%esp
  1032c3:	5b                   	pop    %ebx
  1032c4:	5e                   	pop    %esi
  1032c5:	5f                   	pop    %edi
  1032c6:	5d                   	pop    %ebp
  1032c7:	c3                   	ret    

001032c8 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1032c8:	55                   	push   %ebp
  1032c9:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1032cb:	eb 0c                	jmp    1032d9 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1032cd:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1032d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1032d5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1032d9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032dd:	74 1a                	je     1032f9 <strncmp+0x31>
  1032df:	8b 45 08             	mov    0x8(%ebp),%eax
  1032e2:	0f b6 00             	movzbl (%eax),%eax
  1032e5:	84 c0                	test   %al,%al
  1032e7:	74 10                	je     1032f9 <strncmp+0x31>
  1032e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ec:	0f b6 10             	movzbl (%eax),%edx
  1032ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032f2:	0f b6 00             	movzbl (%eax),%eax
  1032f5:	38 c2                	cmp    %al,%dl
  1032f7:	74 d4                	je     1032cd <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1032f9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1032fd:	74 1a                	je     103319 <strncmp+0x51>
  1032ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103302:	0f b6 00             	movzbl (%eax),%eax
  103305:	0f b6 d0             	movzbl %al,%edx
  103308:	8b 45 0c             	mov    0xc(%ebp),%eax
  10330b:	0f b6 00             	movzbl (%eax),%eax
  10330e:	0f b6 c0             	movzbl %al,%eax
  103311:	89 d1                	mov    %edx,%ecx
  103313:	29 c1                	sub    %eax,%ecx
  103315:	89 c8                	mov    %ecx,%eax
  103317:	eb 05                	jmp    10331e <strncmp+0x56>
  103319:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10331e:	5d                   	pop    %ebp
  10331f:	c3                   	ret    

00103320 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103320:	55                   	push   %ebp
  103321:	89 e5                	mov    %esp,%ebp
  103323:	83 ec 04             	sub    $0x4,%esp
  103326:	8b 45 0c             	mov    0xc(%ebp),%eax
  103329:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10332c:	eb 14                	jmp    103342 <strchr+0x22>
        if (*s == c) {
  10332e:	8b 45 08             	mov    0x8(%ebp),%eax
  103331:	0f b6 00             	movzbl (%eax),%eax
  103334:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103337:	75 05                	jne    10333e <strchr+0x1e>
            return (char *)s;
  103339:	8b 45 08             	mov    0x8(%ebp),%eax
  10333c:	eb 13                	jmp    103351 <strchr+0x31>
        }
        s ++;
  10333e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  103342:	8b 45 08             	mov    0x8(%ebp),%eax
  103345:	0f b6 00             	movzbl (%eax),%eax
  103348:	84 c0                	test   %al,%al
  10334a:	75 e2                	jne    10332e <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  10334c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103351:	c9                   	leave  
  103352:	c3                   	ret    

00103353 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  103353:	55                   	push   %ebp
  103354:	89 e5                	mov    %esp,%ebp
  103356:	83 ec 04             	sub    $0x4,%esp
  103359:	8b 45 0c             	mov    0xc(%ebp),%eax
  10335c:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10335f:	eb 0f                	jmp    103370 <strfind+0x1d>
        if (*s == c) {
  103361:	8b 45 08             	mov    0x8(%ebp),%eax
  103364:	0f b6 00             	movzbl (%eax),%eax
  103367:	3a 45 fc             	cmp    -0x4(%ebp),%al
  10336a:	74 10                	je     10337c <strfind+0x29>
            break;
        }
        s ++;
  10336c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103370:	8b 45 08             	mov    0x8(%ebp),%eax
  103373:	0f b6 00             	movzbl (%eax),%eax
  103376:	84 c0                	test   %al,%al
  103378:	75 e7                	jne    103361 <strfind+0xe>
  10337a:	eb 01                	jmp    10337d <strfind+0x2a>
        if (*s == c) {
            break;
  10337c:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  10337d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103380:	c9                   	leave  
  103381:	c3                   	ret    

00103382 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103382:	55                   	push   %ebp
  103383:	89 e5                	mov    %esp,%ebp
  103385:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10338f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103396:	eb 04                	jmp    10339c <strtol+0x1a>
        s ++;
  103398:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10339c:	8b 45 08             	mov    0x8(%ebp),%eax
  10339f:	0f b6 00             	movzbl (%eax),%eax
  1033a2:	3c 20                	cmp    $0x20,%al
  1033a4:	74 f2                	je     103398 <strtol+0x16>
  1033a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1033a9:	0f b6 00             	movzbl (%eax),%eax
  1033ac:	3c 09                	cmp    $0x9,%al
  1033ae:	74 e8                	je     103398 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  1033b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033b3:	0f b6 00             	movzbl (%eax),%eax
  1033b6:	3c 2b                	cmp    $0x2b,%al
  1033b8:	75 06                	jne    1033c0 <strtol+0x3e>
        s ++;
  1033ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1033be:	eb 15                	jmp    1033d5 <strtol+0x53>
    }
    else if (*s == '-') {
  1033c0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c3:	0f b6 00             	movzbl (%eax),%eax
  1033c6:	3c 2d                	cmp    $0x2d,%al
  1033c8:	75 0b                	jne    1033d5 <strtol+0x53>
        s ++, neg = 1;
  1033ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1033ce:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1033d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033d9:	74 06                	je     1033e1 <strtol+0x5f>
  1033db:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1033df:	75 24                	jne    103405 <strtol+0x83>
  1033e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e4:	0f b6 00             	movzbl (%eax),%eax
  1033e7:	3c 30                	cmp    $0x30,%al
  1033e9:	75 1a                	jne    103405 <strtol+0x83>
  1033eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ee:	83 c0 01             	add    $0x1,%eax
  1033f1:	0f b6 00             	movzbl (%eax),%eax
  1033f4:	3c 78                	cmp    $0x78,%al
  1033f6:	75 0d                	jne    103405 <strtol+0x83>
        s += 2, base = 16;
  1033f8:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1033fc:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103403:	eb 2a                	jmp    10342f <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103405:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103409:	75 17                	jne    103422 <strtol+0xa0>
  10340b:	8b 45 08             	mov    0x8(%ebp),%eax
  10340e:	0f b6 00             	movzbl (%eax),%eax
  103411:	3c 30                	cmp    $0x30,%al
  103413:	75 0d                	jne    103422 <strtol+0xa0>
        s ++, base = 8;
  103415:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103419:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103420:	eb 0d                	jmp    10342f <strtol+0xad>
    }
    else if (base == 0) {
  103422:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103426:	75 07                	jne    10342f <strtol+0xad>
        base = 10;
  103428:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  10342f:	8b 45 08             	mov    0x8(%ebp),%eax
  103432:	0f b6 00             	movzbl (%eax),%eax
  103435:	3c 2f                	cmp    $0x2f,%al
  103437:	7e 1b                	jle    103454 <strtol+0xd2>
  103439:	8b 45 08             	mov    0x8(%ebp),%eax
  10343c:	0f b6 00             	movzbl (%eax),%eax
  10343f:	3c 39                	cmp    $0x39,%al
  103441:	7f 11                	jg     103454 <strtol+0xd2>
            dig = *s - '0';
  103443:	8b 45 08             	mov    0x8(%ebp),%eax
  103446:	0f b6 00             	movzbl (%eax),%eax
  103449:	0f be c0             	movsbl %al,%eax
  10344c:	83 e8 30             	sub    $0x30,%eax
  10344f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103452:	eb 48                	jmp    10349c <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103454:	8b 45 08             	mov    0x8(%ebp),%eax
  103457:	0f b6 00             	movzbl (%eax),%eax
  10345a:	3c 60                	cmp    $0x60,%al
  10345c:	7e 1b                	jle    103479 <strtol+0xf7>
  10345e:	8b 45 08             	mov    0x8(%ebp),%eax
  103461:	0f b6 00             	movzbl (%eax),%eax
  103464:	3c 7a                	cmp    $0x7a,%al
  103466:	7f 11                	jg     103479 <strtol+0xf7>
            dig = *s - 'a' + 10;
  103468:	8b 45 08             	mov    0x8(%ebp),%eax
  10346b:	0f b6 00             	movzbl (%eax),%eax
  10346e:	0f be c0             	movsbl %al,%eax
  103471:	83 e8 57             	sub    $0x57,%eax
  103474:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103477:	eb 23                	jmp    10349c <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103479:	8b 45 08             	mov    0x8(%ebp),%eax
  10347c:	0f b6 00             	movzbl (%eax),%eax
  10347f:	3c 40                	cmp    $0x40,%al
  103481:	7e 38                	jle    1034bb <strtol+0x139>
  103483:	8b 45 08             	mov    0x8(%ebp),%eax
  103486:	0f b6 00             	movzbl (%eax),%eax
  103489:	3c 5a                	cmp    $0x5a,%al
  10348b:	7f 2e                	jg     1034bb <strtol+0x139>
            dig = *s - 'A' + 10;
  10348d:	8b 45 08             	mov    0x8(%ebp),%eax
  103490:	0f b6 00             	movzbl (%eax),%eax
  103493:	0f be c0             	movsbl %al,%eax
  103496:	83 e8 37             	sub    $0x37,%eax
  103499:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  10349c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10349f:	3b 45 10             	cmp    0x10(%ebp),%eax
  1034a2:	7d 16                	jge    1034ba <strtol+0x138>
            break;
        }
        s ++, val = (val * base) + dig;
  1034a4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1034a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034ab:	0f af 45 10          	imul   0x10(%ebp),%eax
  1034af:	03 45 f4             	add    -0xc(%ebp),%eax
  1034b2:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  1034b5:	e9 75 ff ff ff       	jmp    10342f <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  1034ba:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  1034bb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1034bf:	74 08                	je     1034c9 <strtol+0x147>
        *endptr = (char *) s;
  1034c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c4:	8b 55 08             	mov    0x8(%ebp),%edx
  1034c7:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1034c9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1034cd:	74 07                	je     1034d6 <strtol+0x154>
  1034cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1034d2:	f7 d8                	neg    %eax
  1034d4:	eb 03                	jmp    1034d9 <strtol+0x157>
  1034d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1034d9:	c9                   	leave  
  1034da:	c3                   	ret    

001034db <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1034db:	55                   	push   %ebp
  1034dc:	89 e5                	mov    %esp,%ebp
  1034de:	57                   	push   %edi
  1034df:	56                   	push   %esi
  1034e0:	53                   	push   %ebx
  1034e1:	83 ec 24             	sub    $0x24,%esp
  1034e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e7:	88 45 d0             	mov    %al,-0x30(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1034ea:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
  1034ee:	8b 55 08             	mov    0x8(%ebp),%edx
  1034f1:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1034f4:	88 45 ef             	mov    %al,-0x11(%ebp)
  1034f7:	8b 45 10             	mov    0x10(%ebp),%eax
  1034fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1034fd:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103500:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  103504:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103507:	89 ce                	mov    %ecx,%esi
  103509:	89 d3                	mov    %edx,%ebx
  10350b:	89 f1                	mov    %esi,%ecx
  10350d:	89 df                	mov    %ebx,%edi
  10350f:	f3 aa                	rep stos %al,%es:(%edi)
  103511:	89 fb                	mov    %edi,%ebx
  103513:	89 ce                	mov    %ecx,%esi
  103515:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  103518:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10351b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  10351e:	83 c4 24             	add    $0x24,%esp
  103521:	5b                   	pop    %ebx
  103522:	5e                   	pop    %esi
  103523:	5f                   	pop    %edi
  103524:	5d                   	pop    %ebp
  103525:	c3                   	ret    

00103526 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103526:	55                   	push   %ebp
  103527:	89 e5                	mov    %esp,%ebp
  103529:	57                   	push   %edi
  10352a:	56                   	push   %esi
  10352b:	53                   	push   %ebx
  10352c:	83 ec 38             	sub    $0x38,%esp
  10352f:	8b 45 08             	mov    0x8(%ebp),%eax
  103532:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103535:	8b 45 0c             	mov    0xc(%ebp),%eax
  103538:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10353b:	8b 45 10             	mov    0x10(%ebp),%eax
  10353e:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103541:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103544:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103547:	73 4e                	jae    103597 <memmove+0x71>
  103549:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10354c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10354f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103552:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103555:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103558:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10355b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10355e:	89 c1                	mov    %eax,%ecx
  103560:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103563:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103566:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103569:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  10356c:	89 d7                	mov    %edx,%edi
  10356e:	89 c3                	mov    %eax,%ebx
  103570:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  103573:	89 de                	mov    %ebx,%esi
  103575:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103577:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10357a:	83 e1 03             	and    $0x3,%ecx
  10357d:	74 02                	je     103581 <memmove+0x5b>
  10357f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103581:	89 f3                	mov    %esi,%ebx
  103583:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  103586:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  103589:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  10358c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  10358f:	89 5d d0             	mov    %ebx,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103592:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103595:	eb 3b                	jmp    1035d2 <memmove+0xac>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103597:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10359a:	83 e8 01             	sub    $0x1,%eax
  10359d:	89 c2                	mov    %eax,%edx
  10359f:	03 55 ec             	add    -0x14(%ebp),%edx
  1035a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035a5:	83 e8 01             	sub    $0x1,%eax
  1035a8:	03 45 f0             	add    -0x10(%ebp),%eax
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  1035ab:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1035ae:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  1035b1:	89 d6                	mov    %edx,%esi
  1035b3:	89 c3                	mov    %eax,%ebx
  1035b5:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  1035b8:	89 df                	mov    %ebx,%edi
  1035ba:	fd                   	std    
  1035bb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1035bd:	fc                   	cld    
  1035be:	89 fb                	mov    %edi,%ebx
  1035c0:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  1035c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  1035c6:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1035c9:	89 75 c8             	mov    %esi,-0x38(%ebp)
  1035cc:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1035cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1035d2:	83 c4 38             	add    $0x38,%esp
  1035d5:	5b                   	pop    %ebx
  1035d6:	5e                   	pop    %esi
  1035d7:	5f                   	pop    %edi
  1035d8:	5d                   	pop    %ebp
  1035d9:	c3                   	ret    

001035da <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1035da:	55                   	push   %ebp
  1035db:	89 e5                	mov    %esp,%ebp
  1035dd:	57                   	push   %edi
  1035de:	56                   	push   %esi
  1035df:	53                   	push   %ebx
  1035e0:	83 ec 24             	sub    $0x24,%esp
  1035e3:	8b 45 08             	mov    0x8(%ebp),%eax
  1035e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035ef:	8b 45 10             	mov    0x10(%ebp),%eax
  1035f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1035f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1035f8:	89 c1                	mov    %eax,%ecx
  1035fa:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1035fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103600:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103603:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  103606:	89 d7                	mov    %edx,%edi
  103608:	89 c3                	mov    %eax,%ebx
  10360a:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  10360d:	89 de                	mov    %ebx,%esi
  10360f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103611:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  103614:	83 e1 03             	and    $0x3,%ecx
  103617:	74 02                	je     10361b <memcpy+0x41>
  103619:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10361b:	89 f3                	mov    %esi,%ebx
  10361d:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  103620:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  103623:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  103626:	89 7d e0             	mov    %edi,-0x20(%ebp)
  103629:	89 5d dc             	mov    %ebx,-0x24(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10362c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10362f:	83 c4 24             	add    $0x24,%esp
  103632:	5b                   	pop    %ebx
  103633:	5e                   	pop    %esi
  103634:	5f                   	pop    %edi
  103635:	5d                   	pop    %ebp
  103636:	c3                   	ret    

00103637 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103637:	55                   	push   %ebp
  103638:	89 e5                	mov    %esp,%ebp
  10363a:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10363d:	8b 45 08             	mov    0x8(%ebp),%eax
  103640:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103643:	8b 45 0c             	mov    0xc(%ebp),%eax
  103646:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103649:	eb 32                	jmp    10367d <memcmp+0x46>
        if (*s1 != *s2) {
  10364b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10364e:	0f b6 10             	movzbl (%eax),%edx
  103651:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103654:	0f b6 00             	movzbl (%eax),%eax
  103657:	38 c2                	cmp    %al,%dl
  103659:	74 1a                	je     103675 <memcmp+0x3e>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10365b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10365e:	0f b6 00             	movzbl (%eax),%eax
  103661:	0f b6 d0             	movzbl %al,%edx
  103664:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103667:	0f b6 00             	movzbl (%eax),%eax
  10366a:	0f b6 c0             	movzbl %al,%eax
  10366d:	89 d1                	mov    %edx,%ecx
  10366f:	29 c1                	sub    %eax,%ecx
  103671:	89 c8                	mov    %ecx,%eax
  103673:	eb 1c                	jmp    103691 <memcmp+0x5a>
        }
        s1 ++, s2 ++;
  103675:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103679:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  10367d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103681:	0f 95 c0             	setne  %al
  103684:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103688:	84 c0                	test   %al,%al
  10368a:	75 bf                	jne    10364b <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  10368c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103691:	c9                   	leave  
  103692:	c3                   	ret    
