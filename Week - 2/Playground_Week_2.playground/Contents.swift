import UIKit

//MARK: - Data Types and Operators
/***************************************************************/

var str = "Hello, playground"

2 * 2

str

print(str)

CGRect(x: 10, y: 10, width: 200, height: 150)

let correct = Int("123")
let incorrect = Int("Hello World")

print(type(of: correct))
print(type(of: incorrect))

var a: Int?
let b: Int = 5
var c: Int = 0

c = (a ?? b)

if a != nil {
    c = a!
} else {
    c = b
}

c = (a != nil) ? a! : b

var d = [1,2,3,4,5,6,7]

d = d.reversed()

for i in d {
    print(i)
}

//MARK: - Strings
/***************************************************************/

for _ in 1...10 {
    let stringWithIndent = """
        Hello
            everyone!
        """
    print(stringWithIndent)
}

for char in "Cat"{
    print(char)
}

let catCharacters: [Character] = ["C", "a", "t"]
let catString = String(catCharacters)

var string = "Hello world!"

let subString = string.suffix(5)

let stringFromSubString = String(subString)

//MARK: - Flow Control
/***************************************************************/


for _ in 1...3 {
    print("hello")
}

let char = "C"

switch char {
case "A" :
    print("seems like A")
case "B" :
    print("seems like B")
default:
    print("seems like something else")
}

let coordinate = (0,1)

switch  coordinate {
case (0,0):
    print("The beginning")
case (_,0):
    print("OY")
case (0,-10...10):
    print("OX, from -10 to 10")
default:
    print("somewhere else")
}

var value: Int?

var x: Int?

if x != nil {
    _ = x! + 5
}

if let nonOptionalX = x {
    _ = nonOptionalX + 5
}

x = 5

func something() {
    value = 5
    guard let x = value else {
        print("Value of x is nil")
        return
    }
}

something()
print("X = \(String(describing: x))")

var val = 4

switch val {
case 1...5:
    val *= 2
    fallthrough
case 6...10:
    val *= 2
    fallthrough
default:
    val *= 0
}

print(val)


//MARK: - Classes and Structures
/***************************************************************/

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    func someFunc() {
        print("Do nothing")
    }
}


var someResolution = Resolution()
let someVideoMode = VideoMode()

someResolution.width = 1280
let vga = Resolution(width: 640, height: 480)
print(vga)

//MARK: - Enumeration
/***************************************************************/

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum CompassPoint2 {
    case north, south, east, west
}

var directionToWest = CompassPoint.west
print(directionToWest)

enum ColorCode {
    case Color(UIColor)
    case RGB(Int, Int, Int)
    case name(String)
}

var webColor = ColorCode.RGB(0, 0, 128)
webColor = ColorCode.name("Navy")
print(webColor)

switch webColor {
    case let .Color(color):
        print("Color: \(color)")
    case .RGB(let red, let green, let blue):
        print("RGB: \(red),\(green),\(blue)")
    case let .name(colorName):
        print("Color is called \(colorName)")
}

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let earthsOrder = Planet.earth.rawValue

enum CompassPoint3: String {
    case north, sousth, east, west
}

let sunsetDirection = CompassPoint3.west.rawValue

let possiblePlanet = Planet(rawValue: 7)

let positionToFind = 11

if let somePlanet = Planet(rawValue: positionToFind) {
    print(somePlanet.rawValue)
} else {
    print("nil value")
}


enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}


//MARK: - Class vs Structure
/***************************************************************/

class DecimalNumber {
    var value = 0
}

var numberOne = DecimalNumber()
numberOne.value = 5
var numberTwo = DecimalNumber()
numberTwo.value = 3

numberTwo = numberOne

numberOne.value = 7
print(numberTwo.value)

if numberOne === numberTwo {
    print("tenEighty and alsoTenEighty refer to the same Decimal Number")
}

extension DecimalNumber {
    static func == (left: DecimalNumber, right: DecimalNumber) -> Bool {
        return !(left.value == right.value)
    }
    
    static func != (left: DecimalNumber, right: DecimalNumber) -> Bool {
        return !(left == right)
    }
}


//MARK: - Functions and Methods
/***************************************************************/

@discardableResult
func usefulFunc(firstParam: Int = 0, secondParam: String = "", thirdParam: String) -> (firstResult: Int, secondResult: String) {
    
    return (firstParam, secondParam)
}

usefulFunc(firstParam: 1, thirdParam: "Simple string")



func usefulFunc2(_ parameterWithoutArgumentName: Int, argumentName parameterName: String) {
    print("Received \(parameterWithoutArgumentName) and \(parameterName)")
}

usefulFunc2(20, argumentName: "String Argument")



func sum(_ numbers: Int...) -> Int {
    var result: Int = 0
    for number in numbers {
        result += number
    }
    
    return result
}

sum(1,2,3,4,5)

func swapInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var first = 1
var second = 2

swapInts(&first, &second)



func summation(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplication(_ a: Int, _ b: Int) -> Int {
    return a * b
}


type(of: summation)
type(of: multiplication)


var function: (Int, Int) -> Int = summation
function = multiplication

function(3,4)



func provideTransformator() -> (Int) -> Int {
    func squareTransformator(transform value: Int) -> Int {
        return value*value
    }
    
    return squareTransformator
    
}


func transform(_ value: Int, using transformator: (Int) -> Int) -> Int {
    return transformator(value)
}

let transformator = provideTransformator()
let result = transform(6, using: transformator)

class Counter {
    private var count = 0
    
    func  increment () {
        self.count += 1
    }
    
    func isGraterThan(_ count: Int) -> Bool {
        return self.count > count
    }
}

struct Point {
    var x = 0.0
    var y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    mutating func reset() {
        self = Point()
    }
    
    static func df() {
        
    }
}

var point = Point(x: 3, y: 4)
point.moveBy(x: 4, y: -2)

point.reset()

//MARK: - Subscripts
/***************************************************************/


class MyClass {
    class func generateText() -> String {
        return "MyClass"
    }
    
    class func printer1(){
        print("\(self.generateText())")
    }
    
    class func printer2(){
        print("\(MyClass.generateText())")
    }
    

    
}

class MySubClass: MyClass {
    override class func generateText() -> String {
        return "MySubClass"
    }
}

MySubClass.printer1()
MySubClass.printer2()


struct MyStruct {
    static var sharedValue = 0
    
    func increment() {
        type(of: self).sharedValue += 1
    }
}

let myStruct = MyStruct()

MyStruct.sharedValue

myStruct.increment()

MyStruct.sharedValue


let array = ["one", "two", "three"]
array[1] // "two"
string = "This is string"
let index = string.index(after: string.startIndex)
string[index] // "h"
let dictionary = [1 : "one",
                  2 : "two",
                  3 : "three"]

let item = dictionary[10] // nil

