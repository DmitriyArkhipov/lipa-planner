//
//  TrainSuggestViewModel.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 22.09.2021.
//

import Foundation
import Combine

class TrainSuggestViewModel: ObservableObject {
    @Published var suggests: [RaspSuggestedItem] = []
    
    func fetch() {
        RaspSuggestGateway().fetch(byName: "Бердск", succeed: {[weak self] suggestsResponsed in
            DispatchQueue.main.async {
                self?.suggests = suggestsResponsed
            }
        }, failure: { error in
            print("error: ", error.errorDescription!)
        })
    }
}
