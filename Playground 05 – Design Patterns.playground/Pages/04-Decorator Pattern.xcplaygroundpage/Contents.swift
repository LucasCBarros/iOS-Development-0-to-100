//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 4. Decorator Pattern

 The **Decorator Pattern** allows you to **add functionality** to an object without modifying its original code.

 ---

 ### Benefits
 - Flexible alternative to subclassing.
 - Compose behaviors dynamically.

 ---

 ### Risks
 - Too many layers of decorators can become confusing.

 ---

 ### Real-world usage
 - Adding scroll, zoom, or pinch behaviors to a view.
 - Extending logging with different formats.
 - Wrapping network requests with retry logic.
 */
// Base protocol
protocol Coffee {
    func cost() -> Double
    func description() -> String
}

class SimpleCoffee: Coffee {
    func cost() -> Double { return 2.0 }
    func description() -> String { return "Plain Coffee" }
}

class MilkDecorator: Coffee {
    private let base: Coffee
    init(base: Coffee) { self.base = base }

    func cost() -> Double { return base.cost() + 0.5 }
    func description() -> String { return base.description() + " + Milk" }
}

class SugarDecorator: Coffee {
    private let base: Coffee
    init(base: Coffee) { self.base = base }

    func cost() -> Double { return base.cost() + 0.2 }
    func description() -> String { return base.description() + " + Sugar" }
}

var myCoffee: Coffee = SimpleCoffee()
myCoffee = MilkDecorator(base: myCoffee)
myCoffee = SugarDecorator(base: myCoffee)

print("\(myCoffee.description()) → $\(myCoffee.cost())")
/*:
 ### Mini Challenge
 1. Create a `Pizza` base class.
 2. Add `CheeseDecorator` and `PepperoniDecorator`.
 3. Show final description and cost after stacking decorators.
 */
//: [Next >](@next)
