//
//  CalendarReusableView.swift
//  Calendar
//
//  Created by 吴昊原 on 2017/9/30.
//  Copyright © 2017年 吴昊原. All rights reserved.
//

import UIKit

class CalendarReusableView: UICollectionReusableView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    let dateLabel:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        dateLabel.textColor = UIColor.gray
        dateLabel.textAlignment = .center
        dateLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(dateLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateLabel.frame = CGRect(x: 0, y: 0, width: self.width(), height: self.height())
        
    }
}
