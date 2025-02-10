# コミット規約

- 変更を確認し、重要なファイルのみgit addすること。
- conventional commitに従うこと。
- コミットメッセージは英語で記述すること。
- 変更内容を具体的に、簡潔に記述すること。

## 例

```
状況: Makefile、setting.conf、app.js、package.jsonが変更されているとき
コマンド: git add Makefile setting.conf && git commit -m "feat: add install-package command" && git add app.js package.json && git commit -m "feat: use expressjs in app.js, package.json"
```
