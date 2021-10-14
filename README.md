# iOS向け JINS MEME SDK サンプルアプリ

## 【重要】サポート終了のお知らせ

第一世代 JINS MEME は2021年3月末をもちましてサポートを終了しています。SDKにつきましても2021年9月末をもって動作しなくなりますのでご注意ください。

https://jins-meme.com/ja/support/user-support/jins-meme%E3%81%AE%E3%82%B5%E3%83%9D%E3%83%BC%E3%83%88%E7%B5%82%E4%BA%86%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6/

## 概要

まばたきと6軸（加速度およびジャイロセンサー）の値のうちrollを可視化するiOS向けサンプルアプリです。

## セットアップ

### JINSアカウントを作成
まだお持ちでない方は、[JINS MEMEのデベロッパー向けダッシュボード](https://developers.jins.com/)で[JINSアカウントを作成](https://developers.jins.com/preregistration/)いただく必要があります。

### SDKのダウンロード
[JINS MEMEのデベロッパー向けダッシュボード](https://developers.jins.com/)においてJINSアカウントでログイン後、[SDKをダウンロード](https://developers.jins.com/sdks/ios/)して、 */framework/device/MEMELib.framework* ファイルをこのREADME.mdと同じディレクトリにコピーしてください。 なお、このframeworkファイルを使用する場合は、実機でアプリを動かす必要があります。

<small>アプリをシミュレーターと実機で動かす場合は、 */framework/universal/MEMELib.framework* を使用してください。 アプリをApp Storeで公開する際は、deviceディレクトリに入っているframeworkファイルでビルドする必要があります。</small>

### アプリを作成して、アプリIDとアプリSecretを取得
[JINS MEMEのデベロッパー向けダッシュボード](https://developers.jins.com/)で[アプリを作成](https://developers.jins.com/ja/apps/)して、 *AppDelegate.swift* の次の部分をアプリIDとアプリSecretで置き換えてください

```swift
// TODO: Replace appId and appSecret
let appId = "appId"
let appSecret = "appSecret"
```

## 使い方

### JINS MEME と接続する

![トップ画面](https://github.com/jins-meme/JinsMemeSDK-Sample-iOS/blob/master/README_Images/1.jpg)

JINS MEMEと接続するために接続画面を開きます。

画面下にある「Connect」ボタンを押してください。

![接続画面](https://github.com/jins-meme/JinsMemeSDK-Sample-iOS/blob/master/README_Images/2.jpg)

接続画面が開いたらJINS MEMEをアドバタイズモードにします。

その後、接続画面右上にある「scan」ボタンを押してください。

scanに成功すると画像のようにJINS MEMEが表示されます。

接続したいJINE MEMEを選びタップすると接続することができます。


### JINS MEME からのデータを確認する

![トップ画面](https://github.com/jins-meme/JinsMemeSDK-Sample-iOS/blob/master/README_Images/3.jpg)

JINE MEMEと接続が完了するとトップ画面に戻ります。

接続が完了したJINS MEMEを着け、瞬きしたり、頭を動かしてみたりしてください。

JINS MEMEから取得したデータを元にトップ画面の画像変化するようになります。

## License
MIT
