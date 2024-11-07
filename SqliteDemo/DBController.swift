//
//  dbControler.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import Foundation
import SQLite

class DBController {
    static let sharedInstance: DBController = DBController()

    private static var dbName = "db"
    private static var dbExtension = "sqlite3"
    private static var dbPasscode = "passcodee"

    var database: Connection?
    
    private init() {
        //create database connection
        do {
            self.database = try Connection(getPathDirectory())
            try self.database?.key(DBController.dbPasscode)
            self.database?.foreignKeys = true
        }catch {
            print("error when try to creating connection with database \(error)")
        }
    }
    
    private func getPathDirectory() -> String {
        
            // get document directory
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let fullPath = "\(documentDirectory)/\(DBController.dbName).\(DBController.dbExtension)"
            print("path directory: \(fullPath)")
            return fullPath
        
        
       // let existFullPath = FileManager.default.fileExists(atPath: fullPath)
       // guard !existFullPath else {
         //   print("path directiory already exist: \(fullPath)")
       //           return ""
       // }
    }
    
    //Creating table
    func createTable(){
        DatabaseCommands.createTable()
    }
    
    func deleteDB() {
        let fullPath = getPathDirectory()
        do {
            try FileManager.default.removeItem(atPath: fullPath)
            print("Database deleted")
        }catch {
            print("Error when try to delete db.")
        }
    }

}
