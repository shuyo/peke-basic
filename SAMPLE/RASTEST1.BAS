
/* ラスタスクロールのサンプル
/* BG0 をウネウネと縦横方向にスクロールさせます。

dim d(127,250),e(359)
dim int ch(7)={&h102,0,&h103,0,&h104,&h105,&h106,0}	/* 猫の走るパターン
dim int df(15)={5,6,5,2, 5,6,6,2, 5,7,7,2, 6,7,8,3}	/* 猫の移動量
dim int x(63),y(63),n(63),s(63)
int i,j,N=63

 /* 猫の初期位置
for i=0 to N
x(i)=int(rnd()*256)+16
y(i)=int(rnd()*224)+16
n(i)=rand() and 3
s(i)=(rand() and 3)*4
next

 /*
screen 0,3,0,1
sp_init():sp_clr(0)
spfile_def("cat2.sp",1)
palfile_def("cat2.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* 猫を敷き詰める
for i=0 to 30:for j=0 to 20
bg_put(0,(j and 1)+i*2  ,j*2  ,&h308)
bg_put(0,(j and 1)+i*2  ,j*2+1,&h309)
bg_put(0,(j and 1)+i*2+1,j*2  ,&h30a)
bg_put(0,(j and 1)+i*2+1,j*2+1,&h30b)
next:next

 /* ラスタスクロールデータの作成
for j=0 to 255
	e(j)=int(16*cos(pi(j)/128)+.5)+18  + ((int(60*sin(pi(j)/128)+.5)+100) shl 16)
next	/*   ^^^^^ y 軸方向のデータ ^^^^^     ^^^^^^^ x 軸方向のデータ ^^^^^^
for i=0 to 127:for j=0 to 250
	d(i,j)=e((i*2+j)and 255)
next:next:beep

 /* ラスタスクロールデータのセット
ras_scroll_set(2,d,,,8)
 /* ras_scroll_set(2,d,127,250,8) と同じ

 /* ラスタスクロール開始
ras_scroll_stat(1)

 /* 猫走る
while 1
for i=0 to N
x(i)=x(i)-df(n(i)+s(i))
sp_set(i*2,x(i),y(i),ch(n(i)*2))
sp_set(i*2+1,x(i)+16,y(i),ch(n(i)*2+1))
n(i)=(n(i)+1)and 3
if x(i)<8 then x(i)=256+16:y(i)=int(rnd()*224)+16
 /* 高クロック・030 ユーザは適当にウエイトを入れましょう
 /* for j=0 to 500:next
next
endwhile

 /* 終了は CTRL+C。ちゃんとラスタスクロールも止まります。

