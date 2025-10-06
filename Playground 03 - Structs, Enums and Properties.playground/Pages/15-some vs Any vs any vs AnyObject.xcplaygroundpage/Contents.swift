//: [<< Summary](00-Introduction)
//: [< Previous](@previous)
//: # 🧠 Type Erasure & Existentials in Swift
//: Swift gives you several ways to work with abstract types: `some`, `Any`, `any`, and `AnyObject`.
//: Each has different semantics and performance tradeoffs.
//:
//: ---
//: ## 1️⃣ `some` - Opaque Type
//: Hides the specific concrete type, but the compiler still knows it internally.\
//: Allows a function or property to return a **specific type that conforms to a protocol**, without exposing its concrete type.
//:
//: An opaque type hides the concrete return type from the caller but guarantees that it’s one consistent type. It’s the opposite of a generic input — it’s a generic output.
//:
//: ✅ Use when you want **compile-time type safety** but hide the concrete type from users.
protocol Shape {
    func area() -> Double
}
struct Circle: Shape {
    let radius: Double
    func area() -> Double { .pi * radius * radius }
}
struct Square: Shape {
    let side: Double
    func area() -> Double { side * side }
}
func createShape() -> some Shape {
    Circle(radius: 3)
}
let opaqueShape = createShape()
print("Opaque area:", opaqueShape.area()) // Static dispatch (fast)
//: ---
//: ## 2️⃣ `any` - Existential Type
//: Introduced in Swift 5.7 for clarity.
//: It represents *a box* that can hold any type conforming to the protocol, but with dynamic dispatch.
//:
//: ⚠️ Existentials are more flexible but less performant — they use **runtime lookup**.
func printArea(of shape: any Shape) {
    print("Existential area:", shape.area())
}
printArea(of: Circle(radius: 4))
printArea(of: Square(side: 5))

/*: ### ⚠️ Trade-off:
When you use any, you lose compile-time knowledge of the underlying type.\

That means only protocol methods are available — not properties or methods specific to the concrete type.
 */
let shapes: [any Shape] = [
    Circle(radius: 2),
    Square(side: 3)
]
let first = shapes[0]
first.area()      // ✅ Allowed
// first.radius // ❌ Error: Unknown to compiler
//: ---
//: ## 3️⃣ `Any` — Universal Type
//: Can hold *any value* — class, struct, enum, even functions.
//:
//: ✅ Use `Any` when you really don’t know the types at compile time (e.g., JSON parsing)
let mixed: [Any] = [42, "Toronto", true, 3.14]
for value in mixed {
    print("🧩", value)
}
// ⚠️ You lose all type information — must cast to use it.
for value in mixed {
    if let city = value as? String {
        print("City:", city)
    }
}
//: ## 4️⃣ `AnyObject` — Class Instances Only
//: Restricts to **class types** only.
//:
//: ✅ Use `AnyObject` when working with Objective-C APIs or class-bound collections.
class Dog {}
class Cat {}
let pets: [AnyObject] = [Dog(), Cat()]
print("Number of pets:", pets.count)
if let dog = pets.first as? Dog {
    print("Found a dog")
}
//: ---
/*:
 ## 🧩 Summary Comparison

### `some`
- **Use Case:** Hide concrete type while keeping compile-time safety
- **Type Safety:** ✅ Strong
- **Performance:** ⚡ Fast
- **Typical Use:** SwiftUI views, API abstractions

---

### `any`
- **Use Case:** Work with multiple conforming types (type-erased protocol values)
- **Type Safety:** ⚠️ Dynamic (runtime)
- **Performance:** 🐢 Slower (dynamic dispatch)
- **Typical Use:** Protocol-based APIs, heterogeneous collections

---

### `Any`
- **Use Case:** Store any value (no type constraints)
- **Type Safety:** 🚫 Weak
- **Performance:** ⚠️ Depends on boxing/unboxing
- **Typical Use:** Generic containers, JSON parsing, mixed-type arrays

---

### `AnyObject`
- **Use Case:** Represent any class instance (reference type only)
- **Type Safety:** ⚠️ Moderate (class-only)
- **Performance:** 🐢 Moderate, dynamic reference lookups
- **Typical Use:** UIKit / Objective-C interop, delegate references
 */
//: ---
//: ## 🧭 Takeaway
//: - `some` → Hide type, but compiler knows it. ✅ Type-safe and fast.
//: - `any` → Existential — dynamic and flexible.
//: - `Any` → Type-erased container for everything.
//: - `AnyObject` → Class-only container, used mostly for Obj-C interoperability.

//: [Next >](@next)
