# dotfiles


```zsh
sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com
brew install gh
gh auth login
```



```zsh
gh repo clone NumberPiOso/dotfiles
cd dotfiles
git submodule update --init --recursive
```


```zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
# ln -s ~/dotfiles/.p10k ~/.p10k
ln -s ~/dotfiles/zsh/oh-my-zsh ~/.oh-my-zsh
```


```zsh
cd ~/dotfiles && brew bundle
```
