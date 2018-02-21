//
//  Shop.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/21.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct Shop: Decodable {
    
    var hitPerPage: String = ""
    var pageOffset: String = ""
    var totalHitCount: String = ""
    var info: [ShopInfo] = []
    var errorInfo: ErrorInfo?
    
    private enum CodingKeys: String, CodingKey {
        case hitPerPage     = "hit_per_page"
        case pageOffset     = "page_offset"
        case totalHitCount  = "total_hit_count"
        case info           = "rest"
        case error
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        print("values allkeys = \(values.allKeys.description)")
        
        if let value = try? values.decode(String.self, forKey: .hitPerPage) {
            hitPerPage = value
        }
        if let value = try? values.decode(String.self, forKey: .pageOffset) {
            pageOffset = value
        }
        if let value = try? values.decode(String.self, forKey: .totalHitCount) {
            totalHitCount = value
        }
        if let value = try? values.decode([ShopInfo].self, forKey: .info) {
            info = value
            return
        }
        if let value = try? values.decode(ShopInfo.self, forKey: .info) {
            info.append(value)
            return
        }
        if let value = try? values.decode(ErrorInfo.self, forKey: .error) {
            errorInfo = value
        }
        
    }
    
}

struct ShopInfo: Decodable {
 
    var shopId: String
    var address: String
    var category: String
    var budget: String? = nil
    var holiday: String? = nil
    var latitude: String
    var longitude: String
    var lunch: String? = nil
    var name: String
    var nameKana: String
    var openTime: String? = nil
    var parkingLots: String? = nil
    var party: String? = nil
    var tel: String
    var telSub: String? = nil
    var updateDate: String
    var url: String
    var urlMobile: String
    var access: AccessInfo
    var code: CodeInfo
    var couponUrl: CouponUrlInfo
    var imageUrl: ImageUrlInfo
    var pr: PrInfo
    
    private enum CodingKeys: String, CodingKey {
        case shopId         = "id"
        case address
        case category
        case budget
        case holiday
        case latitude
        case longitude
        case lunch
        case name
        case nameKana       = "name_kana"
        case openTime       = "opentime"
        case parkingLots    = "parking_lots"
        case party
        case tel
        case telSub         = "tel_sub"
        case updateDate     = "update_date"
        case url
        case urlMobile      = "url_mobile"
        case access
        case code
        case couponUrl      = "coupon_url"
        case imageUrl       = "image_url"
        case pr
    }
    
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shopId = try values.decode(String.self, forKey: .shopId)
        address = try values.decode(String.self, forKey: .address)
        category = try values.decode(String.self, forKey: .category)
        latitude = try values.decode(String.self, forKey: .latitude)
        longitude = try values.decode(String.self, forKey: .longitude)
        name = try values.decode(String.self, forKey: .name)
        nameKana = try values.decode(String.self, forKey: .nameKana)
        tel = try values.decode(String.self, forKey: .tel)
        updateDate = try values.decode(String.self, forKey: .updateDate)
        url = try values.decode(String.self, forKey: .url)
        urlMobile = try values.decode(String.self, forKey: .urlMobile)
        access = try values.decode(AccessInfo.self, forKey: .access)
        code = try values.decode(CodeInfo.self, forKey: .code)
        couponUrl = try values.decode(CouponUrlInfo.self, forKey: .couponUrl)
        imageUrl = try values.decode(ImageUrlInfo.self, forKey: .imageUrl)
        pr = try values.decode(PrInfo.self, forKey: .pr)
        
        if let value = try? values.decode(String.self, forKey: .budget) {
            budget = value
        }
        if let value = try? values.decode(String.self, forKey: .holiday) {
            holiday = value
        }
        if let value = try? values.decode(String.self, forKey: .lunch) {
            lunch = value
        }
        if let value = try? values.decode(String.self, forKey: .openTime) {
            openTime = value
        }
        if let value = try? values.decode(String.self, forKey: .parkingLots) {
            parkingLots = value
        }
        if let value = try? values.decode(String.self, forKey: .telSub) {
            telSub = value
        }
        
    }
    
}

struct AccessInfo: Decodable {
    
    var line: String
    var note: String? = nil
    var station: String
    var stationExit: String? = nil
    var walk: String
    
    private enum CodingKeys: String, CodingKey {
        case line
        case note
        case station
        case stationExit    = "station_exit"
        case walk
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        line = try values.decode(String.self, forKey: .line)
        station = try values.decode(String.self, forKey: .station)
        walk = try values.decode(String.self, forKey: .walk)
        if let value = try? values.decode(String.self, forKey: .note) {
            note = value
        }
        if let value = try? values.decode(String.self, forKey: .stationExit) {
            stationExit = value
        }
    }
    
}

struct CodeInfo: Decodable {
    
    var areaCode: String
    var areaCodeS: String
    var areaName: String
    var areaNameS: String
    var prefCode: String
    var prefName: String
    var categoryCodeL: [String] = []
    var categoryCodeS: [String] = []
    var categoryNameL: [String] = []
    var categoryNameS: [String] = []
    
    private enum CodingKeys: String, CodingKey {
        case areaCode   = "areacode"
        case areaCodeS  = "areacode_s"
        case areaName   = "areaname"
        case areaNameS  = "areaname_s"
        case prefCode   = "prefcode"
        case prefName   = "prefname"
        case categoryCodeL  = "category_code_l"
        case categoryCodeS  = "category_code_s"
        case categoryNameL  = "category_name_l"
        case categoryNameS  = "category_name_s"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        areaCode = try values.decode(String.self, forKey: .areaCode)
        areaCodeS = try values.decode(String.self, forKey: .areaCodeS)
        areaName = try values.decode(String.self, forKey: .areaName)
        areaNameS = try values.decode(String.self, forKey: .areaNameS)
        prefCode = try values.decode(String.self, forKey: .prefCode)
        prefName = try values.decode(String.self, forKey: .prefName)
        if let value = try? values.decode([String].self, forKey: .categoryCodeL) {
            categoryCodeL = value
        }
        if let value = try? values.decode([String].self, forKey: .categoryCodeS) {
            categoryCodeS = value
        }
        if let value = try? values.decode([String].self, forKey: .categoryNameL) {
            categoryNameL = value
        }
        if let value = try? values.decode([String].self, forKey: .categoryNameS) {
            categoryNameS = value
        }
    }
    
}

struct CouponUrlInfo: Decodable {
    
    var mobile: String? = nil
    var pc: String? = nil
    
    private enum CodingKeys: String, CodingKey {
        case moblie
        case pc
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? values.decode(String.self, forKey: .moblie) {
            mobile = value
        }
        if let value = try? values.decode(String.self, forKey: .pc) {
            pc = value
        }
    }
    
}

struct ImageUrlInfo: Decodable {
    
    var qrCode: String?
    var shopImage1: String?
    var shopImage2: String?
    
    private enum CodingKeys: String, CodingKey {
        case qrCode     = "qrcode"
        case shopImage1 = "shop_image1"
        case shopImage2 = "shop_image2"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? values.decode(String.self, forKey: .qrCode) {
            qrCode = value
        }
        if let value = try? values.decode(String.self, forKey: .shopImage1) {
            shopImage1 = value
        }
        if let value = try? values.decode(String.self, forKey: .shopImage2) {
            shopImage2 = value
        }
    }
    
}

struct PrInfo: Decodable {
    
    var prLong: String?
    var prShort: String?
    
    private enum CodingKeys: String, CodingKey {
        case prLong     = "pr_long"
        case prShort    = "pr_short"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let value = try? values.decode(String.self, forKey: .prLong) {
            prLong = value
        }
        if let value = try? values.decode(String.self, forKey: .prShort) {
            prShort = value
        }
    }
    
}

struct ErrorInfo: Decodable {
    
    var code: String
    var message: String
    
}
