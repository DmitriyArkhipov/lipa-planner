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
    
    @Published var acceleratedSelected: Bool = true  {
        didSet {
            guard acceleratedSelected else { return }
            
//            self.queryBuilder.sort = .accelerated
            
            self.alldSelected = false
        }
    }
    @Published var alldSelected: Bool = false {
        didSet {
            guard alldSelected else { return }
            
//            self.queryBuilder.sort = .all

            self.acceleratedSelected = false
        }
    }
    
    @Published var todaySelected: Bool = true {
        didSet {
            guard todaySelected else {
                return
            }
            
            let today = Date()
            
//            self.queryBuilder.setDate(today)
            
            self.dateSelected = today
            self.dateActiveSelected = false
            self.tomorrowSelected = false
        }
    }
    @Published var tomorrowSelected: Bool = false {
        didSet {
            guard tomorrowSelected else {
                return
            }
            
            let tomorrow = Date().dayAfter

//            self.queryBuilder.setDate(tomorrow)
            
            self.dateSelected = tomorrow
            self.dateActiveSelected = false
            self.todaySelected = false
        }
    }
    @Published var dateActiveSelected: Bool = false {
        didSet {
            guard dateActiveSelected else {
                return
            }
            
            self.todaySelected = false
            self.tomorrowSelected = false
        }
    }
    @Published var dateSelected: Date = Date() {
        didSet {
//            self.queryBuilder.setDate(dateSelected)
        }
    }
    
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
