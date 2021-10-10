//
//  RaspSearchGateway.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import Foundation
import Alamofire

class RaspSearchGateway {
    private let url = "https://api.rasp.yandex.net/v3/search/"
    private let defaultQuery: QueryBuilder.Query = [
        "apikey": ApiKeys.RaspYandex,
        "transport_types": "suburban"
    ]
    
    
    func fetch(
        query: QueryBuilder.Query,
        succeed: @escaping () -> Void,
        failure: @escaping (AFError) -> Void,
        finally: @escaping () -> Void
    ) {
        
        
//        AF.request(url, method: .get, parameters: newParameters).responseDecodable(of: RaspSuggestedResponse.self) { response in
//            if let error = response.error {
//                failure(error)
//                finally()
//
//                return
//            }
//
//            succeed(response.value!.suggests)
//            finally()
//        }
    }
}
