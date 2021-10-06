//
//  Date+FormattedForView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 06.10.2021.
//

import Foundation

extension Date {
    var dayStringValue: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd"

        return dateFormatter.string(from: self)
    }
    
    var shortMonthStringValue: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "LLL"
        dateFormatter.locale = Locale(identifier: "ru_RU_POSIX")
        
        let month = dateFormatter.string(from: self)
        let symbArray = Array(month)

        return String(symbArray[0..<3])
    }
    
    var yearStringValue: String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy"

        return dateFormatter.string(from: self)
    }
}
