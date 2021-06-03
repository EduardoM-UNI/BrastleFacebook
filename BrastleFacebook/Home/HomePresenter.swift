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
    
    func showGnomeDetailVIew(with data: Constanst.gnomesCleanData) {
        
        wireFrame?.presentNewViewDetail(from: view!, withData: data)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorPushDataGnomePresenter(receivedData: [Constanst.gnomesCleanData]) {
        view?.StopSpinner()
        view?.presenterPushDataView(receivedData: receivedData)
    }
    
}
