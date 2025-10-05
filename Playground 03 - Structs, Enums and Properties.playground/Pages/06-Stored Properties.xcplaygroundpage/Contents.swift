//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 6. Stored Properties

 Stored properties are variables or constants that **store values inside a type**.\
 Note: Values inside this properties are reset when the App is terminated.

 ---

 ### Benefits
 - Keep related data together.
 - Define default values.

 ---

 ### Real-world usage
 - A `User` struct with `name` and `email`.
 - A `Book` struct with `title` and `author`.
 - A `Location` struct with `latitude` and `longitude`.
 */
struct Book {
    // No default value is set, so value required at object init
    var title: String
    var author: String

    // Default value is set, so not required at object init
    var isRead: Bool = false
}

// Giving both values for "title" and "author"
var novel = Book(title: "The Pragmatic Programmer", author: "Andy Hunt")
print("Now reading: \(novel.title) by \(novel.author)")

novel.isRead = true
print("Have I read it? \(novel.isRead)")
/*:
 ### Mini Challenge
 1. Create a `struct Movie` with `title`, `year` and `watched: Bool`.
 2. Initialize it with one of your favorite films.
 3. Update the `watched` property to `true`.
 */
//: [Next >](@next)
