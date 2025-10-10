//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 4. Inheritance

 Inheritance allows one class (**child**) to reuse and extend the functionality of another (**parent**).

 ---

 ### Benefits
 - Reuse common logic across classes.
 - Build hierarchies of related objects.

 ---

 ### Real-world usage
 - `UIViewController` subclasses in UIKit.
 - Vehicle classes like `Car`, `Truck`, `Motorcycle`.
 - Payment methods: `CreditCardPayment`, `PayPalPayment`.
 */
// Generic class
class Vehicle {
    var brand: String

    init(brand: String) {
        self.brand = brand
    }

    func drive() {
        print("The \(brand) is moving 🚙")
    }
}

class GasCar: Vehicle {
    var tankLevel: Int = 100

    func refuel() {
        tankLevel = 100
        print("\(brand) refuelled to 100% ⛽️")
    }
}

class ElectricCar: Vehicle {
    var batteryLevel: Int = 100

    func recharge() {
        batteryLevel = 100
        print("\(brand) recharged to 100% 🔋")
    }
}

let ferrari = GasCar(brand: "Ferrari")
ferrari.drive()
ferrari.refuel()

let tesla = ElectricCar(brand: "Tesla")
tesla.drive() // Exist in all classes that inherit from Vehicle
tesla.recharge()
//tesla.refuel() // Doesn't exist in Electric car
/*:
 ### Mini Challenge
 1. Create a `Person` class with `name` and `introduce()` method.
 2. Create a `Student` subclass that adds a `school` property.
 3. Override `introduce()` to include the school name.
 */
//: [Next >](@next)
