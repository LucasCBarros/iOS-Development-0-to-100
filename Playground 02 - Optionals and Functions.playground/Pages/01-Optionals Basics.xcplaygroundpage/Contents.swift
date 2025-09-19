//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 2. Optionals Basics

 An **optional** is a variable that may hold a value OR it may be `nil` (Empty).\
 Think of it as a box that could be empty.

 Syntax:
 - Add `?` after the type to declare an optional.
 - Use `!` to force-unwrap (only when you’re sure it’s not nil).

 ### Real-world usage:
 - A concert ticket might have a seat number or it might be "standing area".
 - A tourist attraction might have an opening time, but sometimes it’s closed.
 - A login form might or might not have a filled username.

 ### Risks:
 - ⚠️ Force-unwrapping (`!`) when the value is `nil` will crash the app crash.
 */
// Declaring an optional
var favoriteHikeInBC: String? = "Praia dos Castelhanos - Ilha Bela"
print("Favorite hike: \(favoriteHikeInBC)") // Prints "Optional(...)" unless unwrapped

// Setting it to nil
favoriteHikeInBC = nil
// print("Weekend plans: \(favoriteHikeInBC!)") //this will cause a crash!

// Force unwrapping (⚠️ dangerous if nil)
favoriteHikeInBC = "Golden Ears Summit"
print("Weekend plans: \(favoriteHikeInBC!)") // Safe because we set a value before
/*:
 ### ⛰️ Mini Challenge
 1. Create an optional String for your favorite hike.
 2. Print it with force unwrap (make sure it’s not nil).
 3. Then set it to nil and see what happens if you force unwrap again.
 */
//: [Next >](@next)
