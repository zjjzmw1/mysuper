//
//  SuperRightCell.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/16.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit
import Cartography

class SuperRightCell: UITableViewCell {
    
    let cellH: CGFloat = 90 // cell高度90
    var iconImgV: UIImageView!
    var nameLbl: UILabel!
    var detailLbl: UILabel!
    var priceLbl: UILabel!
    
    var jianBtn: UIButton!
    var numberLbl: UILabel!
    var jiaBtn: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImgV = Tool.initAImageV(frame: CGRect.init(x: 10, y: 10, width: 70, height: 70))
        self.contentView.addSubview(iconImgV)
        iconImgV.image = #imageLiteral(resourceName: "all_default")
        constrain(iconImgV) { iconImgV in
            iconImgV.left == iconImgV.superview!.left + 10
            iconImgV.top == iconImgV.superview!.top + 10
            iconImgV.width == 70
            iconImgV.height == 70
        }
        
        nameLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 15), textColor: UIColor.getTitleColorSwift())
        nameLbl.textAlignment = .left
        self.contentView.addSubview(nameLbl)
        constrain(nameLbl, iconImgV) { nameLbl, iconImgV in
            nameLbl.left == iconImgV.right + 10
            nameLbl.right == nameLbl.superview!.right - 10
            nameLbl.top == iconImgV.top
            nameLbl.height == 20
        }
        
        detailLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 13), textColor: UIColor.getContentColorSwift())
        detailLbl.textAlignment = .left
        self.contentView.addSubview(detailLbl)
        constrain(detailLbl, nameLbl) { detailLbl, nameLbl in
            detailLbl.left == nameLbl.left
            detailLbl.right == nameLbl.right
            detailLbl.top == nameLbl.bottom
            detailLbl.height == 20
        }
        
        priceLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 14), textColor: UIColor.getMainColorSwift())
        priceLbl.textAlignment = .left
        self.contentView.addSubview(priceLbl)
        constrain(priceLbl, nameLbl) { priceLbl, nameLbl in
            priceLbl.left == nameLbl.left
            priceLbl.right == nameLbl.right
            priceLbl.bottom == priceLbl.superview!.bottom - 10
            priceLbl.height == 20
        }
        
        jiaBtn = Tool.initAButton(frame: .zero, titleString: "", font: FONT_PingFang(fontSize: 0), textColor: UIColor.clear, bgImage: nil)
        jiaBtn.setImage(#imageLiteral(resourceName: "all_add"), for: .normal)
        self.contentView.addSubview(jiaBtn)
        constrain(jiaBtn) { jiaBtn in
            jiaBtn.right == jiaBtn.superview!.right - 10 + 10
            jiaBtn.bottom == jiaBtn.superview!.bottom - 10 + 10
            jiaBtn.width == 23 + 20
            jiaBtn.height == 23 + 20
        }
        
        numberLbl = Tool.initALabel(frame: .zero, textString: "", font: FONT_PingFang(fontSize: 14), textColor: UIColor.getMainColorSwift())
        numberLbl.textAlignment = .center
        self.contentView.addSubview(numberLbl)
        constrain(numberLbl, jiaBtn) { numberLbl, jiaBtn in
            numberLbl.right == jiaBtn.left + 10
            numberLbl.top == jiaBtn.top
            numberLbl.bottom == jiaBtn.bottom
            numberLbl.width == 30
        }
        jianBtn = Tool.initAButton(frame: .zero, titleString: "", font: FONT_PingFang(fontSize: 0), textColor: UIColor.clear, bgImage: nil)
        jianBtn.setImage(#imageLiteral(resourceName: "all_jian"), for: .normal)
        self.contentView.addSubview(jianBtn)
        constrain(jianBtn, numberLbl) { jianBtn, numberLbl in
            jianBtn.right == numberLbl.left + 10
            jianBtn.top == numberLbl.top
            jianBtn.width == 23 + 20
            jianBtn.height == 23 + 20
        }
        
        self.backgroundColor = UIColor.colorRGB16(value: 0x23aefe, alphe: 0.2)
    }
    
    func updateCell(row: Int, nameStr: String) {
        nameLbl.text = nameStr
        detailLbl.text = "简单的商品介绍"
        priceLbl.text = "￥3.5/斤"
        numberLbl.text = "0"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

