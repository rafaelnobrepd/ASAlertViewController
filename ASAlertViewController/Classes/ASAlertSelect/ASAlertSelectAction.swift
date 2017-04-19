//
//  ASAlertSelectAction.swift
//  Pods
//
//  Created by Adriano Souza Costa on 19/04/17.
//
//

import Foundation

public class ASAlertSelectAction {
    
    fileprivate var _title: String
    fileprivate var _detail: String?
    fileprivate var _image: UIImage?
    fileprivate var _isSelected: Bool
    fileprivate var _onAction: (() -> Void)?
    
    public init(title: String, isSelected: Bool = false, detail: String? = nil, image: UIImage? = nil, onAction: (() -> Void)? = nil) {
        _title = title
        _detail = detail
        _image = image
        _isSelected = isSelected
        _onAction = onAction
    }
    
}

extension ASAlertSelectAction: ASAlertSelectOption {
    
    public var title: String {
        get { return _title }
        set { _title = newValue }
    }
    
    public var detail: String? {
        get { return _detail }
        set { _detail =  newValue }
    }
    
    public var image: UIImage? {
        get { return _image }
        set { _image = newValue }
    }
    
    public var isSelected: Bool {
        get { return _isSelected }
        set { _isSelected = newValue }
    }
    
    public var onAction: (() -> Void)? {
        get { return _onAction }
        set { _onAction = newValue }
    }
    
}
