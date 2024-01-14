//
//  FriendBubbleTableViewCell.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class FriendBubbleTableViewCell: UITableViewCell {
    
    static let id = "FriendBubbleTableViewCell"

    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatBubbleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var bubbleView: UIView!
    @IBOutlet var divisionLabel: UILabel!
    
    
    let format = DateFormatter()
    let formatString = DateFormatter()


    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
        
    }



}

extension FriendBubbleTableViewCell {
    func setUI() {
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        profileImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = .systemFont(ofSize: 15)
        chatBubbleLabel.textAlignment = .left

        chatBubbleLabel.font = .systemFont(ofSize: 15)
        chatBubbleLabel.numberOfLines = 0
        chatBubbleLabel.textAlignment = .left
        
        bubbleView.layer.cornerRadius = 10
        bubbleView.layer.borderColor = UIColor(.gray).cgColor
        bubbleView.layer.borderWidth = 1

        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .gray
        
        divisionLabel.text = ""
        divisionLabel.font = .systemFont(ofSize: 12)
        divisionLabel.textAlignment = .center
        divisionLabel.backgroundColor = .systemGray6
        divisionLabel.layer.cornerRadius = 10
        divisionLabel.clipsToBounds = true

        format.dateFormat = "yyyy-MM-dd HH:mm"
        formatString.dateFormat = "hh:mm a"
        
        selectionStyle = .none
    }
    
    func setCell(data: Chat) {
        
        chatBubbleLabel.text = data.message
        
        dateLabel.text = data.date
        
        nameLabel.text = data.user.rawValue
        profileImageView.image = UIImage(named: data.user.profileImage)
        
        guard let date = format.date(from: data.date) else { return }
        let result = formatString.string(from: date)
        dateLabel.text = result

    }
}
