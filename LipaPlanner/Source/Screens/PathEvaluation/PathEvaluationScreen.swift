//
//  PathEvaluation.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 15.01.2022.
//

import SwiftUI

struct PathEvaluationScreen: View {
    let onPressBack: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
            }
            .navigationBarTitle("Оценка пути до станции", displayMode: .inline)
            .navigationBarItems(leading: Button(action: onPressBack, label: {
                HStack {
                    Image("CloseButton")
                        .renderingMode(.template)
                        .foregroundColor(Colors.ActionButton)
                }
            }))
        }
    }
}

struct PathEvaluation_Previews: PreviewProvider {
    static var previews: some View {
        PathEvaluationScreen(onPressBack: {}).preferredColorScheme(.dark)
    }
}
