//
//  TopViewController.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/13.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onClickSearchAddress() {
        let vc = R.storyboard.selectAddress.instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func onClickSearchGroupCategory() {
    }
    
    @IBAction func onClickSearchShopCategory() {
        let vc = R.storyboard.selectCategory.instantiateInitialViewController()!
        navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

