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
