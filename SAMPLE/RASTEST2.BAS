
/* ラスタスクロールのサンプル
/* rasmake.bas で作成したデータでスクロールさせます。

dim d((127+1)*(250+1)-1)
int i,j,s,sx=0,sy=0
dim int dx(9)={0,1,0,-1,1,0,-1,1,0,-1}
dim int dy(9)={0,-1,-1,-1,0,0,0,1,1,1}
 /*
screen 0,3,0,1
sp_init():sp_clr(0)
spfile_def("cat2.sp",1)
palfile_def("cat2.pal",1)
sp_disp(1):sp_on(0,127)
bg_set(0,0,1)

 /* 猫を敷き詰める
for i=0 to 31:for j=0 to 31
bg_put(0,((j and 1)+i*2  )and 63,j*2  ,&h108+(i and 1)*&h100)
bg_put(0,((j and 1)+i*2  )and 63,j*2+1,&h109+(i and 1)*&h100)
bg_put(0,((j and 1)+i*2+1)and 63,j*2  ,&h10a+(i and 1)*&h100)
bg_put(0,((j and 1)+i*2+1)and 63,j*2+1,&h10b+(i and 1)*&h100)
next:next

 /* ラスタスクロールデータ読み込み
lzh_extend("scrdat.lzh",d)
/*fread(d,(127+1)*(250+1),fopen("scroll.dat","r"))
/*fcloseall()

 /* ラスタスクロールデータのセット
ras_scroll_set(6,d,127,250,8)
/*                 ^^^ ^^^ d が１次元配列なので省略不可
 /* ラスタスクロール開始
ras_scroll_stat(1)

 /* main loop
while strig(1)=0
s=stick(1)
sx=(sx+dx(s)) and 511
sy=(sy+dy(s)) and 511
ras_home(sx,sy)  /* 影響が出るのは次の垂直帰線期間後
for j=0 to 80:next
 /* 高クロック機や 030 はもっとループ回数を多くしないと画面が見えません。
endwhile

