//
//  CurrentLocationUsecase.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift

protocol CurrentLocationUsecaseProtocol {
    var coordinate: PublishSubject<CLLocationCoordinate2D> { get }
    func requestLocation()
}

class CurrentLocationUsecase: NSObject, CurrentLocationUsecaseProtocol {
    private let locationManager = CLLocationManager()
    private(set) var coordinate = PublishSubject<CLLocationCoordinate2D>()
    private var disposeBag = DisposeBag()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
}

extension CurrentLocationUsecase: CLLocationManagerDelegate {
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugLog()
        guard let newLocation = locations.last else { return }
        self.coordinate.on(.next(newLocation.coordinate))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.coordinate.on(.error(ApiError.resultError(error)))
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedWhenInUse, .authorizedAlways:
            appDump(status)
            break
        default: break
        }
    }
}
