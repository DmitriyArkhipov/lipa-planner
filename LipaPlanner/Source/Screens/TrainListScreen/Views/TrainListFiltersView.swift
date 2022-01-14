//
//  TrainListFiltersView.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 14.01.2022.
//

import SwiftUI

struct TrainListFiltersView: View {
    @ObservedObject var viewModel: TrainListFiltersViewModel
    
    var body: some View {
        VStack {
            DaySelector(
                dateSelected: self.$viewModel.dateActiveSelected,
                dateValueSelected: self.$viewModel.dateSelected,
                todaySelected: self.$viewModel.todaySelected,
                tomorrowSelected: self.$viewModel.tomorrowSelected
            )
            .padding(.vertical, 16.0)
            SortSelector(
                acceleratedSelected: self.$viewModel.acceleratedSelected,
                alldSelected: self.$viewModel.alldSelected
            )
        }
    }
}

struct TrainListFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        TrainListFiltersView(viewModel: TrainListFiltersViewModel(query: nil, sort: nil)).preferredColorScheme(.dark)
    }
}
