
/* ラスタスクロールデータの作成

 /* １次元配列でないと、書き出せないので。
dim d((127+1)*(250+1)-1),e(359)
int i,j,a,b

 /* 基本データ作成
for j=0 to 255
e(j)=(int(16*cos(pi(j)/128)+.5) and &h3ff) + ((int(60*sin(pi(j)/128)+.5) and &h3ff) shl 16)
next

 /* スクロールデータ作成
for i=0 to 127:for j=0 to 250
	d(i*251+j)=e((i*2+j)and 255)
next:next

 /* 差分を取る
for i=0 to 127:for j=0 to 250-1
	a=d(i*251+(250-j))
	b=d(i*251+(250-j)-1)
	d(i*251+(250-j))=((a-b)and &h3ff)+(( (a and &h3ff0000) - (b and &h3ff0000) ) and &h3ff0000)
next:next

 /* 書き出し
fwrite(d,(127+1)*(250+1),fopen("scroll.dat","c"))
fcloseall()

 /* 圧縮
_system("lha a scrdat scroll.dat")

