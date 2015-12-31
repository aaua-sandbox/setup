#!/bin/sh
perl_ver=5.23.6

echo '*** install list **************'
echo 'plenv'
echo 'perl-build'
echo "perl $perl_ver"
echo 'cpanm'

echo '*** plenv and perl-build install **************'
git clone git://github.com/tokuhirom/plenv.git ~/.plenv
git clone git://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/
echo 'export PATH=~/.plenv/bin:~/.plenv/shims/:$PATH' >> ~/.bash_profile
echo 'eval "$(plenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

echo '*** perl install **************'
# インストール可能なバージョンの確認
# plenv install --list
# plenvに登録されたバージョンの確認
# plenv versions

plenv install $perl_ver
plenv rehash
plenv global $perl_ver
perl -v

echo '*** cpanm install **************'
plenv install-cpanm
cpanm Acme::Nyaa
perl -MAcme::Nyaa -e 'print Acme::Nyaa->new->cat("cpanmインストール完了\n");'
yes | cpanm --uninstall Acme::Nyaa

echo '*** !!!Complete!!! **************'
