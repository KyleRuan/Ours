//
//  RegisterViewController.swift
//  Ours
//
//  Created by Jason on 16/3/11.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import DigitsKit
import Fabric
import Crashlytics
//import AVOSCloud


class LogInWithPhoneViewController: UIViewController {

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
//MARK: - 手机登入
    @IBAction func didTappedAtTheRejisterButton(){
        let config = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
        config.appearance = DGTAppearance()
        config.appearance.logoImage = UIImage(named: "app_logo.png")
        config.appearance.labelFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        config.appearance.bodyFont = UIFont(name: "HelveticaNeue-Italic", size: 16)
        config.appearance.accentColor = UIColor.blackColor()
        config.appearance.backgroundColor = OursConfig.BackgroundColor.Register
//        Digits.sharedInstance()
            Digits.sharedInstance().authenticateWithViewController(self, configuration: config) { (session, error) -> Void in
            if (session != nil) {
     
                let query = QueryDataBase.quaryUserPhoneNumber(session.phoneNumber)
                    print(query.countObjects())
                    if query.countObjects()>0{
                        query.getFirstObjectInBackgroundWithBlock(){ (obj, e) -> Void in
                            //已经注册，直接登入到主界面
                            if obj != nil{
                                let sb = UIStoryboard(name: "Main", bundle: nil)
                                
                                let vc =  sb.instantiateViewControllerWithIdentifier(OursConfig.StoryBoardID.homePageViewController)
                                
                                self.presentViewController(vc, animated: true, completion: nil)
                            }
                        }
                    }else {
                        //到注册用户界面
                        OursUserDefualt.userInfo.password = session.userID
                        OursUserDefualt.userInfo.mobilePhoneNumber = session.phoneNumber
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        
                        let vc =  sb.instantiateViewControllerWithIdentifier(OursConfig.StoryBoardID.registerUserInfomation)
                        
                        self.presentViewController(vc, animated: true, completion: nil)
                        return
                    }
            }
            else {
                print(error.localizedDescription)
            }
        
    }
    
    
    }
    
    
    
    
    
    @IBAction func logIn(sender: AnyObject) {
        
     }
    
    
    
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
