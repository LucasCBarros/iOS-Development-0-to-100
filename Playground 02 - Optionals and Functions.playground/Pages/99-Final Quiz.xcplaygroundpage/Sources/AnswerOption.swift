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
    nonisolated(unsafe) public static var question1  = Question(correct: .two,   hint: "Optionals are declared with this symbol.")
    nonisolated(unsafe) public static var question2  = Question(correct: .one,   hint: "Safely unwraps and assigns a value if present.")
    nonisolated(unsafe) public static var question3  = Question(correct: .three, hint: "Provides a fallback value for nil.")
    nonisolated(unsafe) public static var question4  = Question(correct: .two,   hint: "Dangerous way of unwrapping an optional.")
    nonisolated(unsafe) public static var question5  = Question(correct: .three, hint: "Helps exit early if unwrapping fails.")
    nonisolated(unsafe) public static var question6  = Question(correct: .one,   hint: "Makes a parameter modifiable inside a function.")
    nonisolated(unsafe) public static var question7  = Question(correct: .two,   hint: "Useful when closures are the last argument.")
    nonisolated(unsafe) public static var question8  = Question(correct: .two,   hint: "Transforms elements one by one.")
    nonisolated(unsafe) public static var question9  = Question(correct: .four,  hint: "Removes nil values during transformation.")
    nonisolated(unsafe) public static var question10 = Question(correct: .one,   hint: "Marks closures that can outlive the function.")
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
