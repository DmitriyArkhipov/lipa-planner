//
//  Error+isInternetConnection.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import Foundation

extension Error {
    var isInternetConnection: Bool {
        guard
            let unwrapedError = self as? URLError,
            unwrapedError.code.rawValue == NSURLErrorNotConnectedToInternet
        else {
            return false
        }
        
        return true
    }
}
