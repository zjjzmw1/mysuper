//
//  CartVC.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit

class CartVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var rightTableView: UITableView!
    var rightDataArray: NSMutableArray!
    
    var bottomV: UIView! // 底部结算view
    var bottomLbl: UILabel!
    var bottomBtn: UIButton!
    
    override func viewDidLoad() {
        self.addTitle(titleString: "购物车")
        self.initTableView()
        self.initBottomV()
    }
    
    func initBottomV() {
        bottomV = UIView.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT - TABBAR_HEIGHT - 50, width: SCREEN_WIDTH, height: 50))
        self.view.addSubview(bottomV)
        bottomV.backgroundColor = UIColor.white
        bottomLbl = Tool.initALabel(frame: CGRect.init(x: 10, y: 0, width: bottomV.width - 100 - 10, height: bottomV.height), textString: "总计：￥234.5", font: FONT_PingFang(fontSize: 16), textColor: UIColor.getMainColorSwift())
        bottomLbl.textAlignment = .left
        bottomV.addSubview(bottomLbl)
        bottomBtn = Tool.initAButton(frame: CGRect.init(x: bottomLbl.right, y: 0, width: 100, height: 50), titleString: "结算(9)", font: FONT_PingFang(fontSize: 16), textColor: UIColor.white, bgImage: nil)
        bottomBtn.backgroundColor = UIColor.getMainColorSwift()
        bottomV.addSubview(bottomBtn)
    }
    
    // 初始化表格
    func initTableView() {
        rightDataArray = ["萝卜","黄瓜","番茄","西红柿","萝卜","黄瓜","番茄","西红柿"]
        rightTableView = UITableView.init(frame: CGRect.init(x: 0, y: NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT - 50))
        rightTableView.register(SuperRightCell.classForCoder(), forCellReuseIdentifier: "SuperRightCell")
        rightTableView.backgroundColor = UIColor.getSeparatorColorSwift()
        rightTableView.delegate = self
        rightTableView.dataSource = self
        self.view.addSubview(rightTableView)
        rightTableView.tableFooterView = UIView()
        rightTableView.separatorStyle = .singleLine
        rightTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headSectionV = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 30))
        headSectionV.backgroundColor = UIColor.getMainColorSwift()
        let headLbl = Tool.initALabel(frame: CGRect.init(x: 10, y: 0, width: SCREEN_WIDTH - 20, height: 30), textString: "", font: FONT_PingFang(fontSize: 15), textColor: UIColor.white)
        headSectionV.addSubview(headLbl)
        headLbl.text = "商品清单："
        return headSectionV
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // MARK: 表格代理相关
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rightDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rightCell = tableView.dequeueReusableCell(withIdentifier: "SuperRightCell", for: indexPath) as! SuperRightCell
        let nameStr = rightDataArray.object(at: indexPath.row)
        rightCell.updateCell(row: indexPath.row, nameStr: nameStr as! String)
        return rightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    

}
