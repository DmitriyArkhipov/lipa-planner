//
//  TrainListScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.10.2021.
//

import SwiftUI
import SkeletonUI

struct TrainListScreen: View {
    @State var openCard: Bool = false
    @State var value: String = ""
    
    @ObservedObject var viewModel: TrainListScreenViewModel
    
    var body: some View {
            ScrollView {
                TrainListFiltersView(viewModel: self.viewModel.filtersViewModel)
                .padding(.horizontal, 16.0)
                .padding(.bottom, 16.0)
                TrainListSkeleton(loading: self.viewModel.isLoading) {
                    LazyVStack {
                        ForEach(self.viewModel.itemViewModels, id: \.id) { item in
                            TrainListItem(viewModel: item)
                                .padding([.leading, .trailing], 14.0)
                                .padding([.bottom], 10.0)
                        }
                    }
                }
                .padding(.top, 16.0)
            }
            .navigationBarTitle("Расписание", displayMode: .inline)
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .onAppear {
                if self.viewModel.itemViewModels.isEmpty {
                    self.viewModel.fetch()
                }
            }
    }
}

struct TrainListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrainListScreen(
            viewModel: TrainListScreenViewModel(filersViewModel: TrainListFiltersViewModel(query: nil, sort: nil))
        ).preferredColorScheme(.dark)
    }
}
