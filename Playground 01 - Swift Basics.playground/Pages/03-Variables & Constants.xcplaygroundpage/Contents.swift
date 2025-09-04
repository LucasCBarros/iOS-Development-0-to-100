//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 3. Variables & Constants
---
 - Use `let` for values that **don’t change** → constants.
 - Use `var` for values that **can change** → variables.
---

 Prefer `let` by default. It makes code safer and easier to reason about.

 ---
 ### Real-world usage:
 - Constants → country names, physical constants, fixed settings.
 - Variables → temperature, scores, counters.
---
 ### Risks:
 - Accidentally using `var` instead of `let` can allow unwanted mutations.
 - We suggest always starting with `let` and the compiler will let you know when you are trying to change it and you can switch to `var`
 */

// Constant
let capitalOfCanada = "Ottawa"

// Variable
var currentTemperature = -2
currentTemperature = -8  // temperatures can change (Capitals can't)

// Another example
let capitalOfBrazil = "Brasília"
var favoriteSport = "Swimming"
favoriteSport = "Hiking"

/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Create a constant with your favorite Brazilian or Canadian dish.
 2. Create a variable for how many times you ate it this month.
 3. Print a message using string interpolation: \
    Example: `"I ate Poutine 3 times this month!"`
 */

//: [Next >](@next)
