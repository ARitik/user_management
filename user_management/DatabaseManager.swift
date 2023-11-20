//
//  DatabaseManager.swift
//  user_management
//
//  Created by Ritik Ambadi on 11/20/23.
//

import Foundation
import SQLite

class DatabaseManager {
    private let db: Connection

    private let usersTable = Table("users")
    private let id = Expression<Int64>("id")
    private let firstName = Expression<String>("firstName")
    private let lastName = Expression<String>("lastName")
    private let email = Expression<String>("email")
    private let phone = Expression<String>("phone")

    init() {
        // Path to the database file
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

        do {
            db = try Connection("\(path)/db.sqlite3")
            createTable()
        } catch {
            fatalError("Unable to initialize database: \(error)")
        }
    }

    private func createTable() {
        let createTable = usersTable.create { table in
            table.column(id, primaryKey: true)
            table.column(firstName)
            table.column(lastName)
            table.column(email, unique: true)
            table.column(phone)
        }

        do {
            try db.run(createTable)
        } catch {
            print("Error creating table: \(error)")
        }
    }

    // Add functions for CRUD operations here
    func addUser(firstName: String?, lastName: String?, email: String, phone: String) {
        let users = Table("users")
        let insert = users.insert(Expression<String?>("firstName") <- firstName, Expression<String?>("lastName") <- lastName, Expression<String>("email") <- email, Expression<String>("phone") <- phone)
        
        do {
            try db.run(insert)
        } catch {
            print("Insert failed: \(error)")
        }
    }

    func getAllUsers() -> [User] {
        var users = [User]()

        do {
            for user in try db.prepare(usersTable) {
                let newUser = User(id: user[id], firstName: user[firstName], lastName: user[lastName], email: user[email], phone: user[phone])
                users.append(newUser)
            }
        } catch {
            print("Select failed: \(error)")
        }

        return users
    }

    func updateUser(id: Int64, firstName: String, lastName: String, email: String, phone: String) -> Bool {
        let user = usersTable.filter(self.id == id)
        do {
            let update = user.update([
                self.firstName <- firstName,
                self.lastName <- lastName,
                self.email <- email,
                self.phone <- phone
            ])
            if try db.run(update) > 0 {
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }

        return false
    }

    
    func deleteUser(id: Int64) -> Bool {
        let user = usersTable.filter(self.id == id)
        do {
            if try db.run(user.delete()) > 0 {
                return true
            }
        } catch {
            print("Deletion failed: \(error)")
        }

        return false
    }

}
