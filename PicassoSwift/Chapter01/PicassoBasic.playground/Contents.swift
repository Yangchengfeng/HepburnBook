import UIKit

// ---------- *** 01.变量&常量 *** ----------

var a = 12
var b = 12.2
var c = "wonderful"
var fireIsHot = true

var me = ("chengfengyang", "chengfnegyang@123.com", 1111111) // inference
me.0
me.1
me.2

var d: String // annotation
var e: Int

var PI = 3.14
PI = 3.1415

let minutes = 30
let fireNotHot = true

// ---------- *** 02.整数&浮点数 *** ----------

let fifteenInDecimal = 15
let fifteenInHex = 0xF
let fifteenInOctal = 0o17
let fifteenInBinary = 0b1111

let million = 1_000_000

var oneThirdInFloat: Float = 1/3
var oneThirdInDouble: Double = 1/3

var PI_ = 314e-2

var three = 3
type(of: three)

var zeroPoint = 0.14
type(of: zeroPoint)

PI_ = 3 + 0.14
type(of: PI_)

PI_ = Double(three) + zeroPoint

// ---------- *** 03.使用Tuple打包数据 *** ----------
let succes = (200, "HTTP OK")
succes.0
succes.1

let (successCode, successMessage) = succes
successCode
successMessage

let fileNotFound = (404, "File not found")
let (_, failMessage) = fileNotFound
failMessage

let redirect: (Int, String) = (302, "Temporary redirect")

let tuple1 = (1, 2)
let tuple2 = (2, 3)
tuple1 < tuple2 // ❗️less than 6 numbers

// ---------- *** 04.快速过一遍常用操作符 *** ----------

let userInput: String? = "A user Input"
userInput ?? "A default Input"

for idx in 1..<3 {
    print(idx)
}

// ---------- *** 05.Collections:和Array相关的基础知识 *** ----------

// create

var arr1: Array<Int> = Array<Int>()
var arr2: [Int] = []
var arr3 = arr2

// initialization

var threeInts = [Int](repeating: 3, count: 3)
var sixInts = threeInts + threeInts
var fiveInts = [1, 2, 3, 4, 5]

// common attributes
fiveInts.count
arr1.isEmpty

// access elements
fiveInts[2]
Array(fiveInts[0 ... 2]) // ArraySlice -> storage ptr / beg idx : 0 / end idx : 3
for value in fiveInts {
    print(value)
}
for (index, value) in fiveInts.enumerated() {
    print("\(index): \(value)")
}
fiveInts.forEach {
    print($0)
}

// modification
arr1.append(1)
arr2 += [2, 3, 4]
arr1.insert(0, at: arr1.startIndex)
arr2.remove(at: 2)
arr1.removeLast()

// ---------- *** 06.Collections:理解NSArray和Array的差异 *** ----------

var arr4 = [1, 2, 3]
let copyA = arr4 // copy on write

func getBufferAddress<T>(arr: [T]) -> String {
    return arr.withUnsafeBufferPointer {
        return String(describing: $0)
    }
}

getBufferAddress(arr: arr4)  // "UnsafeBufferPointer(start: 0x0000600000dd0c20, count: 3)"
getBufferAddress(arr: copyA) // "UnsafeBufferPointer(start: 0x0000600000dd0c20, count: 3)"

arr4.append(4)
getBufferAddress(arr: arr4)  // "UnsafeBufferPointer(start: 0x0000600002696550, count: 4)"
getBufferAddress(arr: copyA) // "UnsafeBufferPointer(start: 0x0000600000dd0c20, count: 3)"

// NSArray & NSMutableArray perform reference semantics
let arr5 = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = arr5
let deepCopyB = arr5.copy() as! NSArray

arr5.insert(0, at: 0)
copyB     // [0, 1, 2, 3]
deepCopyB // [1, 2, 3]

// ---------- *** 07.Collections:用Swift的方式使用Array *** ----------

let oneIndex = arr1.index { $0 == 0}
oneIndex

print(arr1.filter { $0 % 2 == 0})

var arrA: [Int] = [1]

type(of: arrA.first)        // Optional<Int>.Type
type(of: arrA.last)         // Optional<Int>.Type
type(of: arrA.removeLast()) // Int.Type
type(of: arrA.min())        // Optional<Int>.Type
type(of: arrA.max())        // Optional<Int>.Type

// ---------- *** 08.Collections:通过closure参数化对数组元素的变形操作 *** ----------

var fibonacci = [0, 1, 1, 2, 3, 5]
var squares = [Int]()
for value in fibonacci {
    squares.append(value * value)
}
let constSquare = fibonacci.map{ $0 * $0 }
constSquare
fibonacci.filter { $0 % 2 == 0 }
fibonacci.elementsEqual([0, 1, 2], by: { $0 == $1 })
fibonacci.starts(with: [0, 1, 1], by: { $0 == $1 })
fibonacci.forEach { print($0) }
fibonacci.sorted(by: >)
let pivot = fibonacci.partition(by: {$0 < 1})
fibonacci
pivot

fibonacci.reduce(0, +) // { $0 + $1 }

// ---------- *** 09.Collections:Filter/Reduce/FlatMap的实现和扩展 *** ----------

var myFibonacci = [0, 1, 1, 2, 3, 5]
print(myFibonacci.filter { $0 % 2 == 0 }) // [0, 2]

let animals = ["🐂", "🐑", "🐷", "🐩", "🐼"]
let ids = [1, 2, 3, 4]
print(animals.flatMap { animal in
    return ids.map { id in (animal, id)}
})

extension Array {
    func myFilter(_ predicate: (Element) -> Bool) -> [Element] {
        var tmp: [Element] = []
        for value in self where predicate(value) {
            tmp.append(value)
        }
        return tmp
    }
    
    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }
    }
    
    func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !contains{ !predicate($0) }
    }
    
    func myReduce<T>(_ initial: T, _ next: (T, Element) -> T) -> T {
        var tmp = initial
        
        for value in self {
            tmp = next(tmp, value)
        }
        
        return tmp
    }
    
    func myFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var tmp: [T] = []
        for value in self {
            tmp.append(contentsOf: transform(value))
        }
        return tmp
    }
}
print(fibonacci.myFilter { $0 % 2 == 0 }) // [2, 0]
print(fibonacci.reject { $0 % 2 == 0 })   // [5, 1, 1, 3]

fibonacci.myReduce(0, +)
fibonacci.myReduce("") { $0 + "\($1)"}

print(animals.myFlatMap { animal in
    return ids.map { id in (animal, id)}
})

[2, 4, 6, 8].allMatch { $0 % 2 == 0 }

// ---------- *** 10.Collections:和Dictionary相关的基础知识 *** ----------

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let record: [String: RecordType] = [
    "uid": .number(11),
    "exp": .number(100),
    "fav": .bool(false),
    "title": .text("Dict basics")
]

record["uid"]
record["exp"]
record["fav"]
record["title"]

type(of: record["invalid"]) // Optional<__lldb_expr_8.recordType>.Type

record.count
record.isEmpty
// record.keys.forEach { print($0) }
// record.values

var record0 = record
record0["fav"] = .bool(true) // bool(true)
record["fav"]                // bool(false)
record0.updateValue(.bool(false), forKey: "fav")
record0["watchLater"] = .bool(false)

for (k, v) in record0 {
    print("\(k): \(v)")
}
record0.forEach { print("\($0): \($1)") }


// ---------- *** 10.Collections:常用的Dictionary extension *** ----------

let defaultRecord: [String: RecordType] = [
    "uid": .number(11),
    "exp": .number(100),
    "fav": .bool(true),
    "title": .text("")
]

var template = defaultRecord
let recordPatch: [String: RecordType] = [
    "uid": .number(11),
    "title": .text("Common dict")
]

extension Dictionary {
    mutating func merge<S: Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value: Value) {
            sequence.forEach { self[$0] = $1 }
    }
    
    init<S: Sequence>(_ sequence: S)
         where S.Iterator.Element == (key: Key, value: Value) {
            self = [:]
            self.merge(sequence)
    }
    func mapValue<T>(_ transform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(map { ($0, transform($1))})
    }
}

let recordPathDict = Dictionary(recordPatch) // init
print(recordPathDict)
print(recordPathDict.map { $1 })

template.merge(recordPatch)
print(template)

let record1 = recordPathDict.mapValue { record -> String in
    switch record {
    case .text(let title):
        return title
    case .number(let exp):
        return String(exp)
    case .bool(let fav):
        return String(fav)
    }
}
record1

// ---------- *** 11.Collections:为自定义类型实现Hashable Key *** ----------

struct Account {
    var type: Int
    var alias: String
    var createdAt: Date
}

//extension Account: Hashable {
//}
//
//extension Account: Equatable {
//}

// ---------- *** 12.Collections:和Set相关的基础知识 *** ----------

var vowel: Set<Character> = ["a", "e", "i", "o", "u"]
vowel.count
vowel.isEmpty

vowel.contains("a")
type(of: vowel.remove("a")) // Optional<Character>.Type
vowel.insert("a")

for charater in vowel.sorted() {
    print(charater)
}
vowel.forEach { print($0) }

// ---------- *** 13.Collections:常用的Set方法 *** ----------

var setA: Set = [1, 2, 3, 4, 5, 6]
var setB: Set = [4, 5, 6, 7, 8, 9]

let interSectAB = setA.intersection(setB)
let unionAB = setA.union(setB)
let symmetricDiffAB = setA.symmetricDifference(setB)
let aSubtractB = setA.subtracting(setB)

type(of: interSectAB)

extension Sequence where Iterator.Element : Hashable {
    func unique() -> [Iterator.Element] {
        var tmp: Set<Iterator.Element> = []
        return filter {
            if tmp.contains($0) {
                return false
            } else {
                tmp.insert($0)
                return true
            }
        }
    }
}
[1, 1, 1, 2, 2, 3, 4, 4].unique()

let oneToSix: IndexSet = [1, 2, 3, 4, 5, 6] // IndexSet 1 ... 6 &&&& Set<Int> 1, 2, 3, 4, 5, 6
let hw = "Hello world!"
let num = CharacterSet(charactersIn: "123456789")

let letters = CharacterSet.letters
hw.rangeOfCharacter(from: letters)

// ---------- *** 14.Collections:理解Range和Collections的关系 *** ----------

for i in stride(from: 1.0, to: 5.0, by: 1.0) {
    print(i)
}

// ---------- *** 15.为代码的执行做个决定：几乎所有的语言都有的条件o判断和循环 *** ----------

var light = "red"
var action = ""

// if ... else if ... else
if light == "red" {
    action = "stop"
} else if light == "yellow" {
    action = "caution"
} else if light == "green" {
    action = "run"
} else {
    action = "invalid"
}

// if ... else ...

switch light {
    case "red":
        action = "stop"
    case "yellow":
        action = "caution"
    case "green":
        action = "run"
    // No break here
    default:
        // action = "invalid"
        break
}

// for ... in
for num in 1 ... 10 {
    if(num % 2 != 0) { continue }
    if(num > 8) { break }
    print(num)
}

// while
var i = 0
while i < 10 {
    i += 1
    print(i)
}

repeat {
    print(i)
    i -= 1
} while i > 0

// ---------- *** 16.为代码的执行做个决定：使用简单的样式匹配 *** ----------

let origin = (x: 0, y: 0)
let pt1 = (x: 0, y: 0)

if pt1.x == origin.x && pt1.y == origin.y {
    print("pt1 at origin")
}

if case (0, 0) = pt1 {
    print("@origin")
}

switch pt1 {
    case (0, 0):
        print("@origin")
    case (_, 0):
        print("on x axis")
    case (0, _):
        print("on y axis")
    case (-1 ... 1, -1 ... 1):
        print("inside 1*1 square")
    default:
        break
}

let arrB = [1, 1, 2, 2 ,2]
for case 2 in arrB {
    print("Found two")
}

// binding value

let pt2 = (x: 10, y: 0)
switch pt2 {
    case (let x, 0):
        print("(\(x), 0) is on x axis")
    default:
        break
}

enum Direction {
    case north, south, east, west(abbr: String)
}
let west = Direction.west(abbr: "W")
if case .west(let direction) = west {
    print(direction)
}

let skills: [String?] = ["Swift", nil, "PHP", "JavaScript", nil]
for case let skill? in skills {
    print(skill)
}

let someValues: [Any] = [1, 1.0, "One"]
for value in someValues {
    switch value {
    case let v as Int:
        print("Integer: \(v)")
    case let v as Double:
        print("Double: \(v)")
    case is String:
        print("String")
    default:
        print("Invalid value")
    }
}

// ---------- *** 17.为代码的执行做个决定：使用高级样式匹配方式 *** ----------

for i in 1 ... 10 where i % 2 == 0 {
    print(i)
}

enum Power {
    case fullyCharged, outOfPower
    case normal(percentage: Double)
}

let battery = Power.normal(percentage: 0.1)

switch battery {
    case .normal(let percentage) where percentage <= 0.1 :
        print("Almost out of power")
    case .normal(let percentage) where percentage >= 0.8 :
        print("Almost fully charged")
    case .fullyCharged, .outOfPower: // ❗️
        print("fully charged or out of power")
    default:
        print("Normal battery status")
}

if case .normal(let percentage) = battery, case 0 ... 0.1 = percentage { // Range ~= Value 可通过样式匹配调整顺序
    print("Almost out of power")
}

let uname = "chengfengyang"
let email = "chengfengyang.io"

if uname == "chengfengyang" && email == "chengfengyang.io" {}
if case ("chengfengyang", "chengfengyang.io") = (uname, email) {
    print("Correct")
}

func ~=<T>(value: T, pattern: ClosedRange<T>) -> Bool {
    return pattern.contains(value)
}

if case .normal(let percentage) = battery, case percentage = 0 ... 0.1 { 
    print("Almost out of power")
}

// ---------- *** 18.使用func和closure加工数据：函数的返回值以及灵活多变的参数 *** ----------

func mul(_ m: Int, of n: Int = 1) { // 有默认值必须在没有默认值右边 external &&& internal
    print(m * n)
}
mul(2)

func multi(_ num: Int ... )  {
    print(num.reduce(1, *))
}
multi(2, 3, 4, 5)

// 获取返回值

func multiNum(result: inout Int, _ num: Int ...) {
    result = num.reduce(1, *)
    print(num.reduce(1, *))
}
var result = 0;
multiNum(result: &result, 2, 3, 4, 5)
print(result)

func multiNum1(_ num: Int ...) -> Int {
    return num.reduce(1, *)
}
print(multiNum1(2, 3, 4, 5))

// ---------- *** 18.使用func和closure加工数据：被绝大多数人误会了的inout参数 *** ----------

// 只有左值才能当做inout来使用
func incremental(_ i: inout Int) {
    return i += 1
}

var incrementalI = 0
incremental(&incrementalI)

prefix func ++(i: inout Int) -> Int {
    i += 1
    return i
}
print(++incrementalI)

func incrementByReference(_ pointer: UnsafeMutablePointer<Int>) { // like (int *) in C language
    pointer.pointee += 1
}
var numI = 0
incrementByReference(&numI)

// ---------- *** 19.使用func和closure加工数据：函数和Closure真的是不同的类型么？ *** ----------

// Closure expression

let squareExpression = { (n: Int) -> Int in
    return n * n
}
squareExpression(2)

let nums = [1, 2, 3, 4]
nums.map(squareExpression)
nums.map { $0 * $0 }

(0 ... 9).map { _ in arc4random() }

func makeCounter() -> () -> Int {
    var value = 0
    return {
        value += 1
        return value
    }
}

let counter1 = makeCounter()
let counter2 = makeCounter()

print(counter1()) // 1
print(counter1()) // 2
print(counter1()) // 3

print(counter2()) // 1
print(counter2()) // 2
print(counter2()) // 3

// ---------- *** 20.理解引用语义的自定义类型：差异于语法之外的struct和class *** ----------

// 引用类型&值类型
struct PointValue {
    var x: Int
    var y: Int
}

class PointRef {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

let p1 = PointRef(x: 0, y: 1)
let p2 = PointValue(x: 0, y: 1)

p1.x = 10
// p2.x = 1

// ---------- *** 20.理解引用语义的自定义类型：理解class类型的各种init方法 *** ----------

//class Point2D {
//    var x: Double = 0
//    var y: Double = 0
//}

class Point2D {
    var x: Double
    var y: Double
    
    init(x: Double = 0, y: Double = 0) { // designated init
        self.x = x
        self.y = y
    }
    
    init?(xy: Double) {
        guard xy > 0 else {
            return nil
        }
        
        self.x = xy
        self.y = xy
    }
    
    convenience init(at: (Double, Double)) { // convenience init
        self.init(x: at.0, y: at.1)
    }
    
    convenience init?(at: (String, String)) { // Failable init
        guard let x = Double(at.0), let y = Double(at.1) else {
            return nil
        }
        
        self.init(at: (x, y))
    }
}

let point1 = Point2D(x: 1, y: 1)
let point2 = Point2D(at: (2, 2))

// ---------- *** 20.理解引用语义的自定义类型：什么是two-phase initialization *** ----------

class Point3D: Point2D {
    var z: Double = 0
}

let origin3D = Point3D()
let point3 = Point3D(x: 1, y: 1)
let point4 = Point3D(xy: 2)
let point5 = Point3D(at: ("3", "3"))

















