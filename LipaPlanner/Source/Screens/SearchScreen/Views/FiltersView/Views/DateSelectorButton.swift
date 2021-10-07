//
//  DateSelectorButton.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 05.09.2021.
//

import SwiftUI
import PartialSheet

struct DateSelectorButton: View {
    @Binding var selected: Bool

    @Binding var dateSelected: Date
    
    @State var showDatePicker: Bool = false
    
    var selectedButtonColor: Color {
        return selected ? Colors.SelectedFilterButton : Colors.UnselectedFilterButton
    }
    
    var selectedTitleColor: Color {
        return selected ? Colors.SelectedFilterButton : Colors.UnselectedTitleFilterButton
    }

    var body: some View {
        Button(action: {
            self.showDatePicker = true
        }, label: {
            HStack {
                Text(self.dateSelected.dayStringValue).font(.system(size: 24, design: .default)).padding(0.0)
                    
                VStack {
                    Text(self.dateSelected.shortMonthStringValue).font(.system(size: 16, design: .default))
                    Text(self.dateSelected.yearStringValue).font(.system(size: 16, design: .default))
                }
            }.foregroundColor(selectedTitleColor)
        })
        .padding(.vertical, 7)
        .padding(.horizontal, 16)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(selectedButtonColor, lineWidth: 2)
        )
        .partialSheet(isPresented: $showDatePicker, content: {
            VStack {
                DatePickerView(dateSelected: self.dateSelected) { date in
                    self.dateSelected = date
                    self.showDatePicker = false
                    self.selected = true
                }
            }
        })
    }
}

struct DateSelectorButton_TestView: View {
    @State var selected: Bool {
        didSet {
            print("selected: ", selected)
        }
    }
    @State var dateSelected: Date = Date() {
        didSet {
            print("dateSelected: ", dateSelected)
        }
    }
    
    var body: some View {
        DateSelectorButton(selected: $selected, dateSelected: $dateSelected).preferredColorScheme(.dark)
    }
}

struct DateSelectorButton_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectorButton_TestView(selected: false)
    }
}
