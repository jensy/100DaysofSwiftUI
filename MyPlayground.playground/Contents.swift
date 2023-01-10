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
