
 /* タイトル出現 その２

int x,y,s,x0=9,y0=16
float z
dim d(0,199)
screen 0,3,0,1
sp_init():sp_clr(0)
spfile_def("title.sp",1)
palfile_def("title.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* タイトルを置く
for y=0 to 5:for x=0 to 6
bg_put(0,x0+x*2  ,y0+y*2  ,&h104+x*4+y*28)
bg_put(0,x0+x*2  ,y0+y*2+1,&h105+x*4+y*28)
bg_put(0,x0+x*2+1,y0+y*2  ,&h106+x*4+y*28)
bg_put(0,x0+x*2+1,y0+y*2+1,&h107+x*4+y*28)
next:next

while 1
cls

 /* スクロールデータセット
for y=1 to 199:d(0,y)=(-1) and &h3ff:next
d(0,0)=90
ras_scroll_set(6,d,,,55)  /* BG0 縦横差分
ras_scroll_stat(1,,,0)
for s=0 to 2500:next

 /* スクロールデータを書き替えると、即影響が出る
for y=1 to 120
for s=0 to 700:next
d(0,y)=0
next

print "なにかキーを押して下さい";:asc(inkey$)
endwhile
