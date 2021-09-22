//
//  RaspSuggestedResponse.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 22.09.2021.
//

import Foundation

struct RaspSuggestedResponse: Codable {
    let suggests: [RaspSuggestedItem]
    
    private enum CodingKeys: String, CodingKey {
        case suggests = "suggests"
    }
}
