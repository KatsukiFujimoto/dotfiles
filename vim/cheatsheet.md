## ウィンドウ操作

-   ウィンドウサイズの変更 (winresizer)
    -   ウィンドウ操作モードに入る -> Ctrl + E
    -   操作モードを変更する
        -   resize (default) -> r
        -   move -> m
        -   focus -> f
    -   操作方法
        -   ウィンドウを動かす -> h / j / k / l
        -   変更を確定 -> Ctrl + M / Enter
        -   操作をキャンセル -> q

## ファイル操作

-   ファイルエクスプローラーの操作 (fern.vim)

    -   ファイルエクスプローラーの表示制御
        -   ファイルエクスプローラーをトグルする -> Ctrl + a
    -   ファイルエクスプローラー上で検索する
        -   ファイルエクスプローラー上でルートディレクトリからファイルを検索する -> frf
        -   ファイルエクスプローラー上でルートディレクトリからディレクトリを検索する -> frd
        -   ファイルエクスプローラー上でルートディレクトリからファイル・ディレクトリを検索する -> fra
        -   ファイルエクスプローラー上でカーソルのあるディレクトリからファイルを検索する -> ff
        -   ファイルエクスプローラー上でカーソルのあるディレクトリからディレクトリを検索する -> fd
        -   ファイルエクスプローラー上でカーソルのあるディレクトリからファイル・ディレクトリを検索する -> fa
    -   ファイルエクスプローラーからファイルを表示する・開く
        -   ファイルエクスプローラーから指定ファイルのプレビューをトグルする -> Ctrl + p
        -   ファイルエクスプローラーから指定ファイルを vsplit で開く -> Ctrl + v
        -   ファイルエクスプローラーから指定ファイルを xsplit で開く -> Ctrl + x
        -   ファイルエクスプローラーから指定ファイルを別タブで開く -> Ctrl + t
    -   ファイルエクスプローラー上でファイルを操作する
        -   ファイルを新規作成する -> N
        -   ファイル名を変更したり、ファイルを移動する -> m
        -   ファイルを複製する -> c
        -   ファイルを削除する -> D

-   ファイルを開く (fzf)
    -   ファイルを開く -> <Leader> + f
    -   Git 管理下のファイルを開く -> <Leader> + g
    -   git status の結果からファイルを開く -> <Leader> + s
    -   git commits の結果からファイルを開く -> <Leader> + c
    -   バッファからファイルを開く -> <Leader> + b
    -   ファイル履歴からファイルを開く -> <Leader> + h
    -   コマンド履歴から実行する -> <Leader> + H
    -   /を使った検索の履歴から検索を実行する -> :History/
    -   ファイル内検索をしてファイルを開く -> <Leader> + r
    -   実行可能コマンドを検索して実行する -> :Commands
    -   実行 Map を検索して実行する -> :Maps
    -   カーラースキーマを変更する -> :Colors
    -   ウィンドウを検索して移動する -> :Windows
    -   スニペットを検索して利用する -> :Snippets
    -   Help tags を検索して表示する -> :Helptags
    -   Filetypes を検索して表示する -> :Filetypes

## ビュー操作

-   csv を見やすく表示 (rainbow_csv)
    -   csv の区切り文字(delimeter)を指定して読み込ませる -> csvh{delimeter}
    -   csv の区切り文字(delimeter)なしで読み込ませる -> csvnh{delimeter}

## カーソル操作

-   カーソル操作(vim-easymotion)
    -   指定の 2 文字の検索結果にジャンプする -> <Leader> + s + 2 文字 + ジャンプ先の文字
    -   指定の行にジャンプする -> <Leader> + L + 行番号
    -   指定の単語にジャンプする -> <Leader> + w + 単語

## 文字操作

-   囲い文字の変更・削除 (vim-surround)

    -   選択文字列を指定の文字で囲む
        -   指定文字列を""で囲む -> visual mode -> S"
        -   指定文字列を{}で囲む(スペースあり) -> visual mode -> S{
        -   指定文字列を{}で囲む(スペースなし) -> visual mode -> S}
    -   カーソルの位置の囲い文字を変更する
        -   記法 -> cs{before}{after}
        -   ""を''に変更する -> cs"'
        -   ""を p タグに変更する -> cs"<p>
        -   {}を[]に変更する(スペースあり) -> cs{[
        -   {}を[]に変更する(スペースなし) -> cs}]
    -   カーソルの位置の囲い文字を削除する
        -   ""を削除する -> ds"
        -   {}を削除する -> ds{}

-   visual mode で選択された文字のケースを変更する (vim-caser)

    -   MixedCase -> gsm
    -   PascalCase -> gsp
    -   camelCase -> gsc
    -   snake*case -> gs*
    -   UPPER_CASE -> gsu
    -   Title Case -> gst
    -   Sentence case -> gss
    -   space case -> gs<space>
    -   dash-case -> gs-
    -   kebab-case -> gsk
    -   Title-Dash-Case / Title-Kebab-Case -> gsK
    -   dot.case -> gs.

-   コメントアウト (tcomment_vim)

    -   コメントアウトをトグルする -> gcc

-   整列 (vim-easy-align)
    -   記法 -> ga + delimeter + Ctrl + m
    -   :で整列する -> ga + : + Ctrl + m

## チートシート操作

-   チートシートの表示 (vim-cheatsheet)
    -   チートシートを表示する -> :Cheat

## Git 操作

-   tig 操作 (tig-explorer.vim)

    -   tig を開く -> <Leader>t
    -   現在のファイルの履歴を見る -> <Leader>th
    -   現在のファイルの blame を見る -> <Leader>tb

-   Git 操作 (vim-fugitive)
    -   git add -> <leader>ga
    -   git commit -> <leader>gc
    -   git status -> <leader>gs
    -   git push -> <leader>gp
    -   git diff -> <leader>gd
    -   git log -> <leader>gl
    -   git blame -> <leader>gb
    -   開いているファイルの git diff -> :Gvdiffsplit
    -   開いているファイルをブラウザで開く -> :GBrowse
    -   開いているファイルの指定範囲をブラウザで開く -> visual mode + :GBrowse

## Coc 操作

-   Coc 操作 (coc.nvim)
    -   定義元へジャンプ -> cd + x / v / t
    -   型定義元へジャンプ -> ct + x / v / t
    -   宣言元へジャンプ -> cdec
    -   Implement 先へジャンプ -> ci + x / v / t
    -   Reference 先へジャンプ -> cr + x / v / t
    -   ドキュメンテーションを表示 -> K
