//
//  SortSelector.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 09.01.2022.
//

import SwiftUI

struct SortSelector: View {
    @Binding var acceleratedSelected: Bool
    @Binding var alldSelected: Bool
    
    var horizontalPadding: CGFloat {
        return isIpod7() ? 0 : 5
    }
    
    var body: some View {
        HStack {
            SelectorButton(
                title: "Ускоренные",
                selected: self.$acceleratedSelected
            )
            .padding(.trailing, horizontalPadding)
            SelectorButton(
                title: "Все",
                selected: self.$alldSelected
            )
        }
    }
}

struct SortSelector_TestView: View {
    @State var acceleratedSelected: Bool = false
    @State var alldSelected: Bool = false
    
    var body: some View {
        SortSelector(acceleratedSelected: $acceleratedSelected, alldSelected: $alldSelected)
    }
}

struct SortSelector_Previews: PreviewProvider {
    static var previews: some View {
        SortSelector_TestView().preferredColorScheme(.dark)
    }
}
