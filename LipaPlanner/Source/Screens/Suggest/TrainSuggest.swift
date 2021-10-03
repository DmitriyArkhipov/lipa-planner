//
//  TrainSuggest.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI
import SwiftUIRefresh

struct TrainSuggest: View {
    let title: String
    let onPressBack: () -> Void
    let onSelected: (RaspSuggestedItem) -> Void
    
    @ObservedObject var viewModel = TrainSuggestViewModel()
    
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
                    isFocused: true
                )
                .padding(.horizontal, isIpod7() ? 0 : 16)
                List {
                    ForEach(self.viewModel.suggests, id: \.self) { suggest in
                        Button(action: {
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
    }
}

struct TrainSuggest_Previews: PreviewProvider {
    static var previews: some View {
        TrainSuggest(title: "Test", onPressBack: {}, onSelected: { selected in print("test")}).preferredColorScheme(.dark)
    }
}
