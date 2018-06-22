//
//  TopViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/13.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    var searchAddress: SelectAddressPresenterProtcol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func onClickSearchAddress() {
    }
    
    @IBAction func onClickSearchGroupCategory() {
        
    }
    
    @IBAction func onClickSearchShopCategory() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

