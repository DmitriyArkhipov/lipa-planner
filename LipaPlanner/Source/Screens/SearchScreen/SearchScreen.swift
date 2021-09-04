//
//  SearchScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        VStack{
            FiltersView()
            SearchHistoryView()
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
