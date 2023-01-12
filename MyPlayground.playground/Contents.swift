import Cocoa

// Day 14

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
