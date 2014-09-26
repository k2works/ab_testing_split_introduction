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
+ [Sinatraランディングページサンプル](#4)

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
gem 'capistrano-rails', group: :development
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

## <a name="4">Sinatraランディングページ</a>

### セットアップ

```bash
$ hazel split-sinatra-landingpage -d sqlite --bundle
      create  split-sinatra-landingpage/config/initializers
      create  split-sinatra-landingpage/lib
      create  split-sinatra-landingpage/spec
      create  split-sinatra-landingpage/db/migrate
      create  split-sinatra-landingpage/lib/.gitkeep
      create  split-sinatra-landingpage/public/stylesheets
      create  split-sinatra-landingpage/public/stylesheets/main.css
      create  split-sinatra-landingpage/public/javascripts
      create  split-sinatra-landingpage/public/javascripts/.gitkeep
      create  split-sinatra-landingpage/public/images
      create  split-sinatra-landingpage/public/images/.gitkeep
      create  split-sinatra-landingpage/public/images/hazel_icon.png
      create  split-sinatra-landingpage/public/images/hazel_small.png
      create  split-sinatra-landingpage/public/favicon.ico
      create  split-sinatra-landingpage/views
      create  split-sinatra-landingpage/views/layout.erb
      create  split-sinatra-landingpage/views/welcome.erb
      create  split-sinatra-landingpage/split_sinatra_landingpage.rb
      create  split-sinatra-landingpage/spec/split_sinatra_landingpage_spec.rb
      create  split-sinatra-landingpage/spec/spec_helper.rb
      create  split-sinatra-landingpage/config.ru
      create  split-sinatra-landingpage/Gemfile
      create  split-sinatra-landingpage/Rakefile
      create  split-sinatra-landingpage/README.md
      create  split-sinatra-landingpage/config/db.yml
      create  split-sinatra-landingpage/config/initializers/database.rb
         run  bundle from "./split-sinatra-landingpage"
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Using rake 10.3.2
Using minitest 5.4.1
Using rack 1.5.2
Using rack-protection 1.5.3
Using rack-test 0.6.2
Using sequel 4.14.0
Using tilt 1.4.1
Using sinatra 1.4.5
Using sqlite3 1.3.9
Using bundler 1.6.2
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
$ cd split-sinatra-landingpage
$ $ bundle exec rackup config.ru
[2014-09-25 09:25:07] INFO  WEBrick 1.3.1
[2014-09-25 09:25:07] INFO  ruby 2.1.1 (2014-02-24) [x86_64-darwin12.0]
[2014-09-25 09:25:07] INFO  WEBrick::HTTPServer#start: pid=1982 port=9292
```

_http://localhost:9292/_で動作を確認する。

### ランディングページ作成
[Start Bootstrap](http://startbootstrap.com/template-overviews/landing-page/)からテンプレートをダウンロードして適用する。

_split-sinatra-landingpage/public/font-awesome-4.1.0_  
_split-sinatra-landingpage/public/fonts_  
_split-sinatra-landingpage/public/images_  
_split-sinatra-landingpage/public/javascripts_  
_split-sinatra-landingpage/public/stylesheets_  
_split-sinatra-landingpage/views/index.erb_  
_split-sinatra-landingpage/views/layout.erb_  


### A/BテストフレームワークSplit適用

_split-sinatra-landingpage/Gemfile_

```ruby
gem "split",  github: "andrew/split"
```

_split-sinatra-landingpage/config.ru_

```ruby
require 'split/dashboard'

# Split::Dashboard.use Rack::Auth::Basic do |username, password|
#   username == 'admin' && password == 'password'
# end

run Rack::URLMap.new \
  "/"       => SplitSinatraLandingpage.new,
  "/split" => Split::Dashboard.new
```

_split-sinatra-landingpage/config/initializers/split.rb_

```ruby
require 'split'

Split.configure do |config|
end
```

### ステージング環境デプロイ

_split-sinatra-landingpage/Gemfile_  
```ruby
gem "capistrano"
gem "capistrano-ext"
```

```bash
$ bundle
$ cap install
mkdir -p config/deploy
create config/deploy.rb
create config/deploy/staging.rb
create config/deploy/production.rb
mkdir -p lib/capistrano/tasks
Capified
```

デプロイ用ファイル編集

_split-sinatra-landingpage/config/deploy/staging.rb_  
_split-sinatra-landingpage/config/deploy.rb_  
_split-sinatra-landingpage/Capfile_  

デプロイ実行

```bash
$ cap staging deply
```

### プロダクション環境デプロイ

セットアップ

```bash
$ knife cookbook create production -o cookbooks
$ cd cookbooks/production
$ berks init
$ rm -rf .git
```

# 参照
+ [Split](https://github.com/andrew/split)
+ [Example of using split in a sinatra app](https://github.com/andrew/split-sinatra-example)
+ [Example of using split in a rails 3 app](https://github.com/semanticart/split-rails-example)
+ [fnichol/chef-rvm](https://github.com/fnichol/chef-rvm)
+ [brianbianco/redisio](https://github.com/brianbianco/redisio)
+ [Hazel](http://c7.github.io/hazel/)
+ [Start Bootstrap](http://startbootstrap.com/template-overviews/landing-page/)
+ [Vagrant と Azure で使い捨て開発環境をさくっと作る](http://qiita.com/zakkied/items/667418c6b9b1ea349687)
+ [Vagrant-AWSでうまくいかない時の調べ方](http://kazuki-u.hatenablog.com/entry/2013/04/02/195134)
+ [knife solo bootstrap , prepare コマンドが通らない時のtips](http://webuilder240.com/knife_solo_404/)
+ [VagrantでRVMを使うときによくはまること](http://blogs.zealot.co.jp/archives/566)
