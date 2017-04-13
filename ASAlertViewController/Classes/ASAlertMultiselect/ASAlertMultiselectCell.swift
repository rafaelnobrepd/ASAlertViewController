//
//  ASAlertMultiselectCell.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation
import UIKit

class ASAlertMultiselectCell: UITableViewCell {

    // MARK: - Public methods

    func setup(from model: ASAlertMultiselectOption) {
        textLabel?.text = model.title
        detailTextLabel?.text = model.detail
        imageView?.image = model.image
        accessoryType = model.selected ? .checkmark : .none
    }

}
