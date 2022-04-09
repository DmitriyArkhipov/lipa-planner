//
//  GeolocationProvider.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 03.04.2022.
//

import Foundation
import CoreLocation

class GeolocationProvider: NSObject {
    static let domain = String(
        format: "%@.GeolocationProvider",
        Bundle.main.bundleIdentifier!
    )

    let deniedError = NSError(
        domain: domain,
        code: CLError.denied.rawValue,
        userInfo: [NSLocalizedDescriptionKey: "Доступ геоданным запрещен"])
    
    private let locationManager: CLLocationManager

    private var handleSucceed: ((CLLocation) -> Void)?
    private var handleFailure: ((Error) -> Void)?
    private var handleRequestCurrentLocation: (() -> Void)?
    
    private var handleFinally: () -> Void {
        return { [weak self] in
            self?.handleFailure = nil
            self?.handleSucceed = nil
        }
    }
    
    override init() {
        self.locationManager = CLLocationManager()

        super.init()

        self.locationManager.delegate = self
    }

    deinit {
        self.locationManager.delegate = nil
    }
    
    func requestCurrentLocation(
        succeed: (@escaping (_ location: CLLocation) -> Void),
        failure: ((_ error: Error) -> Void)?
    ) {
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.handleSucceed = succeed
        self.handleFailure = failure
        self.handleRequestCurrentLocation = {[weak self] in
            self?.locationManager.requestLocation()
        }

        let authorizationStatus = self.locationManager.authorizationStatus

        switch authorizationStatus {
        case .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        case .restricted, .denied:
            self.handleFailure?(self.deniedError)
        default:
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension GeolocationProvider: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.handleFailure?(error)
        self.handleFinally()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            self.handleRequestCurrentLocation?()
        case .denied, .restricted:
            self.handleFailure?(deniedError)
            self.handleFinally()
        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }

        self.locationManager.stopUpdatingLocation()
        self.handleSucceed?(location)
        self.handleFinally()
    }
}
