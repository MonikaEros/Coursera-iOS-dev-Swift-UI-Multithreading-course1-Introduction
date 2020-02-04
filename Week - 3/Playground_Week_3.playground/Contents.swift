import UIKit

//MARK: - Closure
/***************************************************************/

func counterFunc() -> (Int) -> String {
    var counter = 0
    
    func innerFunc(i: Int) -> String {
        counter += i // counter захвачен в замыкании
        return "running total: \(counter)"
    }
    
    return innerFunc
}

let closureFromFunc = counterFunc()

print("\(closureFromFunc(3))") // running total: 3
print("\(closureFromFunc(3))") // running total: 6
print("\(closureFromFunc(3))") // running total: 9


//MARK: - Closure expression
/***************************************************************/

let multiplier = 3

func transform(_ value: Int, using transformator: (Int) -> Int) -> Int {
    return transformator(value)
}

let anonymousClosure = {
    (anotherItemInArray: Int) -> Int in
    return anotherItemInArray * multiplier
}

transform(6, using: anonymousClosure) // 18

transform(6, using: { (anotherItemInArray: Int) -> Int in
    return anotherItemInArray * multiplier } )

transform(6, using: { anotherItemInArray in
    return anotherItemInArray * multiplier } )

transform(6, using: { anotherItemInArray in anotherItemInArray * multiplier } )

transform(6, using: { $0 * multiplier } )

transform(6) { $0 * multiplier }


let anotherCounter = counterFunc()
print("\(anotherCounter(3))") // running total: 3
print("\(closureFromFunc(3))") // running total: 12

var a = 0
var b = 0
let closure = {
    [newNameForA = a] in
    print(newNameForA, b)
}
a = 10
b = 10
closure() // 0 10

let secondReferenceToAnotherCounter = anotherCounter
print("\(secondReferenceToAnotherCounter(3))") // running total: 6
print("\(secondReferenceToAnotherCounter(3))") // running total: 9
print("\(anotherCounter(3))") // running total: 12


//MARK: - Closure with an attribute
/***************************************************************/

class ClosureRunner {
    private var closure: () -> Void

    init(closure: @escaping () -> Void) {

        self.closure = closure
    }

    func runClosure() {
        closure()
    }
}

let closureRunner = ClosureRunner() {

    print("Closure runned")
}

closureRunner.runClosure() // Closure runned

//MARK: - Autoclosure
/***************************************************************/
let someVar = false
let someVar2 = 26

func and(_ lhs: Bool, _ rhs: @autoclosure () -> Bool) -> Bool {
    guard lhs else {
        return false
    }
    
    return rhs()
}

and(someVar,  someVar2 % 2 == 0) // false

//MARK: - Defining Operators
/***************************************************************/

struct RGBColor {
    var red = 0.0
    var green = 0.0
    var blue = 0.0
}

extension RGBColor {
    static func + (left: RGBColor, right: RGBColor) ->
        RGBColor {
            return RGBColor(red: left.red + right.red, green:
            left.green + right.green, blue: left.blue + right.blue)
        }
}

let blue = RGBColor(red: 0.0, green: 0.0, blue: 1.0)
let red = RGBColor(red: 1.0, green: 0.0, blue: 0.0)
let purple = blue + red

print(purple.red, purple.green, purple.blue)
// 1.0 0.0 1.0

//MARK: - Operators with Protocol inheritance
/***************************************************************/

extension RGBColor: Equatable {
    static func == (left: RGBColor,
    right: RGBColor) -> Bool {
        return left.red == right.red &&
               left.green == right.green &&
               left.blue == right.blue
     }
}

let new_blue = RGBColor(red: 0.0, green: 0.0, blue: 1.0)
let new_secondBlue = RGBColor(red: 0.0, green: 0.0, blue: 1.0)
let new_red = RGBColor(red: 1.0, green: 0.0, blue: 0.0)
print(new_blue == new_secondBlue ? "equal" : "not equal")
// equal
print(new_blue == new_red ? "equal" : "not equal")
// not equal

//MARK: - Defining Own Operators
/***************************************************************/

infix operator **: MultiplicationPrecedence

extension Double {
    static func ** (left: Double, right: Double) ->
    Double {
        return pow(left, right)
    }
}

print(5 ** 5)
// 3125.0


//MARK: - Precedence Group
/***************************************************************/

precedencegroup PowerPrecedence {
    higherThan : AdditionPrecedence
    lowerThan : MultiplicationPrecedence
    associativity : right
}


//MARK: - Properties
/***************************************************************/

struct SimpleStruct {
    var firstValue: Int = 1
    let secondValue: Int
}

var simpleStruct = SimpleStruct(firstValue: 0, secondValue: 2)
simpleStruct.firstValue = 6
let constantStruct = SimpleStruct(firstValue: 0, secondValue: 2)
// constantStruct.firstValue = 3 // Error: change 'let' to 'var' to make it mutable



class DataStore {
    var counter = 0
}

class DataManager {
    lazy var dataStore = DataStore()
}

let dataManager = DataManager()
dataManager.dataStore.counter = 1
dataManager.dataStore.counter = 2


//MARK: - Get/Set
/***************************************************************/


class AnotherDataStore {
    var counter: Int {
        get {
            return numbers.reduce(0, +)
        }
        set(newCounter) {
            numbers = []
            for index in 0...newCounter {
                numbers.append(index)
            }
        }
    }
    var numbers = [Int]()
}

var anotherDataStore = AnotherDataStore()

anotherDataStore.counter = 5
print(anotherDataStore.counter)


//MARK: - Observing properties
/***************************************************************/


class ExplicitCounter {
    var total: Int = 0 {
        willSet(newTotal) {
            print("Скоро установится новое значение \(newTotal)")
        }
//      willSet {
//          print("Скоро установится новое значение \(newValue)")
//      }
        didSet {
            if total > oldValue {
                print("Значение изменилось на: \(total - oldValue)")
            } else {
                print("Значение изменилось на: \(oldValue - total)")
            }
        }
    }
}

let explicitCounter = ExplicitCounter()
explicitCounter.total = 5
explicitCounter.total = 9
explicitCounter.total = 3


struct SomeStruct {
    static var storedTypeProperty = 1
    static var squareOfProperty: Int {
        return storedTypeProperty * storedTypeProperty
    }
}

class SomeClass {
    static var storedTypeProperty = 2
    
    static var squareOfProperty: Int {
        return storedTypeProperty * storedTypeProperty
    }
    
    static var overridableHalfOfProperty: Int {
        get {
            return storedTypeProperty * storedTypeProperty
        }
        set {
            storedTypeProperty = newValue / 2
        }
    }
}

print (SomeStruct.storedTypeProperty)

SomeClass.overridableHalfOfProperty = 10

print(SomeClass.squareOfProperty)
print(anotherDataStore.counter)


//MARK: - Protocols
/***************************************************************/

protocol MyProtocolWithProperties {
    var settableProperty: Int { set get }
    var gettableProperty: Double { get }
}

struct MyStructWithProperties: MyProtocolWithProperties {
    var settableProperty: Int {
        set {
            }
        get {
            return 5
        }
    }
    
    var gettableProperty: Double
}

//MARK: - Protocols for Properies
/***************************************************************/


protocol MyProtocolWithTypeProperty {
    static var typeProperty: Int { get }
}

protocol MyProtocolWithMethods {
    mutating func instanceMethod(parameter: Int)
    static func typeMethod() -> Double
}

struct MyStructWithPropertiesAndMethods: MyProtocolWithProperties, MyProtocolWithMethods {
    var settableProperty: Int
    var gettableProperty: Double
    
    mutating func instanceMethod(parameter: Int) {
        gettableProperty = Double(parameter)
    }
    
    static func typeMethod() -> Double {
        return 4.0
    }
}

//MARK: - Protocols with Init
/***************************************************************/


protocol MyProtocolWithInit {
    init(paramenter: Int)
}

class MyClassWithInit: MyProtocolWithInit {
    let someConst: Int
    
    required init(paramenter: Int) {
        someConst = paramenter
    }
}

var someObject: MyProtocolWithProperties = MyStructWithProperties(gettableProperty: 5.0)
someObject.settableProperty
someObject = MyStructWithPropertiesAndMethods(settableProperty: 1,
gettableProperty: 2.0)
someObject.settableProperty


//MARK: - Delegates
/***************************************************************/

protocol StringProcessorDelegate {
    var concatenateSeparator: String { get }
    func transform(_ string: String) -> String
}

class StringProcessor {
    var delegate: StringProcessorDelegate?
    
    func process(_ strings: [String]) -> String {
        guard strings.count > 0, let delegate = delegate else {
            return ""
        }
    
        var temp = [String]()
    
        for string in strings {
    
            let t = delegate.transform(string)
    
            temp.append(t)
    
        }
    
        return temp.joined(separator: delegate.concatenateSeparator)
    }
}

class UpperCaseStringProcessorDelegate: StringProcessorDelegate {
    var concatenateSeparator: String {
        return " "
    }
    
    func transform(_ string: String) -> String {
        return string.uppercased()
    }
}

class FirstLetterStringProcessorDelegate: StringProcessorDelegate {
    var concatenateSeparator: String {
        return ""
    }

    func transform(_ string: String) -> String {
        guard let firstCharacter = string.first else {
            return ""
        }
        
        return String(firstCharacter)
    }
}

var processor = StringProcessor()
let upperCaseDelegate = UpperCaseStringProcessorDelegate()
let firstLetterDelegate = FirstLetterStringProcessorDelegate()
let testArray = ["This", "is", "simple", "test", "strings"]

processor.process(testArray) // ""

processor.delegate = upperCaseDelegate
processor.process(testArray) // "THIS IS SIMPLE TEST STRINGS"

processor.delegate = firstLetterDelegate
processor.process(testArray) // "Tists"

var arrayOfDelegates = [StringProcessorDelegate]()

arrayOfDelegates.append(upperCaseDelegate)
arrayOfDelegates.append(firstLetterDelegate)

for delegate in arrayOfDelegates {
    delegate.concatenateSeparator
}

let compoundObject: MyProtocolWithProperties & MyProtocolWithMethods
compoundObject = MyStructWithPropertiesAndMethods(settableProperty: 1, gettableProperty: 2.0)


//MARK: - Existential Types
/***************************************************************/

let compoundClassObject: UIView & MyProtocolWithProperties


let arrayOfAny: [Any] = [4, firstLetterDelegate, "String"]

for object in arrayOfAny {
    if let processorDelegate = object as? StringProcessorDelegate {
        processor.delegate = processorDelegate
        processor.process(testArray) // "Tists"
    }
}


//MARK: - Objective-C Protocols
/***************************************************************/

@objc protocol ObjCProtocol {
    @objc optional func optionalFunc() -> Int
    
    func normalSwiftRequiredFunc()
}

@objc class MyObjcExposedClass: NSObject, ObjCProtocol {
    func normalSwiftRequiredFunc() {
    }
}

let objcClass: ObjCProtocol = MyObjcExposedClass()
let res = objcClass.optionalFunc?()
res // nil
