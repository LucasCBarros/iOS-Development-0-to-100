//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 3. Optional Binding

 Since force-unwrapping is risky, Swift gives us **optional binding** to deal with optionals without risking a crash:

 - Use `if let` to safely unwrap an optional.
 - Use `guard let` to unwrap with an **early exit** if a value is missing (great for keeping code flat and is mostly recommended for clean code).

 ### Real-world usage:
 - Checking if a restaurant menu has today’s special before printing it.
 - Displaying a user’s nickname only if they have one.
 - Showing the population of a city if it’s stored in the database.
 */
// Example with 'if let'
var optionalCity: String? = "Rio de Janeiro"

if let city = optionalCity {
    print("Exploring \(city) 🌴") // Has initial value, so will print here
} else {
    print("No city selected yet.")
}

// Another 'if let' example
var coldPlay: String? = nil
if let band = coldPlay {
    print("Tonight’s concert: \(band) 🎸")
} else {
    print("Concert lineup to be announced.") // Doesn't have initial value, so will print here
}

// An 'guard let' example (Remember: exits early if 'nil')
func printHeadline(_ leadSinger: String?) {
    guard let artist = leadSinger else {
        print("Lineup to be announced.")
        return
    }
    print("Tonight’s leadSinger: \(artist)")
}
printHeadline("Fred Mercury")
printHeadline(nil)
/*:
 ### 🍽️ Mini Challenge
 1. Create an optional String for your favorite Canadian dish. Remember to put it inside an optional 'box', so you have to open the box to see if there is a dish or not.
 2. Use `if let` to safely unwrap it and print:
    `"I love eating ..."`
 3. Try setting it to `nil` and see what prints.
 */
//: [Next >](@next)
