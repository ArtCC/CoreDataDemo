//
//  User.swift
//  CoreDataDemo
//
//  Created by Arturo Carretero Calvo on 27/10/16.
//  Copyright © 2016 Arturo Carretero Calvo. All rights reserved.
//

import Foundation
import CoreDataGenericModule

/**
 User class
 */
class User: NSObject, CDGCoreDataProtocol {
    /**
     Id card for user object model
     */
    var idCard: String = ""
    
    /**
     Name for user object model
     */
    var name: String = ""
    
    /**
     Init for object model
     - parameter idCard: idCard description
     - parameter name:   name description
     - returns: object init
     */
    init(idCard: String, name: String) {
        self.idCard = idCard
        self.name = name
    }
    
    // MARK: - CDGCoreDataProtocol
    
    required init(dictionary: [String: String]) {
        idCard = dictionary["idCard"]!
        name = dictionary["name"]!
    }
    
    func saveAsDictionary() -> [String: String] {
        return [
            "idCard" : idCard,
            "name" : name
        ]
    }
    
    func uniqueIdentifier() -> String {
        return idCard
    }
}
