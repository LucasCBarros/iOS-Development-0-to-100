//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
//: # 🧱 Static Properties and Methods
//: Static members belong to the *type itself* and not to any specific instance.\
//: This means every instance of that type shares the same static property or method.
import Foundation

// MARK: - Static Properties in Structs
struct Canada {
    static let countryCode = "CA"
    var province: String
}

let vancouver = Canada(province: "British Columbia")
let toronto = Canada(province: "Ontario")

print("Country code:", Canada.countryCode) // Accessed on the type itself, not instance
// vancouver.countryCode // ❌ Not allowed, 'countryCode' belongs to the type, not the instance
//: Static properties are often used for:
//: - Shared constants
//: - Default configurations
//: - Type-level identifiers

// MARK: - Static Methods
struct MathHelper {
    static func square(_ number: Int) -> Int {
        return number * number
    }
}
// Called without creating a MathHelp object
print(MathHelper.square(4)) // 16
/*: Static methods are like utility functions scoped within a type. \
 They don’t depend on instance data, so they are perfect for helpers or factories.
*/
//: ---
//: ## Static vs Class in Classes
class Vehicle {
    static let wheels = 4
    class var description: String {
        "Generic Vehicle"
    }
}

class Motorcycle: Vehicle {
//    override static var wheels = 2 // ❌ cannot be overridden
    override class var description: String {
        "Two-wheeled motorcycle"
    }
}

print(Vehicle.description)   // Generic Vehicle
print(Motorcycle.description) // Two-wheeled motorcycle
//: 🧩 When to use `static` or `class`:
//: - Use `static` when you don’t need inheritance.
//: - Use `class` for type-level properties or methods that *can be overridden* in subclasses.
// MARK: - Real-World Example
struct AppConfig {
    static let apiBaseURL = URL(string: "https://api.kanadaconnect.ca")!
    static let appVersion = "1.0.0"

    static func info() {
        print("🇨🇦 App Version: \(appVersion) | Base URL: \(apiBaseURL)")
    }
}
AppConfig.info()
/*: 🧭 **Tip:** Static members are great for constants, app-wide configuration or helper methods.\
 ⚠️ Be careful with static *mutable* state, it persists across the app and can cause thread-safety issues.
 */
//: [Next >](@next)
