## howto

### プロジェクトを作成する

各ファイルにて、プロジェクトフォルダ名に合わせる
```
docker-compose run --rm --no-deps web rails new . --force --database=postgresql

docker-compose build
```

### postgresの設定
以下をconfig/database.ymlに書く  
sampleの部分はプロジェクト名にすると良い

```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: sample_development


test:
  <<: *default
  database: sample_test
```
### dbを作成する
```
db:create
```

### 起動
```
docker-compose up
```
バックグラウンドで動作させる場合は
```
docker-compose up -d
```


### シャットダウン
```
docker-compose down 
```

### rails等のコマンドを実行したい場合
```
docker-compose run --rm web [ここからコマンド]
```

### Gemfileを編集したら
```
docker-compose build
```
