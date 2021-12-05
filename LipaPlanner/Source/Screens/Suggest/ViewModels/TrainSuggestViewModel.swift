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
                for: .seconds(0.7),
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
    
    func refresh() {
        self.fetch(by: self.inputText)
    }
    
    func fetch(by name: String) {
        self.isLoading = true

        RaspSuggestGateway().fetch(byName: name, succeed: {[weak self] suggestsResponsed in
            DispatchQueue.main.async {
                self?.suggests = suggestsResponsed
            }
        }, failure: { error in
            debugPrint("error: ", error.errorDescription!)
        }, finally: { [weak self] in
            self?.isLoading = false
        })
    }
}
