//
//  structPost.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 08.12.2021.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id:     Int
    let title:  String
    let body:   String
}
