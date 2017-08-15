//
//  HomeVC.swift
//  supermarket
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView: UITableView!
    var dataArr: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.getBackgroundColorSwift()
        self.addTitle(titleString: "新锐时代") // 根据定位获取离自己最近的小区。收藏的小区优先。
        
        self.initTableViewAndData()
        // 获取我的行程列表
        self.requestAction()
    }
    
    func refreshTableView() {
        if dataArr.count == 0 {
            self.emptyView.isHidden = false
            self.emptyView.image(UIImage.init(named: "trip_no_data"), label: NSLocalizedString("暂无数据", comment: ""), last: NSLocalizedString("点击重试", comment: ""))
            self.tableView.isHidden = true
            self.emptyView.setTapActionWith({
                self.requestAction()
            })
        } else {
            self.emptyView.isHidden = true
            self.tableView.isHidden = false
        }
        self.tableView.reloadData()
    }
    
    func initTableViewAndData() {
        dataArr = NSMutableArray()
        tableView = UITableView(frame: CGRect.init(x: 0, y: NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(HomeCell.classForCoder(), forCellReuseIdentifier: "HomeCell")
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0.1))
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0.1))
        tableView.sectionFooterHeight = 0.1
    }
    
    // MARK: 表格代理相关
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.updateCell(row: indexPath.row, dict: self.dataArr![indexPath.row] as! Dictionary<String, String>)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // 获取自己的行程列表
    func requestAction() {
        
        self.dataArr = [["name": "新荣超市", "detail": "日用品超市"],
                        ["name": "小米超市", "detail": "日用品超市"],
                        ["name": "北门超市", "detail": "水果专卖"],
                        ["name": "新羊超市", "detail": "蔬菜专卖"],
                        ["name": "小蓝儿超市", "detail": "日用品超市"]]
        
        
        self.refreshTableView()
//        ProgressHUD.show(with: self.view, title: "")
//        _ = JHNetwork.shared.getForJSONV2(url: kSApi_me_itineraries, parameters: nil) { [weak self] (result, error) in
//            if self == nil {
//                return
//            }
//            self!.dataArr.removeAllObjects()
//            ProgressHUD.dismissDelay(0)
//            if let arr = result?.array {
//                for i in 0..<arr.count {
//                    if let model = MyTripListModel.deserialize(from: arr[i].description) {
//                        self!.dataArr.add(model)
//                    }
//                }
//            } else {
//                if let message = Tool.getMessage(result: result) {
//                    ProgressHUD.showError(message)
//                }
//            }
//            self!.refreshTableView()
//        }
    }
    
}
