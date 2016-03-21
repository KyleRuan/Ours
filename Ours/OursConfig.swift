//
//  OursConfig.swift
//  DigitsThemes
//
//  Created by Jason on 16/3/11.
//  Copyright © 2016年 Fabric. All rights reserved.
//

import UIKit


class OursConfig{
//    #e91263
//    255,182,193
    
    static let appGroupID: String = "com.kyelruan"

    
    struct BackgroundColor {
        //LightPink
          static let Register:UIColor =  UIColor(red: 1, green: 182/255, blue: 193/255, alpha: 1)
          static let messageToolBarColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
          static let messagecellBar = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        
    }
    
    static let screenWidth = UIScreen.mainScreen().bounds.width
    static let fontSize:CGFloat = 20
    
    
    struct StoryBoardID {
        static let homePageViewController = "HomePageViewController"
        static let logInWithPhoneViewController = "LogInWithPhoneViewController"
        static let  registerUserInfomation = "RegisterUserInfomation"
    }
    
    struct FeedMedia {
        static let backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
       static let messageToolBarColor = UIColor(red:0.557, green:0.557, blue:0.576, alpha:1)
    }
}

