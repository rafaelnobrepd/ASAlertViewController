//
//  ASAlertMultiselectOption.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation

protocol ASAlertMultiselectOption {

    var title: String { get set }
    var detail: String { get set }
    var image: UIImage { get set }
    var selected: Bool { get set }
    var onAction: (() -> Void)? { get set }

}
