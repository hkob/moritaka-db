# encoding: utf-8
# language: ja
機能: 曲に関する CRUD を確認する
  シナリオ: 曲ページにアクセスする
    前提 トップページを表示する
    もし "曲" をクリックする
      ならば 画面に "曲一覧" と表示されていること
    もし "English" をクリックする
      ならば 画面に "List of songs" と表示されていること

  シナリオ: 運用環境では曲の追加ができない
    前提 運用環境である
    かつ 曲一覧を表示する
      ならば 画面に "曲の追加" と表示されていないこと

  シナリオ: 開発環境で新規曲を作成する
    前提 タイトルにテスト用データを登録する
    かつ タイトル一覧を表示する
    もし "わ" をクリックする
    かつ id が "渡良瀬橋" である行の "曲の追加" をクリックする
      ならば 画面に "曲の追加(渡良瀬橋)" と表示されていること
    もし "発表日" に "1993-01-25" と入力する
    かつ "登録する" ボタンをクリックする
      ならば 画面に "曲一覧" と表示されていること
      かつ id が "渡良瀬橋" である行に "渡良瀬橋" と表示されていること
    もし "English" をクリックする
      ならば id が "{WATARASEBASHI}" である行に "{WATARASEBASHI}" と表示されていること
    もし タイトル一覧を表示する
    かつ "English" をクリックする
    かつ "A" をクリックする
    かつ id が "{AME}" である行の "Add a song" をクリックする
    かつ "Release date" に "1990-09-23" と入力する
    かつ "Create Song" ボタンをクリックする
      ならば id が "{AME}" である行に "{AME}" と表示されていること
    もし "Japanese" をクリックする
      ならば id が "雨" である行に "雨" と表示されていること
      かつ 画面に "渡良瀬橋" と表示されていないこと
    もし "わ - を" をクリックする
      ならば id が "渡良瀬橋" である行に "渡良瀬橋" と表示されていること

  シナリオ: 開発環境で曲を編集する
    前提 曲にテスト用データを登録する
    もし 曲一覧を表示する
    かつ "ら - ろ" をクリックする
    かつ id が "Rain" である行の "編集" をクリックする
      ならば 画面に "曲の編集(Rain)" と表示されていること
    もし "あ - お" をクリックする
    かつ id が "雨" である行の "主データ追加" をクリックする
      ならば 画面に "曲一覧" と表示されていること
      かつ id が "雨" である行に "Rain" と表示されていること
    もし "は - ほ" をクリックする
      ならば 画面に "Rain" と表示されていないこと
    もし "あ - お" をクリックする
      かつ id が "雨" である行の "リンク解除" をクリックする
    もし "ら - ろ" をクリックする
      ならば 画面に "Rain" と表示されていること

  シナリオ: 開発環境で曲を削除する
    前提 曲にテスト用データを登録する
    もし 曲一覧を表示する
    かつ "わ - を" をクリックする
    かつ id が "渡良瀬橋" である行の "削除" をクリックする
      ならば 画面に "曲一覧" と表示されていること
      かつ 画面に "渡良瀬橋" と表示されていないこと

  シナリオ: 開発環境でリンクされた曲データが削除されないこと
    前提 曲にテスト用データを登録する
    もし 曲一覧を表示する
    かつ "ら - ろ" をクリックする
    かつ id が "Rain" である行の "編集" をクリックする
    もし "あ - お" をクリックする
    かつ id が "雨" である行の "主データ追加" をクリックする
      ならば id が "雨" である行に "削除" と表示されていないこと

  シナリオ: 曲が登録されているときにタイトルをロックする
    前提 曲にテスト用データを登録する
    もし タイトル一覧を表示する
    かつ "わ" をクリックする
      ならば id が "渡良瀬橋" である行に "削除" と表示されていないこと
    もし "English" をクリックする
    かつ "A" をクリックする
      ならば id が "{AME}" である行に "Destroy" と表示されていないこと
