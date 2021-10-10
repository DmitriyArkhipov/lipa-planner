//
//  ApiKeys.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import Foundation

final class ApiKeys {
    private static var plistData: [String: Any]? {
        guard
            let infoPlistPath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist"),
            let infoPlistDictionary = NSDictionary(contentsOfFile: infoPlistPath),
            let data = infoPlistDictionary as? [String: Any]
            else {
                return nil
        }
        
        return data
    }
    
    static var RaspYandex: String {
        guard
            let data = plistData,
            let key = data["RaspYandex"] as? String
            else {
                return ""
        }
        
        return key
    }
    
    static var YandexMetrica: String {
        guard
            let data = plistData,
            let key = data["YandexMetrica"] as? String
            else {
                return ""
        }
        
        return key
    }
}
