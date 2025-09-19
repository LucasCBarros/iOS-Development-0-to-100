//: [<< Summary](00-Introduction)\
//: [< Previous](@previous)
/*:
 ## 11. Higher-Order Functions

 Higher-order functions are functions that take other functions as arguments or return them. In Swift, they are heavily used to transform, filter and reduce data collections. (When using them we usually opt for the shorthand syntax)

 Swift provides many built-in higher-order functions:

 - `map` → Transform each element
 - `filter` → Keep only elements that satisfy a condition
 - `reduce` → Combine values into one
 - `compactMap` → Remove nils while transforming
 - `flatMap` → Flatten nested collections

 ---

 ### Real-world usage
 - Converting a list of temperatures from °C to °F (`map`).
 - Filtering out free events from a ticket list (`filter`).
 - Summing the length of all names in a playlist (`reduce`).
 - Removing unavailable cities from a travel list (`compactMap`).
 - Flattening categories into a single list of items (`flatMap`).
 */
let numbers = [1, 2, 3, 4, 5, 6]

// 🗺 map – transforms each individual element
let squares = numbers.map { $0 * $0 }
print("Squares:", squares) // [1, 4, 9, 16, 25, 36]

// 🔎 filter – keeps only matching elements
let evens = numbers.filter { $0 % 2 == 0 }
print("Even numbers:", evens)  // [2, 4, 6]

// ➕ reduce – combines all values into one
let total = numbers.reduce(0, +)
print("Sum:", total) // 21

// 🧹 compactMap – removes nils after transforming
let possibleNumbers = ["1", "two", "3", "four"]
let validNumbers = possibleNumbers.compactMap { Int($0) }
print("Not 'nil' when parsing to INT: \(validNumbers)") // [1, 3]

// 🪂 flatMap – flattens nested collections
let nested = [[1, 2], [3, 4, 6], [5]]
let flattened = nested.flatMap { $0 }
print("Flattened:", flattened) // [1 ,2 ,3, 4, 6, 5]
/*:
 ### Mini Challenge
 1. Use `map` to append `" 🇨🇦"` to a list of Canadian provinces.
 2. Use `filter` to keep only names longer than 5 characters.
 3. Use `reduce` to calculate the total population of a `[Int]`.
 */
//: [Next >](@next)

//: ## Higher-Order Functions: Extra Examples
//: ---
//: Here we’ll explore a few more examples of **map, filter, reduce, compactMap and flatMap**.

// MARK: 🗺 map – transforms each individual element
// Example 2: Convert temperatures from Celsius to Fahrenheit
let celsius = [0, 20, 30, 45]
let fahrenheit = celsius.map { $0 * 9/5 + 32 }
print("Temperature in Fahrenheit: \(fahrenheit)") // [32, 68, 86]

// Example 3: Extract city names from dictionary
let cities = ["Brazil": "Brasília", "Canada": "Ottawa"]
let cityNames = cities.map { $0.value }
print("City names: \(cityNames)") // ["Brasília", "Ottawa"]

// Example 4: Uppercase a list of food
let foods = ["pão de queijo", "poutine", "feijoada"]
let uppercasedFoods = foods.map { $0.uppercased() }
print("upper cased foods: \(uppercasedFoods)") // ["PÃO DE QUEIJO", "POUTINE", "FEIJOADA"]
//: ---

// MARK: 🔎 filter – keeps only matching elements
// Example 2: Filter only short names
let names = ["Ana", "Lucas", "Gabriela", "João"]
let shortNames = names.filter { $0.count <= 4 }
print("Only names shorter than 3 characters: \(shortNames)") // ["Ana", "João"]

// Example 3: Filter temperatures above 25
let hotDays = celsius.filter { $0 > 25 }
print("Hot temperatures: \(hotDays)") // [30, 45]

// Example 4: Filter cities that start with “B”
let bCities = cities.filter { $0.value.hasPrefix("B") }
print("Cities that start with 'B': \(bCities)") // ["Brazil": "Brasília"]
//: ---

// MARK: ➕ reduce – combines all values into one
let numbers2 = [1, 2, 3, 4, 5, 6]

// Example 2: Multiply all numbers
let product = numbers2.reduce(1, *)
print("Product of all numbers starting with one: \(product)") // 720

let customOperation = numbers2.reduce(1) { partialResult, nextNumber in
    partialResult + nextNumber * nextNumber + 2
}
print("Custom operation applied: \(customOperation)") // 104

// Example 3: Join strings into one
let joined = names.reduce("") { $0 + " " + $1 }
print("Joined all names: \(joined)") // " Ana Lucas Gabriela João"

// Example 4: Find the maximum number
let maxNumber = numbers2.reduce(Int.min) { max($0, $1) }
print("Maximum number: \(maxNumber)") // 6
//: ---

// MARK: 🧹 compactMap – removes nils after transforming
// Example 2: Extract valid emails
let emails = ["lucas@email.com", nil, "invalid@", nil, "test@domain.com"]
let validEmails = emails.compactMap { $0 }
print("Remove all 'nil' values for email field: \(validEmails)") // removes nils

// Example 3: Convert mixed strings to doubles
let values = ["1.5", "abc", "3.14"]
let doubles = values.compactMap { Double($0) }
print("Not 'nil' when casting to Double: \(doubles)") // [1.5, 3.14]

// Example 4: Extract integers from an array of Any
let mixed: [Any] = [1, "Swift", 3, true]
let ints = mixed.compactMap { $0 as? Int }
print("Only get the values of type INT: \(ints)") // [1, 3]
//: ---

// MARK: 🪂 flatMap – flattens nested collections
// Example 2: Flatten and transform
let phrases = ["Hello World", "Swift iOS"]
let words = phrases.flatMap { $0.split(separator: " ") }
print("Words inside array of string: \(words)") // ["Hello", "World", "Swift", "iOS"]

// Example 3: Expand ranges
let ranges = [1...3, 7...10]
let expanded = ranges.flatMap { $0 }
print("Expanded ranges: \(expanded)") // [1, 2, 3, 7, 8, 9, 10]

// Example 4: Flatten optional arrays
let optionalArrays2: [[Int]?] = [[1, 2], nil, [3, 4]]
let flattened2 = optionalArrays2.compactMap { $0 }.flatMap { $0 }
print("Gather all values into a single array and removes 'nil' values: \(flattened2)") // [1, 2, 3, 4]
/// Notice that is this example we combined 'compactMap' and 'flatMap' in the same result
//: ---
//: [Next >](@next)

//: ---
//: ---
//: ### Same examples without shorthand syntax
//: ---

// MARK: 🗺 map – transforms each individual element
// Example 2: Convert temperatures from Celsius to Fahrenheit
let celsius2 = [0, 20, 30, 45]
let fahrenheit2 = celsius.map { celsiusTemperature in
    return celsiusTemperature * 9/5 + 32
}
print("Temperature in Fahrenheit: \(fahrenheit2)") // [32, 68, 86]

// Example 3: Extract city names from dictionary
let cities2 = ["Brazil": "Brasília", "Canada": "Ottawa"]
let cityNames2 = cities2.map { city in
    return city.value
}
print("City names: \(cityNames2)") // ["Brasília", "Ottawa"]
//: ---

// MARK: 🔎 filter – keeps only matching elements
// Example 2: Filter only short names
let names2 = ["Ana", "Lucas", "Gabriela", "João"]
let shortNames2 = names.filter { name in
    return name.count <= 4
}
print("Only names shorter than 3 characters: \(shortNames)") // ["Ana", "João"]

// Example 3: Filter temperatures above 25
let hotDays2 = celsius.filter { temperature in
    temperature > 25 // implied 'return' since it's just one line
}
print("Hot temperatures: \(hotDays2)") // [30, 45]
//: ---

// MARK: ➕ reduce – combines all values into one
let numbers3 = [1, 2, 3, 4, 5, 6]

// Example 2: Multiply all numbers
let product2 = numbers3.reduce(1) { (accumulator: Int,
                                     currentNumber: Int) -> Int in
    return accumulator * currentNumber
}
print("Product of all numbers starting with one: \(product)") // 720

let customOperation2 = numbers3.reduce(1) { partialResult, nextNumber in
    partialResult + nextNumber * nextNumber + 2
}
print("Custom operation applied: \(customOperation)") // 104

// Example 3: Join strings into one
let joined2 = names.reduce("") { (accumulator: String, currentNumber: String) -> String in
    return accumulator + " " + currentNumber
}
print("Joined all names: \(joined)") // " Ana Lucas Gabriela João"
//: ---

// MARK: 🧹 compactMap – removes nils after transforming
// Example 2: Extract valid emails
let emails2 = ["lucas@email.com", nil, "invalid@", nil, "test@domain.com"]
let validEmails2 = emails.compactMap { email in
    guard let email else { return false }
    return true
    }
print("Remove all 'nil' values for email field: \(validEmails2)") // removes nils

// Example 3: Convert mixed strings to doubles
let values2 = ["1.5", "abc", "3.14"]
let doubles2 = values2.compactMap { value in
    Double(value)
}
print("Not 'nil' when casting to Double: \(doubles2)") // [1.5, 3.14]
//: ---

// MARK: 🪂 flatMap – flattens nested collections
// Example 2: Flatten and transform
let phrases2 = ["Hello World", "Swift iOS"]
let words2 = phrases2.flatMap { phrase in
    phrase.split(separator: " ")
}
print("Words inside array of string: \(words2)") // ["Hello", "World", "Swift", "iOS"]

// Example 3: Expand ranges
let ranges2 = [1...3, 7...10]
let expanded2 = ranges2.flatMap { range in
    return range
}
print("Expanded ranges: \(expanded2)") // [1, 2, 3, 7, 8, 9, 10]
//: ---
//: [Next >](@next)
