//
//  UIView+Extension.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/2/17.
//
//

import Foundation
import UIKit

extension UIView {

    func loadNibFromName(_ name: String) -> UIView {
        let bundle = Bundle(for: type(of: self))

        guard let view = bundle.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            fatalError()
        }
        
        return view
    }

    func loadNib() -> UIView {
        return loadNibFromName(String(describing: type(of: self)))
    }

}
