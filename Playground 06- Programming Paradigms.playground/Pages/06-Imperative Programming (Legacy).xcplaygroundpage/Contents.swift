//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 6. Imperative Programming (Legacy)

 Imperative programming is the **oldest style** and still visible in UIKit.\
 You write explicit, step-by-step instructions for every detail.
 */
// MARK: Example: UIKit Imperative Layout
import UIKit

let button = UIButton(frame: CGRect(x: 50, y: 50, width: 200, height: 40))
button.setTitle("Tap me", for: .normal)
button.backgroundColor = .systemBlue
//: Compare with SwiftUI Declarative:
import SwiftUI
 Button("Tap me") {
     print("Button tapped")
 }
 .frame(width: 200, height: 40)
 .background(Color.blue)
/*:
## Why it matters
- Still widely used in legacy enterprise apps.
- Good to understand when maintaining old codebases.

 ---
*/
//: [Next >](@next)
