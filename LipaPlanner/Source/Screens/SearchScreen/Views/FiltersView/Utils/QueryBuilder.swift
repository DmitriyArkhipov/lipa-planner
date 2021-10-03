//
//  QueryBuilder.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation

class QueryBuilder {
    typealias Query = [String: String]
    
    private var guery: Query = [:]
    
    func setStartPoint(_ startPoint: String) -> Self {
        guery["from"] = startPoint
        
        return self
    }

    func setEndPoint(_ endPoint: String) -> Self {
        guery["to"] = endPoint

        return self
    }

    func setDate(_ date: Date) -> Self {
        guery["date"] = date.iso8601

        return self
    }
    
    var result: Query {
        return self.guery
    }
}
