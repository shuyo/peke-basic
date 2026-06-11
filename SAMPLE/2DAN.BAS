
 /* ２段独立スクロール

int x,y,s
int x1,y1,x2,y2
dim d(0,0)		/* データは境目のところだけ
screen 0,3,1,1
sp_init():sp_clr(0)
spfile_def("cat2.sp",1)
palfile_def("cat2.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* 猫を敷き詰める
for x=0 to 30:for y=0 to 30:s=(x and 1)*&h100
bg_put(0,(y and 1)+x*2  ,y*2  ,&h108+s)
bg_put(0,(y and 1)+x*2  ,y*2+1,&h109+s)
bg_put(0,(y and 1)+x*2+1,y*2  ,&h10a+s)
bg_put(0,(y and 1)+x*2+1,y*2+1,&h10b+s)
next:next

 /* ラスタスクロールデータのセット
ras_scroll_set(2,d,,,300)
ras_scroll_stat(1)

x1=0:y1=0:x2=0:y2=0
while strig(1)=0	/* なんか押したら終わり

 /* main loop
s=stick(1)
if s=2 then y1=y1-1
if s=4 then x1=x1+1
if s=6 then x1=x1-1
if s=8 then y1=y1+1
x1=x1 and &h1ff:y1=y1 and &h1ff
ras_home(x1,y1)		/* 上半分

s=stick(2)
if s=2 then y2=y2-1
if s=4 then x2=x2+1
if s=6 then x2=x2-1
if s=8 then y2=y2+1
d(0,0)=((x2 and &h1ff)shl 16) + (y2 and &h1ff)	/* 下半分

for s=0 to 100:next
 /* 高クロック・030 ユーザは適当にウエイトを入れましょう
endwhile

