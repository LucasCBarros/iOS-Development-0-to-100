//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 6. Functions Basics

 Functions are reusable blocks of code that perform a specific task.

 ### Syntax:
 func name(parameters) -> ReturnType {\
    // code or task instructions\
    return result\
 }

 ### Benefits
 - Avoid repetition (Used for DRY concept)
 - Clear structure
 - Easier to test
 */
//: ### Examples:

// 1) Function WITHOUT parameters AND no return value
func sayHello() {
    print("Hello!")
}
sayHello()

// We could also declare it like this: (But since Void is inferred, then we don't have to)
func sayHello2() -> Void {
    print("Hello 2!")
}
sayHello2()


// 2) Function WITH parameters AND return value
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    return (celsius * 9/5) + 32
}
print("18°C → \(celsiusToFahrenheit(18))°F")


// 3) Function WITH parameter WHERE the first has an External parameter label "for"
func ticketPrice(for event: String, base: Double, fee: Double) -> Double {
    base + fee // Since it's only one line we can hide the 'return' word in this case
}
let total = ticketPrice(for: "Live Show", base: 40, fee: 5) // Notice that here we use the external label for the first one and the internal label for the other ones.
print("Ticket total: \(total)")


// 4) Function WITH parameter WHERE the first has an Empty External parameter label indicated by '_'
func ticketPrice2(_ event: String, base: Double, fee: Double) -> Double {
    base + fee // Since it's only one line we can hide the 'return' word in this case
}
let total2 = ticketPrice2("Live Show", base: 40, fee: 5) // Notice that here we don't have to use any label for the first one and use the internal label for the other ones.
print("Ticket total: \(total2)")


// 5) Function WITH parameter WHERE all have an Empty External parameter label indicated by '_'
func ticketPrice3(_ event: String, _ base: Double, _ fee: Double) -> Double {
    base + fee // Since it's only one line we can hide the 'return' word in this case
}
let total3 = ticketPrice3("Live Show", 40, 5) // Notice that now we don't have to use any label at all, since they are declared in the correct order and type.
print("Ticket total: \(total3)")


// 6) Function WITH multiple steps
func welcomeMessage(name: String) -> String {
    var message = "Welcome, "
    message += "\(name)!"
    return message
}
print(welcomeMessage(name: "Marina"))
/*:
 ### Mini Challenge
 1. Write a function `sum(_:_:)` that returns the sum of two integers.
 2. Write `describeCity(name:country:)` that returns a single sentence.
 3. Call both and print the results.
 */
//: [Next >](@next)
