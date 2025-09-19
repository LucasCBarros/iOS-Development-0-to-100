//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 5. Optional Chaining

 Optional chaining lets you **safely call properties or methods** on an optional.\
 If the optional is `nil`, the whole expression becomes `nil` instead of crashing.

 *Note:* We call it chaining because `we.are.chaining.calls.with.dots()`

 Syntax:
 - For properties: `optional?.property`
 - For methods: `optional?.method()`

 ### Real-world usage:
 - Accessing the name of a song if it’s currently playing.
 - Checking the capital of a country if the dictionary lookup succeeds.
 - Getting the length of a user’s bio if it exists.

 ### Benefits:
 - Avoids crashes.
 - Cleaner code when chaining multiple properties.
 */
// Example: optional string length
var currentSong: String? = "Yellow by Coldplay"
print("Song length: \(currentSong?.count ?? 0) characters")

// Example: optional dictionary lookup
var capitals: [String: String]? = ["Canada": "Ottawa", "Brazil": "Brasília"]
print("Capital of Brazil: \(capitals?["Brazil"] ?? "Unknown")") // If we remove Brazil from the dictionary it will return a nil and we will print "Unknown" instead.
/*:
 ### 🎪 Mini Challenge
 1. Create an optional array of tourist attractions in your town.
 2. Use optional chaining to safely print the first attraction’s name.
 3. Provide "No attractions yet" as a default if it’s nil.
 4. Create a dictionary for the attraction and their location.
 */
//: [Next >](@next)
