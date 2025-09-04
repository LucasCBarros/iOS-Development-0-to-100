//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 4. Operators

 ---
 Operators let us **manipulate values** and compare them. Swift includes:

 - **Arithmetic**  → `+`, `-`, `*`, `/`, `%` *(Remainder of division)*
 - **Comparison**  →  `==` *(Equal)*, `!=` *(Not Equal)*, `<` *(Smaller)*, `>` *(Bigger)*, `<=` *(Smaller or Equal)*, `>=` *(Bigger or Equal)*
 - **Logical**  →  `&&` *(AND)*, `||` *(OR)*, `!` *(NOT)*
 - **Compound assignment**  →  `+=` *(Increment)*, `-=` *(Decrement)*, `*=` *(Multiply)*, `/=` *(Divide)*
 - **Ternary**  →  `condition ? valueIfTrue : valueIfFalse`
---

 ### Real-world usage:
 - Calculating totals (e.g. shopping cart, scores).
 - Checking conditions (e.g. Is one score higher than the other? Could be 'Score1 > Score2').
 - Combining logic (snowing AND cold could be 'isSnowing || isCold').

 ---
 ### Risks:
 - ⚠️ Division by zero crashes, be careful to never divide by zero.
 - `%` works only with integers (unless using advanced math). (e.g. 24%7 = 3)
 */
//: Arithmetic
let brazilianStates = 26
let canadianProvinces = 10
let totalProvinces = brazilianStates + canadianProvinces
print("Both countries have: \(totalProvinces)") // 36
//: Comparison
let canadaHasMoreProvinces = canadianProvinces > brazilianStates // 10 > 26 = false
print("Canada has more provinces? \(canadaHasMoreProvinces)") // false
//: Logical
let isCold = true
let hasSnow = false
let winterConditions = isCold && hasSnow // isCold AND hasSnow (true AND false) = false
print("Is it a snowy winter day? \(winterConditions)") // false
//: Compound Assignment
var OlympicMedals = 10
OlympicMedals += 5 // now 15, since incremented 5
OlympicMedals *= 3 // now 45, since multiplied by 3
print("Canada won \(OlympicMedals) medals in total.")
//: Ternary Operator
let hasMoreProvinces = (brazilianStates > canadianProvinces) ? "Brazil 🇧🇷" : "Canada 🍁"
print("The country with most provinces is: \(hasMoreProvinces)")
//: Mini Challenge
/*:
 1. Create two integer variables for hockey and soccer scores.
 2. Use Compound assignment operators to change the scores.
 3. Use comparison operators to check which sport had more goals.
 4. Use a ternary operator to print the winner between them.
 */
//: ---
//: [Next >](@next)
