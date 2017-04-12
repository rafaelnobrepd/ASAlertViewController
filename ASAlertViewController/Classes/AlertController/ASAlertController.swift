//
//  ASAlertController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/1/17.
//
//

import Foundation
import UIKit

open class ASAlertController: UIViewController {

    // MARK: - Variables

    public var onPresented: (() -> Void)?
    public var onDismiss: (() -> Void)?
    
    internal var _content: UIView?
    internal var _handlers: [ASAlertHandler] = []

    fileprivate var _title: String?
    fileprivate var _message: String?

    fileprivate var alertView: ASAlertView = {
        return ASAlertView().nib
    }()

    private var config: ASAlertConfig = ASAlertConfig.shared

    // MARK: - Lifecircle Class

    public init(title: String? = nil, message: String? = nil, content: UIView? = nil) {
        _title = title
        _message = message
        _content = content
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override open func loadView() {
        view = alertView
    }

    override open func viewDidLoad() {
        super.viewDidLoad()

        setupContent()
        setupHandlers()
        setupCloseAction()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    // MARK: - Public Methods

    open func present(in viewController: UIViewController, presentCompleted: (() -> Void)? = nil) {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve

        viewController.present(self, animated: true, completion: presentCompleted)
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    open func addAction<T: ASAlertHandler>(_ action: T) {
        _handlers.append(action)
    }

    open func addActions<T: ASAlertHandler>(_ actions: [T]) {
        _handlers = actions
    }

    // MARK: - Private Methods

    private func setupUI() {
        alertView.config = config

        alertView.lbTitle?.text = title
        alertView.lbTitle?.isHidden = title?.isEmpty ?? true

        alertView.lbMessage?.text = message
        alertView.lbMessage?.isHidden = message?.isEmpty ?? true

        alertView.vwAlert?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

        UIView.animate(withDuration: 0.26, delay: 0, options: [.curveEaseInOut], animations: {
            self.alertView.vwAlert?.transform = .identity
            self.alertView.vwAlert?.alpha = 1
        }) { (finish) in
            if finish { self.onPresented?() }
        }
    }

    private func setupHandlers() {
        let buttons = _handlers.map { ASHandlerButton(frame: .zero, handler: $0) }

        alertView.svHandlers?.subviews.forEach { $0.removeFromSuperview() }
        alertView.svHandlers?.axis = buttons.count > 2 ? .vertical : .horizontal

        buttons.forEach { button in
            alertView.svHandlers?.addArrangedSubview(button)

            button.onAction = {
                if button.closeOnAction { self.dismiss() }
            }
        }
    }

    private func dismiss() {
        dismiss(animated: true, completion: onDismiss)
    }

    private func setupContent() {
        _content?.removeFromSuperview()

        if let content = content, let vwContent = alertView.vwContent {
            let width = Int(vwContent.bounds.size.width)
            let height = Int(content.bounds.size.height)

            content.frame = CGRect(x: 0, y: 0, width: width, height: height)
            vwContent.addSubview(content)

            alertView.lcHeightContent?.constant = content.bounds.height
        } else {
            alertView.lcHeightContent?.constant = 0
        }
    }
    
    private func setupCloseAction() {
        alertView.closeAction = {
            self.dismiss()
        }
    }

}

extension ASAlertController: ASAlert {

    open override var title: String? {
        get { return _title }
        set { _title = newValue }
    }

    public var message: String? {
        get { return _message }
        set { _message = newValue }
    }

    public var content: UIView? {
        get { return _content }
        set { _content = newValue }
    }

    public var handlers: [ASAlertHandler] {
        get { return _handlers }
        set { _handlers = newValue }
    }
    
}
