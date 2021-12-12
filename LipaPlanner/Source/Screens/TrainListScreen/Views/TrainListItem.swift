//
//  TrainListItem.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import SwiftUI

struct TrainListItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TrainTodayLabel(title: "Через 10 мин", state: .soon)
                Spacer()
                Button(action: {
                    debugPrint("press reminder")
                }) {
                    Image("ReminderIcon")
                }
            }
            .padding([.top, .leading, .trailing], 15.0)
            HStack(alignment: .center) {
                Text("12:30")
                    .font(.system(size: 22, design: .default))
                    .fontWeight(.bold)
                    .padding(.trailing, 33.0)
                Text("40 мин")
                    .font(.system(size: 13, design: .default))
                    .fontWeight(.regular)
                    .padding(.trailing, 26.0)
                Text("12:30")
                    .font(.system(size: 22, design: .default))
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            .padding([.top], 5.0)
            Spacer()
                .frame(height: 5.0)
            HStack {
                Text("Новосибирск-Главный")
                    .font(.system(size: 15, design: .default))
                    .fontWeight(.regular)
                    .foregroundColor(Colors.TrainItemTitleStationColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: 123.0,alignment: .leading)
                    .padding(.trailing, 45.0)
                Text("Новосибирск-Главный")
                    .font(.system(size: 15, design: .default))
                    .fontWeight(.regular)
                    .foregroundColor(Colors.TrainItemTitleStationColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: 123.0,alignment: .leading)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            HStack {
                Text("Черепаново - Новосибирск-Главный")
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

struct TrainListItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainListItem().preferredColorScheme(.dark)
    }
}
