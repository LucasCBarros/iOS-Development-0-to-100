//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 5. Pattern Matching with `switch`

 Swift’s `switch` is very powerful and it can match values, ranges and conditions.

 ---

 ### Benefits
 - More expressive than long `if/else` chains.
 - Perfect for enums with associated values.

 ---

 ### Real-world usage
 - Matching numeric ranges (grades, ages).
 - Handling enums with different payloads.
 - Checking string patterns.
 */
let score = 87

// Matches with a value within a range
switch score {
case 90...100:
    print("Grade: A 🎉")
case 80..<90:
    print("Grade: B 👍")
case 70..<80:
    print("Grade: C 🙂")
default:
    print("Grade: F ❌")
}

enum ConcertTicket {
    case vip(seat: String)
    case regular
    case student(id: Int)
}

// With associated values
let ticket = ConcertTicket.vip(seat: "B22")

// Matches with a value that fulfils the WHERE statement
switch ticket {
    case .vip(let seat) where seat.hasPrefix("A"):
        print("Front row VIP seat at \(seat)")
    case .vip(let seat):
        print("VIP seat at \(seat)")
    case .student(let id):
        print("Student ID: \(id)")
    case .regular:
        print("General admission")
}
/*:
 ### Mini Challenge
 1. Write a `switch` for an `Int` age:
    - Under 12 → "Child ticket"
    - 12–64 → "Adult ticket"
    - 65+ → "Senior ticket"
 2. Extend the `MediaType` enum from the last page with pattern matching.
 */
//: [Next >](@next)
