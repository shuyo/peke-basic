/*
/* ぺけ-ＢＡＳｔｏＣ  簡易インストーラ
/*
/*	拡張機能の L を有効にし、dosfnc.fnc を組み込んで下さい
/*
str dname[255]
char c
 /*
if file_exist("xbc.r")=0 then {
	print "ぺけ-ＢＡＳｔｏＣを展開したディレクトリにて実行して下さい"
	end
}
 /*
dname=getenv("bc")
if dname="" then print "環境変数 bc が設定されていません"
*is0	/* ラベル
if dname="" then {
	print "Ｘ-ＢＡＳｔｏＣをインストールしてあるディレクトリ名を入力して下さい"
	print ">>";
	linput dname
}
if dname="" then goto *is0
c=dname[strlen(dname)-1]	/* 最後の文字
if c<>'\' and c<>'/' and c<>':' then dname=dname+"\"
if file_exist(dname+"BC.X")=0 then {
	color 2
	print "そのディレクトリにＸ-ＢＡＳｔｏＣはインストールされていません"
	color 3:beep:print
	dname="":goto *is0
}
print
print "** xbc.r, basic.cnf, DEF\*.def を ";
color 1:print dname;:color 3
print " にコピーします **"
_sys("copy xbc.r "+dname)
_sys("copy basic.cnf "+dname)
_sys("copy DEF\*.def "+dname)
print:print
 /*
inst_sub("xblib.a","lib")
inst_sub("INCLUDE\*.h","include")
end
 /*



func inst_sub( inst;str , env0;str )
str dname[255]
dname=getenv(env0)
if dname="" then print "環境変数 ";env0;" が設定されていません"
*is1	/* ラベル
if dname="" then {
	print inst;" をインストールするディレクトリを指定して下さい"
	print ">>";
	linput dname
}
if dname="" then goto *is1
print inst;" を ";dname;" にコピーします。よろしいですか？ (y/n)";
if YorN()=0 then dname="":goto *is1
print
print "** ";inst;" を ";
color 1:print dname;:color 3
print " にコピーします **"
_sys("copy "+inst+" "+dname)
print:print
endfunc


func int YorN()
str ink
ink=inkey$:print
if (ink[0] or &h20)='y' then return(1)
return(0)
endfunc



func _sys( com;str )
print com
/*_system( com )
endfunc



func file_exist( fname;str )
int f
	error off
	f=fopen(fname,"r")
	error on
	if errno=0 then fclose(f):return(1)
	return(0)
endfunc


