//
//  TextInput.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI
import Introspect

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var isFocused: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct TextInput: View {
    @State var text = ""
    let placeholder: String
    var isFocused: Bool?
    
    var body: some View {
        VStack {
            CustomTextField(placeholder: Text(placeholder).foregroundColor(Color(hex: "A7A5B5")), text: $text, isFocused: isFocused ?? false)
        }
        .padding(.all, 20)
        .background(Color(hex: "393945"))
        .foregroundColor(Color(hex: "FFFFFF"))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .introspectTextField{ textField in
            if let focused = isFocused, focused {
                textField.becomeFirstResponder()
            }
        }
        
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TextInput(placeholder: "")
    }
}
