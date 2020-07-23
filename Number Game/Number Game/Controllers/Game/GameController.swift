//
//  GameController.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var numberTextfield: UITextField!
    @IBOutlet private weak var tableView: OldAnswersTable!
    @IBOutlet private weak var endOfGameView: UIView!
    
    // MARK: Models
    let viewModel: GameModel = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.setModel(model: OldAnswersTableModel())
        viewModel.generateAnswer()
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberTextfield.becomeFirstResponder()
        navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func answerChanged(_ sender: Any) {
        if let text = numberTextfield.text, text.count == 4 {
            let item = viewModel.checkAnswerAndGetItem(answer: text)
            tableView.viewModel?.answersArray.insert(item, at: 0)
            if item.answerCorrectness == "++++" {
                endOfGameView.isHidden = false
                numberTextfield.endEditing(true)
                numberTextfield.isHidden = true
            }
            numberTextfield.text = ""
        }
    }
    
    @IBAction func newGameTouchUp(_ sender: Any) {
        tableView.setModel(model: OldAnswersTableModel())
        viewModel.generateAnswer()
        endOfGameView.isHidden = true
        numberTextfield.isHidden = false
        numberTextfield.becomeFirstResponder()
        tableView.reloadData()
    }
}
