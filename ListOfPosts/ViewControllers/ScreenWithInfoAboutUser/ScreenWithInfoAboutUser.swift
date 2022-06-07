//
//  ScreenWithInfoAboutUser.swift
//  ListOfPosts
//
//  Created by Роман Дубенец on 13.12.2021.
//

import Foundation
import UIKit

class ScreenInfoAboutUser: UIViewController {
    
    var currentUser: User?
    var name = UILabel()
    var email = UILabel()
    var phone = UILabel()
    var website = UILabel()
    var adress = UILabel()
    var geo = UILabel()
    var company = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        configureLable()
        setSubviews()
        setupLayout()
    }
    
    func configureLable() {
        name.text = currentUser?.name
        email.text = "Email: \(currentUser!.email)"
        phone.text = "Phonenumber: \(currentUser!.phone)"
        website.text = "Web: \(currentUser!.website)"
        adress.text = "Adress: \(currentUser!.address.city) \(currentUser!.address.street) \(currentUser!.address.suite)"
        geo.text = "Lat: \(currentUser!.address.geo.lat), Lng: \(currentUser!.address.geo.lng)"
        company.text = "Company: \(currentUser!.company.name) | \(currentUser!.company.bs)"
    }
    
    func setSubviews() {
        view.addSubview(name)
        view.addSubview(email)
        view.addSubview(phone)
        view.addSubview(website)
        view.addSubview(adress)
        view.addSubview(geo)
        view.addSubview(company)
    }
    
    func setupLayout() {
        name.translatesAutoresizingMaskIntoConstraints = false
        email.translatesAutoresizingMaskIntoConstraints = false
        phone.translatesAutoresizingMaskIntoConstraints = false
        website.translatesAutoresizingMaskIntoConstraints = false
        adress.translatesAutoresizingMaskIntoConstraints = false
        geo.translatesAutoresizingMaskIntoConstraints = false
        company.translatesAutoresizingMaskIntoConstraints = false
        
        name.topAnchor.constraint(equalTo: view.topAnchor, constant: 15).isActive = true
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 30).isActive = true
        email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 30).isActive = true
        phone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        website.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 30).isActive = true
        website.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        adress.topAnchor.constraint(equalTo: website.bottomAnchor, constant: 30).isActive = true
        adress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        geo.topAnchor.constraint(equalTo: adress.bottomAnchor, constant: 10).isActive = true
        geo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        company.topAnchor.constraint(equalTo: geo.bottomAnchor, constant: 30).isActive = true
        company.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        company.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15).isActive = true
    }
}

