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
    var mock = mockChatList
    var arr:[ChatRoom] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setUI()
    }

}


extension ChatListViewController {
    func setTableView() {
        let xib = UINib(nibName: ChatListTableViewCell.id, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: ChatListTableViewCell.id)

        tableView.dataSource = self
        tableView.delegate = self
        
        searchBar.delegate = self
    }
    
    func setUI() {
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
        let sb = UIStoryboard(name: "Chat", bundle: nil)
        
        
        let vc = sb.instantiateViewController(withIdentifier: ChatDetailViewController.id) as! ChatDetailViewController
        vc.navigationTitle = mockChatList[indexPath.row].chatroomName
        vc.data = mockChatList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
        

    }
    
    
    
}

extension ChatListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        arr = []
        mockChatList = mock
        if searchText != "" {
            mockChatList.map {
                if $0.chatroomName.contains(searchText) {
                    arr.append($0)
                }
            }
            mockChatList = arr

        } else {
            print("%%%%% 텍스트필트 빈 칸")
            mockChatList = mock
        }
        print("====")
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
