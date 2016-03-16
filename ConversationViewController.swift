//
//  ConversationViewController.swift
//  Ours
//
//  Created by Jason on 16/3/15.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import AVOSCloud

import AVOSCloudIM

class ConversationViewController:UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sendMessageToLover()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func sendMessageToLover(){
        let client = AVIMClient(clientId: "kyle")
        
        
        client.openWithCallback { (succeeded, error) -> Void in
            client.createConversationWithName("我和你", clientIds: ["lover"], callback: { (suc, error) -> Void in
                if(succeeded){
                    print("ooooooo")
                }
            })
        }
        
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
