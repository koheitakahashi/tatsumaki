# tatsumaki
## setup

以下を実行して、http://localhost:3000 で画面が表示されることを確認。

```shell
docker compose build
docker compose run --rm web bundle install
docker compose run --rm web bin/rails db:setup
docker compose up
```
