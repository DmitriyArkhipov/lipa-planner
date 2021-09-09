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
            .background(configuration.isPressed ? Color(hex: "1A1A20") : Color(hex: "393945"))
            .foregroundColor(Color(hex: "A7A5B5"))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct InputButton: View {
    let onPress: () -> Void
    let placeholder: String
    var value: String?
    
    @State var openSuggest = false
    
    var body: some View {
        Button(action: {
            openSuggest = true
        }, label: {
            VStack {
                HStack {
                    Text(value ?? placeholder)
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
                        openSuggest = false
                    }
                )
            }
        )
    }
}

struct InputButton_Previews: PreviewProvider {
    static var previews: some View {
        InputButton(onPress: {}, placeholder: "Куда")
    }
}
