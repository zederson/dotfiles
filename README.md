## My dotfiles
my configurations environment

## Plugins to VIM
Installation Vundle
[Github Vundle](https://github.com/gmarik/Vundle.vim)

```bash
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
Após executar o git clone será necessário copiar o arquivo *dotfiles/.vimrc* que estará no diretório dotfiles para a sua home *~/.vimrc*.

Install Plugin YouCompleteMe
[Github YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
Install
```bash
brew install cmake
```
```bash
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

Deixa como padrão as teclas de F[1-12] e não as funções de som, contraste, ... APENAS PARA LINUX
```bash
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
```
