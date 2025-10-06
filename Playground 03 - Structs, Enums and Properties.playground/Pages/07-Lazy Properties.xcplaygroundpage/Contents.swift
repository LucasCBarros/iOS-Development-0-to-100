//: [<< Summary](00-Introduction)
//: [< Previous](@previous)
import UIKit
//: # 💤 Lazy Properties
//:
//: In Swift, a **lazy property** is a stored property whose initial value is *not calculated until the first time it’s used*.
//:
//: This is useful when:
//: - The initial value is **expensive to compute**.
//: - The property **depends on something that isn’t available yet** during initialization.
//:
//: Lazy properties must always be declared with `var` (not `let`), since their value might change after initialization.
//:
//: ---

//: ## 🧠 Example: Loading Data Lazily
//: Imagine we’re simulating fetching data only when it’s actually needed\
//: (similar to how some apps delay network or database work).
struct ArticleManager {
    // Regular property (initialized right away)
    var title = "iOS Development 0 to 100"

    // Lazy property (initialized only when accessed)
    lazy var articles: [String] = loadArticles()

    func loadArticles() -> [String] {
        print("📚 Loading articles...")
        return ["Swift Basics", "Optionals", "Protocols", "SwiftUI"]
    }
}

var manager = ArticleManager()

print("App launched ✅") // Nothing loaded yet
print("Accessing articles now:")
print(manager.articles)  // triggers loadArticles() when calling the lazy property
//: 🧩 The value of `articles` is computed only once, the first time it’s accessed.\
//: If you access it again, it reuses the already-loaded value:
print("Accessing again:")
print(manager.articles) // No new "Loading..." message
//: ---
//: ## ⚙️ When to Use Lazy Properties
//:
//: ✅ Use when:
//: - Initialization is expensive (like fetching or parsing data)
//: - The property might *never be used*
//: - It depends on another property that’s initialized later
//:
//: 🚫 Avoid when:
//: - The property is lightweight and always used
//: - You need thread safety (lazy properties are not inherently thread-safe)
//: ---
//: ## 🧭 Real-World Example
//: You might use `lazy` for views or computed resources in UIKit or SwiftUI:
class ProfileViewController: UIViewController {
    lazy var profileImageView: UIImageView = {
        print("🖼️ Creating image view")
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // profileImageView isn't created until it's actually added:
        view.addSubview(profileImageView)
    }
}
//: ---
//: 💡 **Summary:**
//: - `lazy` defers initialization until first access.
//: - Must be a `var`.
//: - Great for performance optimization or dependent setup.
//: - ⚠️ Be careful with thread safety when accessing lazy properties concurrently.
//: ---
//: [Next >](@next)
