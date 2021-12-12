//
//  TrainSegmentEntity.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct TrainSegmentEntity: Codable {
    let arrival: String
    let from: TrainStationEntity
    let thread: TrainThreadEntity
    let departure_platform: String
    let departure: String
    let stops: String
    let days: String?
    let to: TrainStationEntity
    let duration: Double
    let start_date: String
    let arrival_platform: String
    
    private enum CodingKeys: String, CodingKey {
        case arrival = "arrival"
        case from = "from"
        case thread = "thread"
        case departure_platform = "departure_platform"
        case departure = "departure"
        case stops = "stops"
        case days = "days"
        case to = "to"
        case duration = "duration"
        case start_date = "start_date"
        case arrival_platform = "arrival_platform"
    }
}
