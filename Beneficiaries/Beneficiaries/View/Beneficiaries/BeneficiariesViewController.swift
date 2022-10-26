//
//  ViewController.swift
//  Beneficiaries
//
//  Created by Khateeb Hussain on 10/25/22.
//

import UIKit

class BeneficiariesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let viewModel = BeneficiariesViewModel(title: "Beneficiaries")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "BeneficiaryCell", bundle: nil), forCellReuseIdentifier: "BeneficiaryCell")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        loadData()
    }
    
    private func loadData() {
        self.title = viewModel.title
        viewModel.fetchBeneficiaries { [unowned self] _ in
            self.tableView.reloadData()
        }
    }
}

// MARK: TableView Methods
extension BeneficiariesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beneficiaries.count
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let beneCell = tableView.dequeueReusableCell(withIdentifier: "BeneficiaryCell", for: indexPath) as? BeneficiaryCell {
            let bene = viewModel.beneficiaries[indexPath.row]
            beneCell.model = bene
            return beneCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .fade)
        let beneSelected = viewModel.beneficiaries[indexPath.row]
        let detailVC = BeneficiaryDetailViewController(viewModel: BeneficiaryDetailViewModel(model: beneSelected, title: "\(beneSelected.firstName) \(beneSelected.lastName)"))
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
