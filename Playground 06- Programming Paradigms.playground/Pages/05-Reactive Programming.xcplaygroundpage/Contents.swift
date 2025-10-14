//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 5. Reactive Programming

 Reactive programming models data and events as **streams**.\
 Instead of pulling values when you need them, you **subscribe** to updates.

 In iOS, this is done with **Combine** or **RxSwift**.
 */
// MARK: Example: Combine
import Combine

class WeatherStation {
    @Published var temperature: Int = 20
}

let station = WeatherStation()
let cancellable = station.$temperature
    .sink { newTemp in
        print("🌡️ New temperature: \(newTemp)°C")
    }

station.temperature = 25
station.temperature = 30
/*:
 ## Benefits
 - Simplifies async data handling.
 - Fits perfectly with SwiftUI state system (`@State`, `@Binding`).

 ## Where it’s used
 - Networking responses
 - UI bindings
 - Notifications & sensors

 ---
 */
//: [Next >](@next)
