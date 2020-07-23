//
//  GameController.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet private weak var numberTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        numberTextfield.becomeFirstResponder()
    }

}
