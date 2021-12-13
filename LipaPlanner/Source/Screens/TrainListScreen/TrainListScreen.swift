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
    
    @ObservedObject var viewModel: TrainListScreenViewModel
    
    let onPressBack: () -> Void
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(self.viewModel.itemViewModels, id: \.id) { item in
                        TrainListItem(viewModel: item)
                            .padding([.leading, .trailing], 14.0)
                            .padding([.bottom], 10.0)
                    }
                }
            }
            .navigationBarTitle("Расписание", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(
                    action: onPressBack,
                    label: {
                        HStack {
                            Image("BackButton")
                        }
                    }
                )
            )
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .onAppear {
                self.viewModel.fetch()
            }
    }
}

struct TrainListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrainListScreen(
            viewModel: TrainListScreenViewModel(query: nil),
            onPressBack: {}
        )
    }
}
