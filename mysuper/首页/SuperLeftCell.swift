//
//  SuperLeftCell.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit
import Cartography

class SuperLeftCell: UITableViewCell {
    
    var nameLbl: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 15), textColor: UIColor.getMainColorSwift())
        nameLbl.textAlignment = .left
        self.contentView.addSubview(nameLbl)
        constrain(nameLbl) { nameLbl in
            nameLbl.left == nameLbl.superview!.left + 10
            nameLbl.right == nameLbl.superview!.right - 10
            nameLbl.top == nameLbl.superview!.top
            nameLbl.height == 40
        }
        
        self.backgroundColor = UIColor.getSeparatorColorSwift()
    }
    
    func updateCell(row: Int, nameStr: String) {
        nameLbl.text = nameStr
        nameLbl.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
