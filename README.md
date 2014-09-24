A/BテストフレームワークSplit入門
===
# 目的
A/BテストフレームワークSplitの環境構築と設定を学習する

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| ruby      　　　|2.1.1         |             |
| redis     　　　|2.8.9         |             |

# 構成
+ [デプロイ環境構築](#1)
+ [Sinatraアプリケーション](#2)
+ [Rails3アプリケーション](#3)

# 詳細
## <a name="1">デプロイ環境構築</a>
### セットアップ
```bash
$ cd cookbooks/case01
$ vagrant up
```
### レシピ
RVMインストール  
_site-cookbooks/rvm-env/recipes/default.rb_

Reidsインストール  
_site-cookbooks/redis-env/recipes/default.rb_

Webアプリケーション設定  
_cookbooks/case01/recipes/default.rb_

## <a name="2">Sinatraアプリケーション</a>
### セットアップ

```bash
$ git clone https://github.com/andrew/split-sinatra-example.git
Cloning into 'split-sinatra-example'...
remote: Counting objects: 63, done.
remote: Total 63 (delta 0), reused 0 (delta 0)
Unpacking objects: 100% (63/63), done.
Checking connectivity... done.
$ cd split-sinatra-example/
$ bundle
$ redis-server &
$ bundle exec rackup config.ru
[2014-09-24 14:57:42] INFO  WEBrick 1.3.1
[2014-09-24 14:57:42] INFO  ruby 2.1.1 (2014-02-24) [x86_64-darwin12.0]
[2014-09-24 14:57:42] INFO  WEBrick::HTTPServer#start: pid=10859 port=9292
```
_http://localhost:9292_から動作を確認する。

### デプロイ

_split-sinatra-example/Gemfile_
```bash
gem "capistrano"
gem "capistrano-ext"
```

```bash
$ bundle install
$ cap install
mkdir -p config/deploy
create config/deploy.rb
create config/deploy/staging.rb
create config/deploy/production.rb
mkdir -p lib/capistrano/tasks
Capified
```

デプロイ用ファイル編集

_split-sinatra-example/config/deploy.rb_  
_split-sinatra-example/config/deploy/production.rb_  
_split-sinatra-example/Capfile_

デプロイ実行

```bash
$ cap production deply
```

_http://192.168.33.10_から動作を確認する。

## <a name="3">Rails3アプリケーション</a>

### セットアップ

```bash
$ git clone https://github.com/semanticart/split-rails-example.git
$ cd split-rails-example/
$ bundle
$ redis-server &
$ rails s
```

_http://localhost:3000_から動作を確認する。

### デプロイ

_split-rails-example/Gemfile_

```ruby
em 'capistrano-rails', group: :development
gem 'capistrano'
```

```bash
$ bundle exec capify .
```
デプロイ用ファイル編集

_split-rails-example/config/deploy.rb_  
_split-rails-example/Capfile_

```bash
$ git init
$ git add .
$ git commit -am "Setup"
$ cap deploy:setup
```

ファイル所有権の変更

```bash
$ ssh vagrant@192.168.33.10
vagrant@192.168.33.10's password:vagrant
$ cd /var/www/
$ sudo chgrp vagrant releases/
$ sudo chgrp vagrant shared/
$ exit
```

Railsアプリケーションのデプロイ

```bash
$ cap deploy
```

_http://192.168.33.10_から動作を確認する。

# 参照
+ [Split](https://github.com/andrew/split)
+ [Example of using split in a sinatra app](https://github.com/andrew/split-sinatra-example)
+ [Example of using split in a rails 3 app](https://github.com/semanticart/split-rails-example)
+ [fnichol/chef-rvm](https://github.com/fnichol/chef-rvm)
+ [brianbianco/redisio](https://github.com/brianbianco/redisio)
+ [Hazel](http://c7.github.io/hazel/)
