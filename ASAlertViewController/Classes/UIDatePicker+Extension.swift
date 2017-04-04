//
//  UIDatePicker+Extension.swift
//  Pods
//
//  Created by Adriano Souza Costa on 4/4/17.
//
//

import Foundation

extension UIDatePicker {

    var clampedDate: Date {
        let referenceTimeInterval = self.date.timeIntervalSinceReferenceDate
        let remainingSeconds = referenceTimeInterval.truncatingRemainder(dividingBy: TimeInterval(minuteInterval * 60))
        let timeRoundedToInterval = referenceTimeInterval - remainingSeconds

        return Date(timeIntervalSinceReferenceDate: timeRoundedToInterval)
    }

}
