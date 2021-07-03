//
//  SearchResultsViewController.swift
//  GetGo
//
//  Created by admin on 03/07/2021.
//

import UIKit

class SearchResultsViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    
    var totalCars = [carsInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalCars.append(carsInfo(name: "Mazada 3", model: "SMS1000Z", noOfSeat: "5 Seater"))
        totalCars.append(carsInfo(name: "Honda Shuttle Hybard", model: "SMN7000D", noOfSeat: "7 Seater"))
        totalCars.append(carsInfo(name: "Ssangyong Tivoli", model: "SMS1000Z", noOfSeat: "5 Seater"))
        totalCars.append(carsInfo(name: "Toyata Sientai", model: "SMS1000Z", noOfSeat: "7 Seater"))
        totalCars.append(carsInfo(name: "Mazada 5", model: "SMS1000Z", noOfSeat: "7 Seater"))
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        carsTableView.dataSource = self
        carsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carsTableView.reloadData()
    }
    
    @IBAction func onTouchBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension SearchResultsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.totalCars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = totalCars[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailCell.identifier, for: indexPath) as? CarDetailCell else {
                    return UITableViewCell()
        }
        cell.data = car
        return cell
    }
}

extension SearchResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// tableview cell
class CarDetailCell: UITableViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var lblCarName: UILabel!
    @IBOutlet weak var lblCarModel: UILabel!
    @IBOutlet weak var lblNoOfSeat: UILabel!
    
    var data: carsInfo? {
        didSet {
            if let data = data {
                lblCarName.text = data.name
                lblCarModel.text = data.model
                lblNoOfSeat.text = data.noOfSeat
            }
        }
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
    }
        
    static var identifier : String {
        return String(describing: self)
    }
}

struct carsInfo {
    var name: String
    var model: String
    var noOfSeat: String
    
//    init(name: String, model: String, noOfSeat: String) {
//        self.name = name
//        self.model = model
//        self.noOfSeat = noOfSeat
//    }
}
