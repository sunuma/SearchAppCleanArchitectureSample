//
//  SelectAddressViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit

/**
 *
 */
protocol SelectAddressViewInput: class {
    // 現在地検索
    func successCurrentLocation()
    func failureCurrentLocation(error: ApiError)
    // 住所入力検索
    func successTextField()
    func failureTextField(error: ApiError)
    // リスト選択での絞り込み検索
    func successTableView()
    func failureTableView(error: ApiError)
    
}

/**
 *
 */
class SelectAddressViewController: UIViewController {
    
    @IBOutlet weak var searchAddressField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let presenter = SelectAddressPresenter()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        searchAddressField.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        presenter.viewDidLoad(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - IBAction
    
    @IBAction func onClickCurrentLocation() {
        presenter.clickLocation()
    }
    
    @IBAction func onClickReturn() {
        
    }
}

// MARK: - UITextFieldDelegate

extension SelectAddressViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let inputText = textField.text else {
            return false
        }
        presenter.searchInputText(inputText)
        return true
    }
}

extension SelectAddressViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        presenter.setupTableCell(cell)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectedTableCell(tableView, didSelectRowAt: indexPath)
    }
}


extension SelectAddressViewController: SelectAddressViewInput {
    
    // MARK: - SelectAddressViewInput
    
    func successCurrentLocation() {
        switch currentSearchType {
        case .address:
            
            break
        case .purpose:
            
            break
        case .category:
            
            break
        }
    }
    
    func failureCurrentLocation(error: ApiError) {
        
    }
    
    func successTextField() {
        switch currentSearchType {
        case .address:
            
            break
        case .purpose:
            
            break
        case .category:
            
            break
        }
    }
    
    func failureTextField(error: ApiError) {
        
    }
    
    func successTableView() {
        switch currentSearchType {
        case .address:
            
            break
        case .purpose:
            
            break
        case .category:
            
            break
        }
    }
    
    func failureTableView(error: ApiError) {
        
    }
    
}
