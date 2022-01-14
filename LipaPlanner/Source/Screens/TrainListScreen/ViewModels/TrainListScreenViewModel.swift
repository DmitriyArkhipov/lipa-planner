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
    
    private var unsortedItemViewModels: [TrainListItemViewModel] = []
    
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
    
    var handleChangeSort: (QueryBuilder.Sort) -> Void {
        return { [weak self] sort in
            self?.sort(sort)
        }
    }
    
    func fetch() {
        guard let query = self.filtersViewModel.query, let sort = self.filtersViewModel.sort else {
            return
        }
        
        self.isLoading = true
        
        RaspSearchGateway.fetch(
            query: query,
            succeed: { [weak self] segments in
                DispatchQueue.main.async {
                    let viewModels = segments.map { item in
                        return TrainListItemViewModel(segment: item)
                    }
                    
                    self?.itemViewModels = viewModels
                    self?.unsortedItemViewModels = viewModels
                    
                    self?.sort(sort)
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
    
    func sort(_ sort: QueryBuilder.Sort) {
        switch sort {
        case .all:
            self.itemViewModels = self.unsortedItemViewModels
        case .accelerated:
            let viewModels = self.unsortedItemViewModels.reduce([]) { result, item -> [TrainListItemViewModel] in
                var newResult = result
                
                if item.segment.durationMinutes < 40 {
                    newResult.append(item)
                }
                
                return newResult
            }
            
            self.itemViewModels = viewModels
        }
    }
}
