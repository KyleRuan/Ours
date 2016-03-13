//
//  OursAlert.swift
//  Ours
//
//  Created by Jason on 16/3/13.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit


class OursAlert {
    
    
    class func alert(title title: String, message: String?, dismissTitle: String, inViewController viewController: UIViewController?, withDismissAction dismissAction: (() -> Void)?){
      
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let  alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: dismissTitle, style: .Default) { (_) -> Void in
                if let action = dismissAction{
                    action()
                }
            }
            alertVC.addAction(action)
            viewController?.presentViewController(alertVC, animated: true, completion: nil)

        }
        
    }
}

