//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 4. Enums with Associated Values

 Enums can store **additional data** for each case.
 This makes them very flexible compared to raw values.

 ---

 ### Benefits
 - Attach context-specific info.
 - Cleaner than using parallel variables.

 ---

 ### Real-world usage
 - A concert ticket with a seat number.
 - A network request result with success or error info.
 - Media files with different formats (audio, video).
 */
enum ConcertTicket {
    case vip(seat: String)
    case regular
    case student(id: Int)
}

let ticket1 = ConcertTicket.vip(seat: "A12")
let ticket2 = ConcertTicket.student(id: 12345)

switch ticket1 {
    case .vip(let seat):
        print("VIP ticket, seat \(seat)") // "VIP ticket, seat A12"
    case .regular:
        print("General admission") // "General admission"
    case .student(let id):
        print("Student ticket ID: \(id)") // "Student ticket ID: 12345"
}
/*:
 ### Mini Challenge
 1. Create an enum `MediaType` with cases:
    - `.audio(filename: String, duration: Int)`
    - `.video(filename: String, resolution: String)`
 2. Print a message depending on which type is chosen.
 */
//: [Next >](@next)
