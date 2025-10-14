//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 5. Observer Pattern

 The **Observer Pattern** defines a one-to-many relationship where multiple objects (**observers**) get notified when another object (**subject**) changes.

 ---

 ### Benefits
 - Decouples subjects from observers.
 - Enables reactive programming.
 - Already built into NotificationCenter, Combine and RxSwift.

 ---

 ### Risks
 - Observers may introduce unexpected side effects.
 - Harder to trace bugs with many observers.

 ---

 ### Real-world usage
 - Notifications in iOS (`NotificationCenter`).
 - UI updates when data changes.
 - Event-driven programming.
 */
protocol Observer {
    func update(message: String)
}

class NewsPublisher {
    private var observers: [Observer] = []

    func subscribe(_ observer: Observer) {
        observers.append(observer)
    }

    func notify(message: String) {
        for observer in observers {
            observer.update(message: message)
        }
    }
}

class NewsReader: Observer {
    var name: String
    init(name: String) { self.name = name }

    func update(message: String) {
        print("📰 \(name) received news: \(message)")
    }
}

// Create the object that will publish the changes
let publisher = NewsPublisher()
// Create the objects that will update when changes are made
let reader1 = NewsReader(name: "Alice")
let reader2 = NewsReader(name: "Bob")

// Add them to the list to be notified
publisher.subscribe(reader1)
publisher.subscribe(reader2)

// When a change occurs both 'readers' are notified
publisher.notify(message: "Swift 6 announced!")
/*:
 ### Mini Challenge
 1. Create a `WeatherStation` that notifies observers with temperature updates.
 2. Observers should print `"CityName: current temp X°C"`.
 3. Subscribe at least 2 observers and simulate updates.
 */
//: [Next >](@next)
