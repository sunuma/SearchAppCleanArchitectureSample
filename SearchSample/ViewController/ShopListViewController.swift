//
//  ShopListViewController.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ShopListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var shopSearch: ShopSearchPresenterProtocol!
    private let disposeBag = DisposeBag()
    private var shopData: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initalize(param: ShopAPIParam = ShopAPIParam()) {
        shopSearch = initializeShopSearch()
        subscribe()
        shopSearch.fetch(param: param)
    }
}

extension ShopListViewController: UITableViewDelegate, UITableViewDataSource {
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

extension ShopListViewController {
    func subscribe() {
        // shop search presenter subscribe
        shopSearch.shopData.subscribe(onNext: { [unowned self] result in
            appDump(result)
            self.shopData = result
            self.tableView.reloadData()
        }, onError: { error in
            appDump(error)
        }).disposed(by: disposeBag)
    }
}
