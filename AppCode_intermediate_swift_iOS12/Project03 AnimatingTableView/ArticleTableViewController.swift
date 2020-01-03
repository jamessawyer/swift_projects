//
//  ArticleTableViewController.swift
//  Project03 AnimatingTableView
//
//  Created by lucian on 2020/1/3.
//  Copyright © 2020 oscar. All rights reserved.
//

/// 知识点
/// 1. StoryBoard 中使用 UIStack 进行布局
/// 2. CATransform3DMakeRotation & CATransform3DTranslate & CATransform3DIdentity & UIView.animate
/// 3. tableview(_: willDisplay:forRowAt:) 设置table cell 入场动画

import UIKit

class ArticleTableViewController: UITableViewController {
    let postTitles = ["Use Background Transfer Service To Download File in Background",
                      "Face Detection in iOS Using Core Image",
                      "Building a Speech-to-Text App Using Speech Framework in iOS 10",
                      "Building Your First Web App in Swift Using Vapor",
                      "Creating Gradient Colors Using CAGradientLayer",
                      "A Beginner's Guide to CALayer"];
    let postImages = ["imessage-sticker-pack", "face-detection-featured", "speech-kit-featured", "vapor-web-framework", "cagradientlayer-demo", "calayer-featured"];

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 258.0
        tableView.rowHeight = UITableView.automaticDimension
        
        if #available(iOS 11.0, *) {
            // 大的navigation title
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postTitles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        cell.postTitle.text = postTitles[indexPath.row]
        cell.postImageView.image = UIImage(named: postImages[indexPath.row])
        return cell
    }
    
    /// 在Cell绘制之前 可用于配置cell对象 和 Cell出场动画
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 初始状态
        cell.alpha = 0
        // 效果1 逆时针翻转90度
        //        let rotationAngleInRadians = 90 * CGFloat(Double.pi/180)
//        let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        
        // 效果2 从左下角(x: -500, y: 100)动画到Cell本该在的地方
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        cell.layer.transform = rotationTransform
       
        
        // 结束状态
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }

}
