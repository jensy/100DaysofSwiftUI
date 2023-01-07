import Cocoa

// Day 10
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            // newValue is provided by Setter
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

struct Dog {
    var breed: String
    var cuteness: Int
    var rating: String {
        if cuteness < 3 {
            return "That's a cute dog!"
        } else if cuteness < 7 {
            return "That's a really cute dog!"
        } else {
            return "That a super cute dog!"
        }
    }
}
let luna = Dog(breed: "Samoyed", cuteness: 11)

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

struct Player {
    var name: String
    var number: Int
    
    // Custom initializer
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Sophie")
print(player)

// Day 11

struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var acc = BankAccount()
acc.deposit(amount: 500)

let success = acc.withdraw(amount: 200)

if success {
    print("Withdrew money successfully.")
} else {
    print("Not enough money in the account.")
}

struct AppData {
    static let version = "1.4 beta 3"
    static let saveFilename = "settings.json"
    static let homeURL = "https://google.com"
}

AppData.version

struct Painter {
    let username: String
    let password: String
    
    static let example = Painter(username: "jensnikolaus", password: "mygreatpw123")
}

Painter.example

// Checkpoint 6
// New Struct to store information about a car
// Model, number of seats, current gear
// Add a method to change gears up or down
// Have a think about variables and access control
// Don't allow invalid gears: 1...10

struct Car {
    let model: String
    private let seatNumber: Int
    private var currentGear = 5
    
    init(model: String) {
        self.model = model
        seatNumber = 4
    }
    
    mutating func downshift(gears: Int) -> Bool {
        if currentGear >= gears && currentGear - gears >= 1 {
            currentGear -= gears
            return true
        } else {
            print("Not enough gears!")
            return false
        }
    }
    
    mutating func gearUp(gears: Int) -> Bool {
        if currentGear + gears > 10 {
            print("Only got 10 gears, kiddo!")
            return false
        } else {
            currentGear += gears
            return true
        }
    }
}

var subaru = Car(model: "Forester")
print(subaru)
subaru.downshift(gears: 3)
print(subaru)
subaru.gearUp(gears: 6)
print(subaru)
subaru.downshift(gears: 9)
print(subaru)
subaru.gearUp(gears: 2)
print(subaru)
subaru.downshift(gears: 11)
print(subaru)
subaru.gearUp(gears: 2)
