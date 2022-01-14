//
//  TimeInterval+FormattedMinutes.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 18.12.2021.
//

import Foundation

extension TimeInterval {
    var formattedMinutes: String {
        let minutes = self / 60
        return "\(Int(minutes)) мин"
    }
    
    var minutes: Double {
        return self / 60
    }
}
