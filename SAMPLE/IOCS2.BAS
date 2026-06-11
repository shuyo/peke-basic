
 /* iocs() サンプルその２
 /* テキスト画面にランダムに直線を引きます。

int i,a1adr,x0,y0,x1,y1
int TXLINE=&hd5
dim char a1(6*2-1)
 /*
a1adr=_arp(a1)    /* a1 のデータ部分のアドレス
for i=0 to 999
x0=int(rnd()*768)
x1=int(rnd()*768)
y0=int(rnd()*512)
y1=int(rnd()*512)
wpoke( a1adr, i and 1, x0, y0, x1-x0, y1-y0, &hffff )
 /*  0(a1).w : 書き込むプレーン ( 0-3 )
 /*  2(a1).w : 始点の x 座標
 /*  4(a1).w : 始点の y 座標
 /*  6(a1).w : 直線のベクトルの x 方向の成分
 /*  8(a1).w : 直線のベクトルの y 方向の成分
 /* 10(a1).w : ラインスタイル ( &h0000-&hffff )
iocs( TXLINE,,,,,, a1)
next
