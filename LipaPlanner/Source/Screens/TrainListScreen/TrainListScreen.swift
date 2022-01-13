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
                DaySelector(
                    dateSelected: self.$viewModel.dateActiveSelected,
                    dateValueSelected: self.$viewModel.dateSelected,
                    todaySelected: self.$viewModel.todaySelected,
                    tomorrowSelected: self.$viewModel.tomorrowSelected
                )
                .padding(.horizontal, 16.0)
                .padding(.vertical, 16.0)
                SortSelector(
                    acceleratedSelected: self.$viewModel.acceleratedSelected,
                    alldSelected: self.$viewModel.alldSelected
                )
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
            viewModel: TrainListScreenViewModel(query: nil, sort: nil)
        ).preferredColorScheme(.dark)
    }
}
