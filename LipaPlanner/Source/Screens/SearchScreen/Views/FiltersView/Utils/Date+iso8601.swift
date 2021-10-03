//
//  Date+iso8601.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation

extension Date {
    private var dateWithZeroTime: Date {
        let gregorian = Calendar(identifier: .gregorian)
        var components = gregorian.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: self
        )

        components.hour = 0
        components.minute = 0
        components.second = 0

        return gregorian.date(from: components)!
    }
    
    var iso8601: String {
        return ISO8601DateFormatter().string(from: self.dateWithZeroTime)
    }
}
