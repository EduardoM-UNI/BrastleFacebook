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

    @IBOutlet weak var lbProfessions: UILabel!
    @IBOutlet weak var lbGnomeHair: UILabel!
    @IBOutlet weak var lbGnomeHeight: UILabel!
    @IBOutlet weak var lbGnomeWeight: UILabel!
    @IBOutlet weak var lbGnomeAge: UILabel!
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
       
        lbGnomeHair.text = data.hair_color
        lbGnomeHeight.text = "\(data.height ?? 0)"
        lbGnomeWeight.text = "\(data.weight ?? 0)"
        lbGnomeAge.text = "\(data.age ?? 0)"
        lbGnomeName.text = data.name
        imgGnome.sd_setImage(with: URL(string:data.thumbnail!), completed: nil)
        lbProfessions.text = data.professions.joined(separator: ", ")
       
    }
    
}
