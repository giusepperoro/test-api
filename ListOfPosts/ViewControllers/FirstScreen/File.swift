//
//  File.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 12.12.2021.
//

import Foundation
import UIKit

//    MARK: User Cell

protocol PostCellDelegate: AnyObject {
    func didSelectUser(user: User?)
}


class PostCell: UITableViewCell {
    
//    MARK: Class constant
    static let indentifire = "PostCell"
    
    var username = UIButton(type: .system)
    var title = UILabel()
    var body = UILabel()
    var user: User?
    
    weak var delegate: PostCellDelegate?
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupLayout()
        
        username.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("this class doesn't support an interface builder")
    }
    
    func configure(user: User?, titleP: Post) {
        username.setTitle(user?.username ?? "User not found", for: .normal)
        title.text = titleP.title
        body.text = titleP.body
        
        self.user = user
    }
    
    func setupSubviews() {
        contentView.addSubview(username)
        contentView.addSubview(title)
        contentView.addSubview(body)
    }
    
    func setupLayout() {
        username.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        
        username.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        username.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        title.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 5).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        
        body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
    }
    
    @objc func onClick() {
        delegate?.didSelectUser(user: user)
    }
}

//setSubView
//выкладываем вью на ячейке
//констрейн

