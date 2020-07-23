//
//  UITableView+Extensions.swift
//  Number Game
//
//  Created by yusuf terzi on 23.07.2020.
//  Copyright © 2020 yusufTerzi. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(_ cell: UITableViewCell.Type) {
        if cell.bundle?.path(forResource: cell.defaultNibName, ofType: "nib") != nil {
            register(cell.defaultNib, forCellReuseIdentifier: cell.defaultNibName)
        } else {
            register(cell, forCellReuseIdentifier: cell.defaultNibName)
        }
    }
    
    func indexPathIsValid(indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.row >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        return true
    }
    
    // swiftlint:disable force_cast
    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: cell.defaultNibName, for: indexPath) as! T
    }
    
    func scrollToBottom() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let row = self.numberOfRows(inSection: self.numberOfSections - 1) - 1
            let section = self.numberOfSections - 1
            let indexPath = IndexPath(
                row: row,
                section: section)
            if row >= 0 && section >= 0 && self.indexPathIsValid(indexPath: indexPath) {
                if self.hasRowAtIndexPath(indexPath: indexPath as NSIndexPath) {
                    self.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
    }
    
    func scrollToTop() {
        
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    func hasRowAtIndexPath(indexPath: NSIndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
    // swiftlint:enable force_cast
    
}

