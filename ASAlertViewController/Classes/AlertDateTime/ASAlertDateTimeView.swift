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
        didSet { setupDatePicker() }
    }
    
    var maxDate: Date? = nil {
        didSet { setupDatePicker() }
    }
    
    var minDate: Date? = nil {
        didSet { setupDatePicker() }
    }
    
    var type: ASAlertDateTimeType = .dateTime {
        didSet { setupDatePicker() }
    }
    
    var interval: Int = 15 {
        didSet { setupDatePicker() }
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
        addObservers()
    }

    // MARK: - Private Methods
    
    fileprivate func setupDatePicker() {
        setupMode()
        
        dpCalendar?.minuteInterval = interval
        dpCalendar?.maximumDate = maxDate
        dpCalendar?.minimumDate = minDate
        dpCalendar?.timeZone = TimeZone.autoupdatingCurrent
        dpCalendar?.locale = Locale.autoupdatingCurrent
        dpCalendar?.date = date ?? Date()
        
        if date == nil { date = dpCalendar?.clampedDate }
    }

    private func setupMode() {
        switch type {
        case .date:
            dpCalendar?.datePickerMode = .date
        case .time:
            dpCalendar?.datePickerMode = .time
        case .dateTime:
            dpCalendar?.datePickerMode = .dateAndTime
        }
    }
    
    fileprivate func addObservers() {
        dpCalendar?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc fileprivate func selectDate(_ sender: UIDatePicker) {
        date = sender.date
        onValueChange?(date)
    }

}
