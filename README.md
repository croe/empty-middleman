# empty-middleman

Middlemanの諸々設定済み空プロジェクト。

## 導入

1. ダウンロードか`git clone git@github.com:2YY/empty-middleman.git`で手元に落とす(ダウンロードの場合はzipファイルなので展開しておく)
2. 出来上がったディレクトリのルートに`cd`で移動する
3. `bundle install  --path=vendor/bundle`を実行する(グローバルにBundler入ってない場合はあらかじめ`gem install bundler`しておく)
    + **Windows**で'bundle install'が'Faild build to native gem extension'みたいな感じのエラーと共に失敗する場合は、**DevKit**のインストールがうまくいってない可能性が極めて高いので、改めてDevKitだけ再インストールして再トライするのがオススメ。
4. `bower install`を実行する(グローバルにBower入ってない場合はあらかじめ`npm install bower -g`しておく)
5. [bower.json](https://github.com/2YY/empty-middleman/blob/master/bower.json)に「name」「authors」「license」を記入する
    + 必須じゃないのでやらなくても開発は出来るけど、記入しておくとなんとなくスッキリする
6. 準備完了! 後は中身を作る

## できること

### [KSS](http://kss-node.github.io/kss-node/)

KSSを使ってスタイルガイドを作れるようにした。

### [Foundation](http://foundation.zurb.com)

Foundationが使える。

CSSの大枠の設計として、

+ [stylesheets/all.sass](https://github.com/2YY/empty-middleman/blob/master/source/stylesheets/all.sass)
    + Bowerコンポーネントを全てこの中にインポートする
    + 自前のモジュールを全てこの中にインポートする
    + `body`に設定するような全ページ共通のスタイルはここに記述する
    + ページごとの各モジュール間marginをここに記述する(ページ内の全ての内容をモジュール化して、それらを別ファイルに分離することでなるべく細分化する。このほうがどこに何があるか分かりやすい気がする)
+ [stylesheets/modules](https://github.com/2YY/empty-middleman/tree/master/source/stylesheets/modules)
    + 自前のモジュールは全てこの中に置く
    + グローバルヘッダーのような、全ページ共通のモジュールは全てこのディレクトリ直下に置く
    + ページごとのモジュールは、ページ名でディレクトリを作ってその中に置く
        + 例えば`/info.html`のモジュールであれば、`stylesheets/modules/info/info-list`という形

という形を想定している。

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

### [Colorbox](https://github.com/jackmoore/colorbox)

いわゆるLightbox的なダイアログ。

動画もスライダーもiframeもなんでも出せる。レスポンシブ対応可。

### [NiceScroll](https://github.com/inuyaksa/jquery.nicescroll)

慣性スクロール + スクロールバーのデザイン変更。

### [SweetAlert](https://github.com/t4t5/sweetalert)

おしゃれなアラート。

### ページタイトル

[layout.slim](https://github.com/2YY/empty-middleman/blob/master/source/layouts/layout.slim)にて、未設定の時と、末尾に共通して加える文言を設定できるようにしている。




## 注意事項

+ KSSのプレビューがレスポンシブに対応してない問題
    + Styledoccoみたいにボタンを押すとレスポンシブ対応できるカスタムテンプレートを作れば解決する。まだ作ってない。
