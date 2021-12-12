//
//  RaspPaginatin.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct RaspPagination: Codable {
    let total: Int
    
    private enum CodingKeys: String, CodingKey {
        case total
    }
}
