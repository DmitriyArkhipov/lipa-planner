//
//  RaspSuggestGateway.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 22.09.2021.
//

import Foundation
import Alamofire

class RaspSuggestGateway {
    private let url = "https://suggests.rasp.yandex.net/suburban"
    private let parameters: [String: String] = [
        "lang": "ru",
        "national_version": "ru"
    ]
    
    func fetch(
        byName name: String,
        succeed: @escaping ([RaspSuggestedItem]) -> Void,
        failure: @escaping (AFError) -> Void
    ) {
        var newParameters = self.parameters
        
        newParameters["part"] = name
        
        AF.request(url, method: .get, parameters: newParameters).responseDecodable(of: RaspSuggestedResponse.self) { response in
            if let error = response.error {
                failure(error)
                
                return
            }
            
            succeed(response.value!.suggests)
        }
    }
}
