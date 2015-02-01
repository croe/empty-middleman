# empty-middleman

Middlemanの諸々設定済み空プロジェクト。

## 導入

以下の手順を上から順に実行すればOK。

### 依存ライブラリをインストール

+ Ruby
  + [ダウンロードページ](http://rubyinstaller.org)からインストーラをダウンロードして起動
+ Ruby DevKit
  1. [ダウンロードページ](http://rubyinstaller.org)からインストーラをダウンロードして起動
  2. インストーラを起動して適当なフォルダを指定してファイル展開
  3. ファイル展開したフォルダにターミナルで移動(`cd dirpath`)
  4. ターミナルで`ruby dk.rb init`
  5. テキストエディタで`config.yml`を開き、Rubyディレクトリのパス指定が正しいか確認(違っていれば修正)
  6. ターミナルで`ruby dk.rb install`
+ Bundler(gem)
  + ターミナルで`gem install bundler`
+ Node.js
  + [ダウンロードページ](http://nodejs.org)からインストーラをダウンロードして起動
+ Bower(npm)
  + ターミナルで`npm install -g bower`
+ Grunt(npm)
  + ターミナルで`npm install -g grunt-cli`
+ CasperJS(npm)
  + ターミナルで`npm install -g casperjs`
+ PhantomJS(npm)
  + ターミナルで`npm install -g phantomjs`

### Windows

1. `init.bat`をダブルクリックなどして実行する。
    + BowerやBundler、NPMのコンポーネントがプロジェクトフォルダ以下にまとめてインストールされる。

### Mac

1. 手動で依存アセットをインストールする
    + `init.bat`の中に書いているコマンドを上から順に手動で実行


## できること

ワークフロー

### CI

 `wercker.yml`に[Wercker](wercker.com/) 用のビルドタスクを予め記述しているので、すぐに登録できる。

 [Capistrano](https://github.com/capistrano/capistrano) のビルドタスクも用意しているので、環境に合わせて修正すれば、フックでテストとデプロイを自動実行させられるようになる。

### [middleman-kss](https://github.com/Darep/middleman-kss)

[KSS](http://kss-node.github.io/kss-node/)を使ってスタイルガイドを作れる。

### [CasperJS](http://casperjs.org)

CasperJSを使ってビューのE2Eテストが出来る。

### [mocha](https://github.com/mochajs/mocha)

Mocha + Chai + Sinon + Istanbul で、JSの単体テストが出来る。

カバレッジは`source/tests/coverage/mocha`に出力される。

---

システム

### [Scouter](https://github.com/morizyun/scouter)

ソーシャルのシェア数をRubyスクリプト内で取得するやつ。

### ページタイトルとデフォルトのレイアウト

[layout.slim](https://github.com/2YY/empty-middleman/blob/master/source/layouts/layout.slim)にて、未設定の時と、末尾に共通して加える文言を設定できるようにしている。

[layout.slim](https://github.com/2YY/empty-middleman/blob/master/source/layouts/layout.slim)には他にも、スタイルシートやスクリプト、パーシャルなどほぼ毎回使うアセットの呼び出しを宣言してある。

---

フロントエンドアセット

### [Foundation](http://foundation.zurb.com)

Foundationが使える。

スタイルシートのファイル構成は[SMACSS](https://smacss.com)を意識した形を取っている。見れば大体わかる。

### [jquery-smooth-scroll](https://github.com/kswedberg/jquery-smooth-scroll)

ページ内リンクをスムーススクロールさせるやつ。

### [fontawesome](http://fortawesome.github.io/Font-Awesome/)

アイコンフォント。

+ [アイコン一覧](http://fortawesome.github.io/Font-Awesome/icons/)
+ [Photoshop拡張](http://creativedo.co/FontAwesomePS)

### [jquery.kerning](https://github.com/KarappoInc/jquery.kerning.js)

デフォルトでも日本語の約者をカーニングしてくれるやつ。

がっつり各文字の組み合わせごとに字間を調整することも出来る。

デフォルトでは、[layout.slim](https://github.com/2YY/empty-middleman/blob/master/source/layouts/layout.slim)にて、p要素のみカーニングするように設定している。

### [ScrollToFixed](https://github.com/bigspotteddog/ScrollToFixed)

スクロールしてもサイドバーを画面に固定して表示し続けるやつ。

デフォルトでは無効にしているので、必要な場合はall.jsなどで呼び出す。

### [Colorbox](https://github.com/jackmoore/colorbox)

いわゆるLightbox的なダイアログ。

動画もスライダーもiframeもなんでも出せる。レスポンシブ対応可。

デフォルトでは無効にしているので、必要な場合はall.jsなどで呼び出す。

### [NiceScroll](https://github.com/inuyaksa/jquery.nicescroll)

慣性スクロール + スクロールバーのデザイン変更。

### [SweetAlert](https://github.com/t4t5/sweetalert)

おしゃれなアラート。

デフォルトでは無効にしているので、必要な場合はall.jsなどで呼び出す。
