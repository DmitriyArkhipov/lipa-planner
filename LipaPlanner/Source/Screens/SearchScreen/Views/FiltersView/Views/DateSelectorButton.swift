//
//  DateSelectorButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct DateSelectorButton: View {
    let title: String
    let onPress: (Bool) -> Void
    
    @State var isSelected: Bool = false
    
    var selectedButtonColor: Color {
        return isSelected ? Colors.SelectedFilterButton : Colors.UnselectedFilterButton
    }
    
    var selectedTitleColor: Color {
        return isSelected ? Colors.SelectedFilterButton : Colors.UnselectedTitleFilterButton
    }

    var body: some View {
        Button(action: {
            isSelected = isSelected ? false : true
            
            onPress(isSelected)
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

struct DateSelectorButton_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorButton(title: "Date", onPress: { _ in print("testlog")}).preferredColorScheme(.dark)
    }
}
