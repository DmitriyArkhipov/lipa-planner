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
    
    @Published var itemViewModels: [TrainListItemViewModel] = []
    
    init(query: QueryBuilder.Query?) {
        self.query = query
    }
    
    func fetch() {
        guard query != nil else {
            return
        }
        
        RaspSearchGateway.fetch(
            query: self.query!,
            succeed: { [weak self] segments in
                self?.itemViewModels = segments.map { item in
                    return TrainListItemViewModel(segment: item)
                }
            },
            failure: { error in
            if error.isInternetConnection {
                debugPrint("isInternetConnection")
            } else {
                debugPrint("error: ", error.localizedDescription)
            }
        }, finally: {
            
        })
    }
    
    func handleChangeQuery() {
        
    }
}
