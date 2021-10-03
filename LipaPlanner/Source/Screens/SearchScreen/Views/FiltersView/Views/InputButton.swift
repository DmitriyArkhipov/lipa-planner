//
//  InputButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 06.09.2021.
//

import SwiftUI

struct InputButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 20)
            .background(configuration.isPressed ? Colors.InputPressed : Colors.InputBackground)
            .foregroundColor(Colors.InputPlaceholder)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct InputButton: View {
    let onSelected: (RaspSuggestedItem) -> Void
    let placeholder: String
    
    @State var value: String?
    @State var openSuggest = false
    
    var selectedColor: Color {
        return value != nil ? Colors.InputFilled : Colors.InputPlaceholder
    }
    
    var body: some View {
        Button(action: {
            openSuggest = true
        }, label: {
            VStack {
                HStack {
                    Text(value ?? placeholder).foregroundColor(self.selectedColor)
                    Spacer()
                }
            }
        })
        .buttonStyle(InputButtonStyle())
        .sheet(
            isPresented: $openSuggest,
            content: {
                TrainSuggest(
                    title: placeholder,
                    onPressBack: {
                        self.openSuggest = false
                    }, onSelected: { trainSuggestItem in
                        self.value = trainSuggestItem.titleRu
                        
                        self.onSelected(trainSuggestItem)
                        self.openSuggest = false
                    }
                )
            }
        )
    }
}

struct InputButton_Previews: PreviewProvider {
    static var previews: some View {
        InputButton(onSelected: { value in print("selected: ", value)}, placeholder: "Куда").preferredColorScheme(.dark)
    }
}
