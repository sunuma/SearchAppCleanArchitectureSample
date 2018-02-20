//
//  SelectAddressPresenter.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/14.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit
import RxSwift

/**
 *
 */
class SelectAddressPresenter {
    
    //private var searchAddressUsecase = SearchAddressUsecase()
    private var currentLocationUsecase = CurrentLocationUsecase()
    private var inputAddressUsecase = InputAddressUsecase()
    
    
    func initialize() {
        
    }
    
    func viewDidLoad(_ input: SelectAddressViewInput) {
        currentLocationUsecase.input = input
        inputAddressUsecase.input = input
    }
    
    func clickLocation() {
        currentLocationUsecase.getLocation()
    }
    
    func searchInputText(_ text: String) {
        inputAddressUsecase.searchInputText(text)
    }
    
    func setupTableCell(_ cell: UITableViewCell) {
        
    }
    
    func selectedTableCell(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


