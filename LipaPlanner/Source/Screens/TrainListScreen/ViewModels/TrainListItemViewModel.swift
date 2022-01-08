//
//  TrainListItemViewModel.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 09.12.2021.
//

import Foundation

class TrainListItemViewModel: Identifiable {
    let id = UUID()
    
    let segment: TrainSegment
    
    let fromTitle: String
    let fromTime: String
    
    let toTitle: String
    let toTime: String
    
    let duration: String
    
    let trainThread: String
    
    let waitingTime: String
    
    let waitingTimeState: TrainTodayLabelState
    
    
    init(segment: TrainSegment) {
        self.segment = segment
        
        self.fromTitle = segment.from.title
        self.fromTime = segment.arrival
        self.toTitle = segment.to.title
        self.toTime = segment.departure
        self.duration = segment.duration
        self.trainThread = segment.thread.title
        
        let ( waitingTime, label )  = segment.departure_date.waitingTime
        
        self.waitingTime = waitingTime
        
        switch label {
        case .tomorrow:
            self.waitingTimeState = .tomorrow
        case .now:
            self.waitingTimeState = .now
        case .undefined, .soon:
            self.waitingTimeState = .soon
        }
    }
}
