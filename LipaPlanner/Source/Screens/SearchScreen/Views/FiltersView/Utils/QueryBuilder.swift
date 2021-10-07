//
//  QueryBuilder.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation

class QueryBuilder {
    typealias Query = [String: String]
    
    enum Sort {
        case all
        case acceleratedOnly
    }
    
    private var guery: Query = [:]
    
    func setStartPoint(_ startPoint: String) {
        guery["from"] = startPoint
    }

    func setEndPoint(_ endPoint: String) {
        guery["to"] = endPoint
    }

    func setDate(_ date: Date) {
        guery["date"] = date.iso8601
    }
    
    var sort: Sort = .all
    
    var result: Query {
        return self.guery
    }
}
