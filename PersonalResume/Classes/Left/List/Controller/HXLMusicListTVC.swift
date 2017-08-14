//
//  HXLMusicListTVC.swift
//  PersonalResume
//
//  Created by Jefrl on 2017/8/12.
//  Copyright © 2017年 Jefrl. All rights reserved.
//

import UIKit

class HXLMusicListTVC: UITableViewController {

    // 懒加载 歌曲数据数组
    fileprivate lazy var musicMs: [QQMusicModel] = {
        
        // 1. 加载数据
        var models = QQDataTool.getMusicListData() {
            didSet {
                self.tableView.reloadData()
            }
        }
        
        // 给工具类, 赋值播放的音乐列表数据
        QQMusicOperationTool.shareInstance.musicMList = models
        
        return models
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpInit()
        
    }
    
    deinit {
        let tool = QQMusicOperationTool.shareInstance.tool
        tool.stopCurrentMusic()
    }
    
}

extension HXLMusicListTVC {
    /// 状态栏设置白色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// 界面初始化
    func setUpInit() {
        setTabView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    /// tableView 界面的初始化
    func setTabView() {
        
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        
        let image = UIImage(named: "QQListBack.jpg")
        let imageView = UIImageView(image: image)
        tableView.backgroundView = imageView
        
    }
    
}

extension HXLMusicListTVC {
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return musicMs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = QQMusicListCell.cellWithTableView(tableView)
        cell.musicM = musicMs[indexPath.row]
        // 每当 cell 将要显示的时候, 做一次动画
        cell.animation(AnimationType.scale)
        
        let flag = musicMs.count / 2
        if flag > indexPath.row {
            cell.animation(AnimationType.rotate)
        }
        
        return cell;
    }
    
    // delegate source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = musicMs[indexPath.row]
        QQMusicOperationTool.shareInstance.playMusic(model)

        let DetailSB = UIStoryboard(name: "QQDetailVC", bundle: nil)
        let DetailVC = DetailSB.instantiateInitialViewController()!
        navigationController?.pushViewController(DetailVC, animated: true)
    }
    

}

