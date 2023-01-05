import Cocoa

// Day 9: Closures

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Boop boop beep boop"
    }
}

let data: (Int) -> String = getUserData
let user = data(341)
print(user)

let team = ["Gloria", "Suzan", "Piper", "Tiffany", "Sophie"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzan" {
        return true
    } else if name2 == "Suzan" {
        return false
    }
    
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzan" {
        return true
    } else if name2 == "Suzan" {
        return false
    }
    
    return name1 < name2
}

print(captainFirstTeam)

// Shorthand syntax
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

// Checkpoint 5

// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format "7 is a lucky number"
// Print the resulting array, one item per line

var luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func filterOutLuckyNumbers(firstFilter: () -> Void, sortArray: () -> Void, mapToString: () -> Void) {
    firstFilter()
    sortArray()
    mapToString()
}

filterOutLuckyNumbers {
    luckyNumbers.removeAll(where: { $0.isMultiple(of: 2) })
} sortArray: {
    luckyNumbers = luckyNumbers.sorted { $0 < $1 }
} mapToString: {
    for number in luckyNumbers {
        print("\(number) is a lucky number")
    }
}
