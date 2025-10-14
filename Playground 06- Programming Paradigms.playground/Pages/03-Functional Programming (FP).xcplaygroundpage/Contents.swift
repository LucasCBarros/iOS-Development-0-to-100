//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 3. Functional Programming (FP)

 Swift supports many **functional programming** concepts:

 - **Immutability** → Use `let` for values that don’t change.
 - **Pure functions** → Output depends only on input, no side effects.
 - **Higher-order functions** → Functions like `map`, `filter`, `reduce`.
 */
// MARK: Example: Transforming data
let cities = ["Toronto", "Vancouver", "São Paulo", "Rio de Janeiro"]

// Filter cities starting with "S"
let filtered = cities.filter { $0.hasPrefix("S") }
print(filtered) // ["São Paulo"]

// Map to uppercase
let uppercased = cities.map { $0.uppercased() }
print(uppercased)

// Reduce to count total characters
let totalChars = cities.reduce(0) { $0 + $1.count }
print(totalChars)
/*:
 ## Benefits of FP
 - Safer (fewer side effects).
 - More testable and predictable.
 - Concise and expressive.

 ⚠️ Risk: overuse can reduce readability for beginners.

 ---
*/
//: [Next >](@next)
