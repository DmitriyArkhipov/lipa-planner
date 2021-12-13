//
//  TrainListItemViewModel.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 09.12.2021.
//

import Foundation

class TrainListItemViewModel {
    let id = UUID()
    
    let segment: TrainSegment
    
    let fromTitle: String
//    let fromTime: String
    
    let toTitle: String
//    let toTime: String
    
    
    init(segment: TrainSegment) {
        self.segment = segment
        
        self.fromTitle = segment.from.title
        self.toTitle = segment.to.title
    }
}
