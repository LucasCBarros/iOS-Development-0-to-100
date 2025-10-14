//: [Previous](@previous)
//: # 🧩 Structural Design Patterns - Overview
//: These patterns help structure code by **composing classes and objects** to create flexible and reusable systems.
//:
//: ## Patterns Covered
//: 1. Adapter 🌟
//: 2. Bridge
//: 3. Composite
//: 4. Decorator 🌟
//: 5. Facade 🌟
//: 6. Flyweight
//: 7. Proxy
//:
//: ---
import Foundation
//: ## 1️⃣ Adapter Pattern 🌟
//: **Problem:** You need to make two incompatible interfaces work together.
//: **Solution:** Create an adapter that translates one interface into another.
//: **When to use:** Integrating new features into old APIs or legacy systems.
protocol OldPaymentSystem {
    func payWithCard(number: String)
}

class LegacyPayment: OldPaymentSystem {
    func payWithCard(number: String) {
        print("💳 Paid using old system with card \(number)")
    }
}

protocol NewPaymentSystem {
    func pay(amount: Double)
}

class PaymentAdapter: NewPaymentSystem {
    private let oldSystem: OldPaymentSystem

    init(oldSystem: OldPaymentSystem) {
        self.oldSystem = oldSystem
    }

    func pay(amount: Double) {
        print("💱 Adapting new system to old system...")
        oldSystem.payWithCard(number: "1234-5678-0000")
    }
}

let legacySystem = LegacyPayment()
let adapter = PaymentAdapter(oldSystem: legacySystem)
adapter.pay(amount: 50.0)
//: ---
//: ## 2️⃣ Bridge Pattern
//: **Problem:** You want to separate an abstraction from its implementation so they can evolve independently.
//: **Solution:** Use composition instead of inheritance.
//: **When to use:** Decoupling abstraction from implementation (e.g., rendering UI on different systems).
protocol DrawingAPI {
    func drawCircle(x: Int, y: Int, radius: Int)
}

class OpenGLAPI: DrawingAPI {
    func drawCircle(x: Int, y: Int, radius: Int) {
        print("🟢 OpenGL circle at (\(x), \(y)) radius \(radius)")
    }
}

class MetalAPI: DrawingAPI {
    func drawCircle(x: Int, y: Int, radius: Int) {
        print("⚙️ Metal circle at (\(x), \(y)) radius \(radius)")
    }
}

class Circle {
    private let x, y, radius: Int
    private let api: DrawingAPI

    init(x: Int, y: Int, radius: Int, api: DrawingAPI) {
        self.x = x
        self.y = y
        self.radius = radius
        self.api = api
    }

    func draw() {
        api.drawCircle(x: x, y: y, radius: radius)
    }
}

Circle(x: 10, y: 10, radius: 5, api: MetalAPI()).draw()
//: ---
//: ## 3️⃣ Composite Pattern 🌟
//: **Problem:** You want to treat individual objects and groups of objects uniformly.
//: **Solution:** Use a tree structure where both single and composite elements conform to the same interface.
//: **When to use:** Hierarchical structures like file systems, UIViews, or nested menus.
protocol FileSystemItem {
    func display(indentation: String)
}

class File: FileSystemItem {
    private let name: String
    init(_ name: String) { self.name = name }

    func display(indentation: String = "") {
        print("\(indentation)📄 \(name)")
    }
}

class Folder: FileSystemItem {
    private let name: String
    private var items: [FileSystemItem] = []
    init(_ name: String) { self.name = name }
    func add(_ item: FileSystemItem) { items.append(item) }

    func display(indentation: String = "") {
        print("\(indentation)📁 \(name)")
        items.forEach { $0.display(indentation: indentation + "  ") }
    }
}

let documents = Folder("Documents")
documents.add(File("resume.pdf"))

let photos = Folder("Photos")
photos.add(File("trip.png"))

documents.add(photos)
documents.display()
//: ---
//: ## 4️⃣ Decorator Pattern
//: **Problem:** You want to add behavior dynamically to an object without modifying its class.
//: **Solution:** Wrap objects in decorator classes.
//: **When to use:** Adding features dynamically (e.g., view modifiers, middlewares).
protocol Coffee {
    func cost() -> Double
    func ingredients() -> String
}

class BasicCoffee: Coffee {
    func cost() -> Double { 2.0 }
    func ingredients() -> String { "Coffee" }
}

class MilkDecorator: Coffee {
    private let base: Coffee
    init(_ base: Coffee) { self.base = base }
    func cost() -> Double { base.cost() + 0.5 }
    func ingredients() -> String { base.ingredients() + ", Milk" }
}

class SugarDecorator: Coffee {
    private let base: Coffee
    init(_ base: Coffee) { self.base = base }
    func cost() -> Double { base.cost() + 0.2 }
    func ingredients() -> String { base.ingredients() + ", Sugar" }
}

let coffee = SugarDecorator(MilkDecorator(BasicCoffee()))
print("☕️ \(coffee.ingredients()) - $\(coffee.cost())")
//: ---
//: ## 5️⃣ Facade Pattern 🌟
//: **Problem:** Systems can have complex subsystems with many classes and APIs.
//: **Solution:** Provide a simple interface to a complex system.
//: **When to use:** Simplifying complex APIs or subsystems (e.g., AVFoundation setup).
class AudioSystem { func playSound() { print("🔊 Playing sound") } }
class LightingSystem { func turnOn() { print("💡 Lights on") } }
class VideoSystem { func playVideo() { print("🎬 Video playing") } }

class HomeTheaterFacade {
    private let audio = AudioSystem()
    private let lights = LightingSystem()
    private let video = VideoSystem()

    func watchMovie() {
        print("🎥 Starting movie night...")
        lights.turnOn()
        audio.playSound()
        video.playVideo()
    }
}

let homeTheater = HomeTheaterFacade()
homeTheater.watchMovie()
//: ---
//: ## 6️⃣ Flyweight Pattern
//: **Problem:** Large numbers of similar objects consume too much memory.
//: **Solution:** Share common state instead of duplicating it.
//: **When to use:** When creating many similar objects (e.g., map markers, UI icons).
class TreeType {
    let name: String
    init(name: String) { self.name = name }
}

class Tree {
    let type: TreeType
    let x, y: Int
    init(x: Int, y: Int, type: TreeType) {
        self.x = x
        self.y = y
        self.type = type
    }
}

class Forest {
    private var types: [String: TreeType] = [:]
    private var trees: [Tree] = []

    func plantTree(x: Int, y: Int, typeName: String) {
        let type = types[typeName] ?? TreeType(name: typeName)
        types[typeName] = type
        trees.append(Tree(x: x, y: y, type: type))
    }
}

let forest = Forest()
forest.plantTree(x: 1, y: 2, typeName: "Pine")
forest.plantTree(x: 3, y: 4, typeName: "Pine")
//: ---
//: ## 7️⃣ Proxy Pattern
//: **Problem:** You want to control access to another object (e.g., lazy loading, security, logging).
//: **Solution:** Use a proxy that represents the real object.
//: **When to use:** Lazy loading, caching, access control or logging wrappers.
protocol Video {
    func play()
}

class RealVideo: Video {
    private let filename: String
    init(filename: String) { self.filename = filename; load() }
    private func load() { print("📀 Loading \(filename)...") }

    func play() { print("▶️ Playing \(filename)") }
}

class VideoProxy: Video {
    private let filename: String
    private var realVideo: RealVideo?

    init(filename: String) { self.filename = filename }

    func play() {
        if realVideo == nil {
            realVideo = RealVideo(filename: filename)
        }
        realVideo?.play()
    }
}

let video = VideoProxy(filename: "movie.mp4")
video.play() // Loads and plays
video.play() // Plays without reloading
//: ---
//: [Next](@next)
