//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 10. Recursion

 **Recursion** happens when a function calls itself to solve a problem.

 ---

 ### Good for:
 - Breaking down problems into smaller subproblems.
 - Tree traversal (e.g., file system, family tree).
 - Math problems (factorial, Fibonacci).

 ---

 ### Risks
 - Infinite loops if no base case is provided.
 - Can be less efficient than loops in some cases.
 */

// Factorial
func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 } // Base case to break the loop
    return n * factorial(n - 1) // Calls itself
}
print("5! =", factorial(5))

// Fibonacci
func fibonacci(_ n: Int) -> Int {
    if n <= 1 { return n }
    return fibonacci(n-1) + fibonacci(n-2)
}
print("Fib(6) =", fibonacci(6))

/*:
 ### Mini Challenge
 1. Write a recursive function `countdown(from:)` that prints numbers down to 0.
 2. Write a recursive function `sumArray(_:)` that sums all elements of an array.
 */
//: [Next >](@next)
