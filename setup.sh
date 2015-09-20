DOT_FILES=( .vimrc .gvimrc .emacs.d .bash_profile .zshrc .zshenv .gemrc .tmux.conf)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "既にファイルが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
# for rbenv
if [ -a $HOME/.rbenv ]; then
	echo "make default-gems"	
fi
