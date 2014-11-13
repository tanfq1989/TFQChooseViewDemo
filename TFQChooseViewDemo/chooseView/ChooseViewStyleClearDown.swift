//
//  ChooseViewStyleClearDown.swift
//  E_Education
//
//  Created by admin on 14-8-12.
//  Copyright (c) 2014年 TFQ. All rights reserved.
//

import UIKit

class ChooseViewStyleClearDown: ChooseView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    func subViewInit(){
        
        var button: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.tag=9999;
        button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        button.titleEdgeInsets = UIEdgeInsetsMake(6, frame.size.width / 2 , 5, 20);
        button.setTitle("",forState:UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
        button.titleLabel!.textAlignment=NSTextAlignment.Right
        button.titleLabel!.font = UIFont.systemFontOfSize(13)
        self.addSubview(button)
        self.button=button;
        var selectedTitleLabel:UILabel  = UILabel(frame: CGRectMake(5, 0, frame.size.width - 10, frame.size.height))
        selectedTitleLabel.font = UIFont.systemFontOfSize(13)
        self.valueLabel = selectedTitleLabel;
        self.addSubview(selectedTitleLabel)
        
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
}

