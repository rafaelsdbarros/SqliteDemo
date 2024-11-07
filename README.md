<h1>SQLite Demo</h1>

<p>The project was created to implement a CRUD database with Sqlite</p>
<p>
  The main idea was learning about:
  - Create a context of DBConnections;
  - Create DbCommands with custom Database based with protocols:
      static func createTable() -> Void
      static func insert(item: T) -> Int64?
      static func deleteById(item: T) -> Void
      static func findAll() -> [T]?
</p>
