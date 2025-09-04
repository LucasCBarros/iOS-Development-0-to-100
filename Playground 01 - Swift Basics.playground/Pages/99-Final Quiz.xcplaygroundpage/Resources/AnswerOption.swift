//
//  AnswerOption.swift
//  
//
//  Created by Lucas C Barros on 2025-09-03.
//

import Foundation

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

    /// Answer the question
    public func answer(_ option: AnswerOption? = nil) {
        self.selectedAnswer = option
    }

    /// Check if answered correctly
    public var isCorrect: Bool {
        return selectedAnswer == correctAnswer
    }

    /// Show a hint
    public func hint() {
        print("💡 Hint: \(hintMessage)")
    }
}

public class Quiz {
    // Questions only store correct answers internally
//    public nonisolated(unsafe) static let question1 = Question(correct: .two)   // Correct: let
//    public nonisolated(unsafe) static let question2 = Question(correct: .three) // Correct: Set
//    public nonisolated(unsafe) static let question3 = Question(correct: .two)   // Correct: 7

    // Questions are public so they can be answered from the playground
    nonisolated(unsafe) public static var question1  = Question(correct: .two,
                                            hint: "It’s used to declare constants.")
    nonisolated(unsafe) public static var question2  = Question(correct: .one,
                                            hint: "Whole numbers default to this type.")
    nonisolated(unsafe) public static var question3  = Question(correct: .three,
                                            hint: "Used to combine two true/false conditions.")
    nonisolated(unsafe) public static var question4  = Question(correct: .three,
                                            hint: "It lets you embed values inside strings.")
//    public static var question5  = Question(correct: .three,
//                                            hint: "This collection guarantees uniqueness.")
//    public static var question6  = Question(correct: .one,
//                                            hint: "Groups multiple values of different types.")
//    public static var question7  = Question(correct: .two,
//                                            hint: "Safest way to unwrap an optional.")
//    public static var question8  = Question(correct: .three,
//                                            hint: "Best loop for collections.")
//    public static var question9  = Question(correct: .two,
//                                            hint: "Allows stepping with custom increments.")
//    public static var question10 = Question(correct: .four,
//                                            hint: "Exits a function early if a condition fails.")

//    public static func checkScore() {
//        let questions = [question1,
//                         question2,
//                         question3] // extend list
//        let total = questions.count
//        let correct = questions.filter { $0.isCorrect }.count
//        let percentage = Double(correct) / Double(total) * 100
//
//        print("✅ Correct: \(correct)/\(total)")
//        print("📊 Score: \(String(format: "%.1f", percentage))%")
//
//        switch correct {
//        case total:
//            print("🎉 Amazing!!! Perfect score!")
//        case (total-2)...(total-1):
//            print("👍 Good job, just a little review needed.")
//        case 0:
//            print("😅 Please review the chapter and try again.")
//        default:
//            print("Keep practicing, you’re getting there!")
//        }
//    }
}


public extension Quiz {
    static func checkScore() {
        let questions: [Question] = [ question1, question2, question3, question4] //, question5, question6, question7, question8, question9, question10]

        let total = questions.count
        let correct = questions.filter { $0.isCorrect }.count
        let percentage = Double(correct) / Double(total) * 100

        print("✅ Correct: \(correct)/\(total)")
        print("📊 Score: \(String(format: "%.1f", percentage))%")

        switch correct {
        case total:
            print("🎉 Amazing!!! Perfect score!")
        case (total-2)...(total-1):
            print("👍 Good job, just a little review needed.")
        case 0:
            print("😅 Please review the chapter and try again.")
        default:
            print("Keep practicing, you’re getting there!")
        }
    }
}
