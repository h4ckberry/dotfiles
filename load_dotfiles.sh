#!/bin/sh
echo LOAD DOT FILES

select dotfile in .vimrc .bashrc .tmux.conf

do
  echo "select $dotfile"
  break
done

if [ "$dotfile" = ".vimrc" ]; then
  source "$(curl -s https://raw.githubusercontent.com/koooota/dotfiles/master/.vimrc)"
elif [ "$dotfile" = ".bashrc" ]; then
  bash -c "$(curl -s https://raw.githubusercontent.com/koooota/dotfiles/master/.bashrc)"
elif [ "$dotfile" = ".tmux.conf" ]; then
  tmux source-file "$(curl -ssource-file https://raw.githubusercontent.com/koooota/dotfiles/master/.tmux.conf)"
else
  echo "Select the displayed number"
fi
