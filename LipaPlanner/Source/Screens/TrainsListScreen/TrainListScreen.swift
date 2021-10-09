//
//  TrainListScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.10.2021.
//

import SwiftUI

struct TrainListScreen: View {
    @State var openCard: Bool = false
    @State var value: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Text("Hello").onTapGesture {
                        self.openCard = true
                        self.value = "Hello"
                    }
                    Text("Hello2").onTapGesture {
                        self.openCard = true
                        self.value = "Hello2"
                    }
                    Text("Hello3").onTapGesture {
                        self.openCard = true
                        self.value = "Hello3"
                    }
                }
                NavigationLinkFromCode(isActive: self.$openCard) {
                    Text(self.value)
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
