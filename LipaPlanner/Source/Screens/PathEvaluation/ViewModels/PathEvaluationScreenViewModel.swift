//
//  PathEvaluationScreenViewModel.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 07.04.2022.
//

import Foundation
import Combine
import MapKit

class PathEvaluationScreenViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 51.507222,
            longitude: -0.1275
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )
    
    let trainSegment: TrainSegment
    
    private lazy var mapKitProvider: MapKitProvider = {
        return MapKitProvider()
    }()
    
    private lazy var geolocationProvider: GeolocationProvider = {
        return GeolocationProvider()
    }()
    
    init(with trainSegment: TrainSegment) {
        self.trainSegment = trainSegment
    }
    
    func requestRoutsAndRegions() {
        
        geolocationProvider.requestCurrentLocation(succeed: {[weak self] location in
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            
            self?.region = region
        }, failure: { error in
            debugPrint("error: ", error.localizedDescription)
        })
    }
}
