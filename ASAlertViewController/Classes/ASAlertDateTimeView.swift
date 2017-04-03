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

    // MARK: - Lifecircle Class

    override func awakeFromNib() {
        super.awakeFromNib()

        date = dpDateTime?.date

        updateUI()
        addObservers()
    }

    // MARK: - Private Methods

    private func updateUI() {
        if let date = date {
            var format = "dd/MM/yyyy HH:mm"

            switch type {
            case .date:
                format = "dd/MM/yyyy"
            case .dateTime:
                format = "dd/MM/yyyy HH:mm"
            case .time:
                format = "HH:mm"
            }

            let formatter = DateFormatter()
            formatter.dateFormat = format
            lbDateDescription?.text = formatter.string(from: date)
        }

        setupDatePicker()
    }

    private func setupDatePicker() {
        switch type {
        case .date:
            dpDateTime?.datePickerMode = .date
        case .time:
            dpDateTime?.datePickerMode = .time
        case .dateTime:
            dpDateTime?.datePickerMode = .dateAndTime
        }

        dpDateTime?.minuteInterval = interval
        dpDateTime?.date = date ?? Date()
    }

    private func addObservers() {
        dpDateTime?.addTarget(self, action: #selector(selectDate(_:)), for: .valueChanged)
    }

    @objc private func selectDate(_ sender: UIDatePicker) {
        date = sender.date
    }

}
