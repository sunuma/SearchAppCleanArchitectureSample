//
//  ShopDetailViewController.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ShopDetailViewController: UIViewController {
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var openTime: UILabel!
    @IBOutlet weak var access: UILabel!
    @IBOutlet weak var shopType: UILabel!
    private var shopData: ShopInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func set(shopInfo: ShopInfo) {
        self.shopData = shopInfo
    }
    
    private func initialize() {
        guard let shopInfo = self.shopData else { return }
        if let imageUrl = shopInfo.imageUrl.shopImage1, let url = URL(string: imageUrl) {
            shopImage.af_setImage(withURL: url)
        }
        category.text = shopInfo.category
        name.text = shopInfo.name
        tel.text = shopInfo.tel
        address.text = shopInfo.address
        openTime.text = shopInfo.openTime
        let accessInfo = shopInfo.access
        access.text = "[\(accessInfo.line)] " + "\(accessInfo.station)"
    }
}
