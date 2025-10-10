//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 1. Classes and Objects

 A **class** is a blueprint for creating objects.\
 An **object** is an instance of a class.

 ---

 ### Key Differences from Structs
 - **Reference type** (shared in memory).
 - Can use **inheritance**.
 - Support **deinitializers**.

 ---

 ### Real-world usage
 - A `Car` class in a transportation app.
 - A `User` class in a social network.
 - A `ViewController` in an iOS app.
 */
// This is a 'Class' Car, so it's the blueprint of what how a car object has
class Car {
    var brand: String
    var year: Int

    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }

    func honk() {
        print("🚗 Beep beep! I'm a \(brand) from \(year)")
    }
}

// Instantiating a car creates the object, initializing it with its property values
let car1 = Car(brand: "Honda", year: 2022)
car1.honk()
/*:
 ### Mini Challenge
 1. Create a `Dog` class with `name` and `breed`.
 2. Add a method `bark()` that prints `"Woof! I'm <name>"`.
 3. Create two instances and call `bark()`.
 */
//: [Next >](@next)
