//
//  CustomView.swift
//  Pods
//
//  Created by Adriano Souza Costa on 3/31/17.
//
//

import Foundation
import UIKit

@IBDesignable

class CustomView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet { updateUI() }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { updateUI() }
    }

    @IBInspectable var borderColor: UIColor = .darkGray {
        didSet { updateUI() }
    }

    // MARK: - Private Methods

    fileprivate func updateUI() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }

}
