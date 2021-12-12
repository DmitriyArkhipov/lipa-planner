//
//  RaspSearchGateway.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import Foundation
import Alamofire

class RaspSearchGateway {
    private static let url = "https://api.rasp.yandex.net/v3/search/"

    static func fetch(
        query: QueryBuilder.Query,
        succeed: @escaping ([TrainSegment]) -> Void,
        failure: @escaping (Error) -> Void,
        finally: @escaping () -> Void
    ) {
        
        AF.request(url, method: .get, parameters: query)
        .response { response in
            do {
                if let error = response.error {
                    throw error
                }

                let decoder = JSONDecoder()
                let responseEntity = try decoder.decode(RaspResponse.self, from: response.data!)

                succeed(responseEntity.segments)
                finally()
            } catch let error {
                failure(error)
                finally()
            }
        }
    }
}
