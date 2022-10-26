//
//  BeneficiaryDetailViewModel.swift
//  Beneficiaries
//
//  Created by admin on 10/26/22.
//

import Foundation

class BeneficiaryDetailViewModel {
    // MARK: - Initialization
    init(model: Beneficiary, title: String) {
        self.beneficiary = model
        self.title = title
        
    }
    var beneficiary: Beneficiary
    var title: String
}
