import Cocoa

// Day 7

func showWelcome() {
    print("Hello there!")
}

showWelcome()

// Function with parameters number, end
func printTimesTable(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

// Function call with arguments number, end
printTimesTable(number: 5, end: 20)

let root = sqrt(169)

func rollDice(sides: Int) -> Int {
    return Int.random(in: 1...sides)
}

let result = rollDice(sides: 12)
print(result)

// Compare two strings, do they contain the same letters?
func compareWords(word1: String, word2: String) -> Bool {
//    let sortedWord1 = word1.sorted()
//    let sortedWord2 = word2.sorted()
    word1.sorted() == word2.sorted()
    
//    My original code
//    if sortedWord1 == sortedWord2 {
//        print("Yup, we use the same letters in \(word1) and \(word2)!")
//        return Bool(true)
//    } else {
//        print("Nope")
//        return Bool(false)
//    }
}

compareWords(word1: "tea", word2: "eat")
compareWords(word1: "smell", word2: "shell")

func pythagoras(a: Double, b: Double) -> Double {
//    let input = a * a + b * b
//    let root = sqrt(input)
//    return root
    
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

// Function returning a tuple
func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
    ("Taylor", "Swift")
}

// Converting tuple of two elements into two separate constants
let (firstName, lastName) = getUser()

//let firstName = user.firstName
//let lastName = user.lastName
print("Name: \(firstName) \(lastName)")

func hireEmployee(name: String) { }
func hireEmployee(location: String) { }
func hireEmployee(title: String) { }

let lyric = "I see a red door and I want to paint it black!"
//print(lyric.hasPrefix("I see"))

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO"
let isUppercaseResult = isUppercase(string)
print(isUppercaseResult)

// External and internal name for number
func printTimesTable2(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable2(for: 5)
