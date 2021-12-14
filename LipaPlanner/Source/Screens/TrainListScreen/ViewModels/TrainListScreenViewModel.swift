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
    
    @Published var isLoading: Bool = false
    @Published var itemViewModels: [TrainListItemViewModel] = []
    
    init(query: QueryBuilder.Query?) {
        self.query = query
    }
    
    func fetch() {
        guard query != nil else {
            return
        }
        
        self.isLoading = true
        
        RaspSearchGateway.fetch(
            query: self.query!,
            succeed: { [weak self] segments in
                DispatchQueue.main.async {
                    self?.itemViewModels = segments.map { item in
                        return TrainListItemViewModel(segment: item)
                    }
                }
            },
            failure: { error in
            if error.isInternetConnection {
                debugPrint("isInternetConnection")
            } else {
                debugPrint("error: ", error.localizedDescription)
            }
        }, finally: { [weak self] in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
        })
    }
    
    func handleChangeQuery() {
        
    }
}
