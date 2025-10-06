//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 11. Extensions

 Extensions let you **add functionality** to existing types without subclassing.\
**Note:** You can't add properties in extensions, only methods

 ---

 ### Benefits
 - Organize code into logical groups.
 - Add features to built-in types (e.g., `String`, `Int`).
 - Keep related logic close to where it’s used.

 ---

 ### Real-world usage
 - Adding convenience initializers.
 - Extending `String` for validation (e.g., email check).
 - Adding helper functions for formatting dates or currency.
 */
// Example: Adding feature to built-in String type
extension String {
    var isEmail: Bool {
        return self.contains("@") && self.contains(".")
    }
}

print("LucasCavalcanteDeBarros@gmail.com".isEmail) // true
print("iOS Developer".isEmail) // false

extension Int {
    var squared: Int {
        return self * self
    }
}

print("5 squared is", 5.squared) // "5 squared is 25"
/*:
 ### Mini Challenge
 1. Add an extension to `Double` with a `toCurrency` property that formats it as CAD (e.g., `"$12.50"`).
 2. Add an extension to `Array` with a method `randomElementOrNil()` that safely returns an element or nil.
 */
//: [Next >](@next)
