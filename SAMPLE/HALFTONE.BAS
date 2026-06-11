
 /* 半透明機能

screen 1,1,1,1
v_priority("tgs")
palet(2,rgb(0,31,31)) /* 半透明時に使用されるパレット
palet(3,rgb(0,31,31))
apage(0):vpage(15)
fill(100,100,199,300,3) /* 奇数パレットで半透明指定
fill(200,100,300,300,2)
color 7
locate 0,12:?" 半透明のテスト 半透明のテスト 半透明のテスト 半透明のテスト";
color 3
locate 0,0:?"何か押して下さいな";
asc(inkey$)
v_priority("gts")	/* GRAPH > TEXT > SPRITE
asc(inkey$)
v_special(2)	/* 半透明！
asc(inkey$)
end
