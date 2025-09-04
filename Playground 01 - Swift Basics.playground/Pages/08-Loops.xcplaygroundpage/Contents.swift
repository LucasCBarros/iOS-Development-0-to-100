//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 8. Loops

---

 Loops let you **repeat code** until a condition is met or for each item in a collection.

---

 - **while** → runs as long as a condition is true.
 - **repeat-while** → runs at least once, then checks condition.
 - **for-in** → iterate over ranges, arrays, sets, dictionaries.
 - **stride** → step through numbers with custom increments.
---
 ### Real-world usage:
 - Counting down before starting a game.
 - Iterating through a list of cities or scores.
 - Processing items from a data source.
---
 ### Risks:
 - Infinite loops if the exit condition is never met.
 - Modifying a collection while looping over it can cause errors.
 */
// MARK: while
var countdown = 3
while countdown > 0 {
    print("Starting in \(countdown)...")
    countdown -= 1
}
print("Go!")

// MARK: repeat-while
var attempts = 0
repeat {
    print("Attempt #\(attempts)")
    attempts += 1
} while attempts < 3

// MARK: for-in with Array
let provinces = ["Ontario", "Quebec", "Alberta"]
for province in provinces {
    print("Province: \(province)")
}

// MARK: stride
for number in stride(from: 0, through: 10, by: 2) {
    print("Even number: \(number)")
}
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Use a `while` loop to count up from -5 to 7 skipping by 2.
 2. Use a `repeat-while` to simulate rolling a dice until you get a 6.
 3. Use a `for-in` loop to print your 3 favorite Canadian dishes.
 4. Use `stride` to print every third number between 0 and 15.
 */
//: [Next >](@next)
