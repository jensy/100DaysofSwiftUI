import Cocoa

// Day 12

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Inheritance
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day!")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I am a developer who sometimes works \(hours) hours a day!")
    }
}

// Nothing can inherit from this child class
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let jane = Manager(hours: 10)

robert.work()
jane.work()

let novall = Manager(hours: 6)
novall.printSummary()
robert.printSummary()

class Vehicle {
    var isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

class User {
    var username = "Anonymous"
    
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("I'm alive!")
    }
    
    deinit {
        print("I'm gone.")
    }
}

// Share common data in different parts of an app
var user1 = User(id: 341)
var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

// Checkpoint 7

// Hierarchy for animals: Animal class, legs property
// Make Dog subclass of Animal, speak method, each dog's bark is different
// Make Corgi and Poddle subclasses of Dog
// Make Cat subclass of Animal, with speak method and isTame Bool
// Make Persian and Lion subclasses of Cat

class Animal {
    let legs = 4
    
    init(legs: Int = 4) {
    }
}

class Dog: Animal {
    func speak() {
        print("Bark, bark, bark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bark, bark, I am a corgi.")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bark, I am a poodle, bark!")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    func speak() {
        print("Meow, meow, meow")
    }
    
    init(legs: Int = 4, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
        
        if isTame == true {
            print("Such a tame cat.")
        }
    }
}

class Persian: Cat {
    override func speak() {
        print("Meooooooooow…")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roarrrrrrr!!!")
    }
}

var sophie = Animal()

let gus = Dog()
gus.speak()

let mips = Cat(isTame: true)
mips.speak()

let lion = Lion(isTame: false)
lion.speak()

let sausage = Poodle()
sausage.speak()
