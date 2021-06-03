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
  

    @IBOutlet weak var spinnerIndicator: UIActivityIndicatorView!
    @IBOutlet weak var gnomesTable: UITableView!
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var arrayViewGnomes = [GnomesBasicData]()
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension HomeView: HomeViewProtocol {
    

    // TODO: implement view output methods
    
    func presenterPushDataView(receivedData: [GnomesBasicData]) {
        
        arrayViewGnomes = receivedData
        DispatchQueue.main.async { [self] in
            gnomesTable.reloadData()
        }
       
    }
    
    func showSpinner() {
        DispatchQueue.main.async {
            self.spinnerIndicator.startAnimating()
        }
        
    }
    
    func StopSpinner() {
        DispatchQueue.main.async {
            self.spinnerIndicator.stopAnimating()
            self.spinnerIndicator.hidesWhenStopped = true
        }
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
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        presenter?.showGnomeDetailVIew(with: GnomesBasicData(
                        name: arrayViewGnomes[indexPath.row].name,
                                        age: arrayViewGnomes[indexPath.row].age,
                                        height: arrayViewGnomes[indexPath.row].height,
                                        weight:arrayViewGnomes[indexPath.row].weight,
                                        hair_color: arrayViewGnomes[indexPath.row].hair_color,thumbnail: arrayViewGnomes[indexPath.row].thumbnail!))
        
        
    }
    
    func addShadow(container : UIView){
       
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        container.layer.shadowOpacity = 0.5
        container.layer.shadowRadius = 10.0
        container.layer.masksToBounds = false
        
    }
    
}
