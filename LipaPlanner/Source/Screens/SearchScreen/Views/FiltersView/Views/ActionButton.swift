//
//  ActionButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 20)
            .background(configuration.isPressed ? Colors.ActionButtonPressed : Colors.ActionButton)
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
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .buttonStyle(GreenButton())
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(title: "Action title").preferredColorScheme(.dark)
    }
}
