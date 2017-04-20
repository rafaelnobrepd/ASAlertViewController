//
//  ASAlertSelectOption.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/12/17.
//
//

import Foundation

public protocol ASAlertSelectOption {

    var title: String { get }
    var detail: String? { get }
    var image: UIImage? { get }
    var isSelected: Bool { get set }
    var onAction: (() -> Void)? { get }

}
