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

    fileprivate lazy var alertMultselectView: ASAlertMultselectView = {
        return ASAlertMultselectView().nib
    }()

    fileprivate lazy var customHandlers: [ASAlertHandler] = {
        let selectValueHandler = ASAlertAction("Selecionar", type: .default, handler: {

        })
        let clearHandler = ASAlertAction("Limpar", type: .destructive, handler: {

        })

        return [clearHandler, selectValueHandler]
    }()

    override var _content: UIView? {
        get { return alertMultselectView }
        set { super._content = alertMultselectView }
    }

    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { super._handlers = customHandlers }
    }

    // MARK: - Lifecircle Class

    open override func viewDidLoad() {
        super.viewDidLoad()
    }

    public init(title: String? = nil, message: String? = nil) {
        super.init(title: title, message: message, content: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
