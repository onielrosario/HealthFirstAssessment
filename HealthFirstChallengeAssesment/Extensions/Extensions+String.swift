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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        if let date = dateFormatter.date(from:self) {
            dateFormatter.dateFormat = dateToFormat
          newdate = dateFormatter.string(from: date)
        }
        return newdate
    }
}
