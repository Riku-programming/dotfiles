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
done

# GoLandのlaunch shortcutを作成
sudo cp "${PWD}/Jetbrains/goland" "/usr/local/bin/goland"
chmod +x /usr/local/bin/goland

if [ "$(uname)" == 'Darwin' ]; then
    brew install nvim
    brew install tmux
else
    echo "RUN"
fi


# oh-my-zshやvim-plugをインストールする
echo "PlugInstall"
./plug_install.sh
echo "Done"


