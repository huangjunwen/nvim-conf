
# 依赖

## neovim 以及 python3 支持

mac:

```
$ brew install neovim             # /usr/local/bin/nvim
$ brew install python3            # /usr/local/bin/python3 /usr/local/bin/pip3
$ pip3 install neovim --upgrade   # Install python-neovim package
```

## 要使用 golang 支持的话需要安装 go-langserver

目前使用的 go lsp 服务器是 [bingo](https://github.com/saibing/bingo)，以后等 [gopls](https://github.com/golang/go/wiki/gopls) 成熟了可以转用之

## 要是用 gpg 支持的话需要安装 gpg

# 安装

克隆本仓库并符号链接到 `.config/nvim` 目录，然后运行 `:PlugInstall`
