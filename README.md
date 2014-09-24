A/BテストフレームワークSplit入門
===
# 目的
A/BテストフレームワークSplitの環境構築と設定を学習する

# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| ruby      　　　|2.1.1         |             |
| hazel     　　　|0.0.8         |             |

# 構成
+ [環境構築](#1)
+ [Sinatraアプリケーション](#2)
+ [パート３](#3)

# 詳細
## <a name="1">環境構築</a>
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
$ hazel sinatra_sample -d sqlite --bundle
      create  sinatra_sample/config/initializers
      create  sinatra_sample/lib
      create  sinatra_sample/spec
      create  sinatra_sample/db/migrate
      create  sinatra_sample/lib/.gitkeep
      create  sinatra_sample/public/stylesheets
      create  sinatra_sample/public/stylesheets/main.css
      create  sinatra_sample/public/javascripts
      create  sinatra_sample/public/javascripts/.gitkeep
      create  sinatra_sample/public/images
      create  sinatra_sample/public/images/.gitkeep
      create  sinatra_sample/public/images/hazel_icon.png
      create  sinatra_sample/public/images/hazel_small.png
      create  sinatra_sample/public/favicon.ico
      create  sinatra_sample/views
      create  sinatra_sample/views/layout.erb
      create  sinatra_sample/views/welcome.erb
      create  sinatra_sample/sinatra_sample.rb
      create  sinatra_sample/spec/sinatra_sample_spec.rb
      create  sinatra_sample/spec/spec_helper.rb
      create  sinatra_sample/config.ru
      create  sinatra_sample/Gemfile
      create  sinatra_sample/Rakefile
      create  sinatra_sample/README.md
      create  sinatra_sample/config/db.yml
      create  sinatra_sample/config/initializers/database.rb
         run  bundle from "./sinatra_sample"
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Using rake 10.3.2
Using minitest 5.4.1
Using rack 1.5.2
Using rack-protection 1.5.3
Using rack-test 0.6.2
Installing sequel 4.14.0
Using tilt 1.4.1
Using sinatra 1.4.5
Using sqlite3 1.3.9
Using bundler 1.6.2
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
$ cd sinatra_sample
$ bundle exec rackup config.ru
[2014-09-24 14:57:42] INFO  WEBrick 1.3.1
[2014-09-24 14:57:42] INFO  ruby 2.1.1 (2014-02-24) [x86_64-darwin12.0]
[2014-09-24 14:57:42] INFO  WEBrick::HTTPServer#start: pid=10859 port=9292
```
_http://localhost:9292_から動作を確認する。

### デプロイ

_sinatra_sample/Gemfile_
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

_sinatra_sample/config/deploy.rb_  
_sinatra_sample/config/deploy/production.rb_  
_sinatra_sample/Capfile_

デプロイ実行

```bash
$ cap production deply
```

## <a name="3">パート３</a>

# 参照
+ [Split](https://github.com/andrew/split)
+ [fnichol/chef-rvm](https://github.com/fnichol/chef-rvm)
+ [brianbianco/redisio](https://github.com/brianbianco/redisio)
+ [Hazel](http://c7.github.io/hazel/)
