//
//  HomePresenter.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        interactor?.interactorGetData()
        view?.showSpinner()
    }
    
    func showGnomeDetailVIew(with data: GnomesBasicData) {
        
        wireFrame?.presentNewViewDetail(from: view!, withData: data)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorPushDataGnomePresenter(receivedData: [GnomesBasicData]) {
        view?.StopSpinner()
        view?.presenterPushDataView(receivedData: receivedData)
        //Save data from Api to Local db using RealmDB
        interactor?.interactorSaveLocalData(with: receivedData)
    }
    
}
