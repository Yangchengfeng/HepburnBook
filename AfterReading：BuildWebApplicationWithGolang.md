# After_Reading：Build Web Application With Golang

![开篇](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/01.jpg)

## 一 Go环境配置

### 1、Go安装

- 源码

- 安装包

- 第三方工具：如Ubuntu的apt-get、Mac的homebrew、GVM(支持同一系统安装多个版本的Go)

以上罗列了3种安装方式，个人借助第三方工具`homebrew`：``` brew install go ```

### 2、GOPATH与工作空间
> go 命令依赖一个重要的环境变量:$GOPATH

[配置GOPATH](https://www.jianshu.com/p/358cbc939569)：

① ```go env```

![环境变量](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/%E7%8E%AF%E5%A2%83%E5%8F%98%E9%87%8F.png)

② ```vim .bash_profile```

③ 参数配置

```export GOPATH=/usr/local/Cellar/go/1.10.3```

```export GOBIN=$GOPATH/bin```

```export PATH=$PATH:$GOBIN```

④ ``` source .bash_profile```

### 3、Go 命令

1、命令查询

![Go命令查询](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/Go%E5%91%BD%E4%BB%A4%E6%9F%A5%E8%AF%A2.png)

2、[chm手册](https://github.com/astaxie/godoc)

注：[篇附图](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/02.png)
