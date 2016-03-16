//
//  ConfigChattingViewCell.swift
//  Ours
//
//  Created by Jason on 16/3/16.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit


class ConfigChattingViewCell{

    func bubbleView(text:String,ISME:MessageType,position:CGFloat)->UIView{
        let font  = UIFont.systemFontOfSize(OursConfig.fontSize)//可以是控件的字体获取一下
        let sizeMax = CGSizeMake(OursConfig.screenWidth-position-40, 2000)
        
        let arr = [NSFontAttributeName:font]
//        NSLineBreakByWordWrapping
        
        let size = (text as NSString).boundingRectWithSize(sizeMax, options: [NSStringDrawingOptions.UsesLineFragmentOrigin], attributes: arr, context: nil).size
        
        let returnView = UIView()
        returnView.backgroundColor = UIColor.clearColor()
        
        let bubble = UIImage(named: (ISME == .MessageMe ? "SenderAppNodeBkg_HL":"ReceiverTextNodeBkg"))
        
        let left = (bubble!.size.width/2)
        let top =  (bubble!.size.height/2)
        //这里可以尝试换一个函数
        
        
        let image = bubble?.resizableImageWithCapInsets(UIEdgeInsets(top: top, left: left, bottom: bubble!.size.height, right: bubble!.size.width))
        //        let bubbleImageView = UIImageView.init(image: bubble?.stretchableImageWithLeftCapWidth(left, topCapHeight: top))
        
        
        let bubbleImageView = UIImageView.init(image: image)
        NSLog("%f,%f",size.width,size.height)
        
        
        
        //这些参数 size.width有问题 postion size.with - positon -22
        let textLabel = UILabel(frame:CGRectMake(ISME == .MessageMe ? 15.0:22.0, 20.0, size.width+10, size.height+10))
        
        textLabel.backgroundColor = UIColor.clearColor()
        textLabel.font = font
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .ByWordWrapping
        textLabel.text = text
        
        bubbleImageView.frame = CGRectMake(0.0, 14.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height)
        if(ISME == .MessageMe){
            returnView.frame = CGRectMake(OursConfig.screenWidth-position - (textLabel.frame.size.width+30.0), 0.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+30.0)
        }else{
            // self
            //             returnView.frame = CGRectMake(position, 0.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+30.0)
            returnView.frame = CGRectMake(position, 0.0, textLabel.frame.size.width+30.0, textLabel.frame.size.height+30.0)
        }
        
        returnView.addSubview(bubbleImageView)
        returnView.addSubview(textLabel)
        
        
        return returnView
        
    }


//    
//    if(fromSelf)
//    returnView.frame = CGRectMake(320-position-(bubbleText.frame.size.width+30.0f), 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
//    else
//    returnView.frame = CGRectMake(position, 0.0f, bubbleText.frame.size.width+30.0f, bubbleText.frame.size.height+30.0f);
//    
//    [returnView addSubview:bubbleImageView];
//    [returnView addSubview:bubbleText];
    

}



