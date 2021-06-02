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
    
}

extension GnomesDetailPresenter: GnomesDetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension GnomesDetailPresenter: GnomesDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
