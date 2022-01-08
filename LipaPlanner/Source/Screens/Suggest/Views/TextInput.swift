//
//  TextInput.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.09.2021.
//

import SwiftUI
import Introspect

struct CustomTextField: View {
    @Binding var text: String
    
    var placeholder: Text
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }
    var isFocused: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }.onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
    }
}

struct TextInput: View {
    @Binding var text: String
    
    let placeholder: String
    var isFocused: Bool?
    
    var body: some View {
        VStack {
            CustomTextField(
                text: $text,
                placeholder: Text(placeholder).foregroundColor( Colors.InputPlaceholder),
                isFocused: isFocused ?? false
            )
        }
        .padding(.all, 16)
        .background(Colors.InputBackground)
        .foregroundColor(Colors.InputFilled)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .introspectTextField{ textField in
            if let focused = isFocused, focused {
                textField.becomeFirstResponder()
            }
        }
        
    }
}

struct TestView: View {
    @State var text: String = ""
    
    var body: some View {
        TextInput(text: $text, placeholder: "Placeholder")
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
