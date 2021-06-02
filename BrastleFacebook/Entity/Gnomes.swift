//
//  Gnomes.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//

import Foundation
import SwiftyJSON

class Gnomes: NSObject {
    var id: Int?
    var name: String?
    var age: Int?
    var height: Int?
    var weight: Int?
    var hair_color: String?
    var thumbnail: String?
    var friends = [String]()
    var professions = [String]()
    
    init (id: Int, name: String, age: Int, height: Int, weight: Int, hair_color: String, thumbnail: String, friends: [String], professions: [String]) {
        self.id = id
        self.name = name
        self.age = age
        self.height = height
        self.weight = weight
        self.hair_color = hair_color
        self.thumbnail = thumbnail
        self.friends = friends
        self.professions = professions
    }
    
    class func getGnomesDataFromJson(modelDict: JSON) -> Gnomes {
        
        let id = modelDict["id"].intValue
        let name = modelDict["name"].stringValue
        let age = modelDict["age"].intValue
        let height = modelDict["height"].intValue
        let weight = modelDict["weight"].intValue
        let hair_color = modelDict["hair_color"].stringValue
        let thumbnail = modelDict["thumbnail"].stringValue
        let friends = modelDict["friends"].arrayObject
        let professions = modelDict["professions"].arrayObject
        
        let gnomes = Gnomes(id: id, name: name, age: age, height: height, weight: weight, hair_color: hair_color, thumbnail: thumbnail, friends: friends as! [String], professions: professions as! [String])
        
        return gnomes
        
    }
}
