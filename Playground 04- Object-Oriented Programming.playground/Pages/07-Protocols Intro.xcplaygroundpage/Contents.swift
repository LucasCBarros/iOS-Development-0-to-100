//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 7. Protocols (Intro)

 A **protocol** defines a blueprint of methods and properties.\
 Classes, structs and enums can **adopt** protocols.

 ---

 ### Benefits
 - Promotes code reuse.
 - Enables polymorphism without inheritance. (No Overriding methods)
 - Encourages cleaner, modular design.

 ---

 ### Real-world usage
 - `UITableViewDataSource` and `UITableViewDelegate` in UIKit.
 - Defining APIs that multiple types must conform to.
 - Networking abstractions (e.g., `DataFetcher`).
 */
protocol Vehicle {
    var brand: String { get }
    func drive()
}

class Bike: Vehicle {
    var brand: String
    init(brand: String) { self.brand = brand }

    func drive() {
        print("🚲 Riding a \(brand)")
    }
}

class Bus: Vehicle {
    var brand: String
    init(brand: String) { self.brand = brand }

    func drive() {
        print("🚌 Driving a \(brand)")
    }
}

let transport: [Vehicle] = [Bike(brand: "Trek"), Bus(brand: "Mercedes")]
for vehicle in transport { vehicle.drive() }
/*:
 ### Mini Challenge
 1. Create a `Playable` protocol with a `play()` method.
 2. Make `Song` and `Podcast` classes conform to it.
 3. Store them in an array of `Playable` and call `play()`.
 */
//: [Next >](@next)
