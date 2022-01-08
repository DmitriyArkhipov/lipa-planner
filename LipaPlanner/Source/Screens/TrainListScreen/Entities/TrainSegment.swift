//
//  TrainSegment.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct TrainSegment: Codable {
    let arrival: String
    let from: TrainStation
    let thread: TrainThread
    let departure_platform: String
    let departure: String
    let stops: String
    let days: String?
    let to: TrainStation
    let duration: String
    let start_date: String
    let arrival_platform: String
    let departure_date: Date
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let formattedTimeFrom = { (from: String) -> String in
            let date = Date.fromISO8601(string: from)
            
            return date.defaultFormattedTime
        }
        
        let arrivalString = try container.decode(String.self, forKey: .arrival)
        self.arrival = formattedTimeFrom(arrivalString)
        
        let departureString = try container.decode(String.self, forKey: .departure)
        self.departure = formattedTimeFrom(departureString)
        self.departure_date = Date.fromISO8601(string: departureString)
        
        let durationTimeInterval = try container.decode(TimeInterval.self, forKey: .duration)
        self.duration = durationTimeInterval.formattedMinutes
        
        self.from = try container.decode(TrainStation.self, forKey: .from)
        self.thread = try container.decode(TrainThread.self, forKey: .thread)
        self.departure_platform = try container.decode(String.self, forKey: .departure_platform)
        self.stops = try container.decode(String.self, forKey: .stops)
        self.days = try? container.decode(String.self, forKey: .days)
        self.to = try container.decode(TrainStation.self, forKey: .to)
        
        self.start_date = try container.decode(String.self, forKey: .start_date)
        self.arrival_platform = try container.decode(String.self, forKey: .arrival_platform)
    }
    
    private enum CodingKeys: String, CodingKey {
        case arrival,
             from,
             thread,
             departure_platform,
             departure,
             stops,
             days,
             to,
             duration,
             start_date,
             arrival_platform
    }
}
