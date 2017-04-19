//
//  ASAlertSelectController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation
import UIKit

open class ASAlertSelectController: ASAlertController {

    // MARK: - Variables

    public var onSelectedOption: ((_ option: ASAlertSelectOption?) -> Void)?
    
    override var _content: UIView? {
        get { return alertSelectView }
        set { _content = alertSelectView }
    }
    
    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { _handlers = customHandlers }
    }

    internal var customHandlers: [ASAlertHandler] {
        let cancelHandler = ASAlertAction("Cancelar", type: .cancel, handler: {
            self.dismiss()
        })

        return [cancelHandler]
    }
    
    internal lazy var alertSelectView: ASAlertSelectView = {
        return ASAlertSelectView().nib
    }()

    // MARK: - Lifecircle Class

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupSelectedOption()
    }

    public init(title: String? = nil, message: String? = nil, options: [ASAlertSelectOption] = []) {
        super.init(title: title, message: message, content: nil)
        addOptions(options)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public Methods

    public func addOption(_ option: ASAlertSelectOption) {
        alertSelectView.options.append(option)
    }

    public func addOptions(_ options: [ASAlertSelectOption]) {
        alertSelectView.options += options
    }
    
    // MARK: - Private Methods
    
    internal func setupSelectedOption() {
        alertSelectView.onSelectedOptions = { options in
            let firstOption = options.first
            firstOption?.onAction?()
            
            self.onSelectedOption?(firstOption)
            self.dismiss()
        }
    }
    
}
