//
//  PathEvaluation.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 15.01.2022.
//

import SwiftUI
import MapKit

struct PathEvaluationScreen: View {
    let onPressBack: () -> Void
    @ObservedObject var viewModel: PathEvaluationScreenViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Map(
                        coordinateRegion: self.$viewModel.region,
                        showsUserLocation: true
                    )
                    .frame(height: 300)
                    Spacer()
                }
                VStack {
                    Spacer()
                    Text("Hello test")
                }
            }
            .navigationBarTitle("Оценка пути до станции", displayMode: .inline)
            .navigationBarItems(leading: Button(action: onPressBack, label: {
                HStack {
                    Image("CloseButton")
                        .renderingMode(.template)
                        .foregroundColor(Colors.ActionButton)
                }
            }))
            .onAppear {
                self.viewModel.requestRoutsAndRegions()
            }
        }
    }
}

//struct PathEvaluation_Previews: PreviewProvider {
//    static var previews: some View {
//        PathEvaluationScreen(onPressBack: {}).preferredColorScheme(.dark)
//    }
//}
