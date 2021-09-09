//
//  TrainSuggest.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI

struct TrainSuggest: View {
    let title: String
    let onPressBack: () -> Void
    
    @State var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextInput(placeholder: "Название станции",isFocused: true)
                    .padding(.horizontal, 16.0)
                List {
                    Text("test item")
                }.colorMultiply(Color(hex: "1A1A20"))
            }
            .background(Color(hex: "1A1A20").edgesIgnoringSafeArea(.all))
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(leading: Button(action: onPressBack, label: {
                HStack {
                    Image("BackButton")
                }
            }))
        }
    }
}

struct TrainSuggest_Previews: PreviewProvider {
    static var previews: some View {
        TrainSuggest(title: "Test", onPressBack: {})
    }
}
