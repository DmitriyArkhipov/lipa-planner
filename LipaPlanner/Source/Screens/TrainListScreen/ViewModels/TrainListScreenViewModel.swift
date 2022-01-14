//
//  TrainListScreenViewModel.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 09.10.2021.
//

import Foundation
import Combine

class TrainListScreenViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var itemViewModels: [TrainListItemViewModel] = []
    
    let filtersViewModel: TrainListFiltersViewModel
    
    init(filersViewModel: TrainListFiltersViewModel) {
        self.filtersViewModel = filersViewModel
        
        self.filtersViewModel.onChangeQuery = handleChangeQuery
        self.filtersViewModel.onChangeSort = handleChangeSort
    }
    
    var handleChangeQuery: () -> Void {
        return { [weak self] in
            self?.fetch()
        }
    }
    
    var handleChangeSort: () -> Void {
        return { [weak self] in
            self?.sort()
        }
    }
    
    func fetch() {
        guard let query = self.filtersViewModel.query else {
            return
        }
        
        self.isLoading = true
        
        RaspSearchGateway.fetch(
            query: query,
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
    
    func sort() {
        debugPrint("sort")
    }
}
