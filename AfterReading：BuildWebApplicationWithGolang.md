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


# 2 基本语法

## 1、Hello, Go!

示例代码 2-1：新建helloworld.go，打印Hello, Go!

```
package main

import "fmt"

func main() {
    fmt.Print("Hello, Go!")
}
```

1、导入包文件三种格式

①

```
import (
    "fmt"
)
```
②
```
import "./model"
```
③
```
import "shorturl/model"
```
特殊的import方式：
①点操作
```
package main

import (
. "fmt"
)

func main() {
    println("Hello, Go") // 可省略前缀包名
}
```
②别名操作
```
package main

import (
    f "fmt"
)

func main() {
    f.Println("Hello world")
}
```

③_操作

```
import (
    _ "github.com/go-sql-driver/mysql"
) 
```
## 2、基本语法

Go语言数据类型

![数据类型](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/%E6%95%B0%E6%8D%AE%E7%B1%BB%E5%9E%8B.png)

### struct类型

（1）三种声明：

①

```
package main

import "fmt"

type person struct {
    name string
    age int
}

func main() {
    var P person
    P.name = "Astaxie"
    P.age = 25
    fmt.Printf("This Person's name is %s, it's age is %d", P.name, P.age)
}
```

②

```
package main

import "fmt"

type person struct {
    name string
    age int
}

func main() {
    P := person{"Tom", 25} // P必须是未声明的，否则编译出错：no new variables on left side of :=
    fmt.Printf("This Person's name is %s, it's age is %d", P.name, P.age)
}
```

③

```
package main

import "fmt"

type person struct {
    name string
    age int
}

func main() {
    P := person{age: 12, name:"Alice"} // 相较②这是无序的
    fmt.Printf("This Person's name is %s, it's age is %d", P.name, P.age)
}
```

仅是引入该包，当导入一个包时，它所有的init()函数就会被执行，但有时并非真的需要使用这些包，仅仅是希望它的init()函数被执行而已（此时可使用`_操作`引用该包了。即使用_操作引用包是无法通过包名来调用包中的导出函数，而是只是为了简单的调用其init函数()）

```
package main

import "fmt"

type person struct {
    name string
    age int
}

func Older(p1, p2 person) (person, int) {
    if p1.age > p2.age {
        return p1, p1.age - p2.age
    }
    return p2, p2.age - p1.age
}

func main() {
    var tom person
    tom.name, tom.age = "Tom", 33
    bob := person{"Bob", 25}
    paul := person{"Paul", 43}

    tb_Older, tb_diff := Older(tom, bob)
    tp_Older, tp_diff := Older(tom, paul)
    bp_Older, bp_diff := Older(bob, paul)

    fmt.Printf("Of %s and %s, %s is older by %d years\n", tom.name, bob.name, tb_Older.name, tb_diff)
    fmt.Printf("Of %s and %s, %s is older by %d years\n", tom.name, paul.name, tp_Older.name, tp_diff)
    fmt.Printf("Of %s and %s, %s is older by %d years\n", bob.name, paul.name, bp_Older.name, bp_diff)
}
```

（2）匿名字段

```
package main

import "fmt"

type Human struct {
    name string
    age int
    weight int
}

type Student struct {
    Human
    speciality string
}

func main() {
    mark := Student{Human{"Mark", 25, 120}, "ComputerScience"}

    mark.speciality = "AI"
    mark.name = "QQ"
    mark.age = 55
    mark.weight += 10

    fmt.Printf("The information of this student name:%s, age:%d, weight:%d, speciality:%s", mark.name, mark.age, mark.weight, mark.speciality)
}

```
> 假如：Student里面有phone，Human里面也有phone，那如何处理呢？
> 最外层优先访问 -> Student

## 3、面向对象

### make & new

- make用于内建类型(map、slice 和channel)的内存分配。new用于各种类型的内存分配。
内建函数new本质上说跟其它语言中的同名函数功能一样:new(T)分配了零值填充的T类型的内存空间，并且返回其 地址，即一个*T类型的值。用Go的术语说，它返回了一个指针，指向新分配的类型T的零值。内建函数make(T, args)与new(T)有着不同的功能，make只能创建slice、map和channel，并且返回一个有初 始值(非零)的T类型，而不是*T

- new返回指针
【总】内建函数make(T, args)与new(T)有着不同的功能，导致这三个类型有所不同的原因是指向数据结构的引用在使用前必须被 初始化。例如，一个slice，是一个包含指向数据(内部array)的指针、长度和容量的三项描述符;在这些项目被 初始化之前，slice为nil。对于slice、map和channel来说，make初始化了内部的数据结构，填充适当的值。make返回初始化后的(非零)值。

### method

```
package main

import (
    "math"
    "fmt"
)

type Rectangle struct {
    width, height float64
}

type Circle struct {
    radius float64
}

func (r Rectangle) area() float64 {
    return  r.width * r.height
}

func (c Circle) area() float64 {
    return c.radius * c.radius *math.Pi
}

func main() {
    r1 := Rectangle{12, 2}
    r2 := Rectangle{9, 4}
    c1 := Circle{10}
    c2 := Circle{25}
    fmt.Println("Area of r1 is:", r1.area())
    fmt.Println("Area of r2 is:", r2.area())
    fmt.Println("Area of c1 is:", c1.area())
    fmt.Println("Area of c2 is:", c2.area())
}
```

1、指针receiver和非指针receiver

```
package main

import "fmt"

type Person struct {
    Name string
    Age int
}

func (p *Person) SayHi1() {
    p.Name = "leon1"
}

func (p Person) sayHi2() {
    p.Name = "leon2"
}

func main() {
    p1 := &Person{Name: "test", Age: 10}
    fmt.Println("name1:" + p1.Name)
    p1.SayHi1()
    fmt.Println("name2:" + p1.Name)

    p2 := Person{Name: "test1", Age: 11}
    fmt.Println("name3:" + p2.Name)
    p2.sayHi2()
    fmt.Println("name4:" + p2.Name)
}
```

> name1:test
> name2:leon1
> name3:test1
> name4:test1

2、method继承
```
package main

import "fmt"

type Human struct {
    name string
    age int
    phone string
}

type Student struct {
    Human
    school string
}

type Employee struct {
    Human
    company string
}

func (h *Human) Sayhi() {
    fmt.Println("Hi, I am %s you can call me on %s", h.name, h.phone)
}

func main() {
    mark := Student{Human{"Matk", 25, "222-222-YYYY"}, "MIT"}
    sam := Employee{Human{"Sam", 35, "222-322-YYYY"}, "Inc"}

    mark.Sayhi()
    sam.Sayhi()
}
```

3、method重写

```
package main

import "fmt"

type Human struct {
    name string
    age int
    phone string
}

type Student struct {
    Human
    school string
}

type Employee struct {
    Human
    company string
}

func (h *Human) Sayhi() {
    fmt.Println("Hi, I am %s you can call me on %s", h.name, h.phone)
}

func (e *Employee) Sayhi() { 
    fmt.Println("Hi, I am %s , I work at %s, you can call me on %s", e.name, e.company, e.phone)
}

func main() {
    mark := Student{Human{"Matk", 25, "222-222-YYYY"}, "MIT"}
    sam := Employee{Human{"Sam", 35, "222-322-YYYY"}, "Inc"}

    mark.Sayhi()
    sam.Sayhi()
}
```
> **注：没有任何的私有、 公有关键字，通过大小写来实现(大写开头的为共有，小写开头的为私有)，方法也同样适用这个原则。**

### interface

以 `Student实现了三个方法:Sayhi、Sing、BorrowMoney;而Employee实现了Sayhi、Sing、SpendSalary`为例子：


### 反射[reflect](https://golang.org/doc/articles/laws_of_reflection.html)

## 并发

### goroutine

> 比线程更小，十几个goroutine可能体现在 底层就是五六个线程，Go语言内部帮你实现了这些goroutine之间的内存共享。执行goroutine只需极少的栈内存(大 概是4~5KB)，当然会根据相应的数据伸缩。也正因为如此，可同时运行成千上万个并发任务。goroutine比thread更 易用、更高效、更轻便。
> goroutine是通过Go的runtime管理的一个线程管理器。goroutine通过go关键字实现了，其实就是一个普通的函数。


```
package main

import (
    "runtime"
    "fmt"
)

func say(s string) {
    for i := 0; i<5; i++ {
        runtime.Gosched()
        fmt.Println(s)
    }
}

func main() {
    go say("world")
    say("hello")
}
```

```
// 运行结果
hello
hello
hello
hello
hello
```

> 多个goroutine运行在同一个进程里面，共享内存数据， 不过设计上我们要遵循:不要通过共享来通信，而要通过通信来共享。
runtime.Gosched()表示让CPU把时间片让给别人,下次某个时候继续恢复执行该goroutine。
默认情况下，调度器仅使用单线程，也就是说只实现了并发。想要发挥多核处理器的并行，需要在我们的程序中显 示的调用 runtime.GOMAXPROCS(n) 告诉调度器同时使用多个线程。GOMAXPROCS 设置了同时运行逻辑代码的系统线 程的最大数量，并返回之前的设置。如果n < 1，不会改变当前设置。以后Go的新版本中调度得到改进后，这将被移除。

了解runtime包中其他几个处理goroutine的函数

- Goexit：退出当前执行的goroutine，但是defer函数还会继续调用
- Gosched：让出当前goroutine的执行权限，调度器安排其他等待的任务运行，并在下次某个时候从该位置恢复执行。 
- NumCPU：返回 CPU 核数量
- NumGoroutine：返回正在执 行和排队的任务总数
- GOMAXPROCS：用来设置可以运行的CPU核数

### channels

> 默认情况下，channel接收和发送数据都是阻塞的，除非另一端已经准备好，这样就使得Goroutines同步变的更加的 简单，而不需要显式的lock。所谓阻塞，也就是如果读取(value := <-ch)它将会被阻塞，直到有数据接收。其 次，任何发送(ch<-5)将会被阻塞，直到数据被读出。无缓冲channel是在多个goroutine之间同步很棒的工具。

```
package main

import "fmt"

func sum(a []int, c chan int) {
    sum := 0
    for _, v := range a {
        sum += v
    }
    c <- sum
}

func main() {
    a := []int{7, 2, 8, -9, 4, 0}
    c := make(chan int)

    go sum(a[:len(a)/2], c)
    go sum(a[len(a)/2:], c)

    x, y := <-c, <-c
    fmt.Println(x, y, x+y)
}
```

```
// 运行结果
-5 17 12
```

#### Buffered Channels

#### Range和Close

```
package main

import "fmt"

func fibonacci(n int, c chan int)  {
    x, y := 1, 1
    for i:=0; i<n; i++{
    c <- x;
    x, y = y, x + y
}
    close(c)
}

func main() {

    c := make(chan int, 10)
    go fibonacci(cap(c), c)

    for  i := range c  {
        fmt.Println(i)
    }
}
```

```
// 运行结果
1
1
2
3
5
8
13
21
34
55
```

#### Select

> 通过select可以监听channel上的数据流动，select默认是阻塞的，只有当监听的channel中有发送或接收可以进行时才会运行，当多个channel都准备好的时候，select是随机的选择一个执行的。

```
package main

import (
"fmt"
)

func fibonacci(c, quit chan int)  {
    x, y := 1, 1
    for {
        select {
        case c <- x:
        x, y = y, x + y
        case <- quit:
        fmt.Println("quit")
        return
        }
    }
}

func main() {

    c := make(chan int)
    quit := make(chan int)

    go func() {
        for  i := 0; i<10; i++ {
            fmt.Println(<-c)
        }
        quit <- 0
    } ()
    fibonacci(c, quit)
}
```

```
// 运行结果
1
1
2
3
5
8
13
21
34
55
quit
```

#### 超时

```
package main

import (
    "time"
)

func main() {
    c := make(chan int)
    o := make(chan bool)

    go func() {
        for {
            select { // 通过select来设置超时
            case v := <- c:
            println(v)
            case <- time.After(5 * time.Second):
            println("timeout")
            o <- true
            break
            }
        }
    } ()
    <- o
}
```

```
// 运行结果
timeout
```
注：[篇附图](https://github.com/Yangchengfeng/HepburnBook/blob/master/Pic/Go/003.jpg)

- 本文章节主要参照[Build Web Application With Golang](https://github.com/astaxie/build-web-application-with-golang/)

## 附录

【一】[其他资源](https://github.com/KeKe-Li/book/tree/master/Go)


