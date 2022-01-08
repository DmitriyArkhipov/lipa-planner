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
            .padding(.all, 16)
            .background(configuration.isPressed ? Colors.InputPressed : Colors.InputBackground)
            .foregroundColor(Colors.InputPlaceholder)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct InputButton: View {
    let placeholder: String
    
    @Binding var selected: RaspSuggestedItem?
    
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
                        self.selected = trainSuggestItem
                        self.openSuggest = false
                    }
                )
            }
        )
    }
}

struct InputButton_TestView: View {
    @State var selected: RaspSuggestedItem? {
        didSet {
            print("selected: ", selected)
        }
    }
    
    var body: some View {
        InputButton(placeholder: "Куда", selected: $selected)
    }
}

struct InputButton_Previews: PreviewProvider {
    static var previews: some View {
        InputButton_TestView(selected: nil)
    }
}
