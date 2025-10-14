//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 # 4. Declarative Programming

 Declarative programming focuses on **what you want**, not **how to do it**.\
 Instead of step-by-step instructions, you describe the desired outcome.

 ## UIKit vs SwiftUI

 **Imperative UIKit (step by step):**
 */
import UIKit
let label = UILabel()
label.text = "Hello Vancouver!"
label.textColor = .blue
label.textAlignment = .center
/*:
 **Declarative SwiftUI (describe result):**
*/
import SwiftUI
Text("Hello Vancouver!")
    .foregroundColor(.blue)
    .multilineTextAlignment(.center)
/*:
 ## Benefits
 - More concise, readable.
 - UI updates automatically when state changes.
 - Matches human thinking (“I want a blue label with this text”).
 */
//: [Next >](@next)
