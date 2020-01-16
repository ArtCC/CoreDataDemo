//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Arturo Carretero Calvo on 27/10/16.
//  Copyright © 2016 Arturo Carretero Calvo. All rights reserved.
//

import UIKit
import CoreDataGenericModule

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Core Data"
        
        // Core Data init
        _ = CDGCoreDataDataController.sharedInstance
        // Core Data delete and create dummy data test
        deleteAllCoreData()
        createDataInCoreData()
        getAllObjectsFromCoreData()
    }
    
    // MARK: - Core Data test
    /**
     Delete all Core Data model (Delete entities)
     */
    func deleteAllCoreData() {
        if CDGCoreDataEngine.deleteAllInCoreData() {
            print("\nAll delete objects correct from Core Data")
        } else {
            print("\nAll delete objects incorrect from Core Data")
        }
    }
    
    /**
     Create data dummy in Core Data with module generic
     */
    func createDataInCoreData() {
        // String for get text
        var string: String = ""
        
        // Save an object
        let pepito: User = User.init(idCard: "123456789", name: "Pepito Grillo")
        if CDGCoreDataEngine.saveObject(pepito, passwordForEncrypted: "password") {
            if let dict = CDGCoreDataEngine.getObjectWithIdentifier("123456789", passwordForEncripted: "password") {
                let user: User = User(dictionary: dict)
                string = "\nCreate object in Core Data (User model test):\n User id: \(user.idCard) \n User name: \(user.name)"
            }
        }
        
        // Save another object
        let peter: User = User.init(idCard: "987654321", name: "Peter pan")
        if CDGCoreDataEngine.saveObject(peter, passwordForEncrypted: "password") {
            if let dict = CDGCoreDataEngine.getObjectWithIdentifier("987654321", passwordForEncripted: "password") {
                let user: User = User(dictionary: dict)
                string = string.appendingFormat("\n\nCreate object in Core Data (User model test):\n User id: \(user.idCard) \n User name: \(user.name)")
            }
        }
        // open alert with result
        print(string)
    }
    
    /**
     Get all objects from Core Data
     */
    func getAllObjectsFromCoreData() {
        print("\nAll objects from Core Data: \(CDGCoreDataEngine.getObjectsFromCoreData("Entity", passwordForEncripted: "password"))")
    }
}
