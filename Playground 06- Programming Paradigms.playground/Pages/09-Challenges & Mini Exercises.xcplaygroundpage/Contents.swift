//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 9. Challenges & Mini Exercises

 Time to practice! Try these small tasks to reinforce what you learned.

 ---

 ## 🏕️ Challenge 1: Convert UIKit to SwiftUI
 Write this imperative UIKit code in declarative SwiftUI:
*/
import UIKit
 let label = UILabel()
 label.text = "Hello Canada!"
 label.textColor = .red
 label.textAlignment = .center
/*:
 ## 🚲 Challenge 2: Replace Inheritance with Protocols
 Convert this OOP hierarchy into a POP-based design:
*/
 class Animal {
     func sound() { print("Some sound") }
 }
 class Dog: Animal {
     override func sound() { print("Woof 🐶") }
 }
/*:
 ## 🎵 Challenge 3: FP with map/filter
Given this array: Filter only Brazilian genres and Map to uppercase.
*/
 let songs = ["Samba", "Bossa Nova", "Jazz", "Rock"]
/*:
 ## ⚡ Challenge 4: Reactive Flow
 Use Combine with @Published to bind a counter property that updates every time a button is tapped.
 */
//: [Next >](@next)
