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

    public var onSelectDateAction: ((_ date: Date?)->())?

    private var type: ASAlertDateTimeType = .dateTime

    private lazy var alertDateTimeView: ASAlertDateTimeView = {
        let alertDateTime = ASAlertDateTimeView()
        return alertDateTime.nib
    }()

    private lazy var customHandlers: [ASAlertHandler] = {
        let selectDateHandler = ASAlertAction("Selecionar", type: .default, handler: {
            self.onSelectDateAction?(self.alertDateTimeView.date)
        })
        let selectTodayHandler = ASAlertAction("Hoje", type: .default, closeOnAction: false, handler: { 
            self.alertDateTimeView.date = Date()
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

    public init(title: String? = nil, message: String? = nil, type: ASAlertDateTimeType) {
        super.init(title: title, message: message, content: nil)
        self.type = type
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private methods

    private func updateUI() {
        alertDateTimeView.type = type
    }

}
