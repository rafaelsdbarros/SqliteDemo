//
//  ViewController.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    var dbController: DBController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let database = DBController.sharedInstance
        database.createTable()
        
    }
    
    private func startdbConnection(){
    }

    @IBAction func createDBConnection(_ sender: Any) {
        startdbConnection()
    }
    
    
    @IBAction func createTable(_ sender: Any) {

    }
    
    @IBAction func insertData(_ sender: Any) {
        
        //create user
        let user = User(userId: 2,
                        name: "Rafael Silva de Barros",
                        cpf: "125.456.789",
                        email: "r4f4el1964@gmail.com",
                        dateOfBirth: "15/04/1993")
        
        let addnewUser = DatabaseCommands.insert(item: user)
    }
    
    @IBAction func updateData(_ sender: Any) {
        
    }

    @IBAction func deleteData(_ sender: Any) {
        
        DBController.sharedInstance.deleteDB()
    }
}

