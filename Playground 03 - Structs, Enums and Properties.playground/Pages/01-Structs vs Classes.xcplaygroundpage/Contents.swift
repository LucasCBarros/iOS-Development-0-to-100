//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 1. Structs vs Classes

 Swift gives us two primary ways of creating custom types:

 - **Structs** → Value types (copied when assigned) [Note that Swift uses Copy On Write to reduce memory usage].
 - **Classes** → Reference types (shared when assigned).

 ---

 ### Key differences
 
 Structs:
 - Type = Value
 - Inheritance = ❌
 - Mutability = Needs `var`
 - ARC Memory Management = ❌ (stack)

 Classes:
 - Type = Reference
 - Inheritance = ✅
 - Mutability = Can always mutate
 - ARC Memory Management = ✅ (heap)

 ---

 ### Real-world usage
 - Structs → Coordinates, Points, Dates, Configurations.
 - Classes → UI elements, data models that require shared state.
 */
// Struct = Value type
struct City {
    var name: String
    var population: Int
}

var toronto = City(name: "Toronto", population: 3000000)
var copyToronto = toronto // Copies the object

copyToronto.population = 5000000 // Changes the value of the copie of the object
print("Original:", toronto.population, // "Original: 3000000"
      "Copy:", copyToronto.population) // "Copy: 5000000"

// Class = Reference type
class Country {
    var name: String
    var capital: String
    init(name: String, capital: String) {
        self.name = name
        self.capital = capital
    }
}

var brazil = Country(name: "Brazil", capital: "Brasília")
var sameBrazil = brazil // Refers to the previous object

sameBrazil.capital = "Rio de Janeiro" // Changes the value in the original object
print("Original:", brazil.capital, // "Original: Rio de Janeiro"
      "Reference:", sameBrazil.capital) // "Reference: Rio de Janeiro"

//: ## When to Use Each:
//: - Use **structs** when:
//:   - Data is simple and small (like models or coordinates)
//:   - You want immutability and thread-safety
//:   - You don’t need inheritance
//:
//: - Use **classes** when:
//:   - You need shared state (reference semantics)
//:   - You want to use inheritance or Objective-C interoperability
//:   - You need deinitialization logic
//: ---
/*: 🧠 **Key takeaway:**\
 `Structs` keep data isolated and safe from unexpected mutation\
 `Classes` allow shared state and polymorphism, which are powerful, but easier to misuse
 */
//: ---
/*:
 ### Mini Challenge
 1. Create a `struct Album` with `title` and `year`.
 2. Create a `class Band` with `name` and `genre`.
 3. Show how modifying one copy of each behaves differently.
 */
//: [Next >](@next)
