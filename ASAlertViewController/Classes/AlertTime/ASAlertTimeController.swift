//
//  ASAlertTimeController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/3/17.
//
//

import Foundation
import UIKit

open class ASAlertTimeController: ASAlertDateTimeController {

    // MARK: - Lifecircle Class

    public init(title: String? = nil, message: String? = nil, date: Date? = nil, interval: Int = 15) {
        super.init(title: title, message: message, type: .time, date: date)
        self.interval = interval
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
