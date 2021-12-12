//
//  TrainStationEntity.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct TrainStationEntity: Codable {
    let code: String
    let title: String
    let station_type: String
    let transport_type: String
    let station_type_name: String
    let type: String
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case title = "title"
        case station_type = "station_type"
        case transport_type = "transport_type"
        case station_type_name = "station_type_name"
        case type = "type"
    }
}
