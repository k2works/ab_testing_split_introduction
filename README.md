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
+ [Sinatraアプリケーションセットアップ](#2)
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

## <a name="2">Sinatraアプリケーションセットアップ</a>
## <a name="3">パート３</a>

# 参照
+ [Split](https://github.com/andrew/split)
+ [fnichol/chef-rvm](https://github.com/fnichol/chef-rvm)
+ [brianbianco/redisio](https://github.com/brianbianco/redisio)
+ [Hazel](http://c7.github.io/hazel/)
