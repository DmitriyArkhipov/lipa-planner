//
//  DatePickerView.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.10.2021.
//

import SwiftUI
import PartialSheet

struct DatePickerView: View {
    @State var dateSelected: Date = Date()

    let onSelected: (Date) -> Void
    
    @EnvironmentObject var partialSheet : PartialSheetManager
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10.0)
            DatePicker("", selection: self.$dateSelected, displayedComponents: .date)
                .padding(.horizontal, 16.0)
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(Colors.ActionButton)
                .gesture(DragGesture().onChanged{_ in })
            ActionButton(title: "Готово") {
                self.onSelected(self.dateSelected)
            }
            .padding([.leading, .bottom, .trailing], 16.0)
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(onSelected: { _ in }).preferredColorScheme(.dark)
    }
}
