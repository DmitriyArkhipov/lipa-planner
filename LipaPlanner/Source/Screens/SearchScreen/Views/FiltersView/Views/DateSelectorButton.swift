//
//  DateSelectorButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct DateSelectorButton: View {
    let title: String
    
    @Binding var selected: Bool
    
    var selectedButtonColor: Color {
        return selected ? Colors.SelectedFilterButton : Colors.UnselectedFilterButton
    }
    
    var selectedTitleColor: Color {
        return selected ? Colors.SelectedFilterButton : Colors.UnselectedTitleFilterButton
    }

    var body: some View {
        Button(action: {
            selected = selected ? false : true
        }, label: {
            HStack {
                Text("31").font(.system(size: 24, design: .default)).padding(0.0)
                    
                VStack {
                    Text("июл").font(.system(size: 16, design: .default))
                    Text("2021").font(.system(size: 16, design: .default))
                }
            }.foregroundColor(selectedTitleColor)
        })
        .padding(.vertical, 7)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedButtonColor, lineWidth: 2)
        )
    }
}

struct DateSelectorButton_TestView: View {
    @State var selected: Bool {
        didSet {
            print("selected: ", selected)
        }
    }
    
    var body: some View {
        DateSelectorButton(title: "Date", selected: $selected).preferredColorScheme(.dark)
    }
}

struct DateSelectorButton_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorButton_TestView(selected: false)
    }
}
