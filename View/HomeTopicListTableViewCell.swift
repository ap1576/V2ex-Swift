//
//  HomeTopicListTableViewCell.swift
//  V2ex-Swift
//
//  Created by huangfeng on 1/8/16.
//  Copyright © 2016 Fin. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTopicListTableViewCell: UITableViewCell {
    /// 头像
    var avatarImageView: UIImageView?
    /// 用户名
    var userNameLabel: UILabel?
    /// 日期 和 最后发送人
    var dateAndLastPostUserLabel: UILabel?
    /// 评论数量
    var replyCountLabel: UILabel?
    var replyCountIconImageView: UIImageView?
    
    /// 节点
    var nodeNameLabel: UILabel?
    /// 帖子标题
    var topicTitleLabel: UILabel?
    
    /// 装上面定义的那些元素的容器
    var contentPanel:UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.setup();
    }
    func setup()->Void{
        self.backgroundColor=V2EXColor.colors.v2_backgroundColor;
        
        self.contentPanel = UIView();
        self.contentPanel!.backgroundColor=UIColor.whiteColor();
        self.contentView .addSubview(self.contentPanel!);
        self.contentPanel!.snp_makeConstraints{ (make) -> Void in
            make.top.left.right.equalTo(self.contentView);
        }
        
        self.avatarImageView = UIImageView();
        self.avatarImageView!.contentMode=UIViewContentMode.ScaleAspectFit;
        self.avatarImageView!.layer.cornerRadius = 3;
        self.avatarImageView!.layer.masksToBounds = true;
        self.contentPanel!.addSubview(self.avatarImageView!);
        self.avatarImageView!.snp_makeConstraints{ (make) -> Void in
            make.left.top.equalTo(self.contentView).offset(12);
            make.width.height.equalTo(35);
        }
        
        self.userNameLabel = UILabel();
        self.userNameLabel!.textColor = V2EXColor.colors.v2_TopicListUserNameColor;
        self.userNameLabel!.font=v2Font(14);
        self.contentPanel! .addSubview(self.userNameLabel!);
        self.userNameLabel!.snp_makeConstraints{ (make) -> Void in
            make.left.equalTo(self.avatarImageView!.snp_right).offset(10);
            make.top.equalTo(self.avatarImageView!);
        }
        
        self.dateAndLastPostUserLabel = UILabel();
        self.dateAndLastPostUserLabel!.textColor=V2EXColor.colors.v2_TopicListDateColor;
        self.dateAndLastPostUserLabel!.font=v2Font(12);
        self.contentPanel?.addSubview(self.dateAndLastPostUserLabel!);
        self.dateAndLastPostUserLabel!.snp_makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.avatarImageView!);
            make.left.equalTo(self.userNameLabel!);
        }
        
        self.replyCountLabel = UILabel();
        self.replyCountLabel!.textColor = V2EXColor.colors.v2_TopicListDateColor
        self.replyCountLabel!.font = v2Font(12)
        self.contentPanel!.addSubview(self.replyCountLabel!);
        self.replyCountLabel!.snp_makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.userNameLabel!);
            make.right.equalTo(self.contentPanel!).offset(-12);
        }
        self.replyCountIconImageView = UIImageView(image: UIImage(imageNamed: "reply_n"))
        self.replyCountIconImageView?.contentMode = .ScaleAspectFit
        self.contentPanel?.addSubview(self.replyCountIconImageView!);
        self.replyCountIconImageView!.snp_makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.replyCountLabel!);
            make.width.height.equalTo(18);
            make.right.equalTo(self.replyCountLabel!.snp_left).offset(-2);
        }
        
        self.nodeNameLabel = UILabel();
        self.nodeNameLabel!.textColor = V2EXColor.colors.v2_TopicListDateColor
        self.nodeNameLabel!.font = v2Font(11)
        self.nodeNameLabel!.backgroundColor = UIColor(white: 0.9, alpha: 1);
        self.nodeNameLabel?.layer.cornerRadius=2;
        self.nodeNameLabel!.clipsToBounds = true
        self.contentPanel?.addSubview(self.nodeNameLabel!)
        self.nodeNameLabel!.snp_makeConstraints{ (make) -> Void in
            make.centerY.equalTo(self.replyCountLabel!);
            make.right.equalTo(self.replyCountIconImageView!.snp_left).offset(-4)
            make.bottom.equalTo(self.replyCountLabel!).offset(1);
            make.top.equalTo(self.replyCountLabel!).offset(-1);
        }
        
        self.topicTitleLabel=V2SpacingLabel();
        self.topicTitleLabel!.textColor=V2EXColor.colors.v2_TopicListTitleColor;
        self.topicTitleLabel!.font=v2Font(18);
        self.topicTitleLabel!.numberOfLines=0;
        self.topicTitleLabel!.preferredMaxLayoutWidth=SCREEN_WIDTH-24;
        self.contentPanel?.addSubview(self.topicTitleLabel!);
        self.topicTitleLabel!.snp_makeConstraints{ (make) -> Void in
            make.top.equalTo(self.avatarImageView!.snp_bottom).offset(12);
            make.left.equalTo(self.avatarImageView!);
            make.right.equalTo(self.contentPanel!).offset(-12);
        }
        
        
        self.contentPanel!.snp_makeConstraints{ (make) -> Void in
            make.bottom.equalTo(self.topicTitleLabel!.snp_bottom).offset(12);
        }
        
        self.contentView.snp_makeConstraints{ (make) -> Void in
            make.left.top.right.equalTo(self);
            make.bottom.equalTo(self.contentPanel!).offset(10);
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func bind(model:TopicListModel){
        self.userNameLabel?.text = model.userName;
        self.dateAndLastPostUserLabel?.text = model.date
        self.topicTitleLabel?.text = model.topicTitle;
        
        if let avata = model.avata {
            self.avatarImageView?.kf_setImageWithURL(NSURL(string: "https:" + avata)!)
        }
        
        self.replyCountLabel?.text = model.replies;
        if let node = model.nodeName{
            self.nodeNameLabel!.text = "  " + node + "  "
        }

    }
}
