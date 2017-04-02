//
//  ASHandlerButton.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/1/17.
//
//

import Foundation
import UIKit

class ASHandlerButton: UIButton {

    // MARK: - Variables

    var onAction: (()->())?

    private var alertHandler: ASAlertHandler?

    // MARK: - Lifecircle Class

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(frame: CGRect, handler: ASAlertHandler? = nil) {
        super.init(frame: frame)

        alertHandler = handler

        updateUI()
        setupAction()
    }

    // MARK: - Private Methods

    private func updateUI() {
        setTitle(alertHandler?.title, for: .normal)
        setTitleColor(alertHandler?.type.fontStyle.color, for: .normal)
        titleLabel?.font = alertHandler?.type.fontStyle.font
        backgroundColor = .white

        translatesAutoresizingMaskIntoConstraints = false;
        heightAnchor.constraint(equalToConstant: 45).isActive = true
    }

    private func setupAction() {
        addTarget(self, action: #selector(callHandler), for: .touchUpInside)
        addTarget(self, action: #selector(drag), for: .touchDown)
        addTarget(self, action: #selector(drag), for: .touchDragEnter)
        addTarget(self, action: #selector(exitDrag), for: .touchDragExit)
    }

    @objc private func callHandler() {
        onAction?()
        alertHandler?.handler?()
    }

    @objc private func drag() {
        UIView.animate(withDuration: 0.26) {
            self.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
        }
    }

    @objc private func exitDrag() {
        UIView.animate(withDuration: 0.26) {
            self.backgroundColor = .white
        }
    }

}
