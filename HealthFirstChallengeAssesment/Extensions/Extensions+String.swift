//
//  Extensions+String.swift
//  HealthFirstChallengeAssesment
//
//  Created by Oniel Rosario on 8/11/19.
//  Copyright © 2019 Oniel Rosario. All rights reserved.
//

import Foundation


// ISO Date converter
extension String {
    func returnDateFormatted(dateToFormat: String) -> String {
        var newdate = self
        let converter = ISO8601DateFormatter()
        converter.formatOptions = [.withInternetDateTime,
                                   .withDashSeparatorInDate,
                                   .withFullDate,
                                   .withColonSeparatorInTimeZone,
                                   .withFractionalSeconds]
        if let date = converter.date(from:self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateToFormat
          newdate = dateFormatter.string(from: date)
        }
        return newdate
    }
}
