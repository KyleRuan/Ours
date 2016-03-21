//
//  QueryDataBase.swift
//  Ours
//
//  Created by Jason on 3/20/16.
//  Copyright © 2016 com.kyleruan. All rights reserved.
//

import Foundation
import AVOSCloud

class QueryDataBase{

    
    class func quaryUserInformaiton() {
//        let query = AVQuery(className: OursConstants.LeanCloud.oursUsers)

        
    }
    
    class func quaryUserPhoneNumber(PhoneNumber:String)->AVQuery {
        let UserInformationquery = AVQuery(className: OursConstants.LeanCloud.oursUsers)
        
       UserInformationquery.whereKey("mobilePhoneNumber", equalTo: PhoneNumber)
        
         return UserInformationquery
        
    }
    
}



//let query = AVQuery(className: Constants.AVClassName)
//query.whereKey(Constants.AVElementUser, equalTo: userNameUITextField.text)
//query.getFirstObjectInBackgroundWithBlock { (objects, error) -> Void in
//    
//    if objects != nil{
//        hub.textLabel.text = "该用户已注册"
//        hub.indicatorView = JGProgressHUDErrorIndicatorView()
//        hub.showInView(self.view, animated: true)
//        self.doneBTN.enabled = false
//        self.userNameUITextField.layer.borderColor = UIColor.redColor().CGColor
//        self.userNameUITextField.layer.borderWidth = 2
//        self.userNameUITextField.becomeFirstResponder()
//    }else{
//        self.post.saveInBackgroundWithBlock { (success, error) -> Void in
//            if success{
//                hub.textLabel.text = "注册成功"
//                hub.indicatorView = JGProgressHUDSuccessIndicatorView()
//                hub.showInView(self.view, animated: true)
//                //                         self.successNotice("注册成功")
//                let storyboard = UIStoryboard(name: "LogIn", bundle: NSBundle.mainBundle())
//                let login = storyboard.instantiateViewControllerWithIdentifier("LoggingViewController")  as! LoggingViewController
//                self.view.window?.rootViewController = login
//                //                        self.navigationController?.popViewControllerAnimated(true)
//            }else{
//                hub.textLabel.text = error.description
//                hub.indicatorView = JGProgressHUDErrorIndicatorView()
//                hub.showInView(self.view, animated: true)
//                
//            }
//        }
//    }
//}

