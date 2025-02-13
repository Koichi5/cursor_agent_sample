---
description: Pull Request作成手順
globs:
---

## pull request 作成手順

まず、このファイルを参照したら、「Pull Request 作成手順のファイルを確認しました！」と報告してください。

### 変更内容の確認

- {{マージ先ブランチ}}に関する指定がない場合は、どのブランチに対して PullRequest を作成するか必ず聞き返してください。
- `git diff origin/{{マージ先ブランチ}}...HEAD | cat` でマージ先ブランチとの差分を確認

### Golden Test の実装と実行

- 変更内容に`lib/views/**`のファイルが含まれているかを確認
- 新規作成された View がある場合：

  1. `test/views/{view_name}_test/{view_name}_test.dart`に Golden Test を実装
  2. `flutter test --update-goldens test/views/{view_name}_test/{view_name}_test.dart`を実行

- 既存の View が変更された場合：
  1. `flutter test --tags=golden`を実行して変更の影響を確認
  2. 意図した変更であることを確認
  3. `flutter test --update-goldens --tags=golden`を実行して Golden Image を更新

### Pull Request 作成とブラウザでの表示

- 以下のコマンドで pull request を作成し、自動的にブラウザで開く
- PR タイトルおよび PR テンプレートはマージ先との差分をもとに適切な内容にする
- 指示がない限り Draft で pull request を作成
- PR の本文は一時ファイルを使用して作成することを推奨

  ```bash
  # PR本文を一時ファイルに保存（より確実な方法）
  echo '{{PRテンプレートの内容}}' > pr_body.txt

  # PRの作成
  git push origin HEAD && \
  gh pr create --draft --title "{{PRタイトル}}" --body-file pr_body.txt && \
  gh pr view --web
  ```

- 各セクションを明確に区分
- 必要な情報を漏れなく記載

### Golden Test の実行

[golden-test.mdc](mdc:.cursor/rules/golden-test.mdc) をもとに、UI に変更があれば実行してください。

#### PR テンプレート

[pull-request-template.mdc](mdc:.cursor/rules/pull-request-template.mdc) からテンプレート内容を取得すること
