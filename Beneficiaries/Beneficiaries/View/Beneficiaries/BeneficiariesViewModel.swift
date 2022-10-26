//
//  BeneficiariesViewModel.swift
//  Beneficiaries
//
//  Created by Khateeb Hussain on 10/25/22.
//

import Foundation

class BeneficiariesViewModel {
    // MARK: - Initialization
    init(model: [Beneficiary]? = nil, title: String) {
        if let inputModel = model {
            beneficiaries = inputModel
        } else {
            beneficiaries = [Beneficiary]()
        }
        self.title = title
        
    }
    var beneficiaries: [Beneficiary]
    var title: String
}

extension BeneficiariesViewModel {
    func fetchBeneficiaries(completion: @escaping (Result<[Beneficiary]?, Error>) -> Void) {
        BeneficiaryService().loadBeneficiariesFromFile(fileName: "Beneficiaries") { [unowned self] result in
            switch result {
            case .success(let beneficiaries):
                self.beneficiaries = beneficiaries
                completion(.success(beneficiaries))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
