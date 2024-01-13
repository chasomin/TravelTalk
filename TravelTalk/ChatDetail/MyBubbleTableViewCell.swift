//
//  MyBubbleTableViewCell.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class MyBubbleTableViewCell: UITableViewCell {
    
    static let id = "MyBubbleTableViewCell"

    @IBOutlet var chatBubbleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var bubbleView: UIView!
    
    let format = DateFormatter()
    let formatString = DateFormatter()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        chatBubbleLabel.font = .systemFont(ofSize: 15)
        chatBubbleLabel.numberOfLines = 0
        chatBubbleLabel.textAlignment = .left
        
        bubbleView.layer.cornerRadius = 10
        bubbleView.layer.borderColor = UIColor(.gray).cgColor
        bubbleView.layer.borderWidth = 1
        bubbleView.backgroundColor = .systemGray5
        
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textAlignment = .center
        dateLabel.textColor = .gray
        
        format.dateFormat = "yyyy-MM-dd HH:mm"
        formatString.dateFormat = "hh:mm a"
        selectionStyle = .none

    }
    
    func setCell(data: Chat) {
        chatBubbleLabel.text = data.message
        
        dateLabel.text = data.date
        
        guard let date = format.date(from: data.date) else {
            return
        }
        
        let result = formatString.string(from: date)

        dateLabel.text = result

    }


}
