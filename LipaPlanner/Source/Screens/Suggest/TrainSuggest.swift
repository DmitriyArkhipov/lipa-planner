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
    
    @ObservedObject var viewModel = TrainSuggestViewModel()
    
    init(title: String, onPressBack: @escaping () -> Void) {
        UITableView.appearance().backgroundColor = .clear
        
        self.title = title
        self.onPressBack = onPressBack
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextInput(text: $viewModel.inputText, placeholder: "Название станции",isFocused: true)
                    .padding(.horizontal, isIpod7() ? 0 : 16)
                List {
                    ForEach(self.viewModel.suggests, id: \.self) { suggest in
                        Text(suggest.titleRu).listRowBackground(Colors.RowBackground)
                    }
                }
                .padding(.top, -16.0)
                .foregroundColor(Colors.InputFilled)
                .listStyle(InsetGroupedListStyle())
            }
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(leading: Button(action: onPressBack, label: {
                HStack {
                    Image("BackButton")
                }
            }))
        }
//        .onAppear {
//            self.viewModel.fetch()
//        }
    }
}

struct TrainSuggest_Previews: PreviewProvider {
    static var previews: some View {
        TrainSuggest(title: "Test", onPressBack: {})
    }
}
