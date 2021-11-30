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
//    private let defaultQuery: QueryBuilder.Query = [
//        "apikey": ApiKeys.RaspYandex,
//        "transport_types": "suburban"
//    ]
    
    
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
        
        
//        Alamofire
//            .request(self.urlPath, parameters: newQuery)
//            .responseArray(keyPath: "segments") { (response: DataResponse<[TrainSegment]>) in
//                switch response.result {
//                case .success:
//                    let segments = response.result.value!
//
//                    if self.offset == 0 {
//                        self.dataSource.removeAll()
//                    }
//
//                    self.dataSource.append(contentsOf: segments)
//
//                    self.isLoadingDataSource = false
//
//                    DispatchQueue.main.async {
//                        self.delegate?.success()
//                    }
//
//                case .failure(let error):
//                    self.isLoadingDataSource = false
//                    self.dataSource.removeAll()
//
//                    DispatchQueue.main.async {
//                        self.delegate?.failure(error: error)
//                    }
//                }
//            }
//            .responseObject(keyPath: "pagination") { (response: DataResponse<Pagination>) in
//                switch response.result {
//                case .success:
//                    let pagination = response.result.value!
//                    self.total = pagination.total
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        self.delegate?.failure(error: error)
//                    }
//                }
//        }
    }
}
