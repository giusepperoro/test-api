//
//  TableViewCommentCell.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 14.12.2021.
//

import Foundation
import UIKit

class ComCell: UITableViewCell {
    
    static let indentifire = "ComCell"
    
    var name = UILabel()
    var body = UILabel()
    var com: Comments?
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("this class doesn't support an interface builder")
    }
    
    func configure(com: Comments?) {
        name.text = com?.name
        body.text = com?.body
    }
    
    func setupSubviews() {
        contentView.addSubview(name)
        contentView.addSubview(body)
    }
    
    func setupLayout() {
        name.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true

        body.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 0).isActive = true
        body.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        body.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}
