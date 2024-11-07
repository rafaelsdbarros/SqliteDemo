//
//  AddressModel.swift
//  SqliteDemo
//
//  Created by Rafael on 27/09/23.
//

import Foundation
import SQLite

class AddressModel {
    static let id = Expression<Int64>("addressId")
    static let street = Expression<String>("street")
}
