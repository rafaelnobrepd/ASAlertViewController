//
//  ASAlertMultiselect.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation
import UIKit

open class ASAlertMultiselectController: ASAlertController {

    // MARK: - Variables

    fileprivate lazy var alertMultiselectView: ASAlertMultiselectView = {
        return ASAlertMultiselectView().nib
    }()

    fileprivate lazy var customHandlers: [ASAlertHandler] = {
        let selectValueHandler = ASAlertAction("Selecionar", type: .default, handler: {

        })

        let cancelHandler = ASAlertAction("Cancelar", type: .cancel, handler: {

        })

        return [selectValueHandler, cancelHandler]
    }()

    override var _content: UIView? {
        get { return alertMultiselectView }
        set { _content = alertMultiselectView }
    }

    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { _handlers = customHandlers }
    }

    // MARK: - Lifecircle Class

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    public init(title: String? = nil, message: String? = nil, options: [ASAlertMultiselectOption] = []) {
        super.init(title: title, message: message, content: nil)
        addOptions(options)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public Methods

    public func addOption(_ option: ASAlertMultiselectOption) {
        alertMultiselectView.options.append(option)
    }

    public func addOptions(_ options: [ASAlertMultiselectOption]) {
        alertMultiselectView.options += options
    }
    
}
