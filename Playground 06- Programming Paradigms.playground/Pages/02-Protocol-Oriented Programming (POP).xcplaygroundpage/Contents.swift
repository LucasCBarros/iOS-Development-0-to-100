//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 2. Protocol-Oriented Programming (POP)

 Introduced at **WWDC 2015**, POP is Swift’s preferred paradigm.
 Instead of deep class hierarchies, you use **protocols + extensions** to compose behavior.

 - **Protocols** → Define requirements.
 - **Extensions** → Provide default implementations.
 - **Composition > Inheritance** → More flexible, avoids fragile base classes.
 */
// MARK: Example: Drivable
protocol Drivable {
    var speed: Int { get set }
    func drive()
}

extension Drivable {
    func drive() {
        print("Driving at \(speed) km/h 🚘")
    }
}

struct Bike: Drivable {
    var speed: Int
}

struct Skateboard: Drivable {
    var speed: Int
}

let bike = Bike(speed: 20)
bike.drive()

let skate = Skateboard(speed: 10)
skate.drive()

/*:
 ## Benefits of POP
 - Avoids inheritance problems.
 - Default implementations reduce boilerplate.
 - Encourages modular, reusable code.

 ---
 */
//: [Next >](@next)
