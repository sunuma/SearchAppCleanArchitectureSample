### ビルド前に必要な手順

#### Realm用のframeworkを追加
`Realm`を`Carthage`や`cocoaPods`で追加するとビルドに時間がかかるためframeworkを直接追加する
https://realm.io/jp/docs/swift/latest/
はじめに > インストール > Dynamic Framework の内容に従って`RealmSwift.framework`を追加
以下のシェルはビルド時にエラーが出たため現時点では追加していない
```
bash "${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/Realm.framework/strip-frameworks.sh"
```


#### R.swift用のファイル生成コマンドを追加
`Carthage`でR.swiftを使用する場合、`R.generated.swift`を生成するコマンドファイルがないため公式からとってくる  
https://github.com/mac-cain13/R.swift/releases  
XcodeやSwiftの環境に合わせた`rswift-xxxxx.zip`をダウンロードし展開  
プロジェクトディレクトの下にrswiftディレクトを作成し、その下に`rswift`コマンドファイルを配置  
プロジェクト > TARGETS > Build Phases > Run Script - R.swift  に以下のシェルが記述されているのを確認  
```
"$SRCROOT/rswift/rswift" generate "$SRCROOT"
```
プロジェクトディレクトの下に`R.generated.swift`が生成されているのを確認  
左側のファイルヒエラルキーを右クリック > Add Files to ... から`R.generated.swift`を追加  