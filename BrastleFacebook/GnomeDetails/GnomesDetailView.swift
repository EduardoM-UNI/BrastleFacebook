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

    @IBOutlet weak var lbGnomeName: UILabel!
    @IBOutlet weak var imgGnome: UIImageView!
    // MARK: Properties
    var presenter: GnomesDetailPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension GnomesDetailView: GnomesDetailViewProtocol {
    // TODO: implement view output methods
    
    func showGnomeData(data: Constanst.gnomesCleanData) {
        lbGnomeName.text = data.name
    }
    
}
