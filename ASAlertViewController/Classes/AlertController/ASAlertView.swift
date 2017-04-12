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
    @IBOutlet weak var vwOverlay: UIView?
    @IBOutlet weak var svHandlers: UIStackView?
    @IBOutlet weak var btnClose: UIButton?

    @IBOutlet weak var lcHeightContent: NSLayoutConstraint?
    @IBOutlet weak var lcRightMargin: NSLayoutConstraint?

    // MARK: - Variables
    
    var config: ASAlertConfig = ASAlertConfig.shared
    var closeAction: (() -> Void)?
    
    var nib: ASAlertView {
        guard let view = loadNib() as? ASAlertView else { fatalError() }
        return view
    }

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupRecognizer()
    }
    
    // MARK: - Private Methods
    
    private func setupRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        vwOverlay?.addGestureRecognizer(tapRecognizer)
        vwOverlay?.isUserInteractionEnabled = config.closeOnTapInOverlay
    }
    
    private func setupUI() {
        lbTitle?.textColor = config.primaryColor
        lbMessage?.textColor = config.secondColor
        btnClose?.isHidden = !config.closeButton
        lcRightMargin?.constant = config.closeButton ? 35 : 15
        vwAlert?.layer.cornerRadius = config.cornerRadius
        vwAlert?.alpha = 0
    }
    
    // MARK: - Actions
    
    @IBAction private func close() {
        closeAction?()
    }

}
