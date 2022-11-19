//
//  SearchHistoryItem.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 11.04.2022.
//

import SwiftUI

struct SearchHistoryItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("когда")
            }
            .padding([.top, .leading, .trailing])
            HStack {
                Text("Откуда")
            }
            .padding(.horizontal)
            HStack {
                Text("Куда")
            }
            .padding([.leading, .bottom, .trailing])
        }
        .background(Colors.RowBackground)
        .cornerRadius(24.0)
    }
}

struct SearchHistoryItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryItem().preferredColorScheme(.dark)
    }
}
