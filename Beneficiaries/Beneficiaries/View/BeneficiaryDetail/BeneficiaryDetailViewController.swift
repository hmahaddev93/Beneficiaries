//
//  BeneficiaryDetailViewController.swift
//  Beneficiaries
//
//  Created by admin on 10/26/22.
//

import UIKit

class BeneficiaryDetailViewController: UIViewController {

    private let viewModel: BeneficiaryDetailViewModel
    lazy var detailView = BeneficiaryDetailView()
    
    init(viewModel: BeneficiaryDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    private func updateView() {
        detailView.model = viewModel.beneficiary
        self.title = viewModel.title
    }

}
