//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 1. Object-Oriented Programming (OOP)

 OOP is the foundation of UIKit and older Apple frameworks. It uses **classes**, **objects** and **inheritance**.

 - **Encapsulation** → Group related data & behavior inside a class.
 - **Inheritance** → Reuse and extend behavior from parent classes.
 - **Polymorphism** → Different classes respond to the same method in different ways.
 */
// MARK: Example: Vehicles
class Vehicle {
    var name: String
    init(name: String) { self.name = name }

    func move() {
        print("\(name) is moving 🚗")
    }
}
class Car: Vehicle {
    var fuel: Int = 100
    override func move() {
        print("\(name) is driving on the road 🛣️")
    }
}
class ElectricCar: Car {
    var battery: Int = 100
    override func move() {
        print("\(name) is gliding silently ⚡️")
    }
}

let civic = Car(name: "Honda Civic")
civic.move()

let tesla = ElectricCar(name: "Tesla Model 3")
tesla.move()
/*:
 ## Risks of OOP
 - Deep inheritance chains → hard to maintain.
 - "Fragile base class" → changes in parent break children.
 - Encourages "god objects".

 That’s why Swift encourages **POP** for many scenarios.

 ---
 */
//: [Next >](@next)
