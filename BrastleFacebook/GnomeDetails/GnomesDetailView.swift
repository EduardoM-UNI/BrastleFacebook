//
//  GnomesDetailView.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation
import UIKit

class GnomesDetailView: UIViewController {

    // MARK: Properties
    var presenter: GnomesDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension GnomesDetailView: GnomesDetailViewProtocol {
    // TODO: implement view output methods
}
