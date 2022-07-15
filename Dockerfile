FROM ruby:2.5.7
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /rakukin
# コンテナ内にmyappディレクトリを作成

WORKDIR /rakukin
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /rakukin/Gemfile
COPY Gemfile.lock /rakukin/Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /rakukin
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー

ENV TZ Asia/Tokyo