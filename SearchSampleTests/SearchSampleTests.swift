//
//  SearchSampleTests.swift
//  SearchSampleTests
//
//  Created by 鵜沼 心 on 2018/02/13.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import XCTest
@testable import SearchSample

class SearchSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /**
     * エリアデータ取得API検証
     *
     */
    func testAreaRequest() {
        
        let exception = self.expectation(description: "completed testAreaRequest")
        
        let request = AreaRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? Area else {
                XCTFail("result is not Area")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "AreaInfo's list count is zero")
            // PrefecturesInfoの中身
            let info = data.info.first!
            XCTAssertTrue(info.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(info.name != "", "Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    /**
     * 都道府県データ取得API検証
     *
     */
    func testPrefecturesRequest() {
        
        let exception = self.expectation(description: "completed PrefecturesRequest")
        
        let request = PrefecturesRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? Prefectures else {
                XCTFail("result is not Prefectures")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "PrefecturesInfo's list count is zero")
            // PrefecturesInfoの中身
            let info = data.info.first!
            XCTAssertTrue(info.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(info.name != "", "Paramter 'name' is empty")
            XCTAssertTrue(info.areaCode != "", "Paramter 'areaCode' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    /**
     * エリア大データ取得API検証
     *
     */
    func testAreaLargeRequest() {
        
        let exception = self.expectation(description: "completed AreaLargeRequest")
        
        let request = AreaLargeRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? AreaLarge else {
                XCTFail("result is not AreaLarge")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "AreaLargeInfo's list count is zero")
            // AreaLargeInfoの中身
            let areaLInfo = data.info.first!
            XCTAssertTrue(areaLInfo.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(areaLInfo.name != "", "Paramter 'name' is empty")
            // AreaLPrefInfoの中身
            let prefInfo = areaLInfo.info
            XCTAssertTrue(prefInfo.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(prefInfo.name != "", "Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    /**
     * エリア中データ取得API検証
     *
     */
    func testAreaMiddleRequest() {
        
        let exception = self.expectation(description: "completed AreaMiddleRequest")
        
        let request = AreaMiddleRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? AreaMiddle else {
                XCTFail("result is not AreaMiddle")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "AreaMiddleInfo's list count is zero")
            // AreaMiddleInfoの中身
            let areaMInfo = data.info.first!
            XCTAssertTrue(areaMInfo.code != "", "AreaMiddleInfo's Paramter 'code' is empty")
            XCTAssertTrue(areaMInfo.name != "", "AreaMiddleInfo's Paramter 'name' is empty")
            // AreaLInfoの中身
            let areaLInfo = areaMInfo.areaLInfo
            XCTAssertTrue(areaLInfo.code != "", "AreaLInfo's Paramter 'code' is empty")
            XCTAssertTrue(areaLInfo.name != "", "AreaLInfo's Paramter 'name' is empty")
            // AreaPrefInfoの中身
            let prefInfo = areaMInfo.prefInfo
            XCTAssertTrue(prefInfo.code != "", "AreaPrefInfo's Paramter 'code' is empty")
            XCTAssertTrue(prefInfo.name != "", "AreaPrefInfo's Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    /**
     * エリア小データ取得API検証
     *
     */
    func testAreaSmallRequest() {
        
        let exception = self.expectation(description: "completed AreaSmallRequest")
        
        let request = AreaSmallRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? AreaSmall else {
                XCTFail("result is not AreaSmall")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "AreaSmallInfo's list count is zero")
            // AreaSmallInfoの中身
            let areaSmallInfo = data.info.first!
            XCTAssertTrue(areaSmallInfo.code != "", "AreaSmallInfo's Paramter 'code' is empty")
            XCTAssertTrue(areaSmallInfo.name != "", "AreaSmallInfo's Paramter 'name' is empty")
            // AreaLInfoの中身
            let areaLInfo = areaSmallInfo.areaLInfo
            XCTAssertTrue(areaLInfo.code != "", "AreaLInfo's Paramter 'code' is empty")
            XCTAssertTrue(areaLInfo.name != "", "AreaLInfo's Paramter 'name' is empty")
            // AreaMInfoの中身
            let areaMInfo = areaSmallInfo.areaMInfo
            XCTAssertTrue(areaMInfo.code != "", "AreaMInfo's Paramter 'code' is empty")
            XCTAssertTrue(areaMInfo.name != "", "AreaMInfo's Paramter 'name' is empty")
            // AreaPrefInfoの中身
            let prefInfo = areaSmallInfo.prefInfo
            XCTAssertTrue(prefInfo.code != "", "AreaPrefInfo's Paramter 'code' is empty")
            XCTAssertTrue(prefInfo.name != "", "AreaPrefInfo's Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
        
    }

    /**
     * 業態カテゴリ大データ取得API検証
     *
     */
    func testCategoryLargeRequest() {
        
        let exception = self.expectation(description: "completed CategoryLargeRequest")
        
        let request = CategoryLargeRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? CategoryLarge else {
                XCTFail("result is not CategoryLarge")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "CategoryLargeInfo's list count is zero")
            // CategoryLargeInfoの中身
            let categoryLInfo = data.info.first!
            XCTAssertTrue(categoryLInfo.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(categoryLInfo.name != "", "Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    /**
     * 業態カテゴリ小データ取得API検証
     *
     */
    func testCategorySmallRequest() {
        
        let exception = self.expectation(description: "completed CategorySmallRequest")
        
        let request = CategorySmallRequest()
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? CategorySmall else {
                XCTFail("result is not CategorySmall")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "CategorySmallInfo's list count is zero")
            // CategoryLargeInfoの中身
            let categoryLInfo = data.info.first!
            XCTAssertTrue(categoryLInfo.parentCode != "", "Paramter 'parentCode' is empty")
            XCTAssertTrue(categoryLInfo.code != "", "Paramter 'code' is empty")
            XCTAssertTrue(categoryLInfo.name != "", "Paramter 'name' is empty")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
            
        })
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
    /**
     * ショップ情報取得API検証
     *
     */
    func testShopRequest() {
        
        let exception = self.expectation(description: "completed ShopRequest")
        
        let name = "サンミ 大手町店 "
        let tel = "03-6273-4214"
        let address = "〒100-0005 東京都千代田区丸の内1-3-2 三井住友銀行東館B1F"
        
        var request = ShopRequest()
        request.param.name = name
        request.param.tel = tel
        request.param.address = address
        
        HttpsClient().request(request, success: { result in
            
            guard let data = result as? Shop else {
                XCTFail("result is not Shop")
                return
            }
            // リストサイズ
            XCTAssertTrue(data.info.count > 0, "ShopInfo's list count is zero")
            // ShopInfoの中身
            let shopInfo = data.info.first!
            XCTAssertTrue(shopInfo.shopId != "", "Paramter 'shopId' is empty")
            XCTAssertTrue(shopInfo.name == name, "Paramter 'name' is not \(name)")
            XCTAssertTrue(shopInfo.address == address, "Paramter 'address' is not \(address)")
            XCTAssertTrue(shopInfo.tel == tel, "Paramter 'tel' is not \(tel)")
            
            exception.fulfill()
            
        }, failure: { error in
            
            XCTFail(error.errorDescription())
            
            exception.fulfill()
        })
        self.waitForExpectations(timeout: 5, handler: nil)
    }
    
}
