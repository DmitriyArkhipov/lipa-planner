//
//  TrainListSkeletonItem.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.12.2021.
//

import SwiftUI
import SkeletonUI

struct TrainListSkeletonItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("TodayLanel")
                    .skeleton(with: true)
                    .shape(
                        type: .rounded(.radius(10, style: .circular))
                    )
                    .frame(width: 104, height: 24, alignment: .trailing)
                Spacer()
                Text("")
                    .skeleton(with: true)
                    .frame(width: 24, height: 24, alignment: .trailing)
            }
            .padding([.top, .leading, .trailing], 15.0)
            HStack(alignment: .center) {
                Text("time-from")
                    .skeleton(with: true)
                    .frame(width: 58, height: 26, alignment: .trailing)
                    .padding(.trailing, 33.0)
                Text("duration")
                    .skeleton(with: true)
                    .frame(width: 41, height: 16, alignment: .trailing)
                    .padding(.trailing, 26.0)
                Text("time-to")
                    .skeleton(with: true)
                    .frame(width: 58, height: 26, alignment: .trailing)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            .padding([.top], 5.0)
            Spacer()
                .frame(height: 5.0)
            HStack {
                Text("station-from")
                    .skeleton(with: true)
                    .frame(width: 123, height: 18, alignment: .trailing)
                    .padding(.trailing, 45.0)
                Text("station-to")
                    .skeleton(with: true)
                    .frame(width: 123, height: 18, alignment: .trailing)
                Spacer()
            }
            .padding([.horizontal], 15.0)
            HStack {
                Text("train-thread")
                    .skeleton(with: true).frame(height: 20, alignment: .trailing)
                    .padding(.vertical, 10.0)
                    .padding(.leading, 15.0)
                    .padding(.trailing, 10.0)
                Spacer()
            }
            .cornerRadius(24.0, corners: [.topRight])
            .padding(.trailing, 32.0)
        }
        .background(Colors.RowBackground)
        .cornerRadius(24.0)
    }
}

struct TrainListSkeletonItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainListSkeletonItem().preferredColorScheme(.dark)
    }
}
