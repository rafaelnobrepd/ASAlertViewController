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

    public var date: Date? {
        get { return alertDateTimeView.date }
        set { alertDateTimeView.date = newValue }
    }
    
    public var interval: Int {
        get { return alertDateTimeView.interval }
        set { alertDateTimeView.interval = newValue }
    }

    public var maxDate: Date? {
        get { return alertDateTimeView.maxDate }
        set { alertDateTimeView.maxDate = newValue }
    }
    
    public var minDate: Date? {
        get { return alertDateTimeView.minDate }
        set { alertDateTimeView.minDate = newValue }
    }
    
    public var type: ASAlertDateTimeType = .dateTime
    public var onSelectedDateAction: ((_ date: Date?) -> Void)?
    public var onValueChange: ((_ date: Date?) -> Void)?

    fileprivate lazy var alertDateTimeView: ASAlertDateTimeView = {
        return ASAlertDateTimeView().nib
    }()

    fileprivate lazy var customHandlers: [ASAlertHandler] = {
        let clearHandler = ASAlertAction("Limpar", type: .destructive, handler: {
            self.onSelectedDateAction?(nil)
        })
        
        let selectDateHandler = ASAlertAction("Selecionar", type: .default, handler: {
            self.onSelectedDateAction?(self.date)
        })

        return [selectDateHandler, clearHandler]
    }()

    override var _content: UIView? {
        get { return alertDateTimeView }
        set { _content = alertDateTimeView }
    }

    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { _handlers = customHandlers }
    }

    // MARK: - Lifecircle Class

    open override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupHandlers()
    }

    public init(title: String? = nil, message: String? = nil, type: ASAlertDateTimeType, date: Date? = nil, minDate: Date? = nil, maxDate: Date? = nil, interval: Int = 15) {
        super.init(title: title, message: message, content: nil)
        
        self.type = type
        self.date = date
        self.minDate = minDate
        self.maxDate = maxDate
        self.interval = interval
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private methods

    private func setupUI() {
        alertDateTimeView.type = type
        alertDateTimeView.date = date
        alertDateTimeView.maxDate = maxDate
        alertDateTimeView.minDate = minDate
        alertDateTimeView.interval = interval
    }

    private func setupHandlers() {
        alertDateTimeView.onValueChange = onValueChange
    }

}
