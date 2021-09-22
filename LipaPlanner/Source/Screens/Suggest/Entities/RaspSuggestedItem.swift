//
//  RaspSuggestedItem.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 22.09.2021.
//

import Foundation

struct RaspSuggestedItem: Codable, Hashable {
    let id: Int
    let regionId: Int?
    let fullTitle: String?
    let titleUk: String?
    let zoneId: Int?
    let title: String?
    let countryId: Int?
    let fullTitleRu: String?
    let titleRu: String
    let ttype: String?
    let type: String?
    let order: Int?
    let pointKey: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case id = "object_id"
        case regionId = "region_id"
        case fullTitle = "full_title"
        case titleUk = "title_uk"
        case zoneId = "zone_id"
        case title = "title"
        case countryId = "country_id"
        case fullTitleRu = "full_title_ru"
        case titleRu = "title_ru"
        case ttype = "ttype"
        case type = "type"
        case order = "order"
        case pointKey = "pointKey"
    }
}
