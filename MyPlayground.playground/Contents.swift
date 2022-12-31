import Cocoa

// Day 5

let score = 83

// Comparison operators
if score > 80 {
    print("Good job! 🥳")
}

let speed = 88
let percentage = 85

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
} else {
    print("You passed!")
}

let ourName = "Sophie"
let friendName = "Gus"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

let country = "USA"

if country == "Australia" {
    print("Howdy!")
}

let name = "Taylor Swift"

if name != "anonymous" {
    print("Welcome \(name)")
}

var username = "jensnikolaus"

if username.isEmpty {
    username = "anonymous"
}

print("Welcome, \(username)")

// How to check multiple conditions
//if a {
//    print("Code to run if a is true")
//} else if b {
//    print("Code to run if a is false but b is true")
//} else {
//    print("Code to run if both a and b are false")
//}

let temp = 25

//if temp > 20 {
//    if temp < 30 {
//        print("It's a nice day!")
//    }
//}

if temp > 20 && temp < 30 {
    print("It's a nice day!")
}

let userAge = 14
let hasParentalConsent = false

if userAge >= 18 || hasParentalConsent == true {
    print("You can buy the game!")
} else {
    print("You are not allowed to buy the game. Ask your parents for permission!")
}

enum TransportOption {
    case airplane, helicopter, bike, car, rollerskates
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bike {
    print("I hope there is a bike path.")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I am going to search for my rollerskates.")
}

// Switch statements
enum weatherOptions {
    case sun, rain, snow
}

let forecast = weatherOptions.rain

switch forecast {
case .sun:
    print("It should be a beautiful day!")
case .rain:
    print("Pack an umbrella.")
case .snow:
    print("School is cancelled.")
}

let place = "Fort Collins"

switch place {
case "Boulder":
    print("Beautiful trails here.")
case "Fort Collins":
    print("Welcome to FoCo! Have a cider.")
    // fallthrough: It will work its way down when using fallthrough
// If you put default first, it will always go to default first
default:
    print("Huh?")
}

let age = 18

// Ternary conditional operator: WTF (What, true, false)
let canVote = age >= 18 ? "Yes" : "No"

if age >= 18 {
    print("You're eligible to vote.")
} else {
    print("You are not eligible to vote.")
}

print(canVote)

let hour = 23

print(hour < 12 ? "It's before noon!" : "It's after noon.")

let names = ["Jane", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No crew here!" : "Hi, you \(names.count)"

print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
