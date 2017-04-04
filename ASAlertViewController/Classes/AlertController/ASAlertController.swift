//
//  ASAlertController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/1/17.
//
//

import Foundation
import UIKit

public class ASAlertController: UIViewController {

    // MARK: - Variables

    internal var _content: UIView? { didSet { updateContent() } }
    internal var _handlers: [ASAlertHandler] = [] { didSet { updateHandlers() } }
    
    fileprivate var _title: String? { didSet { updateUI() } }
    fileprivate var _message: String? { didSet { updateUI() } }

    private var alertView: ASAlertView = {
        let view = ASAlertView()
        return view.nib
    }()

    // MARK: - Lifecircle Class

    public init(title: String? = nil, message: String? = nil, content: UIView? = nil) {
        _title = title
        _message = message
        _content = content
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func loadView() {
        self.view = alertView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        updateContent()
        updateHandlers()
        addObservers()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    // MARK: - Public Methods

    public func present(in viewController: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve

        viewController.present(self, animated: true, completion: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    public func addAction<T: ASAlertHandler>(_ action: T) {
        _handlers.append(action)
    }

    public func addActions<T: ASAlertHandler>(_ actions: [T]) {
        _handlers = actions
    }

    // MARK: - Private Methods

    internal func updateContent() {
//        _content?.removeFromSuperview()

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
        dismiss(animated: true, completion: nil)
    }
    
    private func addObservers() {
        
    }
    
    private func updateSizeContainerContent() {
        print(alertView.vwContent?.frame)
    }
    
    private func updateUI() {
        alertView.lbTitle?.text = title
        alertView.lbTitle?.isHidden = title?.isEmpty ?? true

        alertView.lbMessage?.text = message
        alertView.lbMessage?.isHidden = message?.isEmpty ?? true

        animation()
    }

    private func animation() {
        alertView.vwAlert?.alpha = 0
        alertView.vwAlert?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)

        UIView.animate(withDuration: 0.3) { 
            self.alertView.vwAlert?.transform = CGAffineTransform.identity
            self.alertView.vwAlert?.alpha = 1
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
