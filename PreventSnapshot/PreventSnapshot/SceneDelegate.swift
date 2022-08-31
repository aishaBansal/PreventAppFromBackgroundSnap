//
//  SceneDelegate.swift
//  PreventSnapshot
//
//  Created by Aishwarya on 30/08/22.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var dummyScreen: UIWindow?
    
    var window: UIWindow?
    var preventView : UIView?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        debugPrint(#function)
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        hidePreventScreen()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        debugPrint(#function)
        //            showPreventScreen()
        showCustomWindow()
    }
    
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
    
    /// showCustomWindow on main window
    fileprivate func showCustomWindow() {
        window = UIApplication.shared.keyWindow!
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeController = mainStoryboard.instantiateViewController(withIdentifier: "PreventVC") as! PreventVC
        preventView = homeController.view
        window?.addSubview(preventView ?? UIView());
    }
    
    /// Hide CustomWindow screen
    fileprivate func hideCustomWindow() {
        preventView?.removeFromSuperview()
        
    }
    
    
}

