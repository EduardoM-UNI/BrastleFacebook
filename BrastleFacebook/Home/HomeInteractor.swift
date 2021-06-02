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

    func interactorGetData() {
       
        remoteDatamanager?.externalGetPoblationGnomes()
    }
    
}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
