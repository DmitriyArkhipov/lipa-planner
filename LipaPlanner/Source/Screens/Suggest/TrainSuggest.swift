//
//  TrainSuggest.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI

struct TrainSuggest: View {
    @State var text = ""
    
//    init() {
//        UINavigationBar.appearance().barTintColor = UIColor(Color(hex: "1A1A20"))
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextInput(isFocused: true)
                    .padding(.horizontal, 16.0)
                List {
                    Text("test item")
                }.colorMultiply(Color(hex: "1A1A20"))
            }
            .background(Color(hex: "1A1A20").edgesIgnoringSafeArea(.all))
            .navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct TrainSuggest_Previews: PreviewProvider {
    static var previews: some View {
        TrainSuggest()
    }
}
