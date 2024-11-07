//
//  UserData.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import Foundation
import SQLite

class User  {
    var userId: Int64
    var name: String
    var cpf: String
    var email: String
    var dateOfBirth: String
    
    init(userId: Int64, name: String, cpf: String, email: String, dateOfBirth: String) {
        self.userId = userId
        self.name = name
        self.cpf = cpf
        self.email = email
        self.dateOfBirth = dateOfBirth
    }
}
