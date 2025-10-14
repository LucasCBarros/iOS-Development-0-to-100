//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 7. Coordinator / Router Pattern

 The **Coordinator Pattern** (sometimes called **Router**) helps manage navigation flow in iOS apps.\
 Instead of letting `UIViewControllers` handle navigation, coordinators centralize the logic.

 ---

 ### Benefits
 - Keeps view controllers lightweight (no navigation code inside them).
 - Easier to test navigation flow.
 - Encourages modular design.

 ---

 ### Real-world usage
 - Managing tab-based or navigation-based flows.
 - Apps with multiple onboarding steps.
 - Feature modules in large apps.
 */
protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {
    func start() {
        print("🚀 App started with Home Screen")
    }

    func navigateToProfile() {
        print("➡️ Navigating to Profile Screen")
    }
}

let coordinator = AppCoordinator()
coordinator.start()
coordinator.navigateToProfile()
/*:
 ### Mini Challenge
 1. Create a `LoginCoordinator` that starts with a `LoginScreen`.
 2. Add a method `navigateToDashboard()`.
 3. Print the navigation flow to simulate transitions.
 */
//: [Next >](@next)
