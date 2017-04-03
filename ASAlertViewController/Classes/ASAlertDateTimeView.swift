//
//  ASAlertDateTimeView.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/2/17.
//
//

import Foundation
import UIKit

public enum ASAlertDateTimeType {

    case date
    case time
    case dateTime

}

class ASAlertDateTimeView: UIView {

    // MARK: - Components

    @IBOutlet private weak var dpDateTime: UIDatePicker?
    @IBOutlet private weak var lbDateDescription: UILabel?
    @IBOutlet private weak var btToday: UIButton?
    @IBOutlet private weak var btClear: UIButton?

    // MARK: - Variables

    var date: Date? = Date() {
        didSet { updateUI() }
    }
    var type: ASAlertDateTimeType = .dateTime {
        didSet { updateUI() }
    }
    var interval: Int = 15 {
        didSet { updateUI() }
    }
    var nib: ASAlertDateTimeView {
        guard let view = loadNib() as? ASAlertDateTimeView else {
            fatalError()
        }
        return view
    }
    
    var onTodayAction: (() -> Void)?
    var onClearAction: (() -> Void)?

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()

        date = dpDateTime?.date

        updateUI()
        addObservers()
    }
    
    deinit {
        if let dpDateTime = dpDateTime {
            self.removeObserver(dpDateTime, forKeyPath: "frame")
        }
    }

    // MARK: - Private Methods

    private func updateUI() {
        btClear?.isEnabled = date != nil
        
        setupDatePicker()
    }

    private func setupDatePicker() {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        
        var label = "Hoje"
        
        switch type {
        case .date:
            dpDateTime?.datePickerMode = .date
            formatter.dateStyle = .long
            formatter.timeStyle = .none
        case .time:
            dpDateTime?.datePickerMode = .time
            label = "Agora"
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        case .dateTime:
            dpDateTime?.datePickerMode = .dateAndTime
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
        }
        
        if let date = dpDateTime?.date {
            lbDateDescription?.text = formatter.string(from: date)
        }

        dpDateTime?.minuteInterval = interval
        dpDateTime?.date = date ?? Date()
        btToday?.setTitle(label, for: .normal)
    }

    private func addObservers() {
        dpDateTime?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc private func selectDate(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    // MARK: - Actions
    
    @IBAction private func todayAction() {
        dpDateTime?.date = Date()
        date = dpDateTime?.date
    }
    
    @IBAction private func clearAction() {
        onClearAction?()
    }

}
