//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 6. Collections

 ---

 Swift provides multiple ways to group values together:

---

 - **Arrays** → ordered lists of values. *(May have duplicates)*
 - **Dictionaries** → key-value pairs. *(Unique Keys)*
 - **Sets** → unique, unordered values.
 - **Tuples** → lightweight grouping of values.

 ---

 ### Real-world usage:
 - Arrays: storing a list of scores, friends or cities.
 - Dictionaries: mapping usernames to passwords, countries to capitals.
 - Sets: storing unique items (like tags, categories).
 - Tuples: returning multiple values from a function.
---

 ### Risks:
 - ⚠️ Arrays and dictionaries crash if you try to access a non-existing index/key.
 - Arrays index start at 0(zero)
 - Sets have no guaranteed order, which can surprise beginners.
 - Tuples are simple, but not great for complex data structures → structs are better.
 */
// MARK: Arrays
var canadianCities = ["Vancouver", "Toronto", "Montreal"]
canadianCities.append("Calgary") // Adding new value to Array by appending
print("Canadian cities: \(canadianCities)")
print("I live in: \(canadianCities[0])") // Use Int for the Index inside Arrays
//print("This will crash since it is a non-existing index: \(canadianCities[4])")

// MARK: Dictionaries 1
var countryCapitals = ["Brazil": "Brasília", "Canada": "Ottawa", "Key": "Value"]
print("Capital of Canada: \(countryCapitals["Canada"] ?? "Unknown")") // Use the 'Key' as the Index inside Dictionaries
print("Capital of Canada 22 : \(countryCapitals["Ottawa"] ?? "Unknown")") // Used 'Value' instead of 'Key' so won't find it.

// MARK: Dictionaries 2
var countryID = [123: "Brasília", 124: "Ottawa", 125: "Value"]
//var countryID = [123: "Brasília", 456: "Ottawa", "Key": "Value"] // Will give error since all 'Keys' need to be of same type, same thing for 'Value'.
//var countryID = [1: "Brasília", 2: "Ottawa", 2: "Value"] // Will give error since all 'Keys' need to be unique, but 2 is repeated.

// To add a new value to Dictionary, give the 'Key' and the 'Value' that will be associated with it
countryID[126] = "Italy"

// Will return an Array with all 'Keys' inside the Dictionary
print("All registered countryIDs: \(countryCapitals.keys)")
// Will return an Array with all 'Values' inside the Dictionary
print("All registered countries: \(countryCapitals.values)")

// MARK: Sets
var uniqueSports: Set = ["Hockey", "Soccer", "Basketball", "Soccer", "Soccer"]
print("Sports set: \(uniqueSports)") // "Soccer" appears only once

// MARK: Tuples
let developer = (name: "Lucas Barros", experience: 7) // Can have labels (optional but recommended for readability)
print("Player: \(developer.name), Jersey: \(developer.experience)")

let developerInfo = (2018, "iOS Developer", true, 1.72) // Can have multiple values
print("I've been an \(developerInfo.1) since \(developerInfo.0). I'm \(developerInfo.3) cm tall") // If you don't have labels you can access via Index
/*:
 ### 🍁🇧🇷 Mini Challenge
 1. Create an array of 4 Canadian animals and print the first and last one.
 2. Create a dictionary mapping Canadian provinces to their abbreviations.
 3. Create a set of favorite sports (make sure to repeat one).
 4. Create a tuple representing your favorite city with (name, population, doesItSnow, abbreviation).
 */
//: [Next >](@next)
