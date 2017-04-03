//
//  ASAlertTimeController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/3/17.
//
//

import Foundation
import UIKit

public class ASAlertTimeController: ASAlertDateTimeController {

    // MARK: - Variables

    private lazy var customHandlers: [ASAlertHandler] = {
        let selectDateHandler = ASAlertAction("Selecionar", type: .default, handler: {
            self.onSelectDateAction?(self.date)
        })
        let closeHandler = ASAlertAction("Cancelar", type: .destructive)

        return [closeHandler, selectDateHandler]
    }()

    override var _handlers: [ASAlertHandler] {
        get { return customHandlers }
        set { _handlers = customHandlers }
    }

    // MARK: - Lifecircle Class

    public init(title: String? = nil, message: String? = nil, date: Date? = Date(), interval: Int = 15) {
        super.init(title: title, message: message, type: .time, date: date)
        self.interval = interval
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
