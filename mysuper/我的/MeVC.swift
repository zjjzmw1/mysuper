//
//  MeVC.swift
//  mysuper
//
//  Created by zhangmingwei on 2017/8/15.
//  Copyright © 2017年 niaoyutong. All rights reserved.
//

import UIKit

class MeVC: BaseViewController {

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.getMainColorSwift()
        self.addTitle(titleString: "我的")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TestVC()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
