//
//  TrainThreadEntity.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

struct TrainThreadEntity: Codable {
    let uid: String?
    let title: String
    let number: String?
    let short_title: String?
    let thread_method_link: String?
    let transport_type: String
    let vehicle: String?
    let express_type: String?
    
    private enum CodingKeys: String, CodingKey {
        case uid = "uid"
        case title = "title"
        case number = "number"
        case short_title = "short_title"
        case thread_method_link = "thread_method_link"
        case transport_type = "transport_type"
        case vehicle = "vehicle"
        case express_type = "express_type"
    }
}
