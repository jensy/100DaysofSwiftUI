import Cocoa

// Day 15: Reviewing everything learned so far

let quote = "You cannot shake hands with a clenched fist."
let author = "Indira Gandhi"

// String interpolation
print("\(quote) – \(author)")

print(quote.hasPrefix("You"))
print(author.hasSuffix("gandhi"))

let id = Int.random(in: 1...1000)
print(id)

let dog: [String: Any] = [
    "name": "Sophie",
    "cuteness": 11
]

print(dog["cuteness", default: "Too cute!"])

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

let dayOff = Weekday.friday

switch dayOff {
case .friday:
    print("Let's start the weekend! ☀️")
default:
    print("It's a work day!")
}

var day = Weekday.monday
day = .friday

var albums: [String] = ["Red", "Fearless"]

// New array of strings
var clues = [String]()

let age = 13
let canVote = age >= 18 ? "Yes" : "Sorry, you can't vote"
print(canVote)

func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)")
    } else {
        print("Hiiiii!")
    }
}

greet("Jane")

// Closures
let team = ["Gloria", "Suzan", "Tiffany", "Tasha"]

//let onlyT = team.filter({ (name: String) -> Bool in
let onlyT = team.filter { name in
    name.hasPrefix("T")
}

// Alternative: let onlyT = team.filter { $0.hasPrefix("T") }

print(onlyT)

struct Game {
    var score = 0 {
        didSet {
            print("Set score to \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score += 10

struct BankAccount {
    private(set) var funds = 0
    
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

let account = BankAccount(funds: 100)
print(account.funds)
//account.funds += 1000 Not allowed due to setting var to private

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developers: Employee {
    func work() {
        print("I am coding for \(hours) hours a day.")
    }
    
    override func printSummary() {
        print("I spent hours and hours a day coding Swift.")
    }
}

let andrea = Developers(hours: 8)
andrea.work()
andrea.printSummary()

class Site {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("Site \(id): Created")
    }
    
    deinit {
        print("Site \(id): Destroyed")
    }
}

for i in 1...3 {
    let site = Site(id: i)
    print("Site \(site.id): I am in control!")
}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

let names = ["Sophie", "Gaius", "Stellah"]
//let names = [String]()
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")
