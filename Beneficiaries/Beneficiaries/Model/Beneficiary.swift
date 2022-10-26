//
//  Beneficiary.swift
//  Beneficiaries
//
//  Created by admin on 10/25/22.
//

import Foundation

struct Beneficiary: Codable {
    let firstName: String
    let lastName: String
    let middleName: String
    let beneType: String
    let designationCode: DesignationCode
    let ssn: String
    let phoneNumber: String
    let dateOfBirth: String
    let address: BeneficiaryAddress
    
    private enum CodingKeys : String, CodingKey {
        case firstName
        case lastName
        case middleName
        case beneType
        case designationCode
        case ssn = "socialSecurityNumber"
        case phoneNumber
        case dateOfBirth
        case address = "beneficiaryAddress"
    }
}

struct BeneficiaryAddress: Codable {
    let firstLine: String
    let secondLine: String?
    let city: String
    let zipCode: String
    let stateCode: String
    let country: String
    
    private enum CodingKeys : String, CodingKey {
        case firstLine = "firstLineMailing"
        case secondLine = "scndLineMailing"
        case city
        case zipCode
        case stateCode
        case country
    }
    
    func fullAddressString() -> String {
        return "\(firstLine) \(secondLine ?? "")\n\(city),\(stateCode), \(zipCode)\n\(country)"
    }
}

enum DesignationCode: String, Codable {
    case P
    case C
    case unknown
    
    init(from decoder: Decoder) throws {
        // 1
        let container = try decoder.singleValueContainer()
        // 2
        let rawString = try container.decode(String.self)
        
        // 3
        if let designationCode = DesignationCode(rawValue: rawString) {
            self = designationCode
        } else {
            // 4
            self = .unknown
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot initialize from invalid String value \(rawString)")
        }
    }
    
    func description() -> String {
        switch self {
        case .P:
            return "Primary"
        case .C:
            return "Contingent"
        case .unknown:
            return "Unknown"
        }
    }
}

