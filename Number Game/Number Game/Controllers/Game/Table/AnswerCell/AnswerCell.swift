//
//  AnswerCell.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class AnswerCell: UITableViewCell {

    @IBOutlet private weak var answerLabel: UILabel!
    @IBOutlet private weak var answerCorrectnessLabel: UILabel!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    func setData(data: AnswerItem) {
        answerLabel.text = data.answer
        answerCorrectnessLabel.text = data.answerCorrectness
        let width = max(CGFloat(300 - (data.order * 20)), 160)
        widthConstraint.constant = width
    }
    
}
