//
//  GnomesDetailView.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//  
//

import Foundation
import UIKit
import SDWebImage

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
    
    func showGnomeData(data: GnomesBasicData) {
        lbGnomeName.text = data.name
        imgGnome.sd_setImage(with: URL(string:data.thumbnail!), completed: nil)
    }
    
}
