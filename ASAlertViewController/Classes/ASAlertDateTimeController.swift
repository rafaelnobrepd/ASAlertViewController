//
//  ASAlertDateTimeController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/2/17.
//
//

import Foundation
import UIKit

public class ASAlertDateTimeController: ASAlertController {

    // MARK: - Variables

    public var date: Date? {
        get { return alertDateTimeView.date }
        set { alertDateTimeView.date = newValue }
    }
    public var interval: Int {
        get { return alertDateTimeView.interval }
        set { alertDateTimeView.interval = newValue }
    }

    public var type: ASAlertDateTimeType = .dateTime

    public var onSelectDateAction: ((_ date: Date?)->())?

    private lazy var alertDateTimeView: ASAlertDateTimeView = {
        let alertDateTime = ASAlertDateTimeView()
        return alertDateTime.nib
    }()

    private lazy var customHandlers: [ASAlertHandler] = {
        let selectDateHandler = ASAlertAction("Selecionar", type: .default, handler: {
            self.onSelectDateAction?(self.date)
        })
        let selectTodayHandler = ASAlertAction("Hoje", type: .default, closeOnAction: false, handler: { 
            self.date = Date()
        })
        let closeHandler = ASAlertAction("Cancelar", type: .destructive)

        return [selectTodayHandler, selectDateHandler, closeHandler]
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

    public override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    public init(title: String? = nil, message: String? = nil, type: ASAlertDateTimeType = .dateTime, date: Date? = Date(), interval: Int = 15) {
        super.init(title: title, message: message, content: nil)
        self.type = type
        self.date = date
        self.interval = interval
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private methods

    private func updateUI() {
        alertDateTimeView.type = type
        alertDateTimeView.date = date
        alertDateTimeView.interval = interval
    }

}
