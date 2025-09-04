//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 2. Type Safety & Type Inference
---
 Swift is a **type-safe language**:
 - You can’t assign a value of the wrong type to a variable.
 - This prevents many bugs at compile time.
 ---
Swift also supports **type inference**:
 - It can figure out the type from the assigned value.
---
 ### Real-world usage:
 - Ensures that "10" (string) isn’t accidentally treated as 10 (number).
---
 ### Risks:
 - Overusing inference can sometimes make code less clear.\
   (e.g., `let x = 3.14` → is it a `Double` or `Float` ???)
 */

// MARK: Type safety
var numberOfProvinces: Int = 10
// numberOfProvinces = "ten" // ❌ error!

// MARK: Type inference
let country = "Canada" // inferred as String
let states = 26 // inferred as Int

/*:
 ---
 ## Type Casting in Swift

 ---

Type casting in Swift is mostly about two things:
- Converting between numeric and string types (e.g. Int → Double, String → Int)
- Checking or downcasting types in class hierarchies (e.g. Animal → Dog)
*/
// MARK: Type casting
let intNumber: Int = 123

// Explicit casting to Double
let doubleNumber: Double = Double(intNumber)  // 123.0

// Double to Int (⚠️ truncates! Does not round the number)
let newInt: Int = Int(3.99)  // 3

let stringNumber: String = String(intNumber) // "123"

// Optional because the string might not be valid
let convertedNumber = Int(stringNumber)   // Optional(123)

let invalidString = "abc"
let failedConversion = Int(invalidString) // nil because failed to cast
/*:
 ### 🍁🇧🇷 Mini Challenge
 Create:
 - An inferred integer for the number of provinces in Canada.
 - A string constant for the Canadian anthem.
 */
//: [Next >](@next)

/*:
 ## Advanced casting content

 ---

 ⚠️ This is more advanced content, circle back after going over Playground 03 ⚠️

 ---
 */
// MARK: Class Hierarchy Casting
class Animal {
    func speak() { print("Some sound") }
}

class Dog: Animal {
    func bark() { print("Woof!") }
}

let pet: Animal = Dog()

// Type check
if pet is Dog {
    print("This is a Dog")
}

// Safe downcasting
if let dog = pet as? Dog {
    dog.bark()  // Woof!
}

// Forced downcasting (unsafe)
let definitelyDog = pet as! Dog
definitelyDog.bark()

// MARK: Casting Between Protocols and Types
protocol Flyable { func fly() }
class Bird: Flyable {
    func fly() { print("Flap flap!") }
}

let animal: Any = Bird()

// Cast Any → Bird
if let bird = animal as? Bird {
    bird.fly()
}

// MARK: Casting to 'Any' and 'AnyObject
// 'Any' → any type (struct, class, enum, etc.)
// 'AnyObject' → only class instances

let mixedArray: [Any] = [1, "Hello", 3.14, true]

for item in mixedArray {
    switch item {
    case let intValue as Int:
        print("Integer: \(intValue)")
    case let stringValue as String:
        print("String: \(stringValue)")
    case let doubleValue as Double:
        print("Double: \(doubleValue)")
    case let boolValue as Bool:
        print("Bool: \(boolValue)")
    default:
        print("Unknown type")
    }
}
