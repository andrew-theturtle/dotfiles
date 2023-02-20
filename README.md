# dotfiles
## zsh
Install `zsh` using Homebrew:
```
brew install zsh
```
Install `zsh` using apt:
```
sudo apt install zsh
```

## Oh-My-Zsh
Install Oh-My-Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
The installation script should set `zsh` to your default shell, but if it doesn't 
you can do it manually:
```
chsh -s $(which zsh)
```

### Plugins
Add plugins to your shell by adding the name of the plugin to the `plugin` array
in `.zshrc`
```
plugins=(git)
```

#### zsh-syntax-highlighting
Clone the zsh-syntax-highlighting plugin’s repo and copy it to the “Oh My ZSH”
plugins directory.
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### zsh-autosuggestions
Clone the zsh-autosuggestions plugin’s repo and copy it to the “Oh My ZSH”
plugins directory.
```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

#### Enforce Changes
To apply the changes you make you need to either start new shell instance or run:
```
source ~/.zshrc
```

## z
Tracks most-used directories to make `cd` smarter
```
brew install z
```
Install without brew
```
sudo curl https://raw.githubusercontent.com/rupa/z/master/z.sh \
          -o /etc/profile.d/z.sh
```

## Vim Vundle
Set up
```
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Install Plugins:
Launch `vim` and run `:PluginInstall`
To install from command line: `vim +PluginInstall +qall`

