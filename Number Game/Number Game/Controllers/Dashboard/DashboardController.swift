//
//  DashboardController.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {

    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private weak var oldGamesButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func newGameTouchUp(_ sender: Any) {
        if let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "gameScreen") as? GameController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
