//
//  TestVC.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/16.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit



class TestVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
        
    var rightTableView: UITableView!
    var rightDataArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitle(titleString: "测试的新闻列表")
        
        self.initTableView()
        self.requestAction()
        
    }
    
    func requestAction() {
        let param = ["key": kWXContentKey, "keyword": "北京", "page": "1", "rows": "50"]
//        let param = ["key": kWXContentKey, "page": "1", "rows": "50"]
        JHNetwork.shared.postForJSONV2(url: kWX_jingxuan, refreshCache: true, parameters: param) { (json, error) in
            SLog("json====\(json)")
        }
    }
    
    // 初始化表格
    func initTableView() {
        rightDataArray = ["萝卜","黄瓜","番茄","西红柿","萝卜","黄瓜","番茄","西红柿"]
        rightTableView = UITableView.init(frame: CGRect.init(x: 0, y: NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT - 50))
        rightTableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        rightTableView.backgroundColor = UIColor.getSeparatorColorSwift()
        rightTableView.delegate = self
        rightTableView.dataSource = self
        self.view.addSubview(rightTableView)
        rightTableView.tableFooterView = UIView()
        rightTableView.separatorStyle = .singleLine
        rightTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    // MARK: 表格代理相关
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rightDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rightCell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        rightCell.textLabel?.text = rightDataArray.object(at: indexPath.row) as? String
        
        return rightCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

}
