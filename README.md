# iOS向け JINS MEME SDK サンプルアプリ

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


## License
MIT
