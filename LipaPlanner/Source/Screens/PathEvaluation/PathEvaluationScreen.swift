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
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        NavigationView {
            VStack {
                Map(coordinateRegion: $region)
                            .frame(width: 400, height: 300)
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
