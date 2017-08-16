//
//  HomeCell.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit
import Cartography

class HomeCell: UITableViewCell {
    
    let cellHeight: CGFloat = 150.0
    var bgImageV: UIImageView! // 超市背景图片
    var nameLbl: UILabel! // 超市名称
    var detailLbl: UILabel! // 超市简单介绍
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.bgImageV = UIImageView.init(frame: CGRect.init(x: 0, y: 1, width: SCREEN_WIDTH, height: cellHeight))
        self.contentView.addSubview(self.bgImageV)
        constrain(bgImageV) { bgImageV in
            bgImageV.left == bgImageV.superview!.left
            bgImageV.right == bgImageV.superview!.right
            bgImageV.top == bgImageV.superview!.top + 1
            bgImageV.bottom == bgImageV.superview!.bottom
        }
        bgImageV.backgroundColor = UIColor.lightGray
        bgImageV.layer.masksToBounds = true
        bgImageV.contentMode = .scaleAspectFill
        
        nameLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 20), textColor: UIColor.white)
        nameLbl.textAlignment = .center
        self.contentView.addSubview(nameLbl)
        constrain(bgImageV,nameLbl) { bgImageV,nameLbl in
            nameLbl.left == bgImageV.left + 10
            nameLbl.right == bgImageV.right - 10
            nameLbl.top == bgImageV.top + 0
            nameLbl.height == cellHeight/2.0
        }
        
        detailLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 14), textColor: UIColor.white)
        detailLbl.textAlignment = .center
        self.contentView.addSubview(detailLbl)
        detailLbl.numberOfLines = 0
        detailLbl.sizeToFit()
        constrain(nameLbl,detailLbl) { nameLbl,detailLbl in
            detailLbl.left == nameLbl.left
            detailLbl.right == nameLbl.right
            detailLbl.top == nameLbl.bottom + 0
            detailLbl.height == cellHeight/2.0
        }
        
        self.backgroundColor = UIColor.getSeparatorColorSwift()
        self.selectionStyle = .none
    }
    
    func updateCell(row: Int, dict: Dictionary<String, String>) {
        nameLbl.text = dict["name"]
        detailLbl.text = dict["detail"]
        if row % 2 == 0 {
            self.bgImageV.backgroundColor = UIColor.colorRGB16(value: 0xFD9B27)
        } else {
            self.bgImageV.backgroundColor = UIColor.getMainColorSwift()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
