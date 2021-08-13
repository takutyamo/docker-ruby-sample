# rubyのバージョンを指定(Perfectでは2.6.6)
FROM ruby:2.6.6


# nodejsとyarnはwebpackをインストールする際に必要_
# yarnパッケージ管理ツールをインストール
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn
# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get install nodejs -y

# プロジェクトフォルダ名に合わせる
RUN mkdir /sample
WORKDIR /sample
COPY Gemfile /sample/Gemfile
COPY Gemfile.lock /sample/Gemfile.lock
RUN bundle install
COPY . /sample

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
