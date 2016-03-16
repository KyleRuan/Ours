//
//  PickNickNameViewController.swift
//  Ours
//
//  Created by Jason on 16/3/13.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class PickNickNameViewController: UIViewController {

    @IBOutlet weak var nickNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
      self.nickNameTextField.delegate = self
        // Do any additional setup after loading the view.
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

extension PickNickNameViewController:UITextFieldDelegate{
    func textFieldShouldReturn(textField: UITextField) -> Bool {
      
        guard let text = textField.text else {
            return true
        }
        
        if !text.isEmpty {
           OursUserDefualt.defaults.setObject(text, forKey: nicknameKey)
            
              performSegueWithIdentifier("showAvatarPickViewController", sender: self)
        }
        
        return true

    }
}
