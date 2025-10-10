//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
//: # 🧩 Protocol Extensions
//: Protocol extensions allow us to **add functionality** to protocols, such as default method implementations, without forcing every conforming type to rewrite the same code.
//:
//: This makes code more **reusable**, **consistent** and **composition-friendly**, supporting Swift’s *protocol-oriented programming* philosophy.
import Foundation

// MARK: - Basic Example
protocol Swimmable {
    func swim()
}

// Default behavior using a protocol extension
extension Swimmable {
    func swim() {
        print("🏊‍♂️ Swimming at a steady pace...")
    }
}

struct Athlete: Swimmable {}
struct Dolphin: Swimmable {
    func swim() {
        print("🐬 Swiftly gliding through the water!")
    }
}

let lucas = Athlete()
lucas.swim() // Uses default implementation

let flipper = Dolphin()
flipper.swim() // Uses custom implementation

//: ✅ Benefit: You can provide shared behavior while still allowing custom overrides when needed. (Overrides in this case don't need the keyword 'override' because it's not a parent class method
//:
//: ---
// MARK: - Adding Utility Methods
protocol Locatable {
    var latitude: Double { get }
    var longitude: Double { get }
}

extension Locatable {
    func distance(from other: Locatable) -> Double {
        let latDiff = latitude - other.latitude
        let lonDiff = longitude - other.longitude
        return sqrt(latDiff * latDiff + lonDiff * lonDiff)
    }
}

struct City: Locatable {
    let name: String
    let latitude: Double
    let longitude: Double
}

let vancouver = City(name: "Vancouver", latitude: 49.2827, longitude: -123.1207)
let rio = City(name: "Rio de Janeiro", latitude: -22.9068, longitude: -43.1729)

print("🌎 Distance between \(vancouver.name) and \(rio.name) is: \(vancouver.distance(from: rio))° (approx)")

//: This example demonstrates how we can extend behavior across many types that conform to the same protocol.
//:
//: ---
// MARK: - Restricting Extensions to Certain Types
protocol Describable {
    var description: String { get }
}

// Imposes a restriction to access the methods inside this extension of the protocol
extension Describable where Self: CustomStringConvertible {
    func detailedDescription() -> String {
        return "📝 \(description)"
    }
}

struct Mountain: CustomStringConvertible, Describable {
    var name: String
    var description: String { "Mountain: \(name)" }
}

struct ErrorMountain: Describable {
    var name: String
    var description: String { "Mountain: \(name)" }
}

let whistler = Mountain(name: "Whistler Peak")
print(whistler.detailedDescription())

// Both applied the protocol, but only the one with the expected inheritance can use the Utility method in the protocol extension
let goldenEars = ErrorMountain(name: "Golden Ears Summit")
//print(goldenEars.detailedDescription()) // ❌ Error because this class does inherit from 'CustomStringConvertible'
//: This adds functionality only for types that *also* conform to `CustomStringConvertible`.
//:
//: ---
// MARK: - Real-World Example
protocol Cacheable {
    var cacheKey: String { get }
}

extension Cacheable {
    var cacheKey: String {
        return String(describing: Self.self)
    }
}
struct UserModel: Cacheable {}
struct SettingsModel: Cacheable {}

print("🧠 User cache key:", UserModel().cacheKey)
print("⚙️ Settings cache key:", SettingsModel().cacheKey)
//: 🧭 **When to use protocol extensions:**
//: - To share default implementations
//: - To add helper methods for protocol-conforming types
//: - To promote composition over inheritance
//:
//: 🚫 **Avoid** overusing them to mimic class hierarchies or it can lead to hidden complexity.
//: 
//: [Next >](@next)
