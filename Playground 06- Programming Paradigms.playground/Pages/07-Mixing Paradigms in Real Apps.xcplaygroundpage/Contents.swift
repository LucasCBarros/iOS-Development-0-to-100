//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 7. Mixing Paradigms in Real Apps

 In practice, iOS apps rarely stick to **just one paradigm**.\
 They often mix OOP, POP, FP, Declarative, and Reactive depending on the feature.
 */
// MARK: Example: MVVM with SwiftUI
import Combine

// OOP: ViewModel is a class
class JokeViewModel: ObservableObject {
    // Reactive: publisher with @Published
    @Published var joke: String = ""

    func fetchJoke() {
        // FP: data transformation using map
        let jokes = ["Knock knock 🚪", "Swift is fast ⚡️", "Why so serious 🤡?"]
        joke = jokes.randomElement() ?? "No joke found"
    }
}
//: SwiftUI Declarative View
import SwiftUI
 struct JokeView: View {
     @StateObject private var vm = JokeViewModel()

     var body: some View {
         VStack {
             Text(vm.joke)
             Button("New Joke") {
                 vm.fetchJoke()
             }
         }
     }
 }
/*:
 ## Breakdown
 - **OOP** → ViewModel class
 - **POP** → Could define protocol `JokeService`
 - **FP** → Using `map`/`filter`/`reduce`
 - **Declarative** → SwiftUI layout
 - **Reactive** → Combine bindings with `@Published`

 ---
 */
//: [Next >](@next)
