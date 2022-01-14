//
//  QueryBuilder.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation

// TODO: - Будет переиспользован в списке с электричками
// TODO: - Пока не самая оптимальная валидация query можно сделать получше

struct QueryBuilderError: Error {
    let emptyFields: [QueryBuilder.RequiredKeys]
}

class QueryBuilder {
    typealias Query = [String: String]

    enum Sort {
        case all, accelerated
    }
    
    enum RequiredKeys: String, CaseIterable {
        case apikey, transport_types, from, to, date
    }
    
    private var query: Query = [
        "apikey": ApiKeys.RaspYandex,
        "transport_types": "suburban"
    ]
    
    var sort: Sort = .all
    
    convenience init(from guery: Query) {
        self.init()
        
        var newQuery = self.query
        
        newQuery.merge(guery) { $1 }
        
        self.query = newQuery
    }
    
    func setStartPoint(_ startPoint: RaspSuggestedItem) {
        query["from"] = startPoint.pointKey
    }

    func setEndPoint(_ endPoint: RaspSuggestedItem) {
        query["to"] = endPoint.pointKey
    }

    func setDate(_ date: Date) {
        query["date"] = date.iso8601
    }
    
    var result: Query {
        return self.query
    }
    
    func getResult() throws -> Query {
        try validate()
        
        return self.query
    }
    
    private func validate() throws {
        let emptyFields = RequiredKeys.allCases.reduce([]) { (result, current) -> [QueryBuilder.RequiredKeys] in
            var newResult = result
            
            if self.query[current.rawValue] == nil {
                newResult.append(current)
            }
            
            return newResult
        }
        
        if !emptyFields.isEmpty {
            throw QueryBuilderError(emptyFields: emptyFields)
        }
    }
}
