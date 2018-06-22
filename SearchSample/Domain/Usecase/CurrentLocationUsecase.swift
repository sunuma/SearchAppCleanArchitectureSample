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
class CurrentLocationUsecase: NSObject {
    private let locationManager = CLLocationManager()
    private(set) var location = CLLocationCoordinate2D()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}

extension CurrentLocationUsecase: CLLocationManagerDelegate {
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugLog()
        guard let newLocation = locations.last else { return }
        location = newLocation.coordinate
        var request = ShopRequest()
        request.param.latitude = location.latitude
        request.param.longitude = location.longitude
        
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
