# dotfiles

```zsh
sudo xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install gh
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
# altab
ln -s ~/dotfiles/altab/com.lwouis.alt-tab-macos.plist ~/Library/Preferences/com.lwouis.alt-tab-macos.plist
```

```zsh
cd ~/dotfiles && brew bundle
```

## Rectangle

 Import, Mark launch at login
