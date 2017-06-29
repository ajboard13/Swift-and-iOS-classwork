//Chapter5 Classes and Structures

class Door {
    // attributes
    var opened : Bool = false
    var locked : Bool = false
    let width : Int = 32
    let height : Int = 72
    let weight : Int = 10
    let color : String = "Red"
    
    func open() -> String{
        opened = true
        return "C-r-r-e-e-e-a-k-k-k... the door is open!"
    }
    
    func close() -> String{
        opened = false
        return "C-r-r-e-e-e-a-k-k-k... the door is closed!"
    }
    
    func lock() -> String{
        locked = true
        return "C-l-i-c-k... the door is locked!"
    }
    
    func unlock() -> String{
        locked = false
        return "C-l-i-c-k... the door is unlocked!"
    }
}


let frontDoor = Door()

frontDoor.open()
frontDoor.close()

frontDoor.lock()
frontDoor.unlock()

let backDoor = Door()

backDoor.close()
backDoor.open()


class newDoor{
    var opened : Bool = false
    var locked : Bool = false
    let width : Int
    let height : Int
    var weight : Int
    var color : String
    
    //constructor/ initializer when we create object
    init(width: Int = 32, height : Int = 72, weight : Int = 10, color : String = "red") {
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
    }
    
    func open() -> String{
        if opened == false{
        opened = true
        return "C-r-r-e-e-e-a-k-k-k... the door is open!"
        }
        else{
            return "The door is already open!"
        }
    }
    
    func close() -> String{
        if opened == false{
            return "The door is already closed!"
        }else {
            opened = false
            return "C-r-r-e-e-e-a-k-k-k... the door is closed!"
        }
    }
    
    func lock() -> String{
        if opened == false{
            locked = true
            return "C-l-i-c-k... the door is locked!"
        }else {
            return "You can not lock an opened door!"
        }
    }
    
    func unlock() -> String{
        if locked == false{
            return "The door is already unlocked"
        }else{
        return "C-l-i-c-k... the door is unlocked!"
        }
    }
}

let FrontDoor_1 = newDoor()

let newFrontDoor = newDoor(width: 50, height: 80, weight: 15, color: "blue")


newFrontDoor.color
newFrontDoor.color = "white"
newFrontDoor.color
newFrontDoor.close()
newFrontDoor.open()
newFrontDoor.lock()
newFrontDoor.unlock()

newFrontDoor.locked
newFrontDoor.opened
newFrontDoor.width
newFrontDoor.height
newFrontDoor.weight

newFrontDoor.weight = 103

// ============== portal class ================
class Portal{
    var opened : Bool = false
    var locked : Bool = false
    let width : Int
    let height : Int
    let name : String
    var weight : Int
    var color : String
    
    //constructor/ initializer when we create object
    init(name : String, width: Int = 32, height : Int = 72, weight : Int = 10, color : String = "red") {
        self.width = width
        self.height = height
        self.weight = weight
        self.color = color
        self.name = name //add this
    }
    
    func open() -> String{
        if opened == false{
            opened = true
            return "C-r-r-e-e-e-a-k-k-k... the \(name) is open!"
        }
        else{
            return "The \(name) is already open!"
        }
    }
    
    func close() -> String{
        if opened == false{
            return "The \(name) is already closed!"
        }else {
            opened = false
            return "C-r-r-e-e-e-a-k-k-k... the \(name) is closed!"
        }
    }
    
    func lock() -> String{
        if opened == false{
            locked = true
            return "C-l-i-c-k... the \(name) is locked!"
        }else {
            return "You can not lock an opened \(name)!"
        }
    }
    
    func unlock() -> String{
        if locked == false{
            return "The \(name) is already unlocked"
        }else{
            return "C-l-i-c-k... the \(name) is unlocked!"
        }
    }
}

class niceDoor : Portal {
    init(width : Int = 32, height : Int = 72, weight : Int = 10, color : String = "Red") {
        //calling the super class constructor
        super.init(name: "door", width: width, height: height, weight: weight, color: color)
    }
}

class niceWindow : Portal {
    init(width : Int = 48, height : Int = 48, weight : Int = 5, color : String = "Blue") {
        //calling the super class constructor
        super.init(name: "window", width: width, height: height, weight: weight, color: color)
    }
}


let sunRoomDoor = niceDoor()

sunRoomDoor.close()
sunRoomDoor.open()
sunRoomDoor.lock()
sunRoomDoor.unlock()

let bayWindow = niceWindow()
bayWindow.close()
bayWindow.open()
bayWindow.color
bayWindow.weight
bayWindow.height
bayWindow.width
bayWindow.name

class CombinationDoor : niceDoor{
    var combinationCode : String?
    
    override func lock() -> String {
        return "this method is not valid for a combination door."
    }
    override func unlock() -> String {
        return "this method is not valid for a combination door."
    }
    
    func lock(combinationCode : String) -> String{
        if opened == false{
            if locked == true{
                return "The \(name) is already locked"
            }
            self.combinationCode = combinationCode
            locked = true
            return "C-l-i-c-k... the \(name) is locked!"
        }else {
            return "You can not lock an opened \(name)!"
        }
    }
    
    func unlock(combinationCode : String) -> String{
        if opened == false {
            if locked == false {
                return "The \(name) is already unlocked"
            }
            else {
                if self.combinationCode != combinationCode{
                    return "Wrong code... the \(name) is still locked"
                }
            }
            locked = false
            return "Click... the \(name) is unlocked"
        }
        else{
            return "You cannot unlock an opened \(name)"
        }
    }
}

let securityDoor = CombinationDoor()
securityDoor.combinationCode
securityDoor.unlock()
securityDoor.lock()
securityDoor.lock(combinationCode: "6809")
securityDoor.unlock(combinationCode: "1234")
securityDoor.unlock(combinationCode: "6809")


class Tractor {
    let horsePower : Int
    let color : String
    
    init(horsePower : Int, color : String) {
        self.color = color
        self.horsePower = horsePower
    }
    
    //convenience inits
    // only hores power known
    convenience init(horsePower : Int){
        self.init(horsePower: horsePower, color: "Green")
    }
     // nothing known
    convenience init(){
        self.init(horsePower: 42, color: "Green")
    }
    
}

let myBigTractor = Tractor()
let myBiggerTractor = Tractor(horsePower: 99)
let myYardTractor = Tractor(horsePower: 100, color: "Blue")



enum fuelType : String {
    case Gasoline = "89 Octane"
    case Diesel = "sulpher free"
    case bioDiesel = " vegetable oil"
    case electric = "30 amps"
    case naturalGas = "coalbed methane"
}

var engine : fuelType = .electric
var vehicleName : String
switch engine {
case .Gasoline:
     vehicleName = "Ford F150"
case .Diesel:
     vehicleName = "Ford F250"
case .bioDiesel:
    vehicleName = "Custom Van"
case .electric:
    vehicleName = "Toyota Prius"
case .naturalGas:
    vehicleName = "Utility Truck"
}

print("Vehicle \(vehicleName) takes \(engine.rawValue)")




// ================Structures==================




enum transmissionType{
    case manual4gear
    case manual5gear
    case automatic
}

struct vehicle {
    var fuel : fuelType
    var transmission : transmissionType
}

var dieselAutomatic = vehicle(fuel: .Diesel, transmission: .automatic)

var gasoline4speed = vehicle(fuel: .Gasoline, transmission: .manual4gear)

struct Structure {
    var copyVaribale : Int = 10
}

var Struct1 = Structure()
var struct2 = Struct1
struct2.copyVaribale = 20


//only changed for the 2nd structure
Struct1.copyVaribale
struct2.copyVaribale


class Class {
    var copyVar : Int = 10
}

var class1 = Class()
var class2 = class1



//changed all of the pointer references
class2.copyVar = 90
class1.copyVar
class2.copyVar

struct Triangle {
    var base : Double
    var height : Double
    func area() -> Double {
        return (0.5 * base) * height
    }
}

var myTriangle = Triangle(base: 3.0, height: 4.0)

print(myTriangle.area())


















