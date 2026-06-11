
 /* filesnum, files と、拡張機能 A,E のサンプル

int i
if b_argc<=1 then print "コマンドラインにファイル名を指定して下さい":end
for i=1 to b_argc-1
	printdir(b_argv(i))
next
end
 /*
func printdir(filename;str)
int f,i
f=filesnum(filename,&h20) /* 該当するファイルの個数を返す
dim str Name(f-1)
dim int Size(f-1),Time(f-1)
dim char Attr(f-1)
files( filename, &h20, Name, Size, Time, Attr )
 /* ファイル名その他を配列にセットする
for i=0 to f-1
print using"&                   & ######## ";Name(i),Size(i)
next
endfunc
