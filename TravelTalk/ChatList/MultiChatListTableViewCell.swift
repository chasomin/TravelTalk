//
//  MultiChatListTableViewCell.swift
//  TravelTalk
//
//  Created by 차소민 on 1/14/24.
//

import UIKit

class MultiChatListTableViewCell: UITableViewCell {
    
    static let id = "MultiChatListTableViewCell"
    @IBOutlet var chatroomImageView: [UIImageView]!
    @IBOutlet var chatroomNameLabel: UILabel!
    @IBOutlet var chatMessageLabel: UILabel!
    @IBOutlet var chatDateLabel: UILabel!
    
    let format = DateFormatter()
    let formatString = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

}



extension MultiChatListTableViewCell {
    func setUI() {
        DispatchQueue.main.async {
            self.chatroomImageView.map{
                $0.layer.cornerRadius = $0.frame.width / 2
            }
        }
        chatroomImageView.map {
            $0.contentMode = .scaleAspectFill
        }
        
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
        for i in 0..<chatroomImageView.count {
            chatroomImageView[i].image = UIImage(named: data.chatroomImage[i])
        }
        chatroomNameLabel.text = data.chatroomName
        
        chatMessageLabel.text = data.chatList.last?.message
        
        guard let date = format.date(from: data.chatList.last?.date ?? "") else {
            return
        }
        
        let result = formatString.string(from: date)

        chatDateLabel.text = result
        
    }

}
