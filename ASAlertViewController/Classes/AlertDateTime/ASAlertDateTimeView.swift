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

    @IBOutlet fileprivate weak var dpCalendar: UIDatePicker?

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

    var onValueChange: ((_ date: Date?) -> Void)?

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
        if date == nil { date = dpCalendar?.clampedDate }
    }
    
    fileprivate func setupDatePicker() {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        
        var label = "Hoje"
        
        switch type {
        case .date:
            dpCalendar?.datePickerMode = .date
            formatter.dateStyle = .long
            formatter.timeStyle = .none
        case .time:
            dpCalendar?.datePickerMode = .time
            label = "Agora"
            formatter.dateStyle = .none
            formatter.timeStyle = .short
        case .dateTime:
            dpCalendar?.datePickerMode = .dateAndTime
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
        }

        dpCalendar?.date = date ?? Date()
        dpCalendar?.minuteInterval = interval
        dpCalendar?.maximumDate = maxDate
        dpCalendar?.minimumDate = minDate
    }

    fileprivate func addObservers() {
        dpCalendar?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc fileprivate func selectDate(_ sender: UIDatePicker) {
        date = sender.date
        onValueChange?(date)
    }

}
