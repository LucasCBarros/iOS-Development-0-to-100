//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 1. Basic Data Types

 Swift has several **fundamental types**:
 - `Int` → whole numbers
 - `Double` / `Float` → decimals
 - `Bool` → true or false
 - `String` → text

 ### Real-world usage:
 - Use `Int` for counts (e.g. population, medals).
 - Use `Double`/`Float` for precise values (e.g. temperatures, prices).
 - Use `Bool` for conditions (e.g. is it snowing?).
 - Use `String` for text (e.g. names, city names).

 ### Risks:
 - Using the wrong type (e.g. trying to add a `String` to an `Int`).
 - Floating-point precision (`Double` is more precise than `Float`).
 */
// Integers
let brazilianPopulation: Int = 214000000
let brazilianPopulation2: Int = 214_000_000 // Both notation are correct
let canadianPopulation = 40_000_000 // inferred as Int

// Decimals
let averageWinterTemp: Double = -5.3
let carnivalTicketPrice: Float = 299.99

// Boolean (Only two values)
let isSnowing: Bool = true
let isCarnivalDay: Bool = false

// Strings
let favoriteCity: String = "Vancouver"
let favoriteFood = "Chicken Parmegiana"
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Create a constant integer for your age.
 2. Create a double for today’s temperature.
 3. Create a boolean for "is it raining?".
 4. Create a string with your favorite Canadian or Brazilian city.
 */
//: [Next >](@next)

//: ---
//: ---
//: ---

//: ## Extra content:
//: ### Storage limits for Swift types
//: ---
/*: 🔹 Bool\
 ❌ Invalid Bool declarations in Swift: (Only true or false is valid)\
var isSnowing: Bool = 1\
var isSnowing: Bool = "true"\
var isSnowing: Bool = Yes
*/
//: ---
/*: 🔹 Integer\
Considering 64-bit devices (Most modern devices):\
Int type is a 64-bit signed integer, that means that\
- Minimum: -9,223,372,036,854,775,808 (Same as -2^63)\
- Maximum: 9,223,372,036,854,775,807 (Same as 2^63 - 1)
*/
//: ---
/*: 🔹 Double\
Based on 64-bit IEEE 754 floating point.\
- Precision: ~15–16 decimal digits.\
- Range: ±1.7 × 10^308
*/
//: ---
/*: 🔹 Float\
32-bit IEEE 754 floating point.\
- Precision: ~6–7 decimal digits.\
- Range: ±3.4 × 10^38\
👉 That's why in iOS, you should prefer to use Double for most work unless you really need memory savings.
*/
//: ---
/*: 🔹 String\
A Swift String is a collection of Unicode characters.\
- No fixed maximum size — it’s limited only by available memory.\
- Each character may take 1–4 bytes (because of UTF-8 encoding).\
- In practice, you could have strings of hundreds of MBs, but performance will suffer.
 */
