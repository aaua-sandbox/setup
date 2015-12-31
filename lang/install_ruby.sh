#!/bin/sh
ruby_ver=2.3.0

echo '*** install list **************'
echo 'rbenv'
echo "ruby $ruby_ver"

echo '*** rbenv install **************'
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv

mkdir -p ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
cd ~/.rbenv/plugins/ruby-build
sudo ./install.sh

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

rbenv


echo '*** ruby and bundler install **************'
# インストール可能なバージョンの確認
# rbenv install -l
#
# rbenv, ruby-buildの更新
# cd ~/.rbenv
# git pull
# cd ~/.rbenv/plugins/ruby-build
# git pull

rbenv install $ruby_ver
rbenv global $ruby_ver

rbenv exec gem install bundler --no-ri --no-rdoc

rbenv rehash
ruby -v

echo '*** !!!Complete!!! **************'
