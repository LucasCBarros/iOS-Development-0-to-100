//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 3. Encapsulation

 Encapsulation means **hiding internal details** of a class and exposing only what’s necessary.
 This is achieved through **access control** (`private`, `internal`, `public`, etc.).

 ---

 ### Benefits
 - Prevents misuse of code.
 - Keeps APIs clean and easy to use.
 - Protects sensitive data.

 ---

 ### Real-world usage
 - Hiding a banking app’s internal transaction details.
 - Exposing only safe operations to other developers.
 */
class BankAccount {
    private var balance: Double = 0

    func deposit(amount: Double) {
        balance += amount
        print("Deposited $\(amount). Balance is now $\(balance).")
    }

    func withdraw(amount: Double) {
        guard amount <= balance else {
            print("❌ Insufficient funds")
            return
        }
        balance -= amount
        print("Withdrew $\(amount). Balance is now $\(balance).")
    }
}

let account = BankAccount()
// These accessible methods are the only way to change the 'balance' value
account.deposit(amount: 100)
account.withdraw(amount: 30)
// account.balance // ❌ not accessible directly
/*:
 ### Mini Challenge
 1. Create a `User` class with a private `password`.
 2. Add a method `verifyPassword(_:)` that returns true/false.
 3. Test it with correct and incorrect passwords.
 */
//: [Next >](@next)
