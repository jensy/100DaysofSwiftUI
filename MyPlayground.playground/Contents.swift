import Cocoa

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))
print(filename.hasSuffix(".gif"))

var isAuthenticated = false
// ! means "not", and flips between true and false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// String interpolation
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I am \(age+10) years old."

// Checkpoint 1: Celsius to Fahrenheit calculator
let degreesCelsius: Double = 18
let degreesFahrenheit: Double = (degreesCelsius*9)/5 + 32
print("It is \(degreesCelsius)°C today, that is \(degreesFahrenheit)° Fahrenheit.")

// Arrays, type-safety
var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 16, 32, 64, 128]
var temperatures = [25.3, 28.2, 16.8]

print(beatles[0])

beatles.append("Sophie")
beatles.append("Maddie")
beatles.append("Jens")

var scores = Array<Int>()
print(scores)
scores.append(100)
scores.append(50)
scores.append(260)
print(scores)

//var albums = Array<String>()
var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums)

albums.count

albums.remove(at: 2)
print(albums)

print(albums.contains("Red"))

albums.reversed()
// This does not really reverse the Array, but flags it, for performance reasons

// Dictionaries
var familyMember = [
    "name": "Sophie",
    "species": "dog",
    "location": "Fort Collins",
    "age": 3
] as [String : Any]

print(familyMember["name", default: "Unknown"])
print(familyMember["age", default: "Unknown"])

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 226
heights["LeBron James"] = 206
// Overwriting value for Shaquille O'Neal
heights["Shaquille O'Neal"] = 225

print(heights["LeBron James", default: 0])
print(heights["Shaquille O'Neal", default: 0])

// Sets
var actors = Set<String>([
    "Denzel Washington",
    "Tom Cruise",
    "Nicolas Cage",
    "Samuel L Jackson"
])

print(actors)
actors.insert("Prince")
print(actors)

//actors.insert("Prince")
// Sets do not allow duplicates

actors.contains("Prince")
// Sets provide fast lookup of items

// Enums
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
//day = Weekday.sunday

// Type annotation
let surname: String = "Nikolaus"
var score: Double = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.141
var isLoggedIn: Bool = true

// All those do the same thing
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
print(style)
style = .dark

let username: String
// Lots of code
username = "@jensnikolaus"
// More complicated code
print(username)

// Checkpoint 2: Create an array of strings, write code to print the number of items in the array, and also the number of unique items in the array

let fruit = [
    "banana",
    "mango",
    "apple",
    "cherry",
    "mango",
    "watermelon"
]
print(fruit)
print(fruit.count)
let fruitBasket = Set(fruit)
print(fruitBasket)
print(fruitBasket.count)
