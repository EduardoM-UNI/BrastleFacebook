//
//  GnomesDetailWireFrame.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation
import UIKit

class GnomesDetailWireFrame: GnomesDetailWireFrameProtocol {

static func createGnomesDetailModule(with data: GnomesBasicData) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "gnomesDetailView")
        if let view = viewController as? GnomesDetailView {
            let presenter: GnomesDetailPresenterProtocol & GnomesDetailInteractorOutputProtocol = GnomesDetailPresenter()
            let interactor: GnomesDetailInteractorInputProtocol & GnomesDetailRemoteDataManagerOutputProtocol = GnomesDetailInteractor()
            let localDataManager: GnomesDetailLocalDataManagerInputProtocol = GnomesDetailLocalDataManager()
            let remoteDataManager: GnomesDetailRemoteDataManagerInputProtocol = GnomesDetailRemoteDataManager()
            let wireFrame: GnomesDetailWireFrameProtocol = GnomesDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.gnomesDataReceived = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "GnomesDetailView", bundle: Bundle.main)
    }
    
}
