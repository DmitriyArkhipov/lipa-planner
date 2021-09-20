//
//  SelectorButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct SelectorButton: View {
    let title: String
    let onPress: (Bool) -> Void
    
    @State var isSelected: Bool = false
    
    var body: some View {
        Button(action: {
            isSelected = isSelected ? false : true
            
            onPress(isSelected)
        }, label: {
            Spacer()
            Text(title)
            Spacer()
        })
        .padding(.vertical, 16)
        .padding(.horizontal, 6)
        .colorMultiply(isSelected ? .green : .blue)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.green : Color.blue, lineWidth: 2)
        )
    }
}

struct SelectorButton_Previews: PreviewProvider {
    static var previews: some View {
        SelectorButton(title: "Button Title", onPress: { _ in print("TestLog")}, isSelected: false).preferredColorScheme(.dark)
    }
}
