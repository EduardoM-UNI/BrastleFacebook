//
//  HomeView.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController {

    // MARK: Properties
    var presenter: HomePresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}
