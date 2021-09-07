//
//  TestScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 06.09.2021.
//

import SwiftUI

struct TestScreen: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
//                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                Spacer()
            }
            .clipped()
            .background(Color(hex: "1A1A20").edgesIgnoringSafeArea(.all))
//            .navigationBarHidden(true)
        }
    }
}

struct TestScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestScreen()
    }
}
