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
    @IBOutlet weak var lcHeightContent: NSLayoutConstraint?
    @IBOutlet weak var btnClose: UIButton?

    // MARK: - Variables
    
    var closeAction: (() -> Void)?
    
    var primaryColor: UIColor = UIColor(red: 3/255, green: 66/255, blue: 114/255, alpha: 1) {
        didSet { updateUI() }
    }
    
    var closeOnTapInOverlay: Bool = true {
        didSet { setupRecognizer() }
    }
    
    var showCloseButton: Bool = true {
        didSet { updateUI() }
    }
    
    var nib: ASAlertView {
        guard let view = loadNib() as? ASAlertView else { fatalError() }
        return view
    }

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupRecognizer()
        updateUI()
    }
    
    // MARK: - Private Methods
    
    private func setupRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(close))
        vwOverlay?.addGestureRecognizer(tapRecognizer)
        vwOverlay?.isUserInteractionEnabled = closeOnTapInOverlay
    }
    
    private func updateUI() {
        lbTitle?.textColor = primaryColor
        btnClose?.isHidden = !showCloseButton
    }
    
    // MARK: - Actions
    
    @IBAction private func close() {
        closeAction?()
    }

}
