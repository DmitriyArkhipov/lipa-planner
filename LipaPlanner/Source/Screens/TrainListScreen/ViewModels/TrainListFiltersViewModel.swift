//
//  TrainListFiltersViewModel.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.01.2022.
//

import Foundation
import Combine

class TrainListFiltersViewModel: ObservableObject {
    typealias ChangeQueryHandler = () -> Void
    typealias ChangeSortHandler = (QueryBuilder.Sort) -> Void
    
    private let initialQuery: QueryBuilder.Query?
    
    var onChangeQuery: ChangeQueryHandler?
    var onChangeSort: ChangeSortHandler?
    var sort: QueryBuilder.Sort? {
        return self.queryBuilder?.sort
    }
    var query: QueryBuilder.Query? {
        return try? self.queryBuilder?.getResult()
    }
    
    private var queryBuilder: QueryBuilder?
    private var initialized = false
    
    @Published var acceleratedSelected: Bool = true  {
        didSet {
            guard acceleratedSelected else { return }
            
            if initialized {
                self.queryBuilder!.sort = .accelerated
                
                self.onChangeSort?(.accelerated)
            }
            
            self.alldSelected = false
        }
    }
    @Published var alldSelected: Bool = false {
        didSet {
            guard alldSelected else { return }
            
            if initialized {
                self.queryBuilder!.sort = .all
                
                self.onChangeSort?(.all)
            }

            self.acceleratedSelected = false
        }
    }
    
    @Published var todaySelected: Bool = true {
        didSet {
            guard todaySelected else {
                return
            }
            
            let today = Date()
            
            if initialized {
                self.queryBuilder!.setDate(today)
                
                self.onChangeQuery?()
            }
            
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
            
            if initialized {
                self.queryBuilder!.setDate(tomorrow)
                
                self.onChangeQuery?()
            }
            
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
            if initialized {
                self.queryBuilder!.setDate(dateSelected)
                
                self.onChangeQuery?()
            }
        }
    }
    
    init(query: QueryBuilder.Query?, sort: QueryBuilder.Sort?) {
        self.initialQuery = query
        
        if let query = query, let sort = sort {
            self.queryBuilder = QueryBuilder(from: query)
            self.queryBuilder!.sort = sort
            
            if let dateISO8601String = query["date"] {
                let date = Date.fromISO8601(string: dateISO8601String)

                if date.isToday {
                    self.todaySelected = true
                } else if date.isTomorrow {
                    self.tomorrowSelected = true
                } else {
                    self.dateSelected = date
                    self.dateActiveSelected = true
                }
            }
            
            switch sort {
            case .accelerated:
                self.acceleratedSelected = true
            case .all:
                self.alldSelected = true
            }
        }
        
        self.initialized = true
    }
}
