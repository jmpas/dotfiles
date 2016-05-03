source common/functions.sh

# homebrew
if which node &> /dev/null; then
    msg_checking "node"
else
    msg_install "Node" "brew install node"
    brew install node
    ok "OK"
fi
# homebrew
if which brew &> /dev/null; then
    msg_checking "homebrew"
else
    msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ok "OK"
fi

# zsh
brew install zsh zsh-completions
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
chsh -s /usr/local/bin/zsh

# tmux
brew install tmux

# vim
brew install macvim --override-system-vim

# vim - colors
cp -R .vim/colors ~/.vim/colors

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# phantomjs
if which phantomjs &> /dev/null; then
    msg_checking "phantomjs"
else
    msg_install "phantomjs" "brew install phantomjs"
    brew install phantomjs
    msg_ok "OK"
fi

# mongo
if which mongod &> /dev/null; then
    msg_checking "mongodb"
else
    msg_install "mongodb" "brew install mongodb"
    brew install mongodb --with-openssl
    msg_ok "OK"
fi
