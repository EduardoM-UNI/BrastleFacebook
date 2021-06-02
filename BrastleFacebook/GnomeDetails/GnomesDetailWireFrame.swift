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

    class func createGnomesDetailModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "GnomesDetailView")
        if let view = navController.children.first as? GnomesDetailView {
            let presenter: GnomesDetailPresenterProtocol & GnomesDetailInteractorOutputProtocol = GnomesDetailPresenter()
            let interactor: GnomesDetailInteractorInputProtocol & GnomesDetailRemoteDataManagerOutputProtocol = GnomesDetailInteractor()
            let localDataManager: GnomesDetailLocalDataManagerInputProtocol = GnomesDetailLocalDataManager()
            let remoteDataManager: GnomesDetailRemoteDataManagerInputProtocol = GnomesDetailRemoteDataManager()
            let wireFrame: GnomesDetailWireFrameProtocol = GnomesDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "GnomesDetailView", bundle: Bundle.main)
    }
    
}
