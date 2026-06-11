
 /* drvctrl() サンプル

int x=0
str drv
	/* 2HD を探す
while drvctrl(7,chr$('A'+x)+":")<>&hfe :x=x+1:endwhile
drv=chr$('A'+x)+":"
	/* 挿入待ち
drvctrl( 4,drv )	/* ＬＥＤ点滅
print "DRIVE ";drv;" にディスク入れたって"
while ( drvctrl(0,drv) and 2 )<>2 :endwhile
drvctrl( 5,drv )	/* ＬＥＤ消灯
	/* メディアイジェクト
print "なんか押したらイジェクトしまっせ"
asc(inkey$)
drvctrl(1,drv)
end
