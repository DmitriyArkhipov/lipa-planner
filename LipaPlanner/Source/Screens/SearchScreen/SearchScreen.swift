//
//  SearchScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                FiltersView().padding(isIpod7() ? 0 : 16)
                SearchHistoryView()
            }
            .clipped()
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationTitle("")
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
