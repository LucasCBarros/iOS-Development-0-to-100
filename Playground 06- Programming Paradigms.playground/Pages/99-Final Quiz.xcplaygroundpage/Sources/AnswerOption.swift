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
    nonisolated(unsafe) public static var question1  = Question(correct: .one,
                                            hint: "Classes, inheritance, polymorphism = OOP.")
    nonisolated(unsafe) public static var question2  = Question(correct: .two,
                                            hint: "Swift promotes protocols & composition over inheritance.")
    nonisolated(unsafe) public static var question3  = Question(correct: .three,
                                            hint: "Pure functions & immutability = FP.")
    nonisolated(unsafe) public static var question4  = Question(correct: .one,
                                            hint: "SwiftUI is declarative.")
    nonisolated(unsafe) public static var question5  = Question(correct: .three,
                                            hint: "Reactive programming handles async streams.")
    nonisolated(unsafe) public static var question6  = Question(correct: .two,
                                            hint: "POP = protocols + extensions with default implementations.")
    nonisolated(unsafe) public static var question7  = Question(correct: .two,
                                            hint: "Use let for immutability.")
    nonisolated(unsafe) public static var question8  = Question(correct: .three,
                                            hint: "for-in loops are imperative, not declarative.")
    nonisolated(unsafe) public static var question9  = Question(correct: .two,
                                            hint: "Combine is Apple’s built-in reactive framework.")
    nonisolated(unsafe) public static var question10 = Question(correct: .three,
                                            hint: "Imperative = UIKit’s step-by-step coding style.")
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
