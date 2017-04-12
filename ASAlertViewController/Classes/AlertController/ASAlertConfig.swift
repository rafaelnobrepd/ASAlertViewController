//
//  ASAlertConfig.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/11/17.
//
//

import Foundation

open class ASAlertConfig {

    public static var shared = ASAlertConfig()

    public var closeOnTapInOverlay: Bool = true
    public var closeButton: Bool = false
    public var primaryColor: UIColor = .black
    public var secondColor: UIColor = .black
    public var cornerRadius: CGFloat = 12.5
    
}
