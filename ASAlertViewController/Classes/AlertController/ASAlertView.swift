//
//  ASAlertView.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/3/17.
//
//

import Foundation
import UIKit

class ASAlertView: UIView {

    // MARK: - Componets

    @IBOutlet weak var lbTitle: UILabel?
    @IBOutlet weak var lbMessage: UILabel?
    @IBOutlet weak var vwContent: UIView?
    @IBOutlet weak var vwAlert: UIView?
    @IBOutlet weak var svHandlers: UIStackView?
    @IBOutlet weak var lcHeightContent: NSLayoutConstraint?

    // MARK: - Variables
    
    var nib: ASAlertView {
        guard let view = loadNib() as? ASAlertView else { fatalError() }
        return view
    }


    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
