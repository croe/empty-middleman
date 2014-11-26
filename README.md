# empty-middleman

Middlemanの諸々設定済み空プロジェクト。

## 使い方

1. ダウンロードか`git clone git@github.com:2YY/empty-middleman.git`で手元に落とす(ダウンロードの場合はzipファイルなので展開しておく)
2. 出来上がったディレクトリのルートに`cd`で移動する
3. `bundle install  --path=vendor/bundle`を実行する(グローバルにBundler入ってない場合はあらかじめ`gem install bundler`しておく)
4. `bower install`を実行する(グローバルにBower入ってない場合はあらかじめ`npm install bower -g`しておく)
5. [bower.json](https://github.com/2YY/empty-middleman/blob/master/bower.json)に「name」「authors」「license」を記入する
    + 必須じゃないのでやらなくても開発は出来るけど、記入しておくとなんとなくスッキリする
6. 準備完了! 後は中身を作る

## 設定内容

### [Foundation](http://foundation.zurb.com)

Foundationが使える。

CSSの設計としては、

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

という想定。

### [jquery-smooth-scroll](https://github.com/kswedberg/jquery-smooth-scroll)

ページ内リンクをスムーススクロールさせるやつ。

TODO: 使い方のサンプルコードをここに書く……。

### [fontawesome](http://fortawesome.github.io/Font-Awesome/)

みんな大好きアイコンフォント。

+ [アイコン一覧](http://fortawesome.github.io/Font-Awesome/icons/)
+ [Photoshop拡張](http://creativedo.co/FontAwesomePS)

いいですね……!

Photoshop拡張もあるアイコンフォントって他にもあるのかな?

### [jquery.kerning](https://github.com/KarappoInc/jquery.kerning.js)

デフォルトでも日本語の約者をカーニングしてくれるやつ。

がっつり各文字の組み合わせごとに字間を調整することも出来る。

[layout.slim](https://github.com/2YY/empty-middleman/blob/master/source/layouts/layout.slim)にて、p要素をカーニングするように設定している。
