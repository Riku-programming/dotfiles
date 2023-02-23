#!/bin/zsh

#!/bin/bash

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."
brew upgrade

formulas=$(brew list)

echo "brew tap"
# brew tap thirdparty
brew tap homebrew/cask-fonts

echo "brew install formula"

formulas=$(cat ./brew_files/formulas.txt)
cat ./brew_files/formulas.txt | while read -r formulas
do
  brew install "${formulas}" || brew upgrade "${formulas}"
  sleep 5
  echo "Next formula Install"
done

echo Install GUI Applications
# todo 以下コマンドの出力とcasksが少しぶれる
casks=$(ls /Applications | sed -e "s/.app//g" |  awk '{print tolower($0)}')
casks=$(find . -maxdepth 1  -name '')
casks=(
    atom
    alfred
    alacritty
    appcleaner
    biscuit
    bitwarden
    boostnote
    cacher
    cheatsheet
    dash
    deepl
    discord
    docker
    drawio
    dropbox
    font-hack-nerd-font
    gitkraken
    grammarly
    google-backup-and-sync
    gyazo
    hyperswitch
    inkscape
    iterm2
    julia
    jetbrains-toolbox
    kap
    karabiner-elements
    keycastr
    mamp
    notion
    obs
    papers
    r
    rectangle
    skitch
    skype
    slack
    spotify
    steam
    tickeys
    visual-studio
    visual-studio-code
    vrew
    vlc
    xmind
    zoom
)

echo "brew casks"
for cask in "${casks[@]}"; do
    brew install --cask "$cask"
done

# AppのIdを取得
#app_ids=$(mas list | cut -d " " -f 1)
echo "Install apps from the app store"
cat ./brew_files/app_ids.txt | while read app_ids
do
  mas install "$app_ids"
done


#brew cleanup
echo "brew installed"
