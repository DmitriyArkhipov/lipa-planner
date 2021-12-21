//
//  Date+DefaultFormattedTime.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 18.12.2021.
//

import Foundation

extension Date {
    var defaultFormattedTime: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)

        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"

        return "\(hourString):\(minutesString)"
    }
}
