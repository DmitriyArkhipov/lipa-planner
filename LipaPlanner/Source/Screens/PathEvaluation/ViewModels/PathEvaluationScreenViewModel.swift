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
    
    @Published var annotationItems: [TypedPointAnnotation] = []
    
    let trainSegment: TrainSegment
    
    private lazy var mapKitProvider: MapKitProvider = {
        return MapKitProvider()
    }()
    
    private lazy var geolocationProvider: GeolocationProvider = {
        return GeolocationProvider()
    }()
    
    private var evaluationPath: EvaluationPath? {
        didSet {
            guard
                let source = evaluationPath?.source,
                let destination = evaluationPath?.destination
            else {
                return
            }
            
            let sourceAnnotation = self.mapKitProvider.createAnnotation(from: source, type: .source)
            let destinationAnnotation = self.mapKitProvider.createAnnotation(from: destination, type: .destination)
            
            self.annotationItems = [
                sourceAnnotation,
                destinationAnnotation
            ]
        }
    }
    
    init(with trainSegment: TrainSegment) {
        self.trainSegment = trainSegment
    }
    
    func requestRoutsAndRegions() {
        
        geolocationProvider.requestCurrentLocation(succeed: {[weak self] location in
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            
            guard let weakSelf = self else {
                return
            }
            
            let sourceMapKitItem = weakSelf.mapKitProvider.getMapItem(from: location)
            
            weakSelf.evaluationPath = EvaluationPath(source: sourceMapKitItem, destination: nil)
            
            weakSelf.mapKitProvider.requestStationLocation(
                at: weakSelf.trainSegment,
                region: region,
                succeed: {[sourceMapKitItem] stationMapKitItem in
                    self?.evaluationPath = EvaluationPath(
                        source: sourceMapKitItem,
                        destination: stationMapKitItem
                    )
                },
                failure: {
                    debugPrint("Ошибка определения точек")
                }
            )
            
            self?.region = region
        }, failure: { error in
            debugPrint("error: ", error.localizedDescription)
        })
    }
}
