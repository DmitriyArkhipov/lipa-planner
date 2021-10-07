//
//  FiltersViewModel.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation
import Combine

class FiltersViewModel: ObservableObject {
    @Published var todaySelected: Bool = true {
        didSet {
            guard todaySelected else {
                return
            }
            
            let today = Date()
            
            self.queryBuilder.setDate(today)
            
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
            
            let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!

            self.queryBuilder.setDate(tomorrow)
            
            self.dateSelected = tomorrow
            self.dateActiveSelected = false
            self.todaySelected = false
        }
    }
    @Published var acceleratedSelected: Bool = true {
        didSet {
            guard acceleratedSelected else { return }
            
            self.queryBuilder.sort = .acceleratedOnly
            
            self.alldSelected = false
        }
    }
    @Published var alldSelected: Bool = false {
        didSet {
            guard alldSelected else { return }
            
            self.queryBuilder.sort = .all

            self.acceleratedSelected = false
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
            self.queryBuilder.setDate(dateSelected)
        }
    }
    
    @Published var selectedFrom: RaspSuggestedItem? = nil {
        didSet {
            guard let fromPoint = selectedFrom?.pointKey else {
                return
            }
            
            self.queryBuilder.setStartPoint(fromPoint)
        }
    }
    
    @Published var selectedTo: RaspSuggestedItem? = nil {
        didSet {
            guard let toPoint = selectedTo?.pointKey else {
                return
            }
            
            self.queryBuilder.setEndPoint(toPoint)
        }
    }
    
    private lazy var queryBuilder: QueryBuilder = {
        let queryBulder = QueryBuilder()
        
        queryBulder.setDate(Date())
        queryBulder.sort = .acceleratedOnly
        
        return queryBulder
    }()
}
