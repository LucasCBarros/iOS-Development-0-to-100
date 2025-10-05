//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 9. Getters & Setters

 Computed properties can also have **getters and setters**.
 - `get` → defines how to retrieve a value.
 - `set` → defines how to assign a new value.

 ---

 ### Benefits
 - Encapsulation: control how properties are read/written.
 - Add logic to updates (e.g., validation, formatting).

 ---

 ### Real-world usage
 - Storing prices in cents but exposing them in dollars.
 - Validating that a username isn’t empty.
 - Converting between metric and imperial units.
 */

struct Temperature {
    var celsius: Double

    var fahrenheit: Double {
        get {
            return (celsius * 9/5) + 32
        }
        set {
            celsius = (newValue - 32) * 5/9
        }
    }
}

var temp = Temperature(celsius: 20)
print("Celsius:", temp.celsius,
      "→ Fahrenheit:", temp.fahrenheit) // Will call the GET from "fahrenheit"

temp.fahrenheit = 98.6 // Will call the SET  from "fahrenheit"
print("Updated Celsius:", temp.celsius)
/*:
 ### Mini Challenge
 1. Create a `struct BankAccount` with a `balance` in cents.
 2. Add a computed property `balanceInDollars` with `get`/`set`.
 3. Test depositing and withdrawing amounts in dollars.
 */
//: [Next >](@next)
