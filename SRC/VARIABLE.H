変数個数	equ	$20		* 2^5
変数SIZE	equ	$1000
nest_workSIZE	equ	$2000
* 関数bufSIZE	equ	$10*512
関数listSIZE	equ	4*64		* 関数ファイルの個数上限 64
strbufSIZE	equ	$2000
CbufSIZE	equ	$100		* 2^8

	.offset 0
_変数int:	.ds.l	2
_変数str:	.ds.l	2
_変数char:	.ds.l	2
_変数float:	.ds.l	2
_配列:		.ds.l	2

_AUTOint:	.ds.l	2
_AUTOstr:	.ds.l	2
_AUTOchar:	.ds.l	2
_AUTOfloat:	.ds.l	2
_AUTO配列:	.ds.l	2

_is_hash:	.ds.b	256

_名前:		.ds.l	2
_行番号:	.ds.l	3
_ラベル:	.ds.l	3
_goto飛先:	.ds.l	3
_変数INIT:	.ds.l	3
_引数INIT:	.ds.l	3
_b_argc:	.ds.l	1
_b_argv:	.ds.l	1

_SPinit:	.ds.l	1
_program_area:	.ds.l	1
_中間言語:	.ds.l	1
_変数area:	.ds.l	1
_mem_last:	.ds.l	1
_command_line:	.ds.l	1
_MEM1:		.ds.l	1
_MEM2:		.ds.l	1

_関数list:	.ds.l	1
_関数buf:	.ds.l	1
_内部関数buf:	.ds.l	1
_内部関数para:	.ds.l	1

_nest_work:	.ds.l	1
_strbuf:	.ds.l	1

_errorno:	.ds.l	1
_行数:		.ds.l	1
_中間言語行数:	.ds.l	4
_EXTENDmask:	.ds.l	2

_関数file数:	.ds.w	1
_関数個数:	.ds.w	1
_内部関数個数:	.ds.w	1

_sinitASK:	.ds.w	1
_sinitFLAG:	.ds.b	1	* bit 7:screen/console/width
	.even			* bit 6:color []
_RETURNtype:	.ds.w	1
_breakcheck:	.ds.w	1
_EXITcode:	.ds.w	1
_fkeyflag:	.ds.w	1
_FREEMEM:	.ds.w	1
_tagFP:		.ds.w	1
_scroll開始行:	.ds.w	1
_global_flag:	.ds.b	1
		.even

_system変数:	.ds.b	8*8
_標準functable:	.ds.w	$100*2
_外部functable:	.ds.w	$100*2
_起動dir:	.ds.b	$100
_tmp:		.ds.b	$200
_b_initbuf:	.ds.b	712
_basic_filename: .ds.b	$100
_cnf_filename:	.ds.b	$100
_tag_filename:	.ds.b	$100
_ed_filename:	.ds.b	$100
_strtok_work:	.ds.w	1
_strtok_buf:	.ds.b	$100
		.ds.b	$100
_SP上限:	.ds.b	$8000
_WORK:



関数list	reg	_関数list(a6)
関数buf		reg	_関数buf(a6)
関数file数	reg	_関数file数(a6)
関数個数	reg	_関数個数(a6)
内部関数buf	reg	_内部関数buf(a6)
内部関数para	reg	_内部関数para(a6)
内部関数個数	reg	_内部関数個数(a6)

変数int		reg	_変数int(a6)
変数str		reg	_変数str(a6)
変数char	reg	_変数char(a6)
変数float	reg	_変数float(a6)
配列		reg	_配列(a6)

AUTOint		reg	_AUTOint(a6)
AUTOstr		reg	_AUTOstr(a6)
AUTOchar	reg	_AUTOchar(a6)
AUTOfloat	reg	_AUTOfloat(a6)
AUTO配列	reg	_AUTO配列(a6)
RETURNtype	reg	_RETURNtype(a6)

名前		reg	_名前(a6)
行番号		reg	_行番号(a6)
ラベル		reg	_ラベル(a6)
goto飛先	reg	_goto飛先(a6)
変数INIT	reg	_変数INIT(a6)
引数INIT	reg	_引数INIT(a6)
b_argc		reg	_b_argc(a6)
b_argv		reg	_b_argv(a6)

SPinit		reg	_SPinit(a6)
breakcheck	reg	_breakcheck(a6)
EXITcode	reg	_EXITcode(a6)
program_area	reg	_program_area(a6)
中間言語	reg	_中間言語(a6)
変数area	reg	_変数area(a6)
command_line	reg	_command_line(a6)
MEM1		reg	_MEM1(a6)
MEM2		reg	_MEM2(a6)

errorno		reg	_errorno(a6)
行数		reg	_行数(a6)
中間言語行数	reg	_中間言語行数(a6)
mem_last	reg	_mem_last(a6)
nest_work	reg	_nest_work(a6)
fkeyflag	reg	_fkeyflag(a6)
sinitASK	reg	_sinitASK(a6)
sinitFLAG	reg	_sinitFLAG(a6)
tagFP		reg	_tagFP(a6)
scroll開始行	reg	_scroll開始行(a6)
global_flag	reg	_global_flag(a6)
EXTENDmask	reg	_EXTENDmask(a6)

system変数	reg	_system変数(a6)
標準functable	reg	_標準functable(a6)
外部functable	reg	_外部functable(a6)
起動dir		reg	_起動dir(a6)
tmp		reg	_tmp(a6)		* その場限り
strbuf		reg	_strbuf(a6)
b_initbuf	reg	_b_initbuf(a6)
basic_filename	reg	_basic_filename(a6)
cnf_filename	reg	_cnf_filename(a6)
tag_filename	reg	_tag_filename(a6)
ed_filename	reg	_ed_filename(a6)

 * 標準関数用
strtok_work	reg	_strtok_work(a6)
strtok_buf	reg	_strtok_buf(a6)



 * 外部関数 infomation table
	.offset	0
Finit:		.ds.l	1
Frun:		.ds.l	1
Fend:		.ds.l	1
Fexit:		.ds.l	1
Fbreak:		.ds.l	1
FctrlD:		.ds.l	3
Ftokun:		.ds.l	1
Fpara:		.ds.l	1
Fexec:		.ds.l	1
		.ds.l	5	* 予備



ERROR	.macro	num
	moveq	#num,d0
	bra	error
	.endm

ERRORS	.macro	num
	moveq	#num,d0
	bra	errors
	.endm

WARN	.macro	num
	move.l	d0,-(sp)
	moveq	#num,d0
	bsr	warning
	move.l	(sp)+,d0
	.endm

WARNS	.macro	num
	move.l	d0,-(sp)
	moveq	#num,d0
	bsr	warnings
	move.l	(sp)+,d0
	.endm


 * 拡張機能のフラグ
b_argF		equ	30		* 0 = なし, 1 = あり
fnc_dimF	equ	29		* 1 = 関数の引き数に配列許す
v_initF		equ	28		* 1 = 関数呼び出しごとに変数初期化しない
labelF		equ	27		* 1 = goto ラベルを使用出来る
breakoffF	equ	26		* 1 = BREAK(CTRL+C) 無効
len_dimF	equ	25		* 1 = 可変長配列使えるよ

* コンフィグ・コンパイラ共通のフラグ
no_cnfF		equ	8		* 0 = .cnf , 1 = .bas
fnckeyF		equ	16		* 0 = ファンクションキー書き替える
fncautoF	equ	17		* 1 = ファンクションキーＡＵＴＯ
fncwarnF	equ	18		* 1 = WARNING 出た

* コンパイラ・インタプリタ共通のフラグ
modeF		equ	7		* 0 = global , 1 = auto

* コンパイラのフラグ
endfuncF	equ	6		* 1 = endfunc後
warningF	equ	5		* 1 = ワーニング出た
warnoffF	equ	4		* 1 = ワーニングOFF
linenumF	equ	3		* 1 = 行番号あり

* インタプリタのフラグ
cursorF		equ	0		* 0 = cursor OFF, 1 = ON
errorF		equ	1		* 0 = error on, 1 = off
localF		equ	15		* local flag
