//
//  ASAlertDateController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/3/17.
//
//

import Foundation
import UIKit

open class ASAlertDateController: ASAlertDateTimeController {

    public init(title: String? = nil, message: String? = nil, date: Date? = nil) {
        super.init(title: title, message: message, type: .date, date: date)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
