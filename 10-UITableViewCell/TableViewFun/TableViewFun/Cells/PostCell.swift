//
//  PostCell.swift
//  TableViewFun
//
//  Created by mac on 16/1/1.
//  Copyright © 2016年 shiziwen. All rights reserved.
//

import UIKit

struct Post {
    let avatar: String
    let image: String
    let nickname: String
    let username: String
    let content: String
    let create_at: String
}

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
