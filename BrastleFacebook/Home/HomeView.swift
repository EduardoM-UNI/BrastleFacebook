//
//  HomeView.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 1/6/21.
//  
//

import Foundation
import UIKit
import SDWebImage

class HomeView: UIViewController {
  

    @IBOutlet weak var gnomesTable: UITableView!
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayViewGnomes = [Constanst.gnomesCleanData]()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {

    // TODO: implement view output methods
    
    func presenterPushDataView(receivedData: [Constanst.gnomesCleanData]) {
        
        arrayViewGnomes = receivedData
        gnomesTable.reloadData()
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayViewGnomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gnomesCell", for: indexPath) as! GnomesTableViewCell
        
        addShadow(container: cell.viewBackground)
        cell.lbNameGnome.text = arrayViewGnomes[indexPath.row].name
        cell.imgGnome.sd_setImage(with: URL(string:arrayViewGnomes[indexPath.row].thumbnail!), completed: nil)
        
//        profileImage.sd_setImage(with: URL(string: gnome.thumbnailURL), completed: nil)
        
        return cell
    }
    
    func addShadow(container : UIView){
       
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        container.layer.shadowOpacity = 0.5
        container.layer.shadowRadius = 10.0
        container.layer.masksToBounds = false
        
    }
    
}
