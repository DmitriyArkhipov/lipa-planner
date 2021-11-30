//
//  QueryBuilder.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation

// TODO: - Будет переиспользован в списке с электричками
// TODO: - Пока не самая оптимальная валидация query можно сделать получше
enum QueryBulderError: String, Error {
    case emptyApiKey = "Нет api_key для доступа к расписанию"
    case emptyTransportTypes = "Не выбран тип транпорта для поиска"
    case emptyPoint = "QueryBulderError: Не выбрана точка-станция для поиска"
}

class QueryBuilder {
    typealias Query = [String: String]

    enum Sort {
        case all, accelerated
    }
    
    private var query: Query = [
        "apikey": ApiKeys.RaspYandex,
        "transport_types": "suburban"
    ]
    
    var sort: Sort = .all
    
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
        if query["apikey"] == nil {
            throw QueryBulderError.emptyApiKey
        } else if query["transport_types"] == nil {
            throw QueryBulderError.emptyTransportTypes
        } else if query["from"] == nil || query["to"] == nil {
            throw QueryBulderError.emptyPoint
        }
        
        return self.query
    }
}
