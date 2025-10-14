//: [Previous](@previous)
//: # 🧱 Creational Design Patterns
//: These patterns handle **object creation** — providing flexibility, readability, and reducing dependencies between code components.
//:
//: ## Patterns Covered
//: 1. Builder 🌟
//: 2. Prototype
//: 3. Abstract Factory 🌟
//: 4. Object Pool
//: ---
import Foundation
//: ## 1️⃣ Builder Pattern 🌟
//: **Problem:** When creating complex objects (with many properties), constructors become messy and hard to read.
//: **Solution:** Builder separates object construction from its representation.
//: **When to use:** Building objects with many optional or configurable parts (e.g., UIViews, API requests).
class Sandwich {
    var bread = ""
    var cheese = false
    var lettuce = false
    var tomato = false
}

class SandwichBuilder {
    private var sandwich = Sandwich()

    func addBread(_ type: String) -> Self {
        sandwich.bread = type
        return self
    }
    func addCheese() -> Self {
        sandwich.cheese = true
        return self
    }
    func addLettuce() -> Self {
        sandwich.lettuce = true
        return self
    }
    func addTomato() -> Self {
        sandwich.tomato = true
        return self
    }
    func build() -> Sandwich {
        return sandwich
    }
}

let clubSandwich = SandwichBuilder()
    .addBread("Whole Wheat")
    .addCheese()
    .addLettuce()
    .addTomato()
    .build()
//: ---
//: ## 2️⃣ Prototype Pattern
//: **Problem:** Creating objects is expensive or complex and we need many similar copies.
//: **Solution:** Clone existing objects rather than recreating them.
//: **When to use:** Duplicating configured instances (e.g., UI templates, cached models).
protocol Copying {
    func copy() -> Self
}

class GameCharacter: Copying {
    var name: String
    var health: Int
    var weapon: String

    required init(name: String, health: Int, weapon: String) {
        self.name = name
        self.health = health
        self.weapon = weapon
    }

    func copy() -> Self {
        return type(of: self).init(name: name, health: health, weapon: weapon)
    }
}

let original = GameCharacter(name: "Knight", health: 100, weapon: "Sword")
let clone = original.copy() // Makes a Value type copy because classes are Reference types
clone.weapon = "Axe"
//: ---
//: ## 3️⃣ Abstract Factory Pattern 🌟
//: **Problem:** You need to create families of related objects without specifying their concrete classes.
//: **Solution:** Create a factory that produces related objects.
//: **When to use:** Building cross-platform UI or configurable environments.
protocol Button { func render() }
protocol TextField { func render() }

protocol UIFactory {
    func createButton() -> Button
    func createTextField() -> TextField
}

class iOSButton: Button { func render() { print("📱 iOS Button") } }
class iOSTextField: TextField { func render() { print("📱 iOS TextField") } }

class macOSButton: Button { func render() { print("💻 macOS Button") } }
class macOSTextField: TextField { func render() { print("💻 macOS TextField") } }

class iOSFactory: UIFactory {
    func createButton() -> Button { iOSButton() }
    func createTextField() -> TextField { iOSTextField() }
}

class macOSFactory: UIFactory {
    func createButton() -> Button { macOSButton() }
    func createTextField() -> TextField { macOSTextField() }
}

let uiFactory: UIFactory = iOSFactory()
uiFactory.createButton().render()
uiFactory.createTextField().render()
//: ---
//: ## 4️⃣ Object Pool Pattern
//: **Problem:** Creating and destroying objects frequently is expensive (e.g., database connections, reusable UI elements).
//: **Solution:** Reuse objects from a pool instead of creating new ones.
//: **When to use:** Managing reusable resources efficiently (e.g. network or database connections).
class Connection {
    let id: Int
    init(id: Int) { self.id = id }
}

class ConnectionPool {
    private var available: [Connection] = []
    private var inUse: [Connection] = []

    func acquire() -> Connection {
        if let connection = available.popLast() {
            inUse.append(connection)
            return connection
        } else {
            let newConnection = Connection(id: inUse.count + 1)
            inUse.append(newConnection)
            return newConnection
        }
    }

    func release(_ connection: Connection) {
        inUse.removeAll { $0.id == connection.id }
        available.append(connection)
    }
}

let pool = ConnectionPool()
let connection1 = pool.acquire()
let connection2 = pool.acquire()
pool.release(connection1)
let connection3 = pool.acquire()
//: ---
//:
//: [Next](@next)
