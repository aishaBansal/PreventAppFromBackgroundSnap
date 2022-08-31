//
//  AppDelegate.swift
//  PreventSnapshot
//
//  Created by Aishwarya on 30/08/22.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    private var preventScreen: UIWindow?
    var preventView : UIView?

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let packagePath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
        print(packagePath ?? "")
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        showPreventScreen()
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

//MARK: prevent Data leakage from snapshot
extension AppDelegate {
    //custom screen
    fileprivate func showPreventScreen() {
        window = UIApplication.shared.keyWindow!
        
        preventView = UIView(frame: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(UIScreen.main.bounds.size.width), height: CGFloat(UIScreen.main.bounds.size.height)))
        
        window?.addSubview(preventView ?? UIView());
        (preventView ?? UIView()).backgroundColor = .blue
        
    }
    
    /// Hide custom screen
    fileprivate func hidePreventScreen() {
        preventView?.removeFromSuperview()
    }
}
