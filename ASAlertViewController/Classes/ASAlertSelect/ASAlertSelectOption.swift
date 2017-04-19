//
//  ASAlertSelectOption.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation

public protocol ASAlertSelectOption {

    var title: String { get set }
    var detail: String? { get set }
    var image: UIImage? { get set }
    var isSelected: Bool { get set }
    var onAction: (() -> Void)? { get set }

}
