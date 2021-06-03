//
//  GnomesDetailProtocols.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation
import UIKit

protocol GnomesDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: GnomesDetailPresenterProtocol? { get set }
    func showGnomeData(data: Constanst.gnomesCleanData)
}

protocol GnomesDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGnomesDetailModule(with data: Constanst.gnomesCleanData) -> UIViewController
}

protocol GnomesDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: GnomesDetailViewProtocol? { get set }
    var interactor: GnomesDetailInteractorInputProtocol? { get set }
    var wireFrame: GnomesDetailWireFrameProtocol? { get set }
    var gnomesDataReceived: Constanst.gnomesCleanData? {get set}
    func viewDidLoad()
}

protocol GnomesDetailInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol GnomesDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GnomesDetailInteractorOutputProtocol? { get set }
    var localDatamanager: GnomesDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: GnomesDetailRemoteDataManagerInputProtocol? { get set }
}

protocol GnomesDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol GnomesDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: GnomesDetailRemoteDataManagerOutputProtocol? { get set }
}

protocol GnomesDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol GnomesDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
