//
//  TrainListScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.10.2021.
//

import SwiftUI

struct TrainListScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text("Hello")
                    Text("Hello2")
                    Text("Hello3")
                }
            }
        }
    }
}

struct TrainListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrainListScreen()
    }
}
