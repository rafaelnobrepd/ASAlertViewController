//
//  ASAlertHandler.swift
//  Pods
//
//  Created by Adriano Souza Costa on 3/31/17.
//
//

import Foundation

public enum ASAHandlerType {
    case `default`
    case destructive
    case cancel

    public var fontStyle:(font: UIFont, color: UIColor) {
        let sizeFont: CGFloat = 17
        let defaultColor: UIColor = UIColor(red: 10/255, green: 96/255, blue: 255/255, alpha: 1)
        let destructColor: UIColor = UIColor(red: 252/255, green: 33/255, blue: 37/255, alpha: 1)

        switch self {
        case .default:
            return (font: UIFont.systemFont(ofSize: sizeFont), color: defaultColor)
        case .destructive:
            return (font: UIFont.systemFont(ofSize: sizeFont), color: .red)
        case .cancel:
            return (font: UIFont.boldSystemFont(ofSize: sizeFont), defaultColor)
        }
    }
}

public protocol ASAlertHandler {

    var title: String { get set }
    var handler: (()->())? { get set }
    var type: ASAHandlerType { get set }
    var closeOnAction: Bool { get }

}

extension ASAlertHandler {

    public var closeOnAction: Bool {
        get { return true }
    }

}
