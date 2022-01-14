//
//  Date+isTomorrow.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.01.2022.
//

import Foundation

extension Date {
    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
}
