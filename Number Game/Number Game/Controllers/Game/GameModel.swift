//
//  GameModel.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class GameModel {
    
    var correctAnswer: String = ""
    
    func generateAnswer() {
        correctAnswer = ""
        while correctAnswer.count != 4 {
            let nextNumber: String = generateNextNumber()
            if !correctAnswer.contains(nextNumber) {
                correctAnswer.append(nextNumber)
            }
        }
        
        print("answer: ---> " + correctAnswer)
    }
    
    private func generateNextNumber() -> String {
        let number = Int.random(in: 0..<9)
        return "\(number)"
    }
    
    func checkAnswerAndGetItem(answer: String) -> AnswerItem {
        let item = AnswerItem()
        var answerCorrectness: String = ""
        for (index, answerChar) in answer.enumerated() {
            if answerChar == correctAnswer[index] {
                answerCorrectness += "+"
            } else if correctAnswer.contains(answerChar) {
                answerCorrectness += "-"
            }
        }
        
        item.answer = answer
        item.answerCorrectness = answerCorrectness
        return item
    }
}
