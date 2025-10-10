//: [<< Summary](00-Introduction)
//: [< Previous](@previous)
//: # 🧩 Protocols with Associated Types
//: Associated types make protocols **generic** so they allow the protocol to define a *placeholder type* that is specified later by the conforming type.
//:
//: This enables flexible, reusable abstractions without knowing the concrete type in advance.
//:
//: ---
//: ## 🧠 What Is an Associated Type?
//: It’s a type placeholder defined inside a protocol using the `associatedtype` keyword.\
//: It allows methods or properties in the protocol to use that placeholder instead of a specific type.
//:
//: ---
//: ✅ This makes `DataStore` reusable for *any* kind of data, not just `User`.
protocol DataStore {
    associatedtype Item
    func save(_ item: Item)
    func loadAll() -> [Item]
}

struct User {
    let name: String
}
// Any conforming type will then define what `Item` actually is:
class UserStore: DataStore {
    private var items: [User] = []
    func save(_ item: User) { items.append(item) }
    func loadAll() -> [User] { items } // Since 'User' is used in the 'Item' place, then Swift infers it's the type to be used
}
let userStore = UserStore()
userStore.save(User(name: "Lucas"))
print(userStore.loadAll().first?.name ?? "No users") // "Lucas"
//: ---
//: ## 💡 Why Use Associated Types?
//: - To build **generic protocols** without explicitly using generics.
//: - To keep code flexible and type-safe.
//: - To abstract over collections, networking layers, storage services, and more.
//:
//: ---
//: ## 📱 iOS Practical Example
//: ✅ This pattern is common in **network layers**, **repository patterns** and **Combine publishers**.
//:
//: Imagine a reusable data provider for fetching any model type.
protocol NetworkProvider {
    associatedtype Model
    func fetch(completion: @escaping (Result<[Model], Error>) -> Void)
}

struct Article: Codable {
    let title: String
}

class ArticleProvider: NetworkProvider {
    typealias Model = Article // You can also use 'typealias' to make the associated type more obvious and redable
    func fetch(completion: @escaping (Result<[Article], Error>) -> Void) {
        completion(.success([Article(title: "Exploring Swift Protocols")]))
    }
}

let articleProvider = ArticleProvider()
articleProvider.fetch { result in
    switch result {
        case .success(let articles): print("📰 \(articles.first!.title)")
        case .failure(let error): print("Error: \(error)")
    }
}
//: ---
//: ## ⚠️ Limitation
//: Protocols with associated types **cannot be used directly as concrete types** (they’re not existential-safe).
// MARK: Example
// let store: DataStore = UserStore() // ❌ Error: Protocol 'DataStore' can only be used as a generic constraint
//: ✅ Workaround 1: Use Generics
func saveAll<T: DataStore>(_ store: T, items: [T.Item]) {
    items.forEach { store.save($0) }
}
//: ✅ Workaround 2: Use Type Erasure
//: You can wrap the protocol in a generic struct to "erase" the specific type.
struct AnyDataStore<T>: DataStore {
    typealias Item = T
    private let _save: (T) -> Void
    private let _loadAll: () -> [T]
    init<U: DataStore>(_ store: U) where U.Item == T {
        _save = store.save
        _loadAll = store.loadAll
    }
    func save(_ item: T) { _save(item) }
    func loadAll() -> [T] { _loadAll() }
}

let anyUserStore = AnyDataStore(UserStore())
anyUserStore.save(User(name: "Ana"))
print(anyUserStore.loadAll().count) // ✅ Works fine!
//: ---
//: ## 🧩 Summary
//: - Use `associatedtype` to make protocols generic and flexible.
//: - Enables reusable abstractions (e.g. data providers, repositories, publishers).
//: - Can’t use directly as a type, so you must use generics or type erasure.
//: - Common in **Combine**, **SwiftUI** and **data architecture**.
//:
//: [Next >](@next)
