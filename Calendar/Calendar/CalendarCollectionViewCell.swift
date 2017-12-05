//
//  CalendarCollectionViewCell.swift
//  Calendar
//
//  Created by 吴昊原 on 2017/9/30.
//  Copyright © 2017年 吴昊原. All rights reserved.
//

import UIKit

class CalendarCollectionViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let label = UILabel()
    var date:String = ""
    var isTouch:Bool = true {
        willSet{
            self.isTouch = newValue
            if !newValue {
                self.label.textColor = UIColor.gray
            }else{
                self.label.textColor = UIColor.black
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = self.contentView.frame
    }
}
