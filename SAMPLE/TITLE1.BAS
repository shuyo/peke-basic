
 /* タイトル出現 その１

int x,y,s,x0=9
float z
dim d(200,99)
screen 0,3,0,1
sp_init():sp_clr(0)
spfile_def("title.sp",1)
palfile_def("title.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* タイトルを置く
for y=0 to 5:for x=0 to 6
bg_put(0,x0+x*2  ,5+y*2  ,&h104+x*4+y*28)
bg_put(0,x0+x*2  ,5+y*2+1,&h105+x*4+y*28)
bg_put(0,x0+x*2+1,5+y*2  ,&h106+x*4+y*28)
bg_put(0,x0+x*2+1,5+y*2+1,&h107+x*4+y*28)
next:next

 /* ラスタスクロールデータの作成
print " 準備中"
for x=0 to 200
z=6000#/(x+20)-26.4
/*z=200-x
for y=0 to 99
	d(x,y)=int(z*sin(z*y/200)+.5) and &h1ff
next:next:beep

while 1
print " なにかキーを押して下さい";:asc(inkey$):cls

 /* ラスタスクロールデータのセット
ras_scroll_set(0,d,,,55)
 /* ラスタスクロール開始
ras_scroll_stat(1,,,1)

 /* スクロール終了まで待つ
while ras_scroll_stat(-1)>=0:endwhile
endwhile

