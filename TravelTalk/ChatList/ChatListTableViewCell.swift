//
//  ChatListTableViewCell.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {
    static let id = "ChatListTableViewCell"
    
    @IBOutlet var chatroomImageView: UIImageView!
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var chatMessageLabel: UILabel!
    @IBOutlet var chatDateLabel: UILabel!
    
    
    let format = DateFormatter()
    let formatString = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        DispatchQueue.main.async {
            self.chatroomImageView.layer.cornerRadius = self.chatroomImageView.frame.width / 2
        }
        chatroomImageView.contentMode = .scaleAspectFill
        
        chatroomNameLabel.font = .boldSystemFont(ofSize: 16)
        
        chatMessageLabel.font = .systemFont(ofSize: 14)
        chatMessageLabel.textColor = .gray

        chatDateLabel.font = .systemFont(ofSize: 12)
        chatDateLabel.textColor = .gray
        
        format.dateFormat = "yyyy-MM-dd HH:mm"
        formatString.dateFormat = "yy.MM.dd"
        
        selectionStyle = .none

    }
    

    func setCell(data: ChatRoom) {
        chatroomImageView.image = UIImage(named: data.chatroomImage[0])
        
        chatroomNameLabel.text = data.chatroomName
        
        chatMessageLabel.text = data.chatList.last?.message
        
        guard let date = format.date(from: data.chatList.last?.date ?? "") else {
            return
        }
        
        let result = formatString.string(from: date)

        chatDateLabel.text = result
        
    }
    

}
