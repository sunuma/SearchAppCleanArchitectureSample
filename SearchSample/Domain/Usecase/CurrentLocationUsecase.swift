//
//  CurrentLocationUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import CoreLocation

/**
 *
 */
protocol CurrentLocationUsecaseOutput: class {
    func fetchComplete(data: CurrentLocation)
    func failure(error: Error)
}

/**
 *
 */
class CurrentLocationUsecase: NSObject {
    
    weak var input: SelectAddressViewInput?
    private let locationManager = CLLocationManager()
    private(set) var location = CLLocationCoordinate2D()
    
    let dataStore = CurrentLocationDataStore()
    
    override init() {
        super.init()
        locationManager.delegate = self
        dataStore.output = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getLocation() {
        locationManager.requestLocation()
    }
    
}

extension CurrentLocationUsecase: CLLocationManagerDelegate {
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugLog()
        guard let newLocation = locations.last else { return }
        location = newLocation.coordinate
        let request = CurrentLocationRequest()
        dataStore.fetch(request: request)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // 位置情報の取得に失敗
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
            break
        default: break
        }
    }
    
}

extension CurrentLocationUsecase: CurrentLocationUsecaseOutput {
    
    // MARK: - CurrentLocationUsecaseOutput
    
    func fetchComplete(data: CurrentLocation) {
        input?.successCurrentLocation()
    }
    
    func failure(error: Error) {
        input?.failureCurrentLocation(error: error)
    }
    
}
