//
//  AppDelegate.swift
//  Graygram-clone-iOS
//
//  Created by aney on 2017. 3. 12..
//  Copyright © 2017년 Taedong Kim. All rights reserved.
//

import UIKit

import CGFloatLiteral
import Kingfisher
import ManualLayout
import SnapKit
import Then

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  /// `AppDelegate`의 인스턴스를 반환합니다.
  static var instance: AppDelegate? {
    return UIApplication.shared.delegate as? AppDelegate
  }
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    
    let splashViewController = SplashViewController()
    let navigationController = UINavigationController(rootViewController: splashViewController)
    window.rootViewController = navigationController
    
    self.window = window
    
    return true
  }
  
  func presentLoginSreen() {
    let loginViewController = LoginViewController()
    let navigationController = UINavigationController(rootViewController: loginViewController)
    self.window?.rootViewController = navigationController
  }
  
  func presentMainSreen() {
    let tabBarController = MainTabBarController()
    self.window?.rootViewController = tabBarController
  }
  
}

