//
//  AppDelegate.swift
//  Chapter01 AdpativeUI
//
//  Created by lucian on 2020/1/2.
//  Copyright © 2020 oscar. All rights reserved.
//
/// 如果使用XCode一开始使用的Target 是13.0 则需要做一下步骤
/// 1. 删除 Info.plist 文件中 "Application Scene Manifest"
/// 2. 在AppDelegate 中定义 var window: UIWindow?  避免黑屏, 并且删除Scene相关的代码
/// 3. 删除 SceneDelegate.swift 文件

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

