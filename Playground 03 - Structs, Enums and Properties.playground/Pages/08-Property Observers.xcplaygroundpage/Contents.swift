//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 8. Property Observers

 Property observers let you **respond to changes** in a property’s value.

 - `willSet` → Called **before** the value changes.
 - `didSet` → Called **after** the value changes.

 ---

 ### Benefits
 - Useful for logging or validation.
 - Great for updating UI automatically.

 ---

 ### Real-world usage
 - Tracking score in a game.
 - Logging changes in account balance.
 - Updating a progress bar when progress changes.
 */

struct Game {
    var score: Int = 0 {
        willSet { // Called BEFORE value change
            print("Score will change to \(newValue)")
        }
        didSet { // Called AFTER value change
            print("Score changed from \(oldValue) to \(score)")
        }
    }
}

var game = Game()
game.score = 10
game.score = 25
/*:
 ### Mini Challenge
 1. Create a `Download` struct with `progress` (0–100).
 2. Add `didSet` to print `"Progress: <value>%"`.
 3. Test by updating `progress` several times.
 */
//: [Next >](@next)
