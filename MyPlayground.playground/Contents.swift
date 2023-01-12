import Cocoa

// Day 14
// Unwrapping optionals

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
//number = 12

// Temporarily creating a second constant with the same name, it is only available inside condition body, shadowing
if let number = number {
    square(number: number)
} else {
    print("No, number here")
}

// Guard
func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

printSquare(of: 4)

let fruit = [
    "apple": "red",
    "orange": "orange",
    "lemon": "yellow"
]

let yummyFruit = fruit["lime"] ?? "No fruit available."

let lightsaberColor: String? = "green"
let color = lightsaberColor ?? "blue"

// Optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

// Function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

// Checkpoint 9
// Function that accepts an optional array of integers, and returns one of those integers
// If the array is missing or empty, return a new random number in the range of 1 through 100
// Write your function in a single line of code

func returnNumber(_ numbers: [Int]) -> Int { return numbers.randomElement() ?? Int.random(in: 1...100) }

returnNumber([])
returnNumber([5,9,19,39,105])
