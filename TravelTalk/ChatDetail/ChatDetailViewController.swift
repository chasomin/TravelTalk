//
//  ChatDetailViewController.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class ChatDetailViewController: UIViewController {

    static let id = "ChatDetailViewController"
    
    var navigationTitle: String = ""
    var data: ChatRoom = ChatRoom(chatroomId: 0, chatroomImage: [""], chatroomName: "")
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var sendButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        
        setTableView()
        

    }
    

    
}

extension ChatDetailViewController {
    
    func setTableView() {
        let xibMyBubble = UINib(nibName: "MyBubbleTableViewCell", bundle: nil)
        tableView.register(xibMyBubble, forCellReuseIdentifier: "MyBubbleTableViewCell")
        
        let xibFriendBubble = UINib(nibName: "FriendBubbleTableViewCell", bundle: nil)
        tableView.register(xibFriendBubble, forCellReuseIdentifier: "FriendBubbleTableViewCell")


        tableView.delegate = self
        tableView.dataSource = self
        textView.delegate = self
        
        // 채팅방 맨 아래로 스크롤
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: IndexPath(row: self.data.chatList.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
    func setUI() {
        navigationItem.title = navigationTitle
        
        textView.layer.cornerRadius = 10
        textView.backgroundColor = .systemGray6
        textView.font = .systemFont(ofSize: 15)
        textView.text = "메시지를 입력하세요"
        textView.textColor = .gray
        
        
        sendButton.setTitle("", for: .normal)
        sendButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendButton.tintColor = .gray
        
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


extension ChatDetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "메시지를 입력하세요"
            textView.textColor = .gray
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .gray {
            textView.text = nil
            textView.textColor = .black
        }

    }
}
