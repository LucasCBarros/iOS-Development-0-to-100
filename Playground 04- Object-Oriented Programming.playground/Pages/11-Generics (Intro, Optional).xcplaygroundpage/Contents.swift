//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 8. Generics Into (Optional)

 Generics allow you to write **flexible, reusable functions and types** that work with any data type.

 ---

 ### Benefits
 - Avoid code duplication.
 - Keep type safety.
 - Build powerful abstractions.

 ---

 ### Real-world usage
 - Swift’s `Array`, `Dictionary` and `Set` are generic.
 - Reusable network or storage layers.
 - Strongly typed helpers like `Result<T, Error>`.
 */
/// The '<T>' between the method name and it's parameters is the syntax of Generics
// After that all 'T' will refer to that generic Type passed
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var x = "Rio"
var y = "Toronto"
swapValues(&x, &y)
print("x:", x, "y:", y)

var i = 10
var j = 20
swapValues(&i, &j)
print("i:", i, "j:", j)
/*:
 ### Mini Challenge
 1. Create a generic function `findFirst<T>` that takes an array of `T` and a condition, returning the first matching element.
 2. Test it with numbers and strings.
 */
//: [Next >](@next)
