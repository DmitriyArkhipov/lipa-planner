//
//  Date+FromISO8601String.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 18.12.2021.
//

import Foundation

extension Date {
    static func fromISO8601(string: String) -> Self {
        let formatter = ISO8601DateFormatter()

        return formatter.date(from: string)!
    }
}
