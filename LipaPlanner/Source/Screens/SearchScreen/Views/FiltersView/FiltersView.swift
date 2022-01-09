//
//  FiltersView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var viewModel = FiltersViewModel()
    
    var horizontalPadding: CGFloat {
        return isIpod7() ? 0 : 5
    }

    var body: some View {
        VStack{
            DaySelector(
                dateSelected: self.$viewModel.dateActiveSelected,
                dateValueSelected: self.$viewModel.dateSelected,
                todaySelected: self.$viewModel.todaySelected,
                tomorrowSelected: self.$viewModel.tomorrowSelected
            )
            .padding(.bottom, 20.0)
            InputButton(placeholder: "Откуда", selected: self.$viewModel.selectedFrom)
                .padding(.bottom, 10.0)
            InputButton(placeholder: "Куда", selected: self.$viewModel.selectedTo)
                .padding(.bottom, 20.0)
            SortSelector(
                acceleratedSelected: self.$viewModel.acceleratedSelected,
                alldSelected: self.$viewModel.alldSelected
            )
            .padding(.bottom, 24.0)
            ActionButton(title: "Показать расписание") {
                self.viewModel.trainListOpen()
            }
            NavigationLinkFromCode(isActive: self.$viewModel.trainListOpened) {
                TrainListScreen(
                    viewModel: TrainListScreenViewModel(query: self.viewModel.trainListQuery),
                    onPressBack: {
                        self.viewModel.trainListOpened = false
                    }
                )
            }
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView().preferredColorScheme(.dark)
    }
}
