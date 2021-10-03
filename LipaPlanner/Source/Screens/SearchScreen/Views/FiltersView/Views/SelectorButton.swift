//
//  SelectorButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct SelectorButton: View {
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
            Spacer()
            Text(title)
            Spacer()
        })
        .foregroundColor(selectedTitleColor)
        .padding(.vertical, 16)
        .padding(.horizontal, 6)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedButtonColor, lineWidth: 2)
        )
    }
}

struct SelectorButton_TestView: View {
    @State var selected: Bool {
        didSet {
            print("selected: ", selected)
        }
    }
    
    var body: some View {
        SelectorButton(title: "Button Title", selected: $selected).preferredColorScheme(.dark)
    }
}

struct SelectorButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectorButton_TestView(selected: false)
    }
}
