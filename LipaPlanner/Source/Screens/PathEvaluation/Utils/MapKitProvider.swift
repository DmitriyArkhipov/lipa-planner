//
//  MapKitProvider.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 03.04.2022.
//

import Foundation
import MapKit

class MapKitProvider {
    func getMapItem(from location: CLLocation) -> MKMapItem {
        let placemark = MKPlacemark(coordinate: location.coordinate, addressDictionary: nil)
        return MKMapItem(placemark: placemark)
    }

    func requestStationLocation(
        at trainSegment: TrainSegment,
        region: MKCoordinateRegion?,
        succeed: @escaping (_ mapItem: MKMapItem) -> Void,
        failure: @escaping () -> Void
    ) {
        let request = MKLocalSearch.Request()

        let stationTypeName = trainSegment.from.station_type_name
        let stationTitle = trainSegment.from.title

        request.naturalLanguageQuery = String(
            format: "%@ %@",
            stationTypeName,
            stationTitle
        )

        if let region = region {
            request.region = region
        }

        let search = MKLocalSearch(request: request)

        search.start { response, _ in
            guard let response = response else {
                failure()
                return
            }

            let matchingItems = response.mapItems

            succeed(matchingItems.first!)
        }
    }
}
