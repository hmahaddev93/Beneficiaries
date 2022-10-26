//
//  BeneficiaryService.swift
//  Beneficiaries
//
//  Created by admin on 10/26/22.
//

import Foundation

protocol BeneficiaryService_Protocol {
    func loadBeneficiariesFromFile(fileName: String, completion: @escaping (Result<[Beneficiary], Error>) -> Void)
}

class BeneficiaryService: BeneficiaryService_Protocol {
    private let fileManager: AppFileManager
    private let jsonDecoder: JSONDecoder
    
    init(fileManager: AppFileManager = AppFileManager.shared) {
        self.fileManager = fileManager
        self.jsonDecoder = JSONDecoder()
    }
    
    func loadBeneficiariesFromFile(fileName: String, completion: @escaping (Result<[Beneficiary], Error>) -> Void) {
        if let jsonData = fileManager.readLocalFile(forName: fileName) {
            do {
                let result = try self.jsonDecoder.decode([Beneficiary].self, from: jsonData)
                print(result)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        completion(.failure(AppFileManagerError.invalidData))
    }
}
