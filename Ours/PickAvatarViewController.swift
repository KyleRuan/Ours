//
//  PickAvatarViewController.swift
//  Ours
//
//  Created by Jason on 16/3/13.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class PickAvatarViewController: UIViewController{
    

    
    @IBOutlet weak var avatarImage: UIImageView!
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    private lazy var imagePicker:UIImagePickerController! = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    nextButton.title = ""
        
        nextButton.enabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pickAvatarFromPhotoLibrary(sender: AnyObject) {
        selectImageControllerWithType(UIImagePickerControllerSourceType.PhotoLibrary)
        nextButton.title = "Next"
        
        nextButton.enabled = true
    }
    
    
    
    @IBAction func pickAvatarFromCamera(sender: AnyObject) {
         selectImageControllerWithType(UIImagePickerControllerSourceType.Camera)
        nextButton.title = "Next"
        
        nextButton.enabled = true
    }
    
    
    
    private func showNext(){
        //show navigationBar
        
    }
    private func selectImageControllerWithType(type:UIImagePickerControllerSourceType){
        
        if !UIImagePickerController.isSourceTypeAvailable(type){
            //输出没有这个设备的alert
            OursAlert.alert(title: "Error", message: "The device don't support this Source", dismissTitle: "Cancel", inViewController: self,withDismissAction: nil)
            
            return
        }
        imagePicker.sourceType = type
        
    
        imagePicker.delegate = self
        
        
        
        switch type {
        case .Camera:
            if UIImagePickerController.isCameraDeviceAvailable(.Front){
                imagePicker.cameraDevice = .Front
             }else{
                imagePicker.cameraDevice = .Rear
            }
          presentViewController(imagePicker, animated: true, completion: nil)

        case .PhotoLibrary:
             presentViewController(imagePicker, animated: true, completion: nil)
            
        default: break
            
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

extension PickAvatarViewController:UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true , completion: nil)
        
    }
    
    
   
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        
    let origin = info[UIImagePickerControllerOriginalImage] as! UIImage
    self.avatarImage.image = origin
        
//        OursUserDefual
      dismissViewControllerAnimated(true , completion: nil)
    }
    
}