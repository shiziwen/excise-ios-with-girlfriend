//
//  ViewController.swift
//  TableViewFun
//
//  Created by mac on 15/12/15.
//  Copyright © 2015年 shiziwen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func clear(sender: AnyObject) {
        data.removeAll()
        tableView.reloadData()
    }
    
    var data = [
//        "😄 Human", "🐱 Nikeo", "🐶 Dog", "🎄 Tree", "🎁 Gift"
        Post(avatar: "kevin", image: "fangsuo", nickname: "Kevin", username: "@kevinzhow", content: "在我感到寂寞、空虚、难过的时候，我总会想起方所，这是一个又热闹，又安静的敌方", create_at: "2 hours ago"),
        Post(avatar: "kevin", image: "book", nickname: "Kevin", username: "@kevinzhow", content: "在我感到寂寞、空虚、难过的时候，我总会想起方所，这是一个又热闹，又安静的敌方", create_at: "2 hours ago"),
        Post(avatar: "kevin", image: "ipad", nickname: "Kevin", username: "@kevinzhow", content: "在我感到寂寞、空虚、难过的时候，我总会想起方所，这是一个又热闹，又安静的敌方", create_at: "2 hours ago")
    ]
    
    var normalText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        title = "😄 动物园"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // 返回cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NormalCell", forIndexPath: indexPath) as! PostCell
        
        let post = data[indexPath.row]
        
        cell.postImageView.image = UIImage(named: post.image)
        cell.avatarImageView.image = UIImage(named: post.avatar)
        cell.usernameLabel.text = post.username
        cell.nicknameLabel.text = post.nickname
        cell.contentLabel.text = post.content
        cell.timeLabel.text = post.create_at
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        normalText = cell?.textLabel?.text
        
        // 如果有navigation controller就会滑动出现，没有则由下而上弹出
        performSegueWithIdentifier("showNormalViewController", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showNormalViewController" {
            let viewController = segue.destinationViewController as! NormalViewController
            
            viewController.normalText = normalText
        }
        else {
            print("No")
        }
    }
    
}
