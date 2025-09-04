//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 9. Control Transfer Statements

---

 Control transfer statements let you change the flow inside loops and conditionals:

---

 - **break** → immediately exit a loop or switch.
 - **continue** → skip to the next iteration of a loop.
 - **fallthrough** → continue into the next `switch` case.
 - **guard** → exit early if a condition is not met. (Great for cleaner code!)

---

 ### Real-world usage:
 - Stopping a search when a result is found (`break`).
 - Skipping invalid data (`continue`).
 - Early exits in functions to avoid nested `if`s (`guard`).
---
 ### Risks:
 - ⚠️ Overusing `break`/`continue` can make loops harder to follow.
 - ⚠️ `fallthrough` can lead to unexpected results if not carefully used.
 */
// MARK: break
for number in 1...5 {
    if number == 3 {
        break // stop loop entirely
    }
    print("Number: \(number)")
}

// MARK: continue
for number in 1...5 {
    if number == 3 {
        continue // skip just this iteration
    }
    print("Number: \(number)")
}

// MARK: fallthrough
let weather = "sunny"
switch weather {
case "rainy":
    print("Bring an umbrella ☔️")
case "sunny":
    print("Wear sunglasses 🕶️") // Will be triggered but lets continue looking for matches
    fallthrough
default:
    print("Have a nice day!") // Will also be triggered
}

// MARK: guard
// This uses Optionals, that we will see further ahead
func greetUser(_ name: String?) {
    guard let name = name else {
        print("No name provided ❌")
        return
    }
    print("Hello, \(name) 👋")
}
greetUser("Lucas")
greetUser(nil)
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Use a loop and `break` when you find the number 7.
 2. Use `continue` to skip printing even numbers in a loop from 1 to 10.
 */
//: [Next >](@next)
