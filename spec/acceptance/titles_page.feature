# encoding: utf-8
# language: ja
機能: タイトルに関する CRUD を確認する
	シナリオ: タイトルページにアクセスする
		前提 トップページを表示する
    もし "[タイトル]" をクリックする
		ならば 画面に "タイトル一覧" と表示されていること

  シナリオ: 運用環境ではタイトル追加ができない
    前提 運用環境である
    かつ タイトル一覧を表示する
    ならば 画面に "[タイトル追加]" と表示されていないこと

  シナリオ: 開発環境で新規タイトルを作成する
    前提 タイトル一覧を表示する
    もし "[タイトル追加]" をクリックする
    ならば 画面に "タイトル追加" と表示されていること
    もし "日本語" に "森高　千里" と入力する
    かつ "英語" に "Chisato Moritaka" と入力する
    かつ "読み" に "もりたか　ちさと" と入力する
    かつ "登録する" ボタンをクリックする
		ならば 画面に "タイトル一覧" と表示されていること
    かつ 画面に "森高　千里" と表示されていること
    もし "[タイトル追加]" をクリックする
    かつ "日本語" に "斉藤　英夫" と入力する
    かつ "英語" に "Hideo Saito" と入力する
    かつ "読み" に "さいとう　ひでお" と入力する
    かつ "登録する" ボタンをクリックする
    ならば 画面に "斉藤　英夫" と表示されていること
    もし "[も]" をクリックする
    ならば 画面に "斉藤　英夫" と表示されていないこと
    かつ 画面に "森高　千里" と表示されていること

  シナリオ: 運用環境で直接タイトル追加ページにアクセスさせない
    前提 運用環境である
    もし タイトル追加ページを表示する
    ならば 画面に "森高千里データベース" と表示されていること

  シナリオ: パラメータ設定が間違えていたときのエラー確認
    前提 タイトル追加ページを表示する
    もし "日本語" に "" と入力する
    かつ "英語" に "Chisato Moritaka" と入力する
    かつ "読み" に "もりたか　ちさと" と入力する
    かつ "登録する" ボタンをクリックする
		ならば 画面に "タイトル一覧" と表示されていないこと
    かつ 画面に "日本語を入力してください。" と表示されていること
    もし "日本語" に "森高　千里" と入力する
    かつ "英語" に "" と入力する
    かつ "登録する" ボタンをクリックする
		ならば 画面に "タイトル一覧" と表示されていないこと
    かつ 画面に "英語を入力してください。" と表示されていること
    もし "英語" に "Chisato Moritaka" と入力する
    かつ "読み" に "" と入力する
    かつ "登録する" ボタンをクリックする
		ならば 画面に "タイトル一覧" と表示されていないこと
    かつ 画面に "読みを入力してください。" と表示されていること
    かつ "読み" に "ABC" と入力する
    かつ "登録する" ボタンをクリックする
		ならば 画面に "タイトル一覧" と表示されていないこと
    かつ 画面に "読みは不正な値です。" と表示されていること


