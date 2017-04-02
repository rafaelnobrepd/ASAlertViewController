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

    // MARK: - Components

    @IBOutlet weak var lbTitle: UILabel?
    @IBOutlet weak var lbMessage: UILabel?
    @IBOutlet weak var vwContent: UIView?
    @IBOutlet weak var svHandlers: UIStackView?
    @IBOutlet weak var lcHeightContent: NSLayoutConstraint?

    // MARK: - Variables

    fileprivate var _title: String? { didSet { updateUI() } }
    fileprivate var _message: String? { didSet { updateUI() } }
    fileprivate var _content: UIView? { didSet { updateContent() } }
    fileprivate var _handlers: [ASAlertHandler] = [] { didSet { updateHandlers() } }

    // MARK: - Lifecircle Class

    override public func loadView() {
        let bundle = Bundle(for: type(of: self))

        guard let view = bundle.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView else {
            fatalError()
        }

        self.view = view
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateContent()
        updateHandlers()
    }

    // MARK: - Public Methods

    public init(title: String? = nil, message: String? = nil, content: UIView? = nil) {
        _title = title
        _message = message
        _content = content

        super.init(nibName: nil, bundle: nil)
    }

    public func presentAlert(in viewController: UIViewController) {
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

    private func updateUI() {
        if let title = title {
            lbTitle?.text = title
            lbTitle?.isHidden = title.isEmpty
        }

        if let message = message {
            lbMessage?.text = message
            lbMessage?.isHidden = message.isEmpty
        }

    }

    private func updateContent() {
        _content?.removeFromSuperview()

        if let content = content {
            content.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            vwContent?.addSubview(content)
            lcHeightContent?.constant = content.bounds.height
        } else {
            lcHeightContent?.constant = 0
        }
    }

    private func updateHandlers() {
        let buttons = _handlers.map { ASHandlerButton(frame: .zero, handler: $0) }

        svHandlers?.subviews.forEach { $0.removeFromSuperview() }
        svHandlers?.axis = buttons.count > 2 ? .vertical : .horizontal

        buttons.forEach { button in
            svHandlers?.addArrangedSubview(button)
            button.onAction = { self.dismiss() }
        }
    }

    private func dismiss() {
        dismiss(animated: true, completion: nil)
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
