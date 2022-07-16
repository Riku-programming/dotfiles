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
`./install.sh`
3. Run install.sh  
`./install.sh`

---

## 注意

install_brew.shの
```
formulas=$(brew list)
casks=$(ls /Applications | sed -e "s/.app//g" |  awk '{print tolower($0)}')
stores=$(mas list | cut -d " " -f 1)
```
この結果をファイル出力して読み込む必要がある

---

## 改善予定

* install_brew.shの変数の部分をapp_ids.txtとcasks.txtとformulas.txtから値を読み込んでshを動かしたい
* output_brew_files.shをcronかCIとか使って自動で実行させたい

---

## 参考文献

[ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164#dotfiles%E7%94%A8%E3%81%AEgitignore%E3%81%AE%E8%A8%AD%E5%AE%9A)
[mas-cliを使ってターミナルからMac App Storeの操作をできるようにする](https://webrandum.net/mas-cli/)