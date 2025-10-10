//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
//: # 💉 Dependency Injection
//: Dependency Injection (DI) is a technique to **supply dependencies from the outside** rather than creating them inside a class.
//: It helps achieve **decoupling**, **testability** and **cleaner architecture**.
//: ## Why Use DI?
//: - Promotes reusability and testing
//: - Reduces tight coupling
//: - Makes code more flexible for swapping components
//: ---
//: ## 1️⃣ Initializer Injection
//: Dependencies are passed when the object is created.
//: ✅ **Advantage:** Strong immutability, clear dependencies.
//: ⚠️ **Risk:** More parameters in large initializers.
protocol WeatherService {
    func fetchTemperature() -> Int
}
class APIWeatherService: WeatherService {
    func fetchTemperature() -> Int { 22 }
}
class IoTWeatherService: WeatherService {
    func fetchTemperature() -> Int { 52 }
}

class WeatherViewModel {
    private let service: WeatherService
    init(service: WeatherService) {
        self.service = service
    }
    func displayWeather() {
        print("🌤 Temperature: \(service.fetchTemperature())°C")
    }
}
let viewModel = WeatherViewModel(service: APIWeatherService()) // Injected the API service
viewModel.displayWeather()
let viewModel2 = WeatherViewModel(service: IoTWeatherService()) // Injects other service
viewModel.displayWeather()
//: ---
//: ## 2️⃣ Property Injection
//: Dependencies are set **after initialization**.
//: ✅ **Advantage:** Useful when dependencies aren’t known at init time.
//: ⚠️ **Risk:** May cause runtime errors if property is never injected.
class ProfileViewController {
    var service: WeatherService? // Needs to be Internal or Public access
    func loadProfile() {
        guard let service else { print("❌ Missing dependency"); return }
        print("Loaded weather: \(service.fetchTemperature())°C")
    }
}
let vc = ProfileViewController()
vc.service = APIWeatherService() // Injecting service by attributing its value to property
vc.loadProfile()
//: ---
//: ## 3️⃣ Method Injection
//: Dependencies are passed directly into a method.
//: ✅ **Advantage:** Very flexible for short-lived dependencies.
//: ⚠️ **Risk:** Can clutter methods with repeated parameters.
class ForecastPrinter {
    func printForecast(using service: WeatherService) {
        print("🗓 Forecast: \(service.fetchTemperature() + 2)°C tomorrow")
    }
}
let printer = ForecastPrinter()
printer.printForecast(using: APIWeatherService()) // Injecting into method which to use
//: ---
//: ## 🧠 In iOS Development
//: - Common in **MVVM**  when injecting ViewModels
//: - **VIPER / Clean Swift** rely heavily on DI
//: - Combine with **protocols** for testable services
//: - Works across paradigms! Not just OOP, also used in POP, Functional, etc...
//:
//: [Next >](@next)
