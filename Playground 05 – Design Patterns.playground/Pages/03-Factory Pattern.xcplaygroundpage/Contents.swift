//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 3. Factory Pattern

 The **Factory Pattern** provides a way to create objects **without exposing the creation logic** to the client.

 ---

 ### Benefits
 - Centralizes object creation.
 - Decouples client code from specific implementations.

 ---

 ### Risks
 - May add unnecessary complexity if used too much.

 ---

 ### Real-world usage
 - Creating different types of views in UIKit or SwiftUI.
 - Payment processing (Credit, PayPal, Crypto).
 - Shape creation in drawing apps.
 */
protocol Transport {
    func travel()
}

class Car: Transport {
    func travel() { print("🚗 Driving a car") }
}

class Bike: Transport {
    func travel() { print("🚲 Riding a bike") }
}

class TransportFactory {
    static func createTransport(type: String) -> Transport {
        switch type {
            case "car": return Car()
            case "bike": return Bike()
            default: fatalError("Unknown transport type")
        }
    }
}

let t1 = TransportFactory.createTransport(type: "car")
t1.travel()

let t2 = TransportFactory.createTransport(type: "bike")
t2.travel()
/*:
 ### Mini Challenge
 1. Create a `ShapeFactory` that can return `Circle`, `Square` or `Triangle`.
 2. Each should have a `draw()` method.
 3. Test the factory by creating different shapes dynamically.
 */
//: [Next >](@next)
