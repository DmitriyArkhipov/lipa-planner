//
//  TrainSuggest.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI
import SwiftUIRefresh

struct TrainSuggestScreen: View {
    let title: String
    let onPressBack: () -> Void
    let onSelected: (RaspSuggestedItem) -> Void
    
    @ObservedObject var viewModel = TrainSuggestViewModel()
    
    @State var isFocused = true
    
    init(
        title: String,
        onPressBack: @escaping () -> Void,
        onSelected: @escaping (RaspSuggestedItem) -> Void)
    {
        UITableView.appearance().backgroundColor = .clear
        
        self.title = title
        self.onPressBack = onPressBack
        self.onSelected = onSelected
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextInput(
                    text: self.$viewModel.inputText,
                    placeholder: "Название станции",
                    isFocused: self.isFocused
                )
                .padding(.horizontal, isIpod7() ? 0 : 16)
                List {
                    ForEach(self.viewModel.suggests, id: \.self) { suggest in
                        Button(action: {
                            self.isFocused = false
                            self.onSelected(suggest)
                        }) {
                            VStack(alignment: .leading) {
                                Text(suggest.titleRu)
                                Text(suggest.itemType)
                                    .font(.footnote)
                                    .fontWeight(.light)
                            }.listRowBackground(Colors.RowBackground)
                        }
                    }
                }
                .pullToRefresh(
                    isShowing: self.$viewModel.isLoading,
                    onRefresh: {
                        self.viewModel.refresh()
                    }
                )
                .animation(.default)
                .padding(.top, -16.0)
                .foregroundColor(Colors.InputFilled)
                .listStyle(InsetGroupedListStyle())
            }
            .padding(.top, 16.0)
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .navigationBarTitle(title, displayMode: .inline)
            .navigationBarItems(leading: Button(action: onPressBack, label: {
                HStack {
                    Image("CloseButton")
                        .renderingMode(.template)
                        .foregroundColor(Colors.ActionButton)
                }
            }))
        }
    }
}

struct TrainSuggest_Previews: PreviewProvider {
    static var previews: some View {
        TrainSuggestScreen(title: "Test", onPressBack: {}, onSelected: { selected in print("test")}).preferredColorScheme(.dark)
    }
}
