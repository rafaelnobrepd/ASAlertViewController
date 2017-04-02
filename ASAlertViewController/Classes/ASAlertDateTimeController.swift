//
//  ASAlertDateTimeController.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/2/17.
//
//

import Foundation
import UIKit

public class ASAlertDateTimeController: ASAlertController {

    // MARK: - Variables

    var onSelectDateAction: ((_ date: Date?)->())?

    private var alertDateTimeView: ASAlertDateTimeView?
    private var type: ASAlertDateTimeType = .dateTime

    // MARK: - Lifecircle Class

    public override func viewDidLoad() {
        loadAlertDateTimeView()
        setupActions()

        super.viewDidLoad()

        updateUI()
    }

    public init(title: String? = nil, message: String? = nil, type: ASAlertDateTimeType) {
        super.init(title: title, message: message, content: nil)
        self.type = type
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Private methods

    private func updateUI() {
        alertDateTimeView?.type = type
    }

    private func loadAlertDateTimeView() {
        let bundle = Bundle(for: type(of: self))
        let nibName = "ASAlertDateTimeView"

        guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? ASAlertDateTimeView else {
            fatalError()
        }

        alertDateTimeView = view
    }

    private func setupActions() {
        onSelectDateAction = alertDateTimeView?.onSelectDateAction
    }

    // MARK: - ASAlert Protocol

    override public var content: UIView? {
        get {
            return alertDateTimeView
        }
        set { _content = alertDateTimeView }
    }

}
