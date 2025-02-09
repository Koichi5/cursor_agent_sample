---
description: 
globs: 
---

## Golden Test とは
Flutter にて画面差分やデザインの崩れがないかを確認するためのテスト手法です。Widget Test の一種として分類されています。

## alchemist について
このプロジェクトでは、Flutter で Golden Test を実施するために alchemist というパッケージを導入しています。このパッケージがあることで、デザインの修正のような視覚的な修正も機械的に判定することができるようになり、考慮漏れ等が減少します。

## このプロジェクトにおける alchemist の扱い方
以下ではこのプロジェクトで alchemist をどのように扱っているかをまとめます。これらの内容は GitHub で PR を作成する際にも非常に重要になります。
このプロジェクトでは、ユーザーの目に見えるViewは`lib`ディレクトリ配下の`views`ディレクトリで管理しています。`views`ディレクトリの配下にあるすべてのファイルに対して Golden Test が作成されていると仮定して実装を進めていきます。
それぞれの`views`に含まれるファイルのテストコードは`test`ディレクトリ配下に含まれており、`lib`配下のテスト対象となるファイルと全く同じディレクトリ構造で格納されています。
[my_home_page.dart](mdc:lib/views/my_home_page/my_home_page.dart)を例に取ります。このファイルは`lib/views/my_home_page/my_home_page.dart`に含まれています。そしてこのファイルのテストコードは`test/views/my_home_page_test/my_home_page_test.dart`に含まれています。テストコードはテスト対象のファイルの名前の最後に「_test」をつける命名規則に従っています。
以上が、テスト対象となるコードとそのテストコードの格納場所です。

次に Golden Test の実行方法について述べます。
以下の手順で Golden Test は実行されます。
1. 開発者が新たに`lib/views`ディレクトリ配下でUIのファイルを作成する
2. Pull Request を作成する前に `flutter test --update-goldens --tags=golden` コマンドを実行することで新たに作成したファイルのUIの画像を登録しておく（このコマンドで作成されたUIの画像はGolden Test のテストコードが含まれるディレクトリと同じディレクトリの `goldens/ci/my_app_default.png` に作成されます。例えば、`my_home_page.dart` というファイルを作成し、テストコードを記述してコマンドを実行すると `test/views/my_home_page_test/goldens/ci/my_app_default.png` のディレクトリに画像が作成されます）
3. 別の実装で既にGolden Test が実装されているファイルを編集する
4. ファイルを修正後 `flutter test --tags=golden` コマンドを実行するとテストが失敗する（この時テストが失敗するのはUIが変更されていることを検知しているためです）
5. テストが失敗した場合は `test/views/{テスト対象のファイル名}_test` ディレクトリに `failures` ディレクトリが作成されます。その中の `my_app_default_masterImage.png` ファイルがマスターの画像であり、ステップ3で修正する前の実行結果のUI画像です。また、`failures`同じディレクトリの `my_app_default_testImage.png` がステップ3で修正した後の実行結果のUI画像です。
6. ステップ3で行ったUIの変更をPRを通してチームメンバーに共有し、その変更に問題がなければPRをマージし、同時に `flutter test --update-goldens --tags=golden` を実行します。これで Golden Image が更新されます。つまり、Golden Test の master 画像が変更後の画像に切り替わります。

以上が Golden Test の実行内容です。

viewsディレクトリ配下で変更があった場合のみ Golden Test を実行するようにできれば理想的です。しかし、課題を細分化するためにこの実装は当面考えていません。