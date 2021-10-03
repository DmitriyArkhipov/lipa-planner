//
//  FiltersViewModel.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 03.10.2021.
//

import Foundation
import Combine

class FiltersViewModel: ObservableObject {
    @Published var todaySelected: Bool = false {
        didSet {
            print("todaySelected: ", todaySelected)
        }
    }
    @Published var tomorrowSelected: Bool = false {
        didSet {
            print("tomorrowSelected: ", tomorrowSelected)
        }
    }
    @Published var acceleratedSelected: Bool = false {
        didSet {
            print("acceleratedSelected: ", acceleratedSelected)
        }
    }
    @Published var alldSelected: Bool = false {
        didSet {
            print("alldSelected: ", alldSelected)
        }
    }
}
