//
//  ChatListViewController.swift
//  TravelTalk
//
//  Created by 차소민 on 1/13/24.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: ChatListTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.id)

        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "TRAVEL TALK"
        
        tableView.rowHeight = 85
        tableView.separatorStyle = .none
        
        searchBar.placeholder = "친구 이름을 검색해보세요"
    }
    
    
    


}



extension ChatListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatListTableViewCell.id, for: indexPath) as! ChatListTableViewCell
        
        cell.setCell(data: mockChatList[indexPath.row])
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}
