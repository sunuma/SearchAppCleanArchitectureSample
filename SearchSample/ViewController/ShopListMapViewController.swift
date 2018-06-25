//
//  ShopListMapViewController.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import MapKit
import CoreLocation

class ShopListMapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    private var shopSearch: ShopSearchPresenterProtocol!
    private let disposeBag = DisposeBag()
    private var shopData: Shop?
    private var coordinate: CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        initializeMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initalize(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        shopSearch = initializeShopSearch()
        subscribe()
        var param = ShopAPIParam()
        param.latitude = coordinate.latitude
        param.longitude = coordinate.longitude
        shopSearch.fetch(param: param)
    }
    
    private func initializeMapView() {
        var region = mapView.region
        region.span.latitudeDelta = 0.05
        region.span.longitudeDelta = 0.05
        mapView.setRegion(region, animated: true)
        mapView.userTrackingMode = .follow
        mapView.userTrackingMode = .followWithHeading
    }
    
    private func initializeMarker(shopData: Shop) {
        mapView.removeAnnotations(mapView.annotations)
        shopData.info.forEach {
            guard let lat = Double($0.latitude), let long = Double($0.longitude) else { return }
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = $0.name
            mapView.addAnnotation(annotation)
        }
    }
}

extension ShopListMapViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopData?.info.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.shopTableViewCell, for: indexPath),
            let shopInfo = shopData?.info[indexPath.row] {
            cell.setup(shopInfo: shopInfo)
            return cell
        }
        return ShopTableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ShopListMapViewController {
    func subscribe() {
        // shop search presenter subscribe
        shopSearch.shopData.subscribe(onNext: { [unowned self] result in
            appDump(result)
            self.shopData = result
            self.tableView.reloadData()
            guard let shopData = self.shopData else { return }
            self.initializeMarker(shopData: shopData)
        }, onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
    }
}
