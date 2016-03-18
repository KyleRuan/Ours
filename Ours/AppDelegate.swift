//
//  AppDelegate.swift
//  Ours
//
//  Created by Jason on 16/3/10.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import DigitsKit
import Appsee
import RealmSwift
import AVOSCloud

import AVOSCloudIM


@UIApplicationMain



class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        #if DEBUG
            Fabric.sharedSDK().debug = true
            Fabric.with([Crashlytics.self()])

            #endif
        AVOSCloud.setApplicationId("bzxwedD39FXjUr6L5pii2jBr-gzGzoHsz", clientKey: "na43AGFaFfX3dv5T3qzkb9oe")
//    let  post = AVObject(className: "test")
//        post.setObject("nihao", forKey: "words")
//        post.saveInBackgroundWithBlock { (_, _) -> Void in
//            print("success")
//        }
        
        Digits.sharedInstance().startWithConsumerKey("14fKKhM4xC6AuGTt3cOVE3k6w", consumerSecret: "aKkFG3EiTUd9eDT1vPNDbUZY8mmj5ftep5j4y3f8wckfFMeoVa")
        Fabric.with([Digits.sharedInstance()])
        Fabric.with([Crashlytics.self,Appsee.self,Digits.self])
        // Override point for customization after application launch.
//        if  Digits.sharedInstance().session() == nil {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let signInViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier(OursConfig.StoryBoardID.logInWithPhoneViewController)
//            window?.rootViewController = signInViewController as? UIViewController
//        }else{
//            
//            print(Digits.sharedInstance().session()?.authToken)
//            let sb = UIStoryboard(name: "Main", bundle: nil)
//            
//            let vc =  sb.instantiateViewControllerWithIdentifier(OursConfig.StoryBoardID.homePageViewController)
//            
//            window?.rootViewController = vc
//      
//            
//        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

