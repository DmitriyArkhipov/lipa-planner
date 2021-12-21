//
//  TrainTodayLabel.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 06.12.2021.
//

import SwiftUI

enum TrainTodayLabelState {
    case tomorrow, now, soon
}

struct TrainTodayLabelStyle: ViewModifier {
    let state: TrainTodayLabelState
    
    func body(content: Content) -> some View {
        switch state {
            case .now: return content
                .foregroundColor(Color.white)
                .background(Colors.TodayLabelRed)
            case .soon: return content
                .foregroundColor(Color.black)
                .background(Colors.TodayLabelYellow)
            case .tomorrow: return content
                .foregroundColor(Color.black)
                .background(Colors.TodayLabelDefault)
        }
    }
}

struct TrainTodayLabel: View {
    let title: String
    let state: TrainTodayLabelState
    
    var body: some View {
        Text(self.title)
            .font(.system(size: 12, design: .default))
            .padding(.vertical, 5.0)
            .padding(.horizontal, 10.0)
            .lineLimit(1)
            .textCase(.uppercase)
            .modifier(TrainTodayLabelStyle(state: self.state))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

struct TrainTodayLabel_Previews: PreviewProvider {
    static var previews: some View {
        TrainTodayLabel(title: "dssaa", state: .soon)
    }
}
