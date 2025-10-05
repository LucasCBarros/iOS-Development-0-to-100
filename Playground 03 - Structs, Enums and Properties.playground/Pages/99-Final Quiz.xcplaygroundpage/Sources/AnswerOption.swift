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
    // Questions are public so they can be answered from the playground page
    nonisolated(unsafe) public static var question1  = Question(correct: .two,
                                            hint: "Structs are copied (value types); classes are shared (reference types).")
    nonisolated(unsafe) public static var question2  = Question(correct: .one,
                                            hint: "The keyword 'enum' declares an enumeration.")
    nonisolated(unsafe) public static var question3  = Question(correct: .two,
                                            hint: "Raw values are underlying literal values assigned to enum cases.")
    nonisolated(unsafe) public static var question4  = Question(correct: .three,
                                            hint: "Enum cases can carry associated values (often called 'associated values').")
    nonisolated(unsafe) public static var question5  = Question(correct: .three,
                                            hint: "A `static` property is shared across all instances (type-level).")
    nonisolated(unsafe) public static var question6  = Question(correct: .three,
                                            hint: "Property observers (`willSet`/`didSet`) run when a stored property changes.")
    nonisolated(unsafe) public static var question7  = Question(correct: .one,
                                            hint: "Property observers are `willSet` and `didSet`.")
    nonisolated(unsafe) public static var question8  = Question(correct: .one,
                                            hint: "Explicit getters/setters use `get` and `set`.")
    nonisolated(unsafe) public static var question9  = Question(correct: .two,
                                            hint: "`fileprivate` restricts access to the same source file.")
    nonisolated(unsafe) public static var question10 = Question(correct: .two,
                                            hint: "Extensions add functionality to types without subclassing.")
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
