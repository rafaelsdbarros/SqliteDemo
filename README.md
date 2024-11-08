# SQLite Demo

The project was created to implement a CRUD database with Sqlite

## Technology

- Swift
- SQLite for swift from: https://github.com/stephencelis/SQLite.swift

## Code Examples:

- Create a context of DBConnections;
```
    do {
        self.database = try Connection(getPathDirectory())
        try self.database?.key(DBController.dbPasscode)
        self.database?.foreignKeys = true
    }catch {
        print("error when try to creating connection with database \(error)")
    }
```

- Create CRUD operations with protocols:
  ```
    protocol DatabaseProtocol {
      associatedtype T
      static func createTable() -> Void
      static func insert(item: T) -> Int64?
      static func deleteById(item: T) -> Void
      static func findAll() -> [T]?
    }
  ```
- Usage example of implemants and use protocols:

- createTable():
  ```
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
  ```

  - insert():
  ```
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
  ```
  - DeleteByID:
  ```
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
  ```






