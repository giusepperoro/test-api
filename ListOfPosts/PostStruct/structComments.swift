//
//  structComments.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 08.12.2021.
//

import Foundation

struct Comments: Codable {
    var postId: Int
    var id:     Int
    var name:   String
    var email:  String
    var body:   String
}
