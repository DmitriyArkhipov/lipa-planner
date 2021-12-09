//
//  TrainListScreen.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 07.10.2021.
//

import SwiftUI

struct TrainListScreen: View {
    @State var openCard: Bool = false
    @State var value: String = ""
    
    @ObservedObject var viewModel: TrainListScreenViewModel
    
    let onPressBack: () -> Void
    
    var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(0...3, id: \.self) { _ in
                        Text("Hello").onTapGesture {
                            self.openCard = true
                            self.value = "Hello"
                        }
                        Text("Hello2").onTapGesture {
                            self.openCard = true
                            self.value = "Hello2"
                        }
                        Text("Hello3").onTapGesture {
                            self.openCard = true
                            self.value = "Hello3"
                        }
                    }
                    NavigationLinkFromCode(isActive: self.$openCard) {
                        Text(self.value)
                    }
                }
            }
            .navigationBarTitle("Расписание", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(
                    action: onPressBack,
                    label: {
                        HStack {
                            Image("BackButton")
                        }
                    }
                )
            )
            .background(Colors.Background.edgesIgnoringSafeArea(.all))
            .onAppear {
                self.viewModel.fetch()
            }
    }
}

struct TrainListScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrainListScreen(
            viewModel: TrainListScreenViewModel(query: nil),
            onPressBack: {}
        )
    }
}
