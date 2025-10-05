//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 10. Access Control

 Swift provides **access control modifiers** to define where a property, method, or type can be accessed. (Access control keeps APIs clean and safe.)

 ---

 ### Levels
 - `open` → Accessible and overridable anywhere (frameworks).
 - `public` → Accessible anywhere, but not overridable outside the module.
 - `internal` (default) → Accessible within the same module.
 - `fileprivate` → Accessible only within the same file.
 - `private` → Accessible only within the enclosing scope.

 ---

 ### Benefits
 - **Encapsulation:** hide unnecessary details.
 - **Security:** prevent accidental misuse of APIs.
 - **Flexibility:** expose only what’s needed.

 ---

 ### Real-world usage
 - Hiding internal logic in a library (e.g., network retries).
 - Preventing direct changes to sensitive properties like passwords.
 - Providing a clear public API while keeping helpers private.
 */

public struct UserProfile {
    public let username: String
    private var password: String
    let userID: Int = 123 // Internal by default
    fileprivate let userAddress = "Vancouver"

    // Only way to set "password" value because it's private
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    // Only way to access "password" value because it's private
    public func verify(password attempt: String) -> Bool {
        return attempt == password
    }
}

let profile = UserProfile(username: "canadaSwift", password: "🍁1234")
print("Password correct?", profile.verify(password: "🍁1234")) // "Password correct? True"
print("Password correct?", profile.verify(password: "🍁321")) // "Password correct? False"

// Trying to access a private property directly will give you an error
//profile.password // 'password' is inaccessible due to 'private' protection level

// No problem accessing "username" value since it's 'public' access level
profile.username
// Same thing for 'internal' and 'fileprivate' access level
profile.userID
profile.userAddress
/// We use mostly 'public' or 'private'
/*:
 ### Mini Challenge
 1. Create a `BankAccount` struct with a `private` balance.
 2. Add a `deposit(amount:)` and `withdraw(amount:)` method (public).
 3. Prevent direct access to `balance`.
 */
//: [Next >](@next)
