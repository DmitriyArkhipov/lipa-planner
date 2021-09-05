//
//  SearchScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            FiltersView().padding()
            SearchHistoryView()
        }
        .clipped()
        .background(Color(hex: "1A1A20").edgesIgnoringSafeArea(.all))
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
