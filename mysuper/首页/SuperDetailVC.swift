
//
//  SuperDetailVC.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit

class SuperDetailVC: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var leftTableView: UITableView!
    var rightTableView: UITableView!
    var leftDataArray: NSMutableArray!
    var rightDataArray: NSMutableArray!
    // 当前正在点击滑动中
    var clickScrolling: Bool = false
    var titleStr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitle(titleString: titleStr)
        self.clickScrolling = false
        self.initTableView()
    }
    
    // 初始化表格
    func initTableView() {
        rightDataArray = NSMutableArray()
        leftDataArray = ["萝卜","黄瓜","番茄","西红柿"]
        let arr1 = ["黄","红","绿","青","黑","白"]
        for name in leftDataArray {
            let addArr = NSMutableArray()
            for head in arr1 {
                let lastStr = String.init(format: "%@%@",head,name as! String)
                addArr.add(lastStr)
            }
            rightDataArray.add(addArr)
        }
        
        leftTableView = UITableView.init(frame: CGRect.init(x: 0, y: NAVIGATIONBAR_HEIGHT, width: 100, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT))
        leftTableView.backgroundColor = UIColor.getBackgroundColorSwift()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.register(SuperLeftCell.classForCoder(), forCellReuseIdentifier: "SuperLeftCell")
        self.view.addSubview(leftTableView)
        leftTableView.tableFooterView = UIView()
        leftTableView.separatorStyle = .singleLine
        leftTableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        
        rightTableView = UITableView.init(frame: CGRect.init(x: leftTableView.right, y: NAVIGATIONBAR_HEIGHT, width: SCREEN_WIDTH - leftTableView.width, height: SCREEN_HEIGHT - NAVIGATIONBAR_HEIGHT - TABBAR_HEIGHT))
        rightTableView.register(SuperLeftCell.classForCoder(), forCellReuseIdentifier: "SuperLeftCell")
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
        if tableView == rightTableView {
            headLbl.text = leftDataArray.object(at: section) as? String
            return headSectionV
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == leftTableView {
            return 0.0
        } else {
            return 30
        }
    }
    
    // MARK: 表格代理相关
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == leftTableView {
            return 1
        } else {
            return leftDataArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == leftTableView {
            return leftDataArray.count
        } else {
            let arr = rightDataArray.object(at: section) as! NSArray
            return arr.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperLeftCell", for: indexPath) as! SuperLeftCell
        if tableView == leftTableView {
            cell.selectionStyle = .blue
            cell.updateCell(row: indexPath.row, nameStr: (leftDataArray.object(at: indexPath.row) as? String)!, isLeft: true)
        } else {
            let arr = rightDataArray.object(at: indexPath.section) as! NSArray
            cell.updateCell(row: indexPath.row, nameStr: (arr.object(at: indexPath.row) as? String)!, isLeft: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            clickScrolling = true
            let indexP = IndexPath.init(row: 0, section: indexPath.row)
            rightTableView.scrollToRow(at: indexP, at: .top, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.clickScrolling = false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.clickScrolling {
            return
        }
        for i in 0 ..< leftDataArray.count {
            let arr = rightDataArray.object(at: i) as! NSArray
            if arr.count == 0 {
                break
            }
            let indexP = IndexPath.init(row: arr.count - 1, section: i)
            if rightTableView.cellForRow(at: indexP) != nil {
                let indexP1 = IndexPath.init(row: i, section: 0)
                leftTableView.selectRow(at: indexP1, animated: true, scrollPosition: .none)
                break
            }
        }
    }
    
}

