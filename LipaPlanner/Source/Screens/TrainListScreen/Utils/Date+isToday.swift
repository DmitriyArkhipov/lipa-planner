//
//  Date+isToday.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.01.2022.
//

import Foundation

extension Date {
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
}
