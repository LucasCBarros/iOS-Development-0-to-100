//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
//: # 🧼 Pure Functions
//:
//: ---
//: A **pure function** is a function where the output depends only on the input values,
//: and it has **no side effects** (it doesn’t modify external state).
//:
//: ---
//: ### Benefits of Pure Functions:
//: - **Predictable:** Same input → same output, every time.
//: - **Testable:** Easy to verify correctness since no hidden dependencies.
//: - **Composable:** Work great with higher-order functions like `map`, `filter`, `reduce`.
//: ---
//: ### Rules of Purity:
//: 1. No external state modification.
//: 2. No reliance on external mutable data.
//: 3. No side effects (like printing, saving, mutating outside variables).
// MARK: ✅ Pure Function Example
func add(a: Int, b: Int) -> Int {
    return a + b
}
add(a: 3, b: 5) // Always returns 8, no matter what

// MARK: 🚫 Impure Function Example
var counter = 0

@MainActor
func increaseCounter() -> Int {
    counter += 1 // Modifies external state → impure
    return counter
}
increaseCounter() // Returns different results depending on external state

// MARK: Pure Functions in Practice
let numbers = [1, 2, 3, 4, 5]

// Double each number → predictable and pure
let doubled = numbers.map { $0 * 2 }

// Filter even numbers
let evens = numbers.filter { $0 % 2 == 0 }

// Reduce to sum
let sum = numbers.reduce(0, +)
/*:
🏕 Example: Imagine you’re planning a hike in **Whistler, Canada**.\
If you use a pure function to calculate the distance based only on two coordinates,
you’ll always get the same answer for the same inputs, with no surprises!
*/
//: ---
//: [Next >](@next)
