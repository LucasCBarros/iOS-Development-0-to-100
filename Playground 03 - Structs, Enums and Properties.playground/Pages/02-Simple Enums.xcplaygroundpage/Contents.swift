//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 2. Simple Enums

 Enums group related values into a **type-safe list of cases**.\
 (Enums are powerful for representing states.)

 ---

 ### Benefits
 - Prevents invalid values.
 - Self-documenting.
 - Easy to use with `switch`.

 ---

 ### Real-world usage
 - Days of the week.
 - App themes (light, dark, system).
 - Ticket categories (VIP, Regular, Student).
 */
enum TicketType {
    case vip
    case regular
    case student
}

let myTicket: TicketType = .vip

switch myTicket {
    case .vip:
        print("Access to backstage 🎤")
    case .regular:
        print("General admission 🎟️")
    case .student:
        print("Discount applied 🎓")
}

/*:
 ### Mini Challenge
 1. Define an enum `Season` with 4 cases.
 2. Write a `switch` to print one popular activity for each season.
 */
//: [Next >](@next)
