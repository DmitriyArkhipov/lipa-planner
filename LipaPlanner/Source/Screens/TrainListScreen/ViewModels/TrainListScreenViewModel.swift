//
//  TrainListScreenViewModel.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 09.10.2021.
//

import Foundation
import Combine

class TrainListScreenViewModel: ObservableObject {
    let query: QueryBuilder.Query?
    
    init(query: QueryBuilder.Query?) {
        self.query = query
    }
    
    func fetch() {
        RaspSearchGateway.fetch(query: self.query!, succeed: {}, failure: { _ in }, finally: {})
    }
    
    func handleChangeQuery() {
        
    }
}
