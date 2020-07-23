//
//  OldAnswersTableModel.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class AnswerItem {
    var answer: String = ""
    var answerCorrectness: String = ""
    var order: Int = 0
}

class OldAnswersTableModel {
    var answersArray: [AnswerItem] = .init() {
        didSet {
            answersArrayChanged?()
        }
    }
    
    var answersArrayChanged: VoidHandler?
}

