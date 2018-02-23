//
//  Shop.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/21.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import Foundation


struct Shop: Decodable {
    
    private(set) var hitPerPage: String = ""
    private(set) var pageOffset: String = ""
    private(set) var totalHitCount: String = ""
    private(set) var info: [ShopInfo] = []
    private(set) var errorInfo: ErrorInfo?
    
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
 
    private(set) var shopId: String
    private(set) var address: String
    private(set) var category: String
    private(set) var budget: String? = nil
    private(set) var holiday: String? = nil
    private(set) var latitude: String
    private(set) var longitude: String
    private(set) var lunch: String? = nil
    private(set) var name: String
    private(set) var nameKana: String
    private(set) var openTime: String? = nil
    private(set) var parkingLots: String? = nil
    private(set) var party: String? = nil
    private(set) var tel: String
    private(set) var telSub: String? = nil
    private(set) var updateDate: String
    private(set) var url: String
    private(set) var urlMobile: String
    private(set) var access: AccessInfo
    private(set) var code: CodeInfo
    private(set) var couponUrl: CouponUrlInfo
    private(set) var imageUrl: ImageUrlInfo
    private(set) var pr: PrInfo
    
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
    
    private(set) var line: String
    private(set) var note: String? = nil
    private(set) var station: String
    private(set) var stationExit: String? = nil
    private(set) var walk: String
    
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
    
    private(set) var areaCode: String
    private(set) var areaCodeS: String
    private(set) var areaName: String
    private(set) var areaNameS: String
    private(set) var prefCode: String
    private(set) var prefName: String
    private(set) var categoryCodeL: [String] = []
    private(set) var categoryCodeS: [String] = []
    private(set) var categoryNameL: [String] = []
    private(set) var categoryNameS: [String] = []
    
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
    
    private(set) var mobile: String? = nil
    private(set) var pc: String? = nil
    
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
    
    private(set) var qrCode: String?
    private(set) var shopImage1: String?
    private(set) var shopImage2: String?
    
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
    
    private(set) var prLong: String?
    private(set) var prShort: String?
    
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
    
    private(set) var code: String
    private(set) var message: String
    
}
