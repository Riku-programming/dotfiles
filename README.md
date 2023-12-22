# dotfiles 

環境移行前に前の環境で

`./output_brew_files.sh`を実行する

---

## Installation

1. GitClone  
```
git clone https://github.com/Riku-programming/dotfiles.git 
cd dotfiles
```
2. Run install_brew.sh  
`nohup ./install_brew.sh &`
3. Run install.sh  
`sudo  ./install.sh`

---

## 注意

install_brew.shの
```
formulas=$(brew list)
casks=$(ls /Applications | sed -e "s/.app//g" |  awk '{print tolower($0)}')
stores=$(mas list | cut -d " " -f 1)
```
この結果をファイル出力して読み込む必要がある

formulas.txtのaws-sam-cliとaws-cliは時間がかかるので事前に削除しておいた方がいいかも

---

## 改善予定

* output_brew_files.shをcronかCIとか使って自動で実行させたい

---

## やること

zshのプラグインを入れる必要がある
ripgrep batとかを入れる


--- 

## 各種プラグインインストール

### oh-my-zsh

`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

### p10k configure

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

### zsh-autosuggestions

`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

### autojump

`brew install autojump`

### fzf

`git clone --depth 1 https://github.com/junegunn/fzf.git \
~/.fzf/install`

### vim-plug

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
`

### ripgrep

`brew ripgrep`

### [zsh-comletions](https://github.com/zsh-users/zsh-completions)

`  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions`


### [peco](https://github.com/peco/peco)
`brew install peco`
## 参考文献

[ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164#dotfiles%E7%94%A8%E3%81%AEgitignore%E3%81%AE%E8%A8%AD%E5%AE%9A)  
[mas-cliを使ってターミナルからMac App Storeの操作をできるようにする](https://webrandum.net/mas-cli/)
