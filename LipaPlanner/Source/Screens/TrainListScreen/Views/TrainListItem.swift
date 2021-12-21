//
//  TrainListItem.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import SwiftUI

struct TrainListItem: View {
    let viewModel: TrainListItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if !self.viewModel.waitingTime.isEmpty {
                    TrainTodayLabel(title: self.viewModel.waitingTime, state: .soon)
                }
                Spacer()
                Button(action: {
                    debugPrint("press reminder")
                }) {
                    Image("ReminderIcon")
                }
            }
            .padding([.top, .leading, .trailing], 15.0)
            HStack(alignment: .center) {
                Text(self.viewModel.fromTime)
                    .font(.system(size: 22, design: .default))
                    .fontWeight(.bold)
                    .padding(.trailing, 33.0)
                Text(self.viewModel.duration)
                    .font(.system(size: 13, design: .default))
                    .fontWeight(.regular)
                    .padding(.trailing, 26.0)
                Text(self.viewModel.toTime)
                    .font(.system(size: 22, design: .default))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            .padding([.top], 5.0)
            Spacer()
                .frame(height: 5.0)
            HStack {
                Text(self.viewModel.fromTitle)
                    .font(.system(size: 15, design: .default))
                    .fontWeight(.regular)
                    .foregroundColor(Colors.TrainItemTitleStationColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: 123.0,alignment: .leading)
                    .padding(.trailing, 45.0)
                Text(self.viewModel.toTitle)
                    .font(.system(size: 15, design: .default))
                    .fontWeight(.regular)
                    .foregroundColor(Colors.TrainItemTitleStationColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: 123.0,alignment: .leading)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            HStack {
                Text(self.viewModel.trainThread)
                    .font(.system(size: 17, design: .default))
                    .fontWeight(.regular)
                    .padding(.vertical, 10.0)
                    .padding(.leading, 15.0)
                    .foregroundColor(Colors.TrainItemTitleStationColor)
                Spacer()
            }
            .background(Colors.TrainItemSpecSecondBackground)
            .cornerRadius(24.0, corners: [.topRight])
            .padding(.trailing, 32.0)
        }
        .background(Colors.RowBackground)
        .cornerRadius(24.0)
    }
}

//struct TrainListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        TrainListItem().preferredColorScheme(.dark)
//    }
//}
