//
//  HomeInteractor.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    var arrayGnomes = [Constanst.gnomesCleanData]()
    func interactorGetData() {
       
        remoteDatamanager?.externalGetPoblationGnomes()
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
  
    // TODO: Implement use case methods
    
    func remoteDataManagerCallBackData(gnomes: [Gnomes]) {
        
        for index in 0...gnomes.count-1{
        
            let gnome = Constanst.gnomesCleanData(name: gnomes[index].name, age: gnomes[index].age, height: gnomes[index].height, weight: gnomes[index].weight, hair_color: gnomes[index].hair_color, thumbnail: gnomes[index].thumbnail)
            self.arrayGnomes.append(gnome)
            
        }
        presenter?.interactorPushDataGnomePresenter(receivedData: arrayGnomes)
    }
    

}
