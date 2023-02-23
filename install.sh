#!/bin/zsh

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname "$0")
cd "$BASEDIR" || exit

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue
    # シンボリックリンクを貼る
    ln -snfv "${PWD}"/"$f" ~/
done

if [ "$(uname)" == 'Darwin' ]; then
    brew install neovim
    brew install tmux
else
    echo "RUN"
fi


# oh-my-zshやvim-plugをインストールする
echo "PlugInstall"
./plug_install.sh
echo "Done"


