//
//  HomeRemoteDataManager.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    let realm = try! Realm()
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    var url: String {
        return "https://\(Constanst.urlApi.url)/\(Constanst.urlApi.path)"
    }
    
    
    func externalGetPoblationGnomes() {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseJSON {response in
                
                print(Realm.Configuration.defaultConfiguration.fileURL as Any)
                      
                switch response.result {
                case .success:
                   
                    print(response.result.value)
                    
//                    ResponseListarInspeccion.shared.parseListarInspeccionOffLine(jsonArray: response.result.value as! Array<NSDictionary>)
                   
                    break
                case .failure(let error):
                    print(error)
                 
                    break
                }
        }
        
    }
}
