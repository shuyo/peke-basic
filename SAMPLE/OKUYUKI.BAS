
 /* 奥行きつきスクロール（なりかけ）

int x,y,s,x0=200/8
dim d(200,50)
screen 0,3,0,1
sp_init():sp_clr(0)
spfile_def("title.sp",1)
palfile_def("title.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* タイトル描き
for y=0 to 5:for x=0 to 6
bg_put(0,x0+x*2  ,5+y*2  ,&h104+x*4+y*28)
bg_put(0,x0+x*2  ,5+y*2+1,&h105+x*4+y*28)
bg_put(0,x0+x*2+1,5+y*2  ,&h106+x*4+y*28)
bg_put(0,x0+x*2+1,5+y*2+1,&h107+x*4+y*28)
next:next

 /* ラスタスクロールデータの作成
print " 準備中"
for x=0 to 200:for y=0 to 50
	d(x,y)=(x-100)*y/50+100
next:next:beep
cls

 /* ラスタスクロールデータのセット
ras_scroll_set(0,d,,,75)
ras_home(100,0)
x=100

 /* main loop
while 1
s=stick(1)
if x>0   and s=4 then x=x-1
if x<200 and s=6 then x=x+1

 /* ラスタスクロールデータのセット
 /* x = page 番号
ras_scroll_stat(1,x,x,0)

 /* 高クロック・030 ユーザは適当にウエイトを入れましょう
 /*for s=0 to 500:next
endwhile

