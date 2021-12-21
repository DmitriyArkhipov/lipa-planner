//
//  DaySelector.swift.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 22.12.2021.
//

import SwiftUI

struct DaySelector: View {
    @Binding var dateSelected: Bool
    @Binding var dateValueSelected: Date
    
    @Binding var todaySelected: Bool
    @Binding var tomorrowSelected: Bool
    
    var horizontalPadding: CGFloat {
        return isIpod7() ? 0 : 5
    }

    var body: some View {
        HStack {
            DateSelectorButton(
                selected: $dateSelected,
                dateSelected: $dateValueSelected
            )
            .padding(.trailing, horizontalPadding)
            SelectorButton(
                title: "Сегодня",
                selected: $todaySelected
            )
            .padding(.trailing, horizontalPadding)
            SelectorButton(
                title: "Завтра",
                selected: $tomorrowSelected
            )
        }
    }
}

struct DaySelector_TestView: View {
    @State var dateSelected = false
    @State var dateValueSelected = Date()

    @State var todaySelected = false
    @State var tomorrowSelected = false

    var body: some View {
        DaySelector(dateSelected: $dateSelected, dateValueSelected: $dateValueSelected, todaySelected: $todaySelected, tomorrowSelected: $tomorrowSelected)
    }
}

struct DaySelector_Previews: PreviewProvider {
    static var previews: some View {
        DaySelector_TestView().preferredColorScheme(.dark)
    }
}
