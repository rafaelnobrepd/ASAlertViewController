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

    // MARK: - Variables

    var date: Date? {
        didSet { updateUI() }
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

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()
        
        updateUI()
        addObservers()
    }

    // MARK: - Private Methods

    fileprivate func updateUI() {
        setupDate()
        setupDatePicker()
    }

    fileprivate func setupDate() {
        if date == nil { date = dpDateTime?.clampedDate }
    }
    
    fileprivate func setupDatePicker() {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        
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

        dpDateTime?.date = date ?? Date()
        dpDateTime?.minuteInterval = interval
        dpDateTime?.maximumDate = maxDate
        dpDateTime?.minimumDate = minDate
    }

    fileprivate func addObservers() {
        dpDateTime?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc fileprivate func selectDate(_ sender: UIDatePicker) {
        date = sender.date
    }

}
