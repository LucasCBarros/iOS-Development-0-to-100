//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 8. Functions as Types & Typealias

 Functions in Swift are **first-class citizens**.
 That means you can:
 - Assign them to variables (as a *Type*)
 - Pass them as parameters
 - Return them from other functions

 Use `typealias` to give complex function types a friendly name.

 ---

 ### Real-world examples
 - Pass a sorting function to `sorted(by:)`.
 - Pass a filter function to a recommendation system.
 - Store a scoring function for a game.
 */
// 1) Function as a variable
func shout(text: String) -> String { text.uppercased() } // Regular function declaration
let action: (String) -> String = shout // "action" is the same as "shout"
print(action("Dance!")) // Calling "action" is the same as calling "shout", with same parameters (but doesn't need to declare the variable name)


// 2) Function as parameter
func perform(_ operation: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result:", operation(a, b))
}
func add(a: Int, b: Int) -> Int { a + b }
perform(add, 5, 3)   // 8
perform(*, 4, 2)   // 8


// 3) Typealias for readability
typealias MathOperation = (Int, Int) -> Int // Function as Type
func apply(_ a: Int, _ b: Int, using operation: MathOperation) -> Int {
    operation(a, b)
}
let sum = apply(10, 20, using: add)
print("Sum:", sum)

// Same as declaring as:
func applySame(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
    operation(a, b)
}
let sumSame = applySame(10, 20, using: +)
print("Sum:", sumSame)
/*:
 ### Mini Challenge
 1. Define `typealias StringTransformer = (String) -> String`.
 2. Write two transformers: one that reverses text and one that adds `" 🇨🇦"` to the end and use the typealias in the function declaration.
 3. Assign them to variables and call them.
 */
//: [Next >](@next)
