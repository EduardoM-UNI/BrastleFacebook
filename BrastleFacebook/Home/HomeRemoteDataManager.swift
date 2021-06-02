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


class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
   
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    
    var model = [Gnomes]()
    
    var url: String {
        return "https://\(Constanst.urlApi.url)/\(Constanst.urlApi.path)"
    }
    
    
    func externalGetPoblationGnomes() {
        
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseData(completionHandler: { (response) in
              
                switch(response.result) {
                case .success(_):
                    
                    if response.result.value != nil {
                        let json =  try! JSON(data: response.result.value!)
                        let dataArray = json["Brastlewark"].arrayValue
                        
                        for modelDict in dataArray {
                            let gnome = Gnomes.getGnomesDataFromJson(modelDict: modelDict)
                            self.model.append(gnome)
                        }
                    
                        self.remoteRequestHandler?.remoteDataManagerCallBackData(gnomes: self.model )
                     }
                    break
                    
                case .failure(_):
                    print("error", response.result.error ?? "Error")
                    break
                    
                }
                
            })
        
        
//        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).validate().responseData { response in
//
//
//                switch response.result {
//                case .success:
//
//                   // guard let result = response.result.value else { return }
//
//                    guard let json = try JSON(data: response.result.value! as! Data) else { return }
//
//                    let dataArray = json["Brastlewark"].arrayValue
//                    print(dataArray)
//                    var model = [Gnomes]()
//                    for modelDict in dataArray {
//                        let gnome = Gnomes.getGnomesDataFromJson(modelDict: modelDict)
//                        model.append(gnome)
//                    }
//
//                  //  self.remoteRequestHandler?.remoteDataManagerCallBackData(gnomes:  response.result.value as! Array<NSDictionary>)
//
//                  //  print(response.result.value as Any)
//
////                    ResponseListarInspeccion.shared.parseListarInspeccionOffLine(jsonArray: response.result.value as! Array<NSDictionary>)
//
//                    break
//                case .failure(let error):
//                    print(error)
//
//                    break
//                }
//        }
//
    }
}
