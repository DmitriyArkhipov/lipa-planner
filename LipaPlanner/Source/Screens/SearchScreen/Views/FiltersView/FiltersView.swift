//
//  FiltersView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct FiltersView: View {
    @State var test = ""

    var body: some View {
        VStack{
            HStack {
                DateSelectorButton(
                    title: "31.03.21",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
                Spacer()
                SelectorButton(
                    title: "Сегодня",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
                Spacer()
                SelectorButton(
                    title: "Завтра",
                    onPress: { isSelected in print("test: ", isSelected)}
                )
            }
            Text("Откуда")
            Text("Куда")
            HStack {
                Button("Ускоренные", action: {})
                Spacer()
                Button("Все", action: {})
            }
        }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
