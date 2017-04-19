//
//  ASAlertSelectCell.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation
import UIKit

class ASAlertSelectCell: UITableViewCell {
    
    // MARK: - Public methods

    func setup(from model: ASAlertSelectOption) {
        textLabel?.text = model.title
        detailTextLabel?.text = model.detail
        imageView?.image = model.image
        accessoryType = model.isSelected ? .checkmark : .none
    }

}
