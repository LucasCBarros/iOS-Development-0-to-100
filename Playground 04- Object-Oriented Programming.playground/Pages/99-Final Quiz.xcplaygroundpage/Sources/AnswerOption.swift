//
//  AnswerOption.swift
//  Playground 02 – Optionals & Functions Quiz
//
//  Created by Lucas C Barros on 2025-09-03.
//

import SwiftUI

public enum AnswerOption: String, CaseIterable {
    case one = "1️⃣"
    case two = "2️⃣"
    case three = "3️⃣"
    case four = "4️⃣"
}

public class Question {
    private let correctAnswer: AnswerOption
    private let hintMessage: String
    public private(set) var selectedAnswer: AnswerOption? = nil

    public init(correct: AnswerOption, hint: String) {
        self.correctAnswer = correct
        self.hintMessage = hint
    }

    public func answer(_ option: AnswerOption? = nil) {
        self.selectedAnswer = option
    }

    public var isCorrect: Bool {
        return selectedAnswer == correctAnswer
    }

    public func hint() {
        print("💡 Hint: \(hintMessage)")
    }
}

public class Quiz {
    nonisolated(unsafe) public static var question1  = Question(correct: .three,
                                            hint: "Classes in Swift are declared with this keyword.")
    nonisolated(unsafe) public static var question2  = Question(correct: .two,
                                            hint: "Initializers set up a new object’s state.")
    nonisolated(unsafe) public static var question3  = Question(correct: .three,
                                            hint: "The opposite of init, called before deallocation.")
    nonisolated(unsafe) public static var question4  = Question(correct: .two,
                                            hint: "It ensures details are hidden, exposing only what’s needed.")
    nonisolated(unsafe) public static var question5  = Question(correct: .three,
                                            hint: "Classes use `:` followed by the superclass name.")
    nonisolated(unsafe) public static var question6  = Question(correct: .three,
                                            hint: "This keyword signals replacing a superclass implementation.")
    nonisolated(unsafe) public static var question7  = Question(correct: .two,
                                            hint: "Polymorphism allows different implementations with the same name.")
    nonisolated(unsafe) public static var question8  = Question(correct: .three,
                                            hint: "Protocols declare requirements without providing implementation.")
    nonisolated(unsafe) public static var question9  = Question(correct: .two,
                                            hint: "Generics help you write code that works with many types.")
    nonisolated(unsafe) public static var question10 = Question(correct: .three,
                                            hint: "`public` allows use across modules that import it.")
}

public extension Quiz {
    static func checkScore() {
        let questions: [Question] = [
            question1, question2, question3, question4, question5,
            question6, question7, question8, question9, question10
        ]

        let total = questions.count
        let correct = questions.filter { $0.isCorrect }.count
        let percentage = Double(correct) / Double(total) * 100

        var incorrects: [Int] = []
        for index in 0..<total {
            if !questions[index].isCorrect {
                incorrects.append(index+1)
            }
        }

        print("✅ Correct: \(correct)/\(total)")
        print("📊 Score: \(String(format: "%.1f", percentage))%")

        switch correct {
        case total:
            print("🎉 Amazing!!! Perfect score!")
        case (total-2)...(total-1):
            print("👍 Good job, just a little review needed.")
            print("You missed the following questions: \(incorrects)")
        case 0:
            print("😅 Please review the chapter and try again.")
        default:
            print("Keep practicing, you’re getting there!")
        }
    }
}
