//: [<< Summary](00-Introduction)
//: [< Previous](@previous)

//: # 🧩 SOLID Principles
//: SOLID is a set of five design principles that make object-oriented code more **maintainable**, **scalable**, and **testable**.
//: These principles help you avoid tight coupling and make your app easier to change over time.
//:
//: ---
//: ## S — Single Responsibility Principle (SRP)
//: Each class should have only **one reason to change**.
// ✅ Each class has one job — one for saving, one for logging.
class FileManagerSRP {
    func save(_ text: String) { print("💾 Saving file...") }
}
class FileLoggerSRP {
    func log(_ message: String) { print("🪵 Logging: \(message)") }
}

// ❌ One class has does all jobs: saving, logging, etc
class FileManager {
    func save(_ text: String) { print("💾 Saving file...") }
    func log(_ message: String) { print("🪵 Logging: \(message)") }
}
//: ---
//: ## O — Open/Closed Principle (OCP)
//: Classes should be **open for extension**, but **closed for modification**.
// ✅ Add new payment types by creating new classes without need to modify existing ones.
protocol Payment {
    func pay(amount: Double)
}

class CreditCardPayment: Payment {
    func pay(amount: Double) { print("💳 Paid \(amount)") }
}

class PayPalPayment: Payment {
    func pay(amount: Double) { print("💰 Paid \(amount) via PayPal") }
}
//: ---
//: ## L — Liskov Substitution Principle (LSP)
//: Subclasses should be replaceable with their superclass without breaking the app.
class Bird { func fly() { print("Flying...") } }
// ✅ Eagles and Birds can fly
class Eagle: Bird { }
// ⚠️ Violates LSP: `Penguin` shouldn’t inherit from `Bird` if it can’t actually fly.
class Penguin: Bird { override func fly() { print("❌ Penguins can't fly!") } }
//: ---
//: ## I — Interface Segregation Principle (ISP)
//: No class should be forced to implement methods it doesn’t need.
// ❌ Wrong approach:
protocol Printer {
    func printDocument()
    func scanDocument()
}
class SimplePrinter: Printer {
    func printDocument() {}
    func scanDocument() {} // ❌ Not needed — violates ISP
}
// ✅ Fix by splitting protocols:
protocol Printable { func printDocument() }
protocol Scannable { func scanDocument() }

class simplePrinter: Printable {
    func printDocument() {}
}

class fancyPrinter: Printable, Scannable {
    func printDocument() {}
    func scanDocument() {}
}
//: ---
//: ## D — Dependency Inversion Principle (DIP)
//: High-level modules shouldn’t depend on low-level modules, both should depend on **abstractions**.
protocol NetworkService {
    func fetchData()
}
class APIService: NetworkService {
    func fetchData() { print("🌐 Fetching data from API...") }
}
// ✅ DataManager depends on a protocol, not a concrete class, which improves testability and flexibility.
class DataManager {
    private let service: NetworkService
    init(service: NetworkService) {
        self.service = service
    }
    func load() { service.fetchData() }
}
// ❌ DataManager depends on a concrete class, which is more rigid and harder to test.
class dataManager {
    private let service: APIService
    init(service: APIService) {
        self.service = service
    }
    func load() { service.fetchData() }
}
//: [Next >](@next)
