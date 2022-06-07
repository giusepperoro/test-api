//
//  ScreenWithComments.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 13.12.2021.
//

import Foundation
import UIKit

class SecondScreen: UIViewController {
    
    let tableCom = UITableView()
    var curURLCom: String?
    var workWithAPI = WorkWithAPI()
    var downloadCom: [Comments] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        setNavigationController(name: "Comments:")
        setupTable()
        loadData()
    }
    
    func setupTable() {
        view.addSubview(tableCom)
        
        tableCom.translatesAutoresizingMaskIntoConstraints = false
        tableCom.register(ComCell.self, forCellReuseIdentifier: ComCell.indentifire)
        tableCom.dataSource = self
        tableCom.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableCom.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableCom.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableCom.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension SecondScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadCom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ComCell = tableCom.dequeueReusableCell(withIdentifier: ComCell.indentifire,
                                                         for: indexPath) as! ComCell
        let comment = downloadCom[indexPath.row]
        cell.configure(com: comment)
        return cell
    }
}

private extension SecondScreen {
    func loadData() {
        loadCom {
            self.loadCom {
                DispatchQueue.main.async {
                    self.tableCom.reloadData()
                }
            } onError: {
                print("error loading users")
            }

        } onError: {
            print("error loading posts")
        }

    }
    
    func loadCom(onSuccess: @escaping() -> Void, onError: @escaping() -> Void) {
        workWithAPI.getApiData(
            fromUrlString: curURLCom!,
            completion: { result in
                switch result {
                case .success(let data):
                    do {
                        let decodedData = try JSONDecoder().decode([Comments].self, from: data)
                        self.downloadCom = decodedData
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
}

extension SecondScreen {
    func setNavigationController(name: String) {
        title = name
        navigationController?.navigationBar.tintColor = .black
    }
}

