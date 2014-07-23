## My dotfiles
my configurations environment

## Plugins to VIM
Installation janus to vim
[Github Janus](https://github.com/carlhuda/janus)

```bash
$ curl -Lo- https://bit.ly/janus-bootstrap | bash
```
Plugin Tabular
[Github Tabular](https://github.com/godlygeek/tabular)
Install
```bash
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/godlygeek/tabular.git
```

Deixa como padrão as teclas de F[1-12] e não as funções de som, contraste, ... APENAS PARA LINUX
```bash
echo 2 | sudo tee /sys/module/hid_apple/parameters/fnmode
```
