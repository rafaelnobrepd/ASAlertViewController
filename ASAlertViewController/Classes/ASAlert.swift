//
//  ASAlert.swift
//  Pods
//
//  Created by Adriano Souza Costa on 3/31/17.
//
//

import Foundation
import UIKit

public protocol ASAlert {

    var title: String? { get set }
    var message: String? { get set }
    var content: UIView? { get set }
    var handlers:[ASAlertHandler] { get set }

}
