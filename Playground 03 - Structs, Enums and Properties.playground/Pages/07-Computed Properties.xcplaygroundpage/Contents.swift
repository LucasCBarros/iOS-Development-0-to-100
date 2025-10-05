//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 7. Computed Properties

 Computed properties **don’t store values directly**.
 Instead, they calculate a value each time they’re accessed.

 ---

 ### Benefits
 - Keep logic close to the data.
 - Auto-update when related values change.

 ---

 ### Real-world usage
 - Calculating a full name from first and last name.
 - Converting price in CAD to BRL automatically.
 - Calculating BMI from weight and height.
 */

struct Person {
    var firstName: String
    var lastName: String

    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

var user = Person(firstName: "Lucas", lastName: "Barros")
print("Full name:", user.fullName) // "Full name: Lucas Barros"

user.lastName = "Cavalcante"
print("Full name:", user.fullName) // "Full name: Lucas Cavalcante"
/*:
 ### Mini Challenge
 1. Create a `Rectangle` struct with `width` and `height`.
 2. Add a computed property `area`.
 3. Print the area of a rectangle.
 */
//: [Next >](@next)
