//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 3. Enums with Raw Values

 Enums can store **raw values** (String, Int, etc.) automatically or manually assigned.

 ---

 ### Benefits
 - Works well with data from APIs.
 - Provides a direct mapping between values and enums.

 ---

 ### Real-world usage
 - Months numbered 1–12.
 - HTTP status codes.
 - Canadian provinces or Brazilian states with abbreviations.
 */
enum Province: String { // raw value of String
    // Each case with associated String value
    case ontario = "ON"
    case britishColumbia = "BC"
    case quebec = "QC"
}

let myProvince = Province.ontario
print("Selected province: \(myProvince.rawValue)") // "Selected province: ON"

// Int raw values auto-increment
enum Month: Int {
    // Given the first associated value, Swift infers the value for the other cases
    case january = 1, february, march, april
}
print("March is month number \(Month.march.rawValue)") // "March is month number 3"
/*:
 ### Mini Challenge
 1. Create an enum `Instrument` with raw values `"🎸"`, `"🥁"`, `"🎹"`.
 2. Print your favorite instrument’s emoji.
 */
//: [Next >](@next)
