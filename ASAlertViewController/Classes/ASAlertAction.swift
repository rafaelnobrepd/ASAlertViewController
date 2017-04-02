//
//  ASAlertAction.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/1/17.
//
//

import Foundation

public struct ASAlertAction {

    // MARK: - Variables

    fileprivate var _title: String
    fileprivate var _type: ASAHandlerType
    fileprivate var _handler: (() -> ())?

    // MARK: - Lifecircle Class

    public init(title: String, type: ASAHandlerType, handler: (() -> ())? = nil) {
        _title = title
        _type = type
        _handler = handler
    }

}

extension ASAlertAction: ASAlertHandler {

    public var title: String {
        get { return _title }
        set { _title = newValue }
    }

    public var type: ASAHandlerType {
        get { return _type }
        set { _type = newValue }
    }

    public var handler: (()->())? {
        get { return _handler }
        set { _handler = newValue }
    }

}
