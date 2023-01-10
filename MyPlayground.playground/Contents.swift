import Cocoa

// Day 13

// Blueprint
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func travel(distance: Int) {
        print("I am driving \(distance)km.")
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func openSunroof() {
        print("It's a nice day.")
    }
}

struct Bike: Vehicle {
    let name = "Bike"
    var currentPassengers = 1
    
    func travel(distance: Int) {
        print("I am cycling \(distance) km.")
    }
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print ("\(vehicle.name): \(estimate) hours to travel \(distance)km.")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bike()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)

// Opaque return types
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

// Extensions
var quote = "   I like chocolate  ."
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)

extension String {
    // Returning a value: -ed
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // Change current value, eg. sort()
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

quote.trimmed()
quote.trim()

let lyrics = """
Whitespace is the general term of the space character, the tab character, and a variety of other variants on those two. New lines are line breaks in text, which might sound simple but in practice of course there is no single one way of making them, so when we ask to trim new lines it will automatically take care of all the variants for us.

For example, here’s a string that has whitespace on either side:
"""
print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let myBookTitle = Book(title: "Title", pageCount: 259, readingHours: 8)

// Protocol extensions, protocol oriented programming
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Daisy"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I am \(name)!")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
// Create protocol Building
// Add rooms: Int, cost: Int, agentName: String
// Method that prints summary of the agent selling the building
// Two structs: House and Office

protocol Building {
    var rooms: Int { get }
    var cost: Int { get }
    var agentName: String { get }
    
    func printSummary()
}

struct House: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSummary() {
        print("The house has got \(rooms) rooms and costs $\(cost). Call \(agentName) to set up a tour.")
    }
}

struct Office: Building {
    var rooms: Int
    var cost: Int
    var agentName: String
    
    func printSummary() {
        print("The office has got \(rooms) rooms and costs $\(cost). Call \(agentName) to set up a tour.")
    }
}

let house = House(rooms: 4, cost: 250_000, agentName: "Roger Rabit")
house.printSummary()

let office = Office(rooms: 2, cost: 320_000, agentName: "Dori")
office.printSummary()
