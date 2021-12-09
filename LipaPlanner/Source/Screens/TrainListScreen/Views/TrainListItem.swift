//
//  TrainListItem.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 10.10.2021.
//

import SwiftUI

struct TrainListItem: View {
    var body: some View {
        VStack {
            HStack {
                Text("Test")
                Spacer()
                Text("Test")
            }
            HStack {
                Text("Test")
            }
            HStack {
                Text("Test")
            }
        }.background(Colors.RowBackground)
    }
}

struct TrainListItem_Previews: PreviewProvider {
    static var previews: some View {
        TrainListItem().preferredColorScheme(.dark)
    }
}
