# encoding: utf-8
# language: ja
機能: アルバムに関する CRUD を確認する
  シナリオ: アルバムページにアクセスする
    前提 トップページを表示する
    もし "アルバム" をクリックする
      ならば 画面に "アルバム一覧" と表示されていること
    もし "English" をクリックする
      ならば 画面に "List of albums" と表示されていること

  シナリオ: 運用環境ではアルバムの追加ができない
    前提 運用環境である
    かつ タイトル一覧を表示する
      ならば 画面に "アルバムの追加" と表示されていないこと

  シナリオ: 開発環境で新規アルバムを作成する
    前提 タイトルにテスト用データを登録する
    かつ タイトル一覧を表示する
    もし "に" をクリックする
    かつ id が "NEW SEASON" である行の "アルバムの追加" をクリックする
      ならば 画面に "アルバムの追加(NEW SEASON)" と表示されていること
    もし "デバイスタイプ" から "アルバム" を選択する
    かつ "発売日" に "1987-07-25" と入力する
    かつ "番号" に "1st" と入力する
    かつ "分" に "42" と入力する
    かつ "秒" に "25" と入力する
    かつ "日本語コメント" に "デビューアルバム" と入力する
    かつ "英語コメント" に "Debut album" と入力する
    かつ "登録する" ボタンをクリックする
      ならば 画面に "アルバムの編集(NEW SEASON)" と表示されていること
    もし "アルバム一覧(アルバム)" をクリックする
      かつ id が "1" である行に "NEW SEASON" と表示されていること
    かつ "English" をクリックする
      ならば id が "1" である行に "NEW SEASON" と表示されていること
    もし タイトル一覧を表示する
    かつ "English" をクリックする
    かつ "MI" をクリックする
    かつ id が "Mi-HA-" である行の "Add an album" をクリックする
    かつ "Device type" から "Album" を選択する
    かつ "Release date" に "1988-3-25" と入力する
    かつ "Number" に "2nd" と入力する
    かつ "Minutes" に "48" と入力する
    かつ "Seconds" に "32" と入力する
    かつ "Create Device" ボタンをクリックする
      ならば 画面に "Edit the album(Mi-HA-)" と表示されていること
    もし "List of albums(Album)" をクリックする
      ならば id が "2" である行に "Mi-HA-" と表示されていること
    もし "Japanese" をクリックする
      ならば id が "2" である行に "ミーハー" と表示されていること


