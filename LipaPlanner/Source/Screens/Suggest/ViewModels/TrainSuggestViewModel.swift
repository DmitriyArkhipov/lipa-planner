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
    @Published var inputText: String = ""
    @Published var isLoading: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        $inputText
            .throttle(
                for: .seconds(1),
                scheduler: DispatchQueue.main,
                latest: true
            ).sink(
                receiveValue: { [weak self] text in
                    if (text.count >= 3) {
                        self?.fetch(by: text)
                    }
                }
            ).store(in: &subscriptions)
    }
    
    func fetch(by name: String) {
        RaspSuggestGateway().fetch(byName: name, succeed: {[weak self] suggestsResponsed in
            DispatchQueue.main.async {
                self?.suggests = suggestsResponsed
            }
        }, failure: { error in
            print("error: ", error.errorDescription!)
        })
    }
}
