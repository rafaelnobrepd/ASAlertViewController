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

    @IBOutlet fileprivate weak var dpDateTime: UIDatePicker?
    @IBOutlet fileprivate weak var lbDateDescription: UILabel?
    @IBOutlet fileprivate weak var btToday: UIButton?
    @IBOutlet fileprivate weak var btClear: UIButton?
    @IBOutlet fileprivate weak var vwCustomContent: UIView!

    // MARK: - Variables

    var date: Date? {
        get { return dpDateTime?.clampedDate }
        set { updateUI() }
    }
    var maxDate: Date? = nil {
        didSet { updateUI() }
    }
    var minDate: Date? = nil {
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

        updateUI()
        addObservers()
    }

    // MARK: - Private Methods

    fileprivate func updateUI() {
        btClear?.isEnabled = date != nil
        
        setupDatePicker()
    }

    fileprivate func setupDatePicker() {
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
        
        if let date = dpDateTime?.clampedDate {
            lbDateDescription?.text = formatter.string(from: date)
        }

        dpDateTime?.minuteInterval = interval
        dpDateTime?.date = date ?? Date()
        dpDateTime?.maximumDate = maxDate
        dpDateTime?.minimumDate = minDate
        
        btToday?.setTitle(label, for: .normal)
    }

    fileprivate func addObservers() {
        dpDateTime?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc fileprivate func selectDate(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    // MARK: - Actions
    
    @IBAction fileprivate func todayAction() {
        dpDateTime?.setDate(Date(), animated: true)
        date = dpDateTime?.clampedDate
    }
    
    @IBAction fileprivate func clearAction() {
        onClearAction?()
    }

}
