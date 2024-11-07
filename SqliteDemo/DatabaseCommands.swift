//
//  DatabaseCommands.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import Foundation
import SQLite


class DatabaseCommands: DatabaseProtocol {
    
    typealias T = User

    static var table = Table("User")
    
    // Expressions
    static let userId = Expression<Int64>("userId")
    static let name = Expression<String>("name")
    static let cpf = Expression<String>("cpf")
    static let email = Expression<String>("email")
    static let dateOfBirth = Expression<String>("dateOfBirth")
    
    // Creating table
    static func createTable() {
        //get database connetion
        guard let database = DBController.sharedInstance.database else {
            print("Database connetion instance error")
            return
        }
        
        do {
            try database.run(table.create(ifNotExists: true) {t in
                t.column(userId, primaryKey: true)
                t.column(name)
                t.column(cpf, unique: true)
                t.column(email, unique: true)
                t.column(dateOfBirth, unique: true)
            })
        }catch {
            print("Table already exist \(error)")
        }
    }
    
    static func insert(item: User) -> Int64? {
        //get database connetion
        guard let database = DBController.sharedInstance.database else {
            print("Database connetion instance error")
            return nil
        }
        
        do {
            let result = try database.run(table.insert(name <- item.name,
                                          cpf <- item.cpf,
                                          email <- item.email,
                                          dateOfBirth <- item.dateOfBirth))
            return result
        }catch let Result.error(message, code, statement) where code == 20 {
            print("insert row failed: \(message), in \(String(describing: statement))")
            return nil
        }catch let error {
            print("insertion failed: \(error)")
            return nil
        }
       
    }
    
    static func deleteById(item: User) {
        //get database connetion
        guard let db = DBController.sharedInstance.database else {
            print("Database connetion instance error")
            return
        }
        
        let query = table.filter(userId == item.userId)
        do {
            try db.run(query.delete())
        }catch{
            print("error when try to delete: \(error)")
        }
        
    }
    
    static func findAll() -> [User]? {
        //get database connetion
        guard let db = DBController.sharedInstance.database else {
            print("Database connetion instance error")
            return nil
        }
        
        
        var retArray = [User]()
        do {
            for item in try db.prepare(table) {
                print(item[userId])
                
            }
        }catch {
            
        }

        return retArray
    }

}
