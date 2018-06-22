//
//  AppDelegate.swift
//  SearchSample
//
//  Created by 鵜沼 心 on 2018/02/13.
//  Copyright © 2018年 鵜沼 心. All rights reserved.
//

import UIKit

func debugLog(_ description: String = "", function: String = #function, file: String = #file, line: Int = #line) {
    var message = "\n\(file):\(line) \nfunction >>> \(function)"
    if !description.isEmpty {
        message = (message + "\ndescription >>> \(description)")
    }
    message = message + "\n"
    print(message)
}

func appPrint(_ items: Any...) {
    #if DEBUG
    Swift.print(items)
    #endif
}

func appDump<T>(_ value: T) {
    #if DEBUG
    Swift.dump(value)
    #endif
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

