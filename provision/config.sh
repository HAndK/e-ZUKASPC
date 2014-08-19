#!/bin/bash

# プロンプトの変更（短くする）
cat .bashrc | sed -e 's/\\u@\\h://' > .bashrc.tmp
mv .bashrc.tmp .bashrc

# ホームディレクトリにbinディレクトリを作成する
mkdir bin

# gibo install
wget https://raw.github.com/simonwhitaker/gibo/master/gibo -P ~/bin && chmod +x ~/bin/gibo && gibo -u

# heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
