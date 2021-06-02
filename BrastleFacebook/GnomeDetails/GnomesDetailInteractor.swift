//
//  GnomesDetailInteractor.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation

class GnomesDetailInteractor: GnomesDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: GnomesDetailInteractorOutputProtocol?
    var localDatamanager: GnomesDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: GnomesDetailRemoteDataManagerInputProtocol?

}

extension GnomesDetailInteractor: GnomesDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
