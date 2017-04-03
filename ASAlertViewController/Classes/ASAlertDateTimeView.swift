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

    // MARK: - Private Methods

    private func updateUI() {
        btClear?.isEnabled = date != nil
        
        setupDatePicker()
    }

    private func setupDatePicker() {
        var format = "dd/MM/yyyy HH:mm"
        var label = "Hoje"
        
        switch type {
        case .date:
            dpDateTime?.datePickerMode = .date
            format = "dd/MM/yyyy"
        case .time:
            dpDateTime?.datePickerMode = .time
            format = "HH:mm"
            label = "Agora"
        case .dateTime:
            dpDateTime?.datePickerMode = .dateAndTime
            format = "dd/MM/yyyy HH:mm"
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
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
        date = Date()
    }
    
    @IBAction private func clearAction() {
        onClearAction?()
    }

}
