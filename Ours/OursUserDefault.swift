//
//  OursUserDefault.swift
//  Ours
//
//  Created by Jason on 16/3/12.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import RealmSwift
import Fabric

import Crashlytics
import DigitsKit
import Appsee

let v1AccessTokenKey = "v1AccessToken"
let userIDKey = "userID"
let nicknameKey = "nickname"
let introductionKey = "introduction"
let avatarURLStringKey = "avatarURLString"
let badgeKey = "badge"
let pusherIDKey = "pusherID"

let areaCodeKey = "areaCode"
let mobileKey = "mobile"
let discoveredUserSortStyleKey = "discoveredUserSortStyle"
let feedSortStyleKey = "feedSortStyle"
let latitudeShiftKey = "latitudeShift"
let longitudeShiftKey = "longitudeShift"
let userLocationNameKey = "userLocationName"


class OursUserDefualt {
    
    static let defaults = NSUserDefaults(suiteName:OursConfig.appGroupID)!
    
    static var isLogined: Bool {
        
        if let _ = Digits.sharedInstance().session() {
            return true
        } else {
            return false
        }
    }

}