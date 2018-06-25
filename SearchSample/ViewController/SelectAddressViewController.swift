//
//  SelectAddressViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

class SelectAddressViewController: UIViewController {
    @IBOutlet weak var searchAddressField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    private var selectAddress: SelectAddressPresenterProtcol!
    private var currentLocation: CurrentLocationPresenterProtocol!
    private let disposeBag = DisposeBag()
    private var listData: [PrefecturesInfo] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
        searchAddressField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        selectAddress = initializeSelectAddress()
        currentLocation = initializeCurrentLocation()
        subscribe()
        selectAddress.subscribe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - IBAction
    
    @IBAction func onClickCurrentLocation() {
        currentLocation.requestLocation()
    }
}

// MARK: - UITextFieldDelegate

extension SelectAddressViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let _ = textField.text else {
            return false
        }
        return true
    }
}

extension SelectAddressViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.selectAddressCell, for: indexPath) {
            cell.label.text = self.listData[indexPath.row].name
            return cell
        } else {
            let cell = UITableViewCell()
            cell.textLabel?.text = self.listData[indexPath.row].name
            return cell
        }
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let prefecturesInfo = self.listData[indexPath.row]
        var param = ShopAPIParam()
        param.pref = prefecturesInfo.code
        param.area = prefecturesInfo.areaCode
        let vc = R.storyboard.shopList.instantiateInitialViewController()!
        vc.initalize(param: param)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SelectAddressViewController {
    func subscribe() {
        // select address presenter subscribe
        selectAddress.listData.subscribe(onNext: { [unowned self] result in
            self.listData = result.info
            self.tableView.reloadData()
        }, onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
        // current location presenter subscribe
        currentLocation.useCase.coordinate.subscribe(onNext: { [unowned self] result in
            let vc = R.storyboard.shopListMap.instantiateInitialViewController()!
            vc.initalize(coordinate: result)
            self.navigationController?.pushViewController(vc, animated: true)
        }, onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
    }
}
