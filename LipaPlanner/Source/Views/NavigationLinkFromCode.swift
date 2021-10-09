//
//  NavigationLinkFromCode.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.10.2021.
//

import SwiftUI

struct NavigationLinkFromCode<Content: View>: View {
    @Binding var isActive: Bool
    @ViewBuilder var destination: Content
    
    var body: some View {
        NavigationLink("", destination: destination, isActive: self.$isActive).hidden()
    }
}

struct NavigationLinkFromCode_Test: View {
    @State var opened: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Button("Test"){
                    opened = true
                }
                NavigationLinkFromCode(isActive: self.$opened){
                    Text("Hello")
                }
            }
        }
    }
}

struct NavigationLinkFromCode_Previews: PreviewProvider {
    @State var opened: Bool = false
    
    static var previews: some View {
        NavigationLinkFromCode_Test()
    }
}
