//
//  ASAlertViewController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/3/17.
//
//

import Foundation
import UIKit

class ASAlertViewController: UIView {

    // MARK: - Componets

    @IBOutlet weak var lbTitle: UILabel?
    @IBOutlet weak var lbMessage: UILabel?
    @IBOutlet weak var vwContent: UIView?
    @IBOutlet weak var vwAlert: UIView?
    @IBOutlet weak var svHandlers: UIStackView?
    @IBOutlet weak var lcHeightContent: NSLayoutConstraint?

    // MARK: - Variables
    
    var nib: ASAlertViewController {
        guard let view = loadNib() as? ASAlertViewController else {
            fatalError()
        }
        return view
    }
    
}
