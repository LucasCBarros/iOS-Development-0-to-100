//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 4. Nil Coalescing (`??`)

 The **nil coalescing operator** (`??`) provides a **default value** when an optional is `nil`. This makes your code continue to running using the default value.

 Syntax:
 `optional ?? defaultValue`

 ### Real-world usage:
 - Show "Guest" if a username is not set.
 - Use "TBD" when a concert headliner isn’t announced.
 - Display "Closed" when a tourist attraction has no opening hours available.

 ### Benefits:
 - Cleaner and shorter than `if let` in many cases.
 - The *'if let'* or the *'guard let'* Binding can be used if you need to take an action if it's *nil* and the Coalescing is in case you just need to give it a default value.
 */
// Example
var username: String? = nil
let displayName = username ?? "Guest" // If not assigned any value to username it will just call the person "Guest" instead.
print("Welcome, \(displayName)!")

// Another example
var mainDish: String? = nil
let specialDish = mainDish ?? "To be determined"
print("Tonight’s special dish: \(specialDish) 🍽️")
/*:
 ### 🎭 Mini Challenge
 1. Create an optional String for your favorite Canadian festival.
 2. Use `??` to provide "halloween" as a default if *nil*.
 3. Print the result.
 */
//: [Next >](@next)
