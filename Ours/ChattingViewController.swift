//
//  ChattingViewController.swift
//  Ours
//
//  Created by Jason on 16/3/15.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
import AVOSCloudIM


class ChattingViewController: UIViewController {
    @IBOutlet weak var toolBar: UIView!

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var contentListTableView: UITableView!
    
    var targetClientId:String = "Lover"
    var client :AVIMClient!
 


    
    let configCell = ConfigChattingViewCell()
    
    
    
    let kqueryLimit:UInt = 5
    var messages:[AVIMMessage] = []{
        didSet{
            contentListTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    client = AVIMClient(clientId: "kyle")
        
        client.delegate = self
        
        
        self.client.openWithCallback { (suc, error) -> Void in
            if (suc){
//                self.client.conversationQuery().findConversationsWithCallback({ (conversation, error) -> Void in
                

//                    for con in conversation{
//                        let cos = con as! AVIMConversation
//                        self.messages.appendContentsOf(cos.queryMessagesFromCacheWithLimit(5) as! [AVIMMessage])
                    
//                    }
                    
                    
//                })
            }
        }
        
//       currentConversation.queryMessagesFromServerWithLimit(kqueryLimit) { (res, erroe) -> Void in
//          self.messages.appendContentsOf(res as! [Message])
//        }
        self.inputTextView.backgroundColor = OursConfig.BackgroundColor.messageToolBarColor
        contentListTableView.userInteractionEnabled = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"keyBoardWillHide:", name:UIKeyboardWillHideNotification, object: nil)

        
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
    
    func sendMessageToLover(){
      

        
        client.openWithCallback { (succeeded, error) -> Void in
            
            
          
            self.client.createConversationWithName("\(self.client.clientId)和\(self.targetClientId)", clientIds: [self.targetClientId], callback: { (conversation, error) -> Void in
               
                if (error != nil) {
                    print(error)
                    return
                }
                let mes = AVIMMessage(content: "hehe")
                conversation.sendMessage(mes, callback: { (suc, erroe) -> Void in
                    if suc{
                        self.messages.append(mes)
                    }else{
                        print(erroe)
                    }
                })
                
            })
        }
        
    }

}


extension ChattingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          
        return messages.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
            let  cell = tableView.dequeueReusableCellWithIdentifier("ChattingCell",forIndexPath: indexPath)
        if messages.count == 0 {
            return cell
        }
        let isMe = (messages[indexPath.row].clientId == client.clientId)
            if  isMe  {
                let avatar = UIImage(named: "app_logo")
                let imageview = UIImageView(frame: CGRectMake(OursConfig.screenWidth-60, 10, 50, 50))
                imageview.image = avatar
                cell.addSubview(imageview)
            }else{
              
                let avatar = UIImage(named: "app_logo")
                let imageview = UIImageView(frame: CGRectMake(10, 10, 50, 50))
                imageview.image = avatar
                cell.addSubview(imageview)
                
            }
            
        
            cell.addSubview(configCell.bubbleView(messages[indexPath.row].content,ISME: isMe ,position:65))
            
            return cell
        }


    
    
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
         inputTextView.resignFirstResponder()
    }
    
    
    
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        
      
        
//        let  dict  = resultDic[indexPath.row]
        let font  = UIFont.systemFontOfSize(OursConfig.fontSize)//可以是控件的字体获取一下
        
         let sizeMax = CGSizeMake(OursConfig.screenWidth-65-20, 2000)
        
        let arr = [NSFontAttributeName:font]
        
        let size = (messages[indexPath.row].content as NSString).boundingRectWithSize(sizeMax, options: [NSStringDrawingOptions.TruncatesLastVisibleLine ,NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: arr, context: nil).size
        return size.height+44
        
    }

    
    
    
}


extension ChattingViewController{
    //keyboard notification
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

    
}



extension ChattingViewController:AVIMClientDelegate{
    func conversation(conversation: AVIMConversation!, didReceiveUnread unread: Int) {
        //记录是否已经已读
        
//        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"收到新的消息" message:@"" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [view show];
//        
//        if ([message.conversationId isEqualToString:self.currentConversation.conversationId]) {
//            [self.messages addObject:message];
//            [self.messageTableView reloadData];
        
    }
    
    
    
    func conversation(conversation: AVIMConversation!, didReceiveCommonMessage message: AVIMMessage!) {
//        if message.conversationId == currentConversation.conversationId{
//            self.messages.append(message as! Message)
//        }
    }
}


 func conversation(conversation: AVIMConversation!, didReceiveTypedMessage message: AVIMTypedMessage!){
    print(message.content)
    
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
//            var mes = AVIMMessage(content: text)
//            
//        
////            mes.clientId = client.clientId
//           messages.append(mes)
          self.sendMessageToLover()
            inputTextView.text = ""
      }

    
}
}
