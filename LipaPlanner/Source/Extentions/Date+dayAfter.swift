//
//  Date+dayAfter.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 30.11.2021.
//

import Foundation

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(
            byAdding: .day,
            value: 1,
            to: self
        )!
    }
}
