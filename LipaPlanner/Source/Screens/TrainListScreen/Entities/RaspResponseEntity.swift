//
//  RaspResponseEntity.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct RaspResponseEntity: Codable {
    let segments: [TrainSegmentEntity]
    let pagination: RaspPaginationEntity
    
    private enum CodingKeys: String, CodingKey {
        case segments = "segments"
        case pagination = "pagination"
    }
}
