//
//  ViewController.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 06.12.2021.
//

import Foundation
import UIKit

class FirstScreen: UIViewController {
    
    let urlPost = "https://jsonplaceholder.typicode.com/posts"
    let urlUsers = "https://jsonplaceholder.typicode.com/users"
    let urlComments = "https://jsonplaceholder.typicode.com/comments"

    let tableView = UITableView()
    var workWithAPI = WorkWithAPI()
    
    var downloadPost: [Post] = []
    var downloadUser: [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
    
        setTableView()
        setNavigationController(name: "Users:")
        loadData()
    }
}

// MARK: - Private methods

private extension FirstScreen {
    
    func loadData() {
        loadPosts {
            self.loadUsers {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } onError: {
                print("error loading users")
            }

        } onError: {
            print("error loading posts")
        }

    }
    func loadPosts(onSuccess: @escaping() -> Void, onError: @escaping() -> Void) {
        workWithAPI.getApiData(
            fromUrlString: urlPost,
            completion: { result in
                switch result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode([Post].self, from: data)
                        self.downloadPost = decodedData
                        onSuccess()
                    }
                    catch {
                        onError()
                    }
                case .failure:
                    onError()
                }
            }
        )
    }
    
    func loadUsers(onSuccess: @escaping() -> Void, onError: @escaping() -> Void) {
        workWithAPI.getApiData(
            fromUrlString: urlUsers,
            completion: { result in
                switch result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode([User].self, from: data)
                        self.downloadUser = decodedData
                        onSuccess()
                    }
                    catch {
                        onError()
                    }
                case .failure:
                    onError()
                }
            }
        )
    }
    
    func findUserById(id: Int) -> User? {
        return downloadUser.first(where: { $0.id == id })
    }
}

//  MARK: NAVIGATION controller settings

extension FirstScreen {
    func setNavigationController(name: String) {
        title = name
        navigationController?.navigationBar.tintColor = .black
    }
}

//  MARK: Table View Settings

extension FirstScreen {
    func setTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.indentifire)
        tableView.backgroundColor = .blue
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//  MARK: Table View DataSource

extension FirstScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostCell = tableView.dequeueReusableCell(withIdentifier: PostCell.indentifire,
                                                           for: indexPath) as! PostCell
        let post = downloadPost[indexPath.row]
        let usersPost = findUserById(id: post.userId)
        cell.configure(user: usersPost,
                       titleP: post)
        cell.delegate = self
        return cell
        }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return downloadPost.count 
    }
}

//  MARK: Table View Delegate

extension FirstScreen: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let secondScreen = SecondScreen()
        secondScreen.curURLCom = urlPost + "/\(downloadPost[indexPath.row].id)/comments"
        navigationController?.pushViewController(secondScreen,
                                                 animated: true)
    }
}

extension FirstScreen: PostCellDelegate {
    func didSelectUser(user: User?) {
        let vc = ScreenInfoAboutUser()
        
        vc.currentUser = user
        self.present(vc, animated: true, completion: nil)
    }
}
