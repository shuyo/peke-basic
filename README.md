# ぺけ-BASIC (XB) ver.0.02

Sharp X68000 用 BASIC インタープリタ

## 概要

ぺけ-BASIC は、Sharp X68000 上で動作する X-BASIC v2.0 互換インタープリタです。
BASIC プログラムを中間言語（IL）にコンパイルしてから実行する 2 パス方式を採用し、
オールアセンブラによる高速動作を実現しています。

## 動作環境

- Sharp X68000 シリーズ（MC68000 / MC68030）
- または 瑞起 X68000Z
- または XM6 typeG・XEiJ などの X68000 エミュレータ
- Human68k OS

## 特徴

- X-BASIC v2.0 互換（主要ステートメント・関数）
- 中間言語コンパイル方式による高速実行
- 拡張機能（設定ファイルで有効化）
  - `EXTEND` : 可変長配列・配列引数・ラベル・`break` など
  - `SINIT` : 変数の自動初期化なし（高速化）
  - `WARN` : 未宣言変数を警告のみで続行
  - `LABEL` : `goto "ラベル名"` 構文
- 外部関数（`.FNC` ファイル）による機能拡張
- エディタ連携（任意のエディタを指定可能）

## ファイル構成

```
SRC/          インタープリタ本体ソース（MC68000 アセンブラ）
FNCSRC/       拡張外部関数ソース
BIN/          ビルド済みバイナリ（X68000 実機用）
BFD/          BFD ファイル
SAMPLE/       サンプルプログラム
DOCS/         ドキュメント類
```

## ビルド方法

HAS.X（ver.3 以上）と HLK リンカが必要です。

```bat
MAKE.BAT
```

または手動で：

```
HAS.X -e XB.HAS
HAS.X -e XB2.HAS
HAS.X -e XBSTAT.HAS
HAS.X -e XBMATH.HAS
HAS.X -e XBFUNC.HAS
HLK ... （リンク）
```

## 使い方

```
XB [オプション] [プログラムファイル]
```

主なオプション：

| オプション | 説明 |
|---|---|
| `-w` | 警告を抑制 |
| `-e エディタ` | 使用するエディタを指定 |
| `-f 設定ファイル` | 設定ファイルを指定（省略時 `XB.CNF`） |

詳細は [`DOCS/XB.DOC.txt`](DOCS/XB.DOC.txt) を参照してください。

## バージョン履歴

[`DOCS/XBVUP.DOC.txt`](DOCS/XBVUP.DOC.txt) を参照してください。

### 従来の ver.0.02 (LZH配布) との違い

- ぺけ-BASIC 本体(XR.R や外部関数とそれらのソースファイル等)の内容には一切変更ありません
- 本 README.md を追加し、github から clone や release ファイルを取得できるようにしました
- 配布形式を zip ファイルにしました
- BIN, SRC, DOCS ディレクトリを分けました
- ドキュメントの文字コードを UTF-8、拡張子を .txt にしました
- ライセンスを MIT License に変更しました


## ライセンス

[MIT License](LICENSE)

Copyright (c) 1994-1997 Nakatani Shuyo
