//
//  ViewController.swift
//  Ours
//
//  Created by Jason on 16/3/10.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import DigitsKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         Digits.sharedInstance().logOut()
        let authButton = DGTAuthenticateButton(authenticationCompletion: { (session: DGTSession?, error: NSError?) in
            if (session != nil) {
                // TODO: associate the session userID with your user model
                let message = "Phone number: \(session!.phoneNumber)"
                let alertController = UIAlertController(title: "You are logged in!", message: message, preferredStyle: .Alert)
                alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: .None))
                self.presentViewController(alertController, animated: true, completion: .None)
            } else {
                NSLog("Authentication error: %@", error!.localizedDescription)
            }
        })
        authButton.center = self.view.center
        
//        authButton.logOut()
        self.view.addSubview(authButton)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

