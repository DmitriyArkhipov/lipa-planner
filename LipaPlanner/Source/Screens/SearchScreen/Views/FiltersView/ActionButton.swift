//
//  ActionButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 20)
            .background(configuration.isPressed ? Color.green : Color.yellow)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ActionButton: View {
    let title: String
    
    var body: some View {
        Button(action: {}){
            HStack {
                Spacer()
                Text(title)
                    .font(.body)
                    .fontWeight(.bold)
                    .colorMultiply(.white)
                Spacer()
            }
        }
        .buttonStyle(BlueButton())
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Action title").preferredColorScheme(.dark)
    }
}
