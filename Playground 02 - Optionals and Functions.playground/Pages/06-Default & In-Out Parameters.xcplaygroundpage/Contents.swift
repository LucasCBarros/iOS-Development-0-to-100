//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 7. Function Parameters: Default & In-Out

 Swift functions can use **default values** for parameters to always have a valid value
 and **in-out parameters** when a function needs to modify the caller’s value (passed as reference).

 ---

 ### Default Parameters
 Provide a default value when the caller doesn’t supply one.

 ---

 ### Benefits
 - Defaults make functions shorter to call.
 */
//: ### Examples

// Function with Default value for parameter
func orderCoffee(type: String = "Espresso") {
    print("☕ Serving a \(type)")
}
// If not passed a value it will just use the default one
orderCoffee() // prints "Espresso"
// Otherwise it will use the passed value
orderCoffee(type: "Latte") // prints "Latte"
/*:
 ### In-Out Parameters
 Marked with `inout`. Remember to pass the variable with `&`.\
 Note that changes inside the function will affect the original variable!

 ---

 ### Benefits
 - In-out enables modifying variables in place.

 ### Risks
 - Overuse of `inout` makes functions harder to reason about.
 */
//: ### Examples

// Function with In-out parameter (Passed parameter as reference)
func addTip(to bill: inout Double, percent: Double) {
    bill += bill * percent / 100
}
var dinnerBill = 100.0
addTip(to: &dinnerBill, percent: 15) // Note you have to add '&' before the variable
print("Final bill: \(dinnerBill)") // The variable was changed outside the scope of the function
/*:
 ### Mini Challenge
 1. Write a function `greetUser(name: String = "Guest")` that prints `"Hello, <name>!"`. Use this function with and without a parameter.
 2. Write a function `applyDiscount(price: inout Double, percent: Double)` and test it with a variable.
 */
//: [Next >](@next)
