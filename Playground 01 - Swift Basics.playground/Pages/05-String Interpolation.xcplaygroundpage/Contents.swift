//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 5. String Interpolation
---

 String interpolation lets us **insert values inside text** using `\( )`.\
 This makes it easy to build dynamic strings.

---

 ### Real-world usage:
 - Showing scores in a game.
 - Displaying user info like name, city or temperature.
 - Building readable log/debug messages.
---
 ### Risks:
 - ⚠️ Be careful not to interpolate optionals without unwrapping,
   otherwise you may get `"Optional(...)"` in your output.
 */
let city = "Toronto"
let temperature = -7
let phrase = "The temperature in \(city) is \(temperature)°C."
print(phrase)

// Multiple values
let state = "Minas Gerais"
let dish = "Pão de Queijo"
print("In \(state), people love eating \(dish).")
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Create a variable with your favorite Canadian city.
 2. Create another with your favorite Brazilian food.
 3. Print a sentence that combines them both, like:\
    `"I want to eat Poutine in Rio de Janeiro!"`
 */
//: [Next >](@next)
