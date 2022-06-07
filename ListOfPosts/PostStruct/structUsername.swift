//
//  structUsername.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 08.12.2021.
//

import Foundation

struct User: Codable {
    var id:         Int
    var name:       String
    var username:   String
    var email:      String
    var phone:      String
    var website:    String
    var address:     Adress
    var company:    Company
}

struct Adress: Codable {
    var street:     String
    var suite:      String
    var city:       String
    var zipcode:    String
    var geo:        Geo
}

struct Geo: Codable {
    var lat:        String
    var lng:        String
}

struct Company: Codable {
    var name:        String
    var catchPhrase: String
    var bs:          String
}
