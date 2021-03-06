//
//  Date+waitingTime.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 19.12.2021.
//

import Foundation

extension Date {
    enum WaitingLabel {
        case tomorrow, now, soon, undefined
    }
    
    private var waitingDate: Date {
        let today = Date()
        let calendar = Calendar.current

        var todayDateComponents = DateComponents()

        todayDateComponents.hour = calendar.component(.hour, from: today)
        todayDateComponents.minute = calendar.component(.minute, from: today)

        var departureDateComponents = DateComponents()

        departureDateComponents.hour = calendar.component(.hour, from: self)
        departureDateComponents.minute = calendar.component(.minute, from: self)

        let waitTime = calendar.dateComponents([.hour, .minute], from: todayDateComponents, to: departureDateComponents)

        return calendar.date(from: waitTime)!
    }
    
    private var formattedTimeWithUnits: String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)

        let minutesString = minutes < 10 ? "0\(minutes)" : "\(minutes)"

        if hour == 0 {
            return "\(minutes) мин"
        }

        return "\(hour) ч \(minutesString) мин"
    }

    var waitingTime: (String, WaitingLabel)  {
        let today = Date()
        let calendar = Calendar.current
        let todayDay = calendar.component(.day, from: today)
        let todayMonth = calendar.component(.month, from: today)

        let tomorrowDay = todayDay + 1

        let selfDay = calendar.component(.day, from: self)
        let selfMonth = calendar.component(.month, from: self)

        let waitingHour = calendar.component(.hour, from: self.waitingDate)
        let waitingMinute = calendar.component(.minute, from: self.waitingDate)

        if
            todayDay == selfDay,
            todayMonth == selfMonth,
            today.timeIntervalSince1970 < self.timeIntervalSince1970
        {
            let time = self.waitingDate.formattedTimeWithUnits

            return ("Через \(time)".uppercased(), .soon)
        } else if waitingHour == 0 && waitingMinute == 0 {
            return ("Сейчас".uppercased(), .now)
        } else if (tomorrowDay == selfDay) {
            return ("Завтра".uppercased(), .tomorrow)
        }

        return ("", .undefined)
    }
}
