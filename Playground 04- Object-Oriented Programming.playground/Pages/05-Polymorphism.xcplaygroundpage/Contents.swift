//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 5. Polymorphism

 Polymorphism means **one interface, many implementations**.
 It allows objects of different types to be treated as the same type if they share a common superclass or protocol.

 ---

 ### Benefits
 - Write flexible, reusable code.
 - Extend functionality without rewriting.

 ---

 ### Real-world usage
 - Different payment methods (Credit, PayPal, Crypto).
 - Shapes with different `area()` calculations.
 - Animals with different `makeSound()` implementations.
 */
class Animal {
    func makeSound() {
        print("Some generic sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("🐶 Woof!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("🐱 Meow!")
    }
}

let animals: [Animal] = [Dog(), Cat()]
for animal in animals {
    animal.makeSound() // Different sounds, same interface
}

/*:
 ### Mini Challenge
 1. Create a `Shape` superclass with a method `area() -> Double`.
 2. Subclass `Circle` and `Rectangle` with their own area formulas.
 3. Store them in an array and print all areas.
 */
//: [Next >](@next)
