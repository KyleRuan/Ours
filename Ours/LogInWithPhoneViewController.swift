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


class LogInWithPhoneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func didTappedAtTheRejisterButton(){
        let config = DGTAuthenticationConfiguration(accountFields: .DefaultOptionMask)
        config.appearance = DGTAppearance()
        config.appearance.logoImage = UIImage(named: "app_logo.png")
        config.appearance.labelFont = UIFont(name: "HelveticaNeue-Bold", size: 16)
        config.appearance.bodyFont = UIFont(name: "HelveticaNeue-Italic", size: 16)
//        config.phoneNumber = "+86"
//        config.
        //button的颜色
                config.appearance.accentColor = UIColor.blackColor()
        config.appearance.backgroundColor = OursConfig.BackgroundColor.Register
        
        
    


            
        
            
      Digits.sharedInstance()
               Digits.sharedInstance().authenticateWithViewController(self, configuration: config) { (session, error) -> Void in
            if (session != nil) {
                
                //用Leancode保存用户信息
                print(session.authToken)
                print(session.userID)
                
                
            
                let sb = UIStoryboard(name: "Main", bundle: nil)
                
                let vc =  sb.instantiateViewControllerWithIdentifier(OursConfig.StoryBoardID.homePageViewController)
                
                
                        self.presentViewController(vc, animated: true, completion: nil)
            }
            else {
                print(error.localizedDescription)
            }
        
    }
    
        
    }

    
    
    
    
    
    
    func showHomePageOrUserInformationEdit(){
        
//        if OursConfig.
    }
    
    
    
    
    
    @IBAction func logIn(sender: AnyObject) {
        
     }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
