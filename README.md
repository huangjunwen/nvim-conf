
# 依赖

## neovim

mac:

```
$ brew install neovim             # /usr/local/bin/nvim
$ brew install python3            # /usr/local/bin/python3 /usr/local/bin/pip3
$ pip3 install neovim --upgrade   # Install python-neovim package
```

## 要使用 golang 支持的话 需要安装 go-langserver

```
go get -u github.com/sourcegraph/go-langserver
```

见 https://github.com/sourcegraph/go-langserver

# 安装

克隆本仓库并符号链接到 `.config/nvim` 目录，然后运行 `:PlugInstall`
