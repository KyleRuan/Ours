//
//  MessageTableViewCell.swift
//  Ours
//
//  Created by Jason on 16/3/15.
//  Copyright © 2016年 com.kyleruan. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

  
//    @IBOutlet weak var oneChatting: UIView!
    @IBOutlet weak var oneChatting: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.backgroundColor = OursConfig.BackgroundColor.messagecellBar
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
//    
//    convenience init(text:String,fromSelf:Bool,position:Int){
//        self.init(coder: nil)
//        oneChatting = self.bubbleView(text, fromSelf: fromSelf, position: position)
//        
//        
//    }
//
//    required init?(coder aDecoder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
//        super.init(coder: aDecoder)
//    }
    
    
    /**
     产生一个对话cell
     
     - parameter text:     the conttent
     - parameter fromSelf:  self Or received
     - parameter position: postion of the cell to be
     
     - returns:
     */
    func bubbleView(text:String,fromSelf:Bool,position:Int){
//        let theFontSize = text.sizeWithFont(UIFont(), maxSize: CGSizeMake(180.0, 20000.0) )
//        NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
//        CGRect rect = [attrStr boundingRectWithSize:CGSizeMake(labelWidth, CGFLOAT_MAX)
//            options:options
//            context:nil];
        
        let options = NSStringDrawingOptions.UsesFontLeading
        
        let theFontSize = (text as NSString).boundingRectWithSize(CGSizeMake(180, 200000), options: options, attributes: nil, context: nil)
        let imagestr = fromSelf ?"SenderAppNodeBkg_HL":"ReceiverTextNodeBkg"
        let image = UIImage(named: imagestr)
        
        
        
        let bubbleText =  UILabel()
        bubbleText.backgroundColor = UIColor.clearColor()
        bubbleText.font = UIFont()
        bubbleText.numberOfLines = 0;
        bubbleText.lineBreakMode =  .ByWordWrapping
        bubbleText.text = text;

        
        
        let imageview = UIImageView(image: image!.stretchableImageWithLeftCapWidth(Int(image!.size.width)/2 ,topCapHeight: Int(image!.size.height/CGFloat(2))))
        
//        var resultView = UIView()
        let screenWidth = OursConfig.screenWidth
        
        if(fromSelf){
         oneChatting.frame = CGRectMake(screenWidth-CGFloat(position)-(bubbleText.frame.size.width+CGFloat(30.0)), 0.0, bubbleText.frame.size.width+30.0, bubbleText.frame.size.height+30.0)
        }else{
            oneChatting.frame = CGRectMake( CGFloat(position), 0, bubbleText.frame.size.width+30.0, bubbleText.frame.size.height+30.0)
        }
        

        oneChatting.addSubview(bubbleText)
        oneChatting.addSubview(imageView!)
  
//        return resultView
    }

}
