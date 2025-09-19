//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 9. Closures Basics

 A **closure** is a block of code you can store and pass around.\
 Think of them like **inline, anonymous functions**.
- Note: In this page we will use `filter` and `map`, but don't worry about them since we will dive deeper into them a couple pages ahead.

 ---

 ### Syntax
 { (parameters) -> ReturnType in\
 // code\
 }

 ---
 Swift allows **trailing closures** when the closure is the final parameter.
 - Note that this makes the code cleaner, but may affect readability, so use with caution.
 */
typealias operation = (Int, Int) -> Int
let add = { (a: Int, b: Int) -> Int in
    return a + b
}
print("3 + 4 =", add(3,4))

// Notice that the last parameter asks for a function type (closure), so it will allow a trailing closure.
func mathOperation(a: Int, b: Int, with operation: (Int, Int) -> Int) -> Int {
    return operation(a, b)
}

/// This means that instead of using this syntax
// When we call the function we use the "with" label before the closure, notice that it's inside the "( )" brackets.
let mathResult = mathOperation(a: 2, b: 3, with: { a, b in
    add(a,b)
})
print(mathResult)

/// We can use this other cleaner syntax
// OR since the closure is the last parameter we can omit the label and call it outside the function parameters.
let sameMathResult = mathOperation(a: 2, b: 3) { a, b in
    add(a,b)
}
print(sameMathResult)
/*
 ---

 ### Real-world usage
 - Sorting names alphabetically.
 - Filtering a playlist by genre.
 - Mapping a list of numbers into strings.
 */

// Explicit closure
let multiply = { (a: Int, b: Int) -> Int in
    print("Multiply closure")
    return a * b
}
print("3 × 4 =", multiply(3,4))

// It's equivalent of declaring it as a function
func multiply(_ a: Int, _ b: Int) -> Int {
    print("Multiply Function")
    return a * b
}
print("3 × 4 === ", multiply(3, 4))

///  Note: Be careful when declaring a function and a closure with the same exact name, they don't conflict because one is a variable and the other is a function, however this creates a "Shadowing" effect where the second declared will never be called. So you can solve it by: 1. Name them differently, 2. Change their scopes.

// Trailing closure with sorted
let cities = ["Toronto", "São Paulo", "Vancouver"]
// Note: Here we use "$0" and "$1" notations to use swift's shorthand argument names for closures
let sortedCities = cities.sorted { $0 < $1 }
print("Sorted with shorthand:", sortedCities)

// Here we did the exact same thing using long closure notation
let sameSortedCities = cities.sorted { (first: String, second: String) -> Bool in
    return first < second
}
print("Sorted with regular syntax:", sameSortedCities)

// Compact closure
let numbers = [1,2,3,4]
let doubled = numbers.map { $0 * 2 } // Shorthand notation
let sameDoubled = numbers.map { (number: Int) -> Int in // Regular notation
    return number * 2
}
print("Doubled:", doubled)

/*:
 ### Mini Challenge
 1. Create and use a `filter` closure to keep only even numbers from `[1,2,3,4,5,6]`. (Note: Using regular notation)
 2. Create and use a `ModifyName` closure to turn a list of artists into `"🎵 <artist>"`. (Note: Using shorthand notation)
 */
//: [Next >](@next)

