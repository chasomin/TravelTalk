//
//  ChatDetailViewController.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class ChatDetailViewController: UIViewController {
    var navigationTitle: String = ""
    var data: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [""], chatroomName: "")

    static let id = "ChatDetailViewController"
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = navigationTitle
        
        textView.text = "메시지를 입력하세요"
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .systemGray6
        textView.textColor = .gray
        textView.font = .systemFont(ofSize: 15)
        
        sendButton.setTitle("", for: .normal)
        sendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendButton.tintColor = .gray
        
        let xibMyBubble = UINib(nibName: "MyBubbleTableViewCell", bundle: nil)
        tableView.register(xibMyBubble, forCellReuseIdentifier: "MyBubbleTableViewCell")
        
        let xibFriendBubble = UINib(nibName: "FriendBubbleTableViewCell", bundle: nil)
        tableView.register(xibFriendBubble, forCellReuseIdentifier: "FriendBubbleTableViewCell")


        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none

    }
    

    
}

extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data.chatList[indexPath.row].user == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyBubbleTableViewCell.id, for: indexPath) as! MyBubbleTableViewCell
            cell.setCell(data: data.chatList[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FriendBubbleTableViewCell.id, for: indexPath) as! FriendBubbleTableViewCell
            cell.setCell(data: data.chatList[indexPath.row])
            return cell
        }
    }
    
    
}
