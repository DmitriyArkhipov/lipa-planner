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
            
            let tomorrow = Date().dayAfter

            self.queryBuilder.setDate(tomorrow)
            
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
            self.queryBuilder.setDate(dateSelected)
        }
    }
    
    @Published var selectedFrom: RaspSuggestedItem? = nil {
        didSet {
            guard let selectedFrom = selectedFrom else {
                return
            }
            
            self.queryBuilder.setStartPoint(selectedFrom)
        }
    }
    
    @Published var selectedTo: RaspSuggestedItem? = nil {
        didSet {
            guard let selectedTo = selectedTo else {
                return
            }
            
            self.queryBuilder.setEndPoint(selectedTo)
        }
    }
    
    @Published var acceleratedSelected: Bool = true {
        didSet {
            guard acceleratedSelected else { return }
            
            self.queryBuilder.sort = .accelerated
            
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
    
    @Published var trainListOpened: Bool = false
    @Published var trainListQuery: QueryBuilder.Query?
    @Published var trainListSort: QueryBuilder.Sort?
    
    private lazy var queryBuilder: QueryBuilder = {
        let queryBulder = QueryBuilder()
        
        queryBulder.setDate(Date())
        queryBulder.sort = .accelerated
        
        return queryBulder
    }()
    
    func trainListOpen() {
        do {
            self.trainListQuery = try self.queryBuilder.getResult()
            self.trainListSort = self.queryBuilder.sort
            self.trainListOpened = true
        } catch {
            debugPrint("error")
        }
    }
    
    func replaceFromAndTo() {
        let selectedFrom = self.selectedFrom
        let selectedTo = self.selectedTo
        
        if selectedFrom != nil, selectedTo != nil {
            self.selectedFrom = selectedTo
            self.selectedTo = selectedFrom
        }
    }
}
