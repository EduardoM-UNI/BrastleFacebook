//
//  HomeLocalDataManager.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation
import RealmSwift


class HomeLocalDataManager:HomeLocalDataManagerInputProtocol {
    
    let realm = try! Realm()
    
    func saveLocaGnomeData(with gnomes: [GnomesBasicData]){
        
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        DispatchQueue.main.async { [self] in
            
            try! self.realm.write{
                
                self.realm.delete(self.realm.objects(RealmPopulation.self))
                
                
                var gnomespopulation:Array<RealmPopulation> = []
                for index in 0...gnomes.count-1 {
                    let realmPopulation = RealmPopulation()
                    realmPopulation.name = (gnomes[index].name ?? "")
                    realmPopulation.age = (gnomes[index].age ?? 0)
                    realmPopulation.height = (gnomes[index].height ?? 0)
                    realmPopulation.weight = (gnomes[index].weight ?? 0)
                    realmPopulation.hair_color = (gnomes[index].hair_color ?? "")
                    realmPopulation.thumbnail = (gnomes[index].thumbnail ?? "")
                    
                    //            var friends:Array<Realmfriends> = []
                    //            if let friendsGnomes = gnomes[index].friends as? Array<Any>{
                    //                if friendsGnomes.count>=1{
                    //                    let object = Realmfriends()
                    //                    object.friends = friendsGnomes.fr
                    //                }
                    //            }
                    
                    gnomespopulation.append(realmPopulation)
                }
                self.realm.add(gnomespopulation, update: Realm.UpdatePolicy.modified)
            }
        }
    }
}
