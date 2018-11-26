#!/bin/bash

sudo apt-get install -fmy zsh fonts-powerline git curl wget unzip dconf-cli
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s `which zsh`
if ! test -d ~/.solarized; then
  git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
fi
~/.solarized/install.sh
wget https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark -O ~/.solarized/dircolors.ansi-dark
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
wget https://github.com/madmalik/mononoki/releases/download/1.2/mononoki.zip -O mononoki.zip
mkdir -p ~/.fonts/mononoki
unzip -u mononoki.zip -d ~/.fonts/mononoki/
wget https://fonts.google.com/download\?family\=Source%20Code%20Pro -O Source_Code_Pro.zip
mkdir -p ~/.fonts/Source_Code_Pro
unzip -u Source_Code_Pro.zip -d ~/.fonts/Source_Code_Pro
fc-cache -vf ~/.fonts/
sudo apt-get install -fmy autojump python-pygments
if ! test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
if ! test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if ! test -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k; then
  git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
fi
count=$(grep -c "DEFAULT_USER=\`whoami\`" ~/.zshrc)
if [ $count -eq 0 ]; then
  echo "DEFAULT_USER=\`whoami\`" >> ~/.zshrc
fi
count1=$(grep -c "eval \`dircolors ~/.solarized/dircolors.ansi-dark\`" ~/.zshrc)
if [ $count1 -eq 0 ]; then
  echo "eval \`dircolors ~/.solarized/dircolors.ansi-dark\`" >> ~/.zshrc
fi

sed -i "s/^ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc

#Or replace default .zshrc with my custom one
#cp ~/.zshrc ~/.zshrc.`date '+%Y-%m-%d:%H:%M:%S'`
#cp .zshrc ~/.zshrc

#Replace default .zprofile with my custom one
#cp ~/.zprofile ~/.zprofile.`date '+%Y-%m-%d:%H:%M:%S'`
#cp .zprofile ~/.zprofile

#cp ~/.aliases ~/.aliases.`date '+%Y-%m-%d:%H:%M:%S'`
#cp .aliases ~/.aliases

#cp ~/.byobu/.tmux.conf ~/.byobu/.tmux.conf.`date '+%Y-%m-%d:%H:%M:%S'`
#cp .byobu/.tmux.conf ~/.byobu/.tmux.conf
