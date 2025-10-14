//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 6. Strategy Pattern

 The **Strategy Pattern** defines a family of algorithms and makes them interchangeable.\
 Instead of hardcoding behavior, we pass in a "strategy" at runtime.

 ---

 ### Benefits
 - Flexible code that can change behavior dynamically.
 - Encourages composition over inheritance.

 ---

 ### Risks
 - Too many strategies may add unnecessary complexity.

 ---

 ### Real-world usage
 - Different sorting algorithms (bubble sort, quicksort, merge sort).
 - Payment methods (Credit, PayPal, Apple Pay).
 - Compression algorithms (zip, rar, tar).
 */
protocol PaymentStrategy {
    func pay(amount: Double)
}

class CreditCardPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("💳 Paid $\(amount) with Credit Card")
    }
}

class PayPalPayment: PaymentStrategy {
    func pay(amount: Double) {
        print("📧 Paid $\(amount) via PayPal")
    }
}

class Checkout {
    private var strategy: PaymentStrategy

    // Inject the strategy that should be used
    init(strategy: PaymentStrategy) {
        self.strategy = strategy
    }

    func processPayment(amount: Double) {
        strategy.pay(amount: amount)
    }
}

let checkout1 = Checkout(strategy: CreditCardPayment())
checkout1.processPayment(amount: 50)

let checkout2 = Checkout(strategy: PayPalPayment())
checkout2.processPayment(amount: 30)
/*:
 ### Mini Challenge
 1. Create a `TravelStrategy` with strategies for `Car`, `Bike`, and `Bus`.
 2. Make a `TravelPlanner` that uses the chosen strategy to "go to work".
 3. Try switching strategies at runtime.
 */
//: [Next >](@next)
