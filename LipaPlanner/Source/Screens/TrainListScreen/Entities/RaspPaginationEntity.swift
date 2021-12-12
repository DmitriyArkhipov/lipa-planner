//
//  RaspPaginationEntity.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct RaspPaginationEntity: Codable {
    let total: Int
    
    private enum CodingKeys: String, CodingKey {
        case total = "total"
    }
}
