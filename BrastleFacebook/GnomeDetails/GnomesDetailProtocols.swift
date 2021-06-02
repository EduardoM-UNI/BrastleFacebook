//
//  GnomesDetailProtocols.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation
import UIKit

protocol GnomesDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: GnomesDetailPresenterProtocol? { get set }
}

protocol GnomesDetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createGnomesDetailModule() -> UIViewController
}

protocol GnomesDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: GnomesDetailViewProtocol? { get set }
    var interactor: GnomesDetailInteractorInputProtocol? { get set }
    var wireFrame: GnomesDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol GnomesDetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol GnomesDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: GnomesDetailInteractorOutputProtocol? { get set }
    var localDatamanager: GnomesDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: GnomesDetailRemoteDataManagerInputProtocol? { get set }
}

protocol GnomesDetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol GnomesDetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: GnomesDetailRemoteDataManagerOutputProtocol? { get set }
}

protocol GnomesDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol GnomesDetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
