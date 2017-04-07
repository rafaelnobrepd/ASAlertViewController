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

    public var onDismiss: (() -> Void)?
    
    public var closeOnTapInOverlay: Bool = true {
        didSet { updateUI() }
    }
    
    public var showCloseButton: Bool = true {
        didSet { updateUI() }
    }
    
    public var primaryColor: UIColor = UIColor(red: 3/255, green: 66/255, blue: 114/255, alpha: 1) {
        didSet { updateUI() }
    }
    
    internal var _content: UIView? {
        didSet { updateContent() }
    }
    
    internal var _handlers: [ASAlertHandler] = [] {
        didSet { updateHandlers() }
    }
    
    fileprivate var _title: String? {
        didSet { updateUI() }
    }
    
    fileprivate var _message: String? {
        didSet { updateUI() }
    }

    fileprivate var alertView: ASAlertView = {
        return ASAlertView().nib
    }()

    // MARK: - Lifecircle Class

    public init(title: String? = nil, message: String? = nil, content: UIView? = nil) {
        _title = title
        _message = message
        _content = content
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override open func loadView() {
        self.view = alertView
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        setupCloseAction()
        
        updateContent()
        updateHandlers()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
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

    internal func updateContent() {
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
    
    internal func updateHandlers() {
        let buttons = _handlers.map { ASHandlerButton(frame: .zero, handler: $0) }
        
        alertView.svHandlers?.subviews.forEach { $0.removeFromSuperview() }
        alertView.svHandlers?.axis = buttons.count > 2 ? .vertical : .horizontal
        
        buttons.forEach { button in
            alertView.svHandlers?.addArrangedSubview(button)
            button.onAction = { if button.closeOnAction { self.dismiss() } }
        }
    }
    
    internal func dismiss() {
        dismiss(animated: true, completion: onDismiss)
    }
    
    fileprivate func updateUI() {
        alertView.primaryColor = primaryColor
        
        alertView.lbTitle?.text = title
        alertView.lbTitle?.isHidden = title?.isEmpty ?? true

        alertView.lbMessage?.text = message
        alertView.lbMessage?.isHidden = message?.isEmpty ?? true
        
        alertView.closeOnTapInOverlay = closeOnTapInOverlay
        alertView.showCloseButton = showCloseButton
        
        animation()
    }

    fileprivate func animation() {
        alertView.vwAlert?.alpha = 0
        alertView.vwAlert?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

        UIView.animate(withDuration: 0.2) {
            self.alertView.vwAlert?.transform = CGAffineTransform.identity
            self.alertView.vwAlert?.alpha = 1
        }
    }
    
    private func setupCloseAction() {
        alertView.closeAction = { self.dismiss() }
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
