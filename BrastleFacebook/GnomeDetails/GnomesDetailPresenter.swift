//
//  GnomesDetailPresenter.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation

class GnomesDetailPresenter  {
    
    // MARK: Properties
    weak var view: GnomesDetailViewProtocol?
    var interactor: GnomesDetailInteractorInputProtocol?
    var wireFrame: GnomesDetailWireFrameProtocol?
    var gnomesDataReceived: GnomesBasicData? 
    
}

extension GnomesDetailPresenter: GnomesDetailPresenterProtocol {

    // TODO: implement presenter methods
    func viewDidLoad() {
      
        if let gnomeDataRecived = gnomesDataReceived{
            view?.showGnomeData(data: gnomeDataRecived)
        }

    }
}

extension GnomesDetailPresenter: GnomesDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
