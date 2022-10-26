//
//  BeneficiaryDetailView.swift
//  Beneficiaries
//
//  Created by admin on 10/26/22.
//

import UIKit

class BeneficiaryDetailView: UIView {
    
    var model: Beneficiary? {
        didSet {
            self.ssnLabel.text = "SSN: \(model?.ssn ?? "")"
            self.dobLabel.text = "Date of Birth: \(model?.dateOfBirth ?? "")"
            self.phoneLabel.text = "Phone: \(model?.phoneNumber ?? "")"
            self.addressLabel.text = "Address:\n\(model?.address.fullAddressString() ?? "")"
        }
    }

    let ssnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dobLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ssnLabel, dobLabel, phoneLabel, addressLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
        ])
    
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
