import Cocoa

// Day 8

// Specifying default values
func printTimesTable(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 6)

var characters = ["Michael", "Pam", "Kelly", "Dwight"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// Errors in functions
enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password!")
} catch PasswordError.obvious {
    print("Too obvious!")
} catch {
    print("There was an error: \(error.localizedDescription)")
}

// Checkpoint 4

enum inputNumber: Error {
    case tooLow, tooHigh, noRoot
}

func findSquareRoot(_ number: Int = 144) throws -> Int {
    if number < 1 {
        throw inputNumber.tooLow
    } else if number > 10000 {
        throw inputNumber.tooHigh
    }
    
    var result = 0
   
    for i in 1...100 {
        if i * i == number {
        result = i
        print("The square root is: \(result)")
        return result
        }
    }
    
    if result == 0 {
        throw inputNumber.noRoot
    }
}

do {
    let squareRootResult = try findSquareRoot(144)
} catch inputNumber.tooLow {
    print("The number is smaller than 1, sorry.")
} catch inputNumber.tooHigh {
    print("The number is too high to process.")
} catch inputNumber.noRoot {
    print("I don't have a root for you today, sorry.")
}
