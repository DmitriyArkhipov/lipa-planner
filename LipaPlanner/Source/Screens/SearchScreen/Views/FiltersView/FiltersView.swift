//
//  FiltersView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct FiltersView: View {
    @State var test = ""
    
    var horizontalPadding: CGFloat {
        return isIpod7() ? 0 : 5
    }

    var body: some View {
        VStack{
            HStack {
                DateSelectorButton(
                    title: "31.03.21",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
                .padding(.trailing, horizontalPadding)
                SelectorButton(
                    title: "Сегодня",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
                .padding(.trailing, horizontalPadding)
                SelectorButton(
                    title: "Завтра",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
            }
            .padding(.bottom, 20.0)
            InputButton(onSelected: { value in print("selected: ", value) }, placeholder: "Куда")
                .padding(.bottom, 10.0)
            InputButton(onSelected: { value in print("selected: ", value) }, placeholder: "Откуда")
                .padding(.bottom, 20.0)
            HStack {
                SelectorButton(
                    title: "Ускоренные",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
                .padding(.trailing, horizontalPadding)
                SelectorButton(
                    title: "Все",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
            }
            .padding(.bottom, 24.0)
            ActionButton(title: "Показать расписание")
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView().preferredColorScheme(.dark)
    }
}
