# README

## シンボリックリンク
* クローン後`sh dotfilesLink.sh`実行
* dotfiles配下のファイルのシンボリックリンクを貼る

## git補完機能
* 別途`git-completion`のインストールが必要
```
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
echo "source ~/.git-completion.bash" >> ~/.bashrc
source ~/.bashrc
```
