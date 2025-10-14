//: [<< Summary](00-Introduction)
//: [< Previous](@previous)
/*:
 # 🎭 Behavioral Design Patterns - Overview

 Behavioral patterns define how objects **interact**, **communicate** and **delegate responsibilities**.\
 They make object collaboration **flexible**, **testable**, and **decoupled**.

 ## Patterns Covered
 1. Observer 🌟
 2. Strategy 🌟
 3. Command
 4. Chain of Responsibility
 5. Mediator
 6. Memento
 7. State
 8. Template Method
 9. Visitor
 10. Interpreter
 */
//: ---
//:
//: ### 1️⃣ Observer 🌟
//: **Problem:** Many objects must react when one object’s state changes.
//: **Solution:** A subject publishes updates; observers subscribe and react.
//: **Use case:** Notifications, UI bindings, reactive systems.
import Foundation

// Using generics for flexibility
final class Observable<T> {
    private var observers: [(T) -> Void] = []
    // We can call it either 'bind' or 'subscribe'
    func bind(_ observer: @escaping (T) -> Void) {
        observers.append(observer)
    }
    func notify(_ value: T) {
        observers.forEach { $0(value) }
    }
}

class WeatherStation {
    let temperature = Observable<Int>()
    func update(temp: Int) { temperature.notify(temp) }
}

class NewsChannel {
    let newsFeed = Observable<String>()
    func update(news: String) { self.newsFeed.notify(news) }
}

let station = WeatherStation()
station.temperature.bind { print("Observer A: Temp is \($0)°C") }
station.temperature.bind { print("Observer B: Logging temp \($0)") }
station.update(temp: 23)

let newsStation = NewsChannel()
newsStation.newsFeed.bind { print("Observer A: The news is that \($0)") }
newsStation.newsFeed.bind { print("Observer B: will broadcast that \($0)") }
newsStation.update(news: "New iOS 25 is released!")
//: ---
//: ### 2️⃣ Strategy 🌟
//: **Problem:** Need to swap algorithms or behaviors at runtime.
//: **Solution:** Encapsulate interchangeable behaviors as separate types.
//: **Use case:** Payment methods, sorting logic, input validation.
protocol FetchUserDataStrategy {
    func fetch(data: String)
}

struct APIStrategy: FetchUserDataStrategy {
    func fetch(data: String) { print("Fetched \(data) from API") }
}

struct CoreDataStrategy: FetchUserDataStrategy {
    func fetch(data: String) { print("Fetched \(data) from CoreData") }
}

class NetworkManager {
    private var strategy: FetchUserDataStrategy
    init(strategy: FetchUserDataStrategy) { self.strategy = strategy }

    func setNewStrategy(_ new: FetchUserDataStrategy) { strategy = new }
    func fetchData(data: String) { strategy.fetch(data: data) }
}

let networkManager = NetworkManager(strategy: APIStrategy())
networkManager.fetchData(data: "Username: Lucas_Barros")

networkManager.setNewStrategy(CoreDataStrategy())
networkManager.fetchData(data: "UserLocation: Vancouver")
//: ---
//: ### 3️⃣ Command
//: **Problem:** You want to encapsulate requests as objects (undo/redo, queuing).
//: **Solution:** A `Command` object contains all data needed to perform an action.
//: **Use case:** Undo stacks, macro systems, delayed actions.
protocol Command {
    func execute()
    func undo()
}

class Light {
    private(set) var isOn = false
    func turnOn() { isOn = true; print("💡 Light ON") }
    func turnOff() { isOn = false; print("💤 Light OFF") } // Note we can use ';' to write multiple lines together like in Obj-C
}

// Encapsulated methods from light object
class TurnOnCommand: Command {
    let light: Light
    init(_ light: Light) { self.light = light }
    func execute() { light.turnOn() }
    func undo() { light.turnOff() }
}

class Remote {
    private var history: [Command] = []
    func press(_ command: Command) {
        command.execute()
        history.append(command)
    }
    func undoLast() {
        history.popLast()?.undo()
    }
}

let light = Light()
let onCommand = TurnOnCommand(light)
let remote = Remote()
remote.press(onCommand)
remote.undoLast()
//: ---
//: ### 4️⃣ Chain of Responsibility
//: **Problem:** Multiple objects may handle a request, but the sender shouldn't know who.
//: **Solution:** Chain handlers together and each decides whether to handle or pass it on.
//: **Use case:** Validation chains, logging, middleware.
protocol Approver {
    var next: Approver? { get set }

    func approve(amount: Double)
}

class TeamLead: Approver {
    var next: Approver?

    func approve(amount: Double) {
        if amount < 1000 {
            print("👩‍💼 Team Lead approved $\(amount)")
        } else {
            next?.approve(amount: amount)
        }
    }
}

class Director: Approver {
    var next: Approver?
    func approve(amount: Double) {
        if amount < 10000 {
            print("👨‍💼 Director approved $\(amount)")
        } else {
            print("🚀 Escalated to CEO for $\(amount)")
        }
    }
}

let lead = TeamLead()
let director = Director()
lead.next = director
lead.approve(amount: 500)
lead.approve(amount: 5000)
lead.approve(amount: 50000)
//: ---
//: ### 5️⃣ Mediator
//: **Problem:** Objects are tightly coupled because they directly reference each other.
//: **Solution:** A `Mediator` centralizes all communication.
//: **Use case:** Chat rooms, UI component coordination.

protocol ChatMediator {
    func send(message: String, from: User)
}

class User {
    let name: String
    private let mediator: ChatMediator

    init(name: String, mediator: ChatMediator) { self.name = name ; self.mediator = mediator }

    func send(_ message: String) {
        mediator.send(message: message, from: self)
    }
    func receive(_ message: String, from: User) {
        print("📩 \(name) received from \(from.name): \(message)")
    }
}

class SimpleChatRoom: ChatMediator {
    private var users: [User] = []

    func joinedChat(_ user: User) {
        users.append(user)
    }

    func send(message: String, from: User) {
        users.forEach {
            if $0.name != from.name {
                $0.receive(message, from: from)
            }
        }
    }
}

let room = SimpleChatRoom()
let lucas = User(name: "lucas", mediator: room)
let mike = User(name: "mike", mediator: room)
let james = User(name: "james", mediator: room)
room.joinedChat(lucas)
room.joinedChat(mike)
room.joinedChat(james)
lucas.send("Hello James! 👋")
//: ---
//: ### 6️⃣ Memento
//: **Problem:** Need to save and restore an object’s state without exposing its internals.
//: **Solution:** A `Memento` stores a snapshot of the state.
//: **Use case:** Undo functionality, version history.
struct EditorMemento {
    let text: String
}

class TextEditor {
    private var text = ""

    func write(_ newText: String) { text += newText }
    func save() -> EditorMemento { EditorMemento(text: text) }
    func restore(_ savedText: EditorMemento) { text = savedText.text }
    func read() -> String { text }
}

let editor = TextEditor()
editor.write("Hello")

let save1 = editor.save()
editor.write(", world!")

print(editor.read())
editor.restore(save1)
print(editor.read())
//: ---
//: ### 7️⃣ State
//: **Problem:** An object behaves differently based on internal state.
//: **Solution:** Move state-specific logic to separate classes.
//: **Use case:** UI components, media players, workflow engines.
protocol PlayerState {
    func play(context: AudioPlayer)
}

// One set of logic for 'Playing state'
class PlayingState: PlayerState {
    func play(context: AudioPlayer) { print("🎶 Already playing") }
}

// Another set of logic for 'Paused state'
class PausedState: PlayerState {
    func play(context: AudioPlayer) {
        print("▶️ Resuming playback")
        context.state = PlayingState()
    }
}

// Object that will use the states
class AudioPlayer {
    var state: PlayerState = PausedState()
    func pressPlay() { state.play(context: self) }
}

let player = AudioPlayer()
player.pressPlay()
player.pressPlay()
//: ---
//: ### 8️⃣ Template Method
//: **Problem:** You have algorithms with the same steps but different details.
//: **Solution:** Define the skeleton in a base class and let subclasses implement specifics.
//: **Use case:** Framework hooks, setup flows.
class DataProcessor {
    func execute() {
        read()
        process()
        write()
    }
    func read() { fatalError("Override read()") }
    func process() { fatalError("Override process()") }
    func write() { fatalError("Override write()") }
}

class CSVProcessor: DataProcessor {
    override func read() { print("📄 Reading CSV") }
    override func process() { print("⚙️ Processing CSV") }
    override func write() { print("💾 Writing CSV") }
}

CSVProcessor().execute()
//: ---
//: ### 9️⃣ Visitor
//: **Problem:** You need to add operations to objects without changing them.
//: **Solution:** The `Visitor` pattern separates structure from behavior.
protocol UIComponent {
    func accept(_ visitor: UIComponentVisitor)
}

class Label: UIComponent { // Element A
    let text: String
    init(_ text: String) { self.text = text }
    func accept(_ visitor: UIComponentVisitor) { visitor.visit(self) }
}

class Button: UIComponent { // Element B
    let title: String
    init(_ title: String) { self.title = title }
    func accept(_ visitor: UIComponentVisitor) { visitor.visit(self) }
}

protocol UIComponentVisitor {
    func visit(_ label: Label)
    func visit(_ button: Button)
}

// MARK: - Example Visitors
class DescriptionVisitor: UIComponentVisitor {
    func visit(_ label: Label)  { print("Label: \(label.text)") }
    func visit(_ button: Button){ print("Button: \(button.title)") }
}
class ThemeVisitor: UIComponentVisitor {
    func visit(_ label: Label)  { print("Apply theme to label: \(label.text)") }
    func visit(_ button: Button){ print("Apply theme to button: \(button.title)") }
}
// MARK: - Application
let components: [UIComponent] = [Label("Welcome"), Button("Login")]
components.forEach { $0.accept(DescriptionVisitor()) }
components.forEach { $0.accept(ThemeVisitor()) }
//: ---
//: ### 🔟 Interpreter
//: **Problem:** You need to evaluate sentences in a simple domain-specific language.
//: **Solution:** Create classes to represent grammar and interpret expressions.
//:
//: 💡 *Why use it?*
//: - Defines rules for a **mini language or logic** inside your app.
//: - Used in **command parsing, rule engines, or filters**.
//: - Each Expression represents a grammar rule — easy to extend later.
protocol Expression {
    func interpret() -> Int
}

// MARK: - Terminal Expressions
struct Number: Expression {
    let value: Int
    func interpret() -> Int { value }
}

// MARK: - Non-Terminal Expressions
struct Add: Expression {
    let left: Expression
    let right: Expression
    func interpret() -> Int { left.interpret() + right.interpret() }
}

struct Subtract: Expression {
    let left: Expression
    let right: Expression
    func interpret() -> Int { left.interpret() - right.interpret() }
}

// MARK: - Usage
//: Expression: (5 + 3) - 2
let expression = Subtract(left: Add(left: Number(value: 5), right: Number(value: 3)),
                          right: Number(value: 2))

print("Result: \(expression.interpret())") // Prints: Result: 6
//: ---
//: ## ✅ Final Notes
//: - Behavioral patterns help keep systems modular and adaptable.
//: - Start simple: closures and Combine often cover many of these needs.
//: - Use these patterns when behaviors start to get complex or duplicated.
//:
//: [Next >](@next)
