//
//  ChattingViewController.swift
//  Ours
//
//  Created by Jason on 16/3/15.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit


class ChattingViewController: UIViewController {
    @IBOutlet weak var toolBar: UIView!

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var contentListTableView: UITableView!
    
    var resultDic:[[String:String]] = []
    
    let configCell = ConfigChattingViewCell()
    var messages:[Message] = []{
        didSet{
            contentListTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        #if DEBUG
            let dict1 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检ddddddddddddddddddddddddddddddddddddddddddddddddddd"]
            let dict2 = ["name":"me","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检dddddddddddddddddddddddddddddddddddddddddddddddddddddd"]
            let dict3 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
            let dict4 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
            let dict5 = ["name":"lover","content":"微信团队欢迎你。很高兴你开启了微信生活，期待能为你和朋友们带来愉快的沟通体检"]
            
        resultDic = [dict1,dict2,dict3,dict4,dict5]
//            #endif
        
        self.inputTextView.backgroundColor = OursConfig.BackgroundColor.messageToolBarColor
        contentListTableView.userInteractionEnabled = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        
    }
    
    
    
    func keyBoardWillShow(note:NSNotification){
        guard let userInfo = note.userInfo else {
            return
        }
        
        let duringTime = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
        let keybordRect = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue
        self.view.bringSubviewToFront(toolBar)
        let y = -keybordRect.size.height
        let options = UIViewAnimationOptions(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).integerValue << 16))
        UIView.animateWithDuration(duringTime, delay: 0, options: options, animations: { () -> Void in
              self.toolBar.transform = CGAffineTransformMakeTranslation(0,y)
            }) { (_) -> Void in
                
        }

    }
    
    
    func keyBoardWillHide(note:NSNotification){
        guard let userInfo = note.userInfo else  {
            return
        }
        

        let duringTime = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! Double
       
        UIView.animateWithDuration(duringTime, animations: { () -> Void in
              self.toolBar.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sender(sender: AnyObject) {
     //表情
        
    }


    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        inputTextView.resignFirstResponder()
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




extension ChattingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            #if DEBUG
             return resultDic.count
            #endif
        return messages.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
            var  cell = tableView.dequeueReusableCellWithIdentifier("ChattingCell")
            if cell == nil{
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "ChattingCell")
                cell!.selectionStyle = UITableViewCellSelectionStyle.None
            }else{
                for cellView in (cell?.subviews)! {
                    cellView.removeFromSuperview()
                }
            }
            
            //是左还是右
//            let dict = resultDic[indexPath.row]
        
            if  messages[indexPath.row].messageType == MessageType.MessageLover{
                let avatar = UIImage(named: "app_logo")
                let imageview = UIImageView(frame: CGRectMake(10, 10, 50, 50))
                imageview.image = avatar
                cell?.addSubview(imageview)
            }else{
                let avatar = UIImage(named: "app_logo")
                let imageview = UIImageView(frame: CGRectMake(OursConfig.screenWidth-60, 10, 50, 50))
                imageview.image = avatar
                cell?.addSubview(imageview)
                
            }
            
            //如果是text
            
            cell!.addSubview(configCell.bubbleView(messages[indexPath.row].content,ISME: messages[indexPath.row].messageType ,position:65))
            
            return cell!
        }

    
    
    
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         inputTextView.resignFirstResponder()
    }
    
    
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
        if resultDic.count == 0{
            return 0
        }
        
//        let  dict  = resultDic[indexPath.row]
        let font  = UIFont.systemFontOfSize(OursConfig.fontSize)//可以是控件的字体获取一下
        
         let sizeMax = CGSizeMake(OursConfig.screenWidth-65-20, 2000)
        
        let arr = [NSFontAttributeName:font]
        
        let size = (messages[indexPath.row].content as NSString).boundingRectWithSize(sizeMax, options: [NSStringDrawingOptions.TruncatesLastVisibleLine ,NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: arr, context: nil).size
        return size.height+44
    }

    
    
    
}

extension ChattingViewController:UITextViewDelegate{
  



    func textViewDidBeginEditing(textView: UITextView) {
        textView.becomeFirstResponder()
      
        
    }
    func textViewDidChange(textView: UITextView) {
     
        if(textView.text.characters.last == "\n"){
           senderMessage(textView.text)
        }
    }
    
    
    private func senderMessage(text:String){
        if text != "\n" && text != ""{
            let mes = Message(text: text)
           messages.append(mes)
            inputTextView.text = ""
      }

    
}
}
