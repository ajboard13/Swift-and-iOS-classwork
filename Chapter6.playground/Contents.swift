// Chapter 6 Protocols and Extensions (and more!)

protocol LockUnlockProtocol{
    func lock() -> String
    func Unlock() -> String
}


class House : LockUnlockProtocol {
    func lock() -> String {
            return "Click"
    }
    func Unlock() -> String{
            return "Clack"
        }
}



class Vehicle : LockUnlockProtocol {
    func lock() -> String {
        return "Beep Beep!"
    }
    
    func Unlock() -> String {
        return "Beep!"
    }
}

let myHouse = House()
myHouse.lock()
myHouse.Unlock()

let myCar = Vehicle()
myCar.lock()
myCar.Unlock()

protocol NewLockUnockProtocol{
    var locked: Bool{get set}
    func lock() -> String
    func Unlock() -> String
}

class Safe : NewLockUnockProtocol{
    var locked: Bool = false
    
    func lock() -> String {
        locked = true
        return "Ding!"
    }
    func Unlock() -> String {
        locked = false
        return "Dong"
    }
}

class Gate : NewLockUnockProtocol{
    var locked: Bool = false
    
    func lock() -> String {
        locked = true
        return "clink!"
    }
    func Unlock() -> String {
        locked = false
        return "clonk"
    }
}


let mySafe = Safe()
mySafe.lock()
mySafe.Unlock()

let myGate = Gate()
myGate.lock()
myGate.Unlock()

protocol AreaComputationProtocol {
    func computeArea() -> Double
}

protocol PerimeterComputationProtocol {
    func computePerimeter() -> Double
}
struct Rectangle : AreaComputationProtocol,PerimeterComputationProtocol {
    var width, height : Double
    func computeArea() -> Double {
        return width * height
    }
    func computePerimeter() -> Double {
        return width*2 + height*2
    }
}


var square = Rectangle(width: 3, height: 4)
var rectangle = Rectangle(width: 4, height: 6)

square.computeArea()
square.computePerimeter()

rectangle.computeArea()
rectangle.computePerimeter()

protocol TriangleProtocol : AreaComputationProtocol, PerimeterComputationProtocol{
    var a : Double{get set}
    var b : Double{get set}
    var c : Double{get set}
    var base : Double{get set}
    var height : Double{get set}
}

struct Triangle : TriangleProtocol{
    var a, b, c, base, height: Double
    func computeArea() -> Double {
        return (base * height)/2
    }
    func computePerimeter() -> Double {
        return a + b + c
    }
}

var triangle1 = Triangle(a: 4, b: 5, c: 6, base: 12, height: 10)

triangle1.computePerimeter()
triangle1.computeArea()


protocol vendingMachineProtocol{
    var coinInserted : Bool { get set }
    func shouldVend() -> Bool
}

class Vendor : vendingMachineProtocol {
    var coinInserted = false
    func shouldVend() -> Bool {
        if coinInserted == true {
            coinInserted = false
            return true
        }
        return false
    }
}


class colaMachine {
    var vendor : vendingMachineProtocol
    
    init (vendor : vendingMachineProtocol){
        self.vendor = vendor
    }
    
    
    func insertACoin(){
        vendor.coinInserted = true
    }
    
    func pressColaButton() -> String {
        if vendor.shouldVend() == true {
            return "Here's your cola."
        }else {
            return "You must insert a coin."
        }
    }
    func pressRootBeerButton() -> String {
        if vendor.shouldVend() == true {
            return "Here's your root beer."
        }else {
            return "You must insert a coin."
        }
    }
}


var vendingMachine = colaMachine(vendor: Vendor())

vendingMachine.pressColaButton()
vendingMachine.insertACoin()
vendingMachine.pressRootBeerButton()
vendingMachine.pressColaButton()
vendingMachine.insertACoin()





extension colaMachine {
    func pressDietColaButton() -> String {
        if vendor.shouldVend() == true {
            return "Here's your diet cola!"
        } else {
            return "you must insert a coin."
        }
    }
}

vendingMachine.insertACoin()
vendingMachine.pressDietColaButton()

extension Int {
    var kb : Int { return self * 1024}
    var mb : Int {return self * 1024 * 1024}
    var gb : Int {return self * 1024 * 1024 * 1024}
}

var x : Int = 4.kb
var y : Int = 8.mb
var z : Int = 2.gb

print(Int.max)
Int.min

extension Double {
    var F : Double { return self}
    var C : Double {return (((self-32)*5.0)/9.0)}
    var K : Double {return (((self - 32) * 1.8) + 273.15)}
}

var tempF = 80.4.F
var tempC = tempF.C
var tempK = tempF.K


extension String {
    func prependString(value : String) -> String {
        return value + self
    }
    func appendString(value : String) -> String {
        return self + value
    }
}


"x".prependString(value: "prefix-")
"y".appendString(value: "-postfix")


extension Int {
    mutating func triple() {
        self = self * 3
    }
}


var trip = 3
trip.triple()


extension String {
    mutating func decorate() {
        self = "*****" + self + "*****"
    }
}

var testString = "Decorate this"

testString.decorate()
testString.decorate()
testString.decorate()


extension Int {
    func repeater(work : () -> String) {
        for _ in 0..<self {
            work()
        }
    }
}


5.repeater(work: {return "repeat this string"})








