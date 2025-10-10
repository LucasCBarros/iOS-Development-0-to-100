//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 2. Initializers and Deinitializers

 - **Initializer (`init`)** → Sets up an object's properties when created.
 - **Deinitializer (`deinit`)** → Cleans up before an object is destroyed.

 ---

 ### Benefits
 - Initializer: Ensure all properties are set before use.
 - Deinitializer: Free up resources when no longer needed.

 ---

 ### Real-world usage
 - Setting up a database connection.
 - Releasing a file or network resource.
 - Logging object creation and destruction.
 */
class FileHandler {
    var filename: String

    init(filename: String) {
        self.filename = filename
        print("📂 Opened file: \(filename)")
    }

    deinit {
        print("🗑️ Closed file: \(filename)")
    }
}

var handler: FileHandler? = FileHandler(filename: "canada_trip.txt") // inits the object
handler = nil // triggers deinit
/*:
 ### Mini Challenge
 1. Create a `Session` class with a `user` property.
 2. Print `"Session started"` in `init` and `"Session ended"` in `deinit`.
 3. Create and destroy a `Session` object to test.
 */
//: [Next >](@next)
