//
//  FiltersView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct FiltersView: View {
    @State var test = ""

    var body: some View {
        VStack{
            TextField("Откуда", text: $test)
            TextField("Куда", text: $test)
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
