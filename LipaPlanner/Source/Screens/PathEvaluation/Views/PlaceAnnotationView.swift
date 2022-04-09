//
//  PlaceAnnotationView.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 10.04.2022.
//

import SwiftUI
import MapKit

struct PlaceAnnotationView: View {
    let type: AnnotationType
    
    private var backgroundColor: Color {
        switch type {
        case .source:
            return .blue
        case .destination:
            return .green
        }
    }
    
    var body: some View {
        VStack {
            ZStack{
                Image("PinBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(self.backgroundColor)
                switch self.type {
                case .source:
                    Image("MenPinIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .padding(.bottom, 10.0)
                        .frame(width: 20.0, height: 35.0)
                case .destination:
                    Image("TrainPinIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .padding(.bottom, 10.0)
                        .frame(width: 20.0, height: 34.0)
                }
            }
            .frame(width: 40, height: 44, alignment: .top)
            .padding(.bottom, 40.0)
        }
    }
}

struct PlaceAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView(type: .destination)
        PlaceAnnotationView(type: .source)
    }
}
