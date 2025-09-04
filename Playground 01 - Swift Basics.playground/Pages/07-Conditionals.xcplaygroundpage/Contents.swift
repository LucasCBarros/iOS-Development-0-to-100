//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 7. Conditionals

---

 Conditionals help your program make **decisions**.

 ---

 - **if / else** → run code only IF a condition is true ELSE do another action.
 - **switch** → check against multiple possible values.

---
 ### Real-world usage:
 - Check if a user is logged in or not.
 - Decide if a player has enough points to level up.
 - Branch logic depending on the type of item selected.
---
 ### Risks:
 - Too many nested ifs → messy and hard to read.
 - Forgetting a `default` case in `switch` → may cause compiler errors if not exhaustive.
 */

// MARK: if / else
let score = 75
let isMath = true
if score >= 90 {
    print("Grade: A")
} else if score >= 70 {
    print("Grade: B")
} else {
    if isMath { // Can nest IF inside another, but not recommended
        print("Grade: D")
    } else {
        print("Grade: C")
    }
}

// MARK: switch - Equal values
let province = "Ontario"
switch province {
case "British Columbia":
    print("West Coast vibes 🌊")
case "Ontario":
    print("Home to Toronto 🍁")
default:
    print("Somewhere else in Canada 🇨🇦")
}

// MARK: switch - Intervals
let testScore = 5
switch testScore {
case 100 ... 50: // Between 100 and 50
    print("Passed!")
case ..<49: // Smaller than 49
    print("Failed..")
default:
    print("Please talk with the teacher")
}
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Use `if` to check if a number is even or odd.
 2. Use `switch` to print a message for one of three Canadian sports.
 */
//: [Next >](@next)
