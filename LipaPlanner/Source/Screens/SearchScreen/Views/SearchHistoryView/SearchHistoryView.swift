//
//  SearchHistoryView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct SearchHistoryView: View {
    var body: some View {
        Text("Вы смотрели")
            .font(.system(size: 22, design: .default))
            .fontWeight(.bold)
    }
}

struct SearchHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryView().preferredColorScheme(.dark)
    }
}
