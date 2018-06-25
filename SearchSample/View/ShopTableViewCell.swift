//
//  ShopTableViewCell.swift
//  SearchSample
//
//  Created by Shin Unuma on 2018/06/25.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ShopTableViewCell: UITableViewCell {
    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var tel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(shopInfo: ShopInfo) {
        if let image1 = shopInfo.imageUrl.shopImage1 {
            let url = URL(string: image1)!
            shopImage.af_setImage(withURL: url)
        }
        category.text = shopInfo.category
        shopName.text = shopInfo.name
        address.text = shopInfo.address
        tel.text = shopInfo.tel
    }
}
