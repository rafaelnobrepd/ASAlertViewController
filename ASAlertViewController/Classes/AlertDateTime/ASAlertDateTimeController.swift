//
//  ASAlertDateTimeController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/2/17.
//
//

import Foundation
import UIKit

open class ASAlertDateTimeController: ASAlertController {

    // MARK: - Variables

    open var date: Date? {
        get { return alertDateTimeView.date }
        set { alertDateTimeView.date = newValue }
    }
    open var interval: Int {
        get { return alertDateTimeView.interval }
        set { alertDateTimeView.interval = newValue }
    }

    open var type: ASAlertDateTimeType = .dateTime

    open var onSelectDateAction: ((_ date: Date?) -> Void)?

    fileprivate lazy var alertDateTimeView: ASAlertDateTimeView = {
        let alertDateTime = ASAlertDateTimeView().nib
        alertDateTime.onClearAction = {
            self.onSelectDateAction?(nil)
            self.dismiss()
        }
        
        return alertDateTime
    }()

    fileprivate lazy var customHandlers: [ASAlertHandler] = {
        let selectDateHandler = ASAlertAction("Selecionar", type: .default, handler: {
            self.onSelectDateAction?(self.date)
        })
        let closeHandler = ASAlertAction("Cancelar", type: .destructive)

        return [closeHandler, selectDateHandler]
    }()

    override var _content: UIView? {
        get { return alertDateTimeView }
        set { super._content = alertDateTimeView }
    }

    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { super._handlers = customHandlers }
    }

    // MARK: - Lifecircle Class

    open override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    public init(title: String? = nil, message: String? = nil, type: ASAlertDateTimeType, date: Date? = nil, interval: Int = 15) {
        super.init(title: title, message: message, content: nil)
        
        self.type = type
        self.date = date
        self.interval = interval
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private methods

    fileprivate func updateUI() {
        alertDateTimeView.type = type
        alertDateTimeView.date = date
        alertDateTimeView.interval = interval
    }

}
