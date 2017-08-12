//
//  QQMusicTVC.swift
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

import UIKit

class QQMusicTVC: UITableViewController {

     override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = UIColor.brown
        
    }

//    public override init(style: UITableViewStyle) {
//        super.init(style: UITableViewStyle)
//        
//        
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }


   
}
