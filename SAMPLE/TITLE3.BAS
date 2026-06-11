
 /* タイトル出現 その３

int x,y,s,x0=9
float z
dim d(199,99),e(400)
screen 0,3,0,1
/*screen 1,3,1,1

 /* タイトルを描く
symbol(32,40,"タイトル",2,2,2,rgb(0,15,15),0)
symbol(30,40,"タイトル",2,2,2,rgb(0,31,31),0)
symbol(60,88,"やねんで",2,2,1,rgb(0,24,8),0)

 /* ラスタスクロールデータの作成
print " 準備中"
for y=0 to 99
e(    y)=256
e(100+y)=sqr(65536#-6.5536*y*y)
/*e(100+y)=256-sqr(65536#-6.5536*((100-y)*(100-y)))
next
for x=0 to 199
for y=0 to 49
	d(x,y*2  )=(-e(x+150-y*2)) and &h1ff
	d(x,y*2+1)=( e(x+150-y*2)) and &h1ff
next:next:beep

while 1
print " なにかキーを押して下さい";:asc(inkey$):cls

 /* ラスタスクロールデータのセット
ras_scroll_set(4,d,,,55)
 /* ラスタスクロール開始
ras_scroll_stat(1,,,1)

 /* スクロール終了まで待つ
while ras_scroll_stat(-1)>=0:endwhile
endwhile

