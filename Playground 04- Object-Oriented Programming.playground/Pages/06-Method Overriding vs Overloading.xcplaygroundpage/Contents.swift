//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 6. Method Overriding vs Overloading

 Swift supports:
- **overriding** (redefining methods in subclasses)
- **overloading** (multiple methods with the same name but different parameters).

 ---

 ### Method Overriding
 - Redefines a method from a superclass.
 - Requires `override` keyword.

 ### Method Overloading
 - Same method name, different parameter list.
 - No keyword required.

 ---

 ### Real-world usage
 - Overriding `viewDidLoad()` in UIKit.
 - Overloading `init` methods with different parameters.
 */
// MARK: - Overloading
class Printer {
    func printMessage() {
        print("Default message")
    }
}

class FancyPrinter: Printer {
    override func printMessage() {
        print("✨ Fancy message ✨")
    }
}

let printer = FancyPrinter()
printer.printMessage() // "✨ Fancy message ✨"

// MARK: - Overloading
class Calculator {
    // All methods have the EXACT same name, but different paremeters, so Swift infers which to use.
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    // ❌ You can 'Overload' by changing return but it will make it ambiguous
//    func add(_ a: Int, _ b: Int) -> Double {
//        return Double(a + b)
//    }
}

let calc = Calculator()
print("Int sum:", calc.add(2, 3))
print("Double sum:", calc.add(2.5, 3.7))
/*:
 ### Mini Challenge
 1. Create a `Shape` class with a `draw()` method.
 2. Override `draw()` in `Circle` and `Square`.
 3. Overload `draw()` in `Circle` to accept a color parameter.
 */
//: [Next >](@next)
