//
//  RaspResponse.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct RaspResponse: Codable {
    let segments: [TrainSegment]
    let pagination: RaspPagination
    
    private enum CodingKeys: String, CodingKey {
        case segments, pagination
    }
}
