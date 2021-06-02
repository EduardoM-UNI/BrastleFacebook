//
//  HomeRemoteDataManager.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation
import Alamofire

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var url: String {
        return "https://\(Constanst.urlApi.url)/\(Constanst.urlApi.path)"
    }
    
    
    func externalGetPoblationGnomes() {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseJSON { response in
            
            var realmListarEmpresasInc = [RealmListarEmpresasInc]()
            let jsonArray = JSON(response.result.value as Any).arrayValue
            
            switch response.result {
            case .success:
                
                try! self.realm.write {
                    self.realm.delete(self.realm.objects(RealmListarEmpresasInc.self))
                    
                    for obtenerListaEmpresasJson in jsonArray {
                        let proyectos = RealmListarEmpresasInc(obtenerListaEmpresasJson: obtenerListaEmpresasJson)
                        realmListarEmpresasInc.append(proyectos)
                    }
                    self.realm.add(realmListarEmpresasInc, update: Realm.UpdatePolicy.modified)
                }
                
                callback(response.result.value as? Array<NSDictionary>, nil)
                break
            case .failure(let error):
                print(error)
                callback(nil, error as NSError?)
                break
            }
        }
        
    }
}
