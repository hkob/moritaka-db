# encoding: utf-8
# language: ja
機能: 作曲に関する CRUD を確認する
  シナリオ: 曲が登録されているときに作曲・作曲を設定する
    前提 曲にテスト用データを登録する
    かつ 人にテスト用データを登録する
    もし 曲一覧を表示する
    かつ "わ - を" をクリックする
    かつ id が "渡良瀬橋" である行の "編集" をクリックする
    かつ "作曲の編集" をクリックする
      ならば 画面に "作曲の追加(渡良瀬橋)" と表示されていること
    もし "さ - そ" をクリックする
    かつ id が "斉藤英夫" である行の "作曲の追加" をクリックする
      ならば id が "music" である行に "斉藤英夫" と表示されていること
    もし "作曲の編集" をクリックする
    かつ "あ - お" をクリックする
    かつ id が "伊秩弘将" である行の "作曲の追加" をクリックする
      ならば id が "music" である行に "斉藤英夫, 伊秩弘将" と表示されていること
    もし "作曲の編集" をクリックする
    かつ id が "music:20" である行の "編集" をクリックする
    かつ "並び順" に "5" と入力する
    かつ "更新する" ボタンをクリックする
      ならば id が "music" である行に "伊秩弘将, 斉藤英夫" と表示されていること
    もし "作曲の編集" をクリックする
    かつ id が "music:10" である行の "リンク解除" をクリックする
      ならば id が "music" である行に "斉藤英夫" と表示されていること
    


