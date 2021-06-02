//
//  RealmPopulation.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//

import Foundation

import RealmSwift

class RealmPopulation: Object{
    
    @objc dynamic var ID = UUID().uuidString
    @objc dynamic var name : String?
    @objc dynamic var hair_color : String?
    @objc dynamic var age :Int = 0
    @objc dynamic var height :Int = 0
    @objc dynamic var weight :Int = 0
    @objc dynamic var thumbnail : String?
    let friends = List<Realmfriends>()
    let professions = List<RealmProfesion>()
   
    override static func primaryKey() -> String? {
            return "ID"
        }
}

class Realmfriends: Object{
    
    @objc dynamic var ID = UUID().uuidString
    @objc dynamic var friends:String?
    
    override static func primaryKey() -> String? {
            return "ID"
        }
}

class RealmProfesion: Object{
    
    @objc dynamic var ID = UUID().uuidString
    @objc dynamic var professions:String?
    
    override static func primaryKey() -> String? {
            return "ID"
        }
}
