//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 2. Singleton Pattern

 The **Singleton Pattern** ensures that only **one instance** of a class exists during runtime.

 ---

 ### Benefits
 - Centralized access to shared resources.
 - Easy to manage global state.

 ---

 ### Risks
 - Can be overused (global state is hard to test).
 - May hide dependencies.
 - Thread safety issues (multiple threads accessing it simultaneously can cause race conditions or inconsistent data).

 ---

 ### Real-world usage
 - User session management.
 - Network manager.
 - App settings.
 */
class Settings {
    nonisolated(unsafe) static let shared = Settings() // nonisolated(unsafe) is only used because this is a Playground, otherwise just user 'static' keyword

    private init() {} // prevents creating new instances

    var theme: String = "Light"
}

Settings.shared.theme = "Dark"
print("App theme:", Settings.shared.theme)
/*:
 ### Mini Challenge
 1. Create a `Logger` singleton with a `log(message:)` method.
 2. Call it from different places in your playground.
 3. Verify all logs go through the same instance.
 */
//: [Next >](@next)
