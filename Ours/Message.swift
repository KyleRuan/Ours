//
//  Message.swift
//  chatting
//
//  Created by Jason on 16/3/14.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit
enum MessageType{
    case MessageMe
    case  MessageLover
}

class Message{
    
    var me  = "the senter"
    var toSomeone = "the receiver"
    var  content = "the content"
    var messageType = MessageType.MessageMe
    init(text:String) {
        
        content = text
        
        //        let width = screenWidth - iconWidth - padding
        //        let texMaxSize = CGSizeMake(width, MAXFLOAT)
        //        let  textRealSize =  message.content
        
        
    }
    init(){
        
    }
    
//    // 3.信息，尺寸可变
//    2     CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    3     // 3.1 设置最大尺寸
//    4     CGSize textMaxSize = CGSizeMake(screenWidth - iconWidth - padding * 5, MAXFLOAT);
//    5     // 3.2 计算真实尺寸
//    6     CGSize textRealSize = [message.text sizeWithFont:MESSAGE_TEXT_FONT maxSize:textMaxSize];
//    7
//    8     // 3.3 调整信息的位置
//    9     CGFloat textX;
//    10     if (MessageTypeMe == message.type) {
//    11         // 我方，放在靠右
//    12         textX = CGRectGetMinX(_iconFrame) - textRealSize.width - padding;
//    13     } else {
//    14         // 对方，放在靠左
//    15         textX = CGRectGetMaxX(_iconFrame) + padding;
//    16     }
//    17
//    18     CGFloat textY = iconY;
//    19     _textFrame = CGRectMake(textX, textY, textRealSize.width, textRealSize.height);
    
 
}

class MessageSize{
    
    let message = Message()
    let padding:CGFloat = 10
    let  iconWidth:CGFloat = 20
    
    let screenWidth  = UIScreen.mainScreen().bounds.size.width
    
    let creatAttime = NSDate()
    
    
}

extension String {
    func  sizeWithFont(font:UIFont,maxSize:CGSize)->CGSize{
        let  attrs = [NSFontAttributeName:font]
        let size = (self as NSString).boundingRectWithSize(maxSize, options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attrs, context: nil).size
        
        return size
    }
}

