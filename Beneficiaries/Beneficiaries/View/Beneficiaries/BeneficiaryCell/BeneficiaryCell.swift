//
//  BeneficiaryCell.swift
//  Beneficiaries
//
//  Created by Khateeb Hussain on 10/26/22.
//

import UIKit

class BeneficiaryCell: UITableViewCell {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var designationCode: UILabel!
    
    var model: Beneficiary? {
        didSet {
            self.firstName.text = model?.firstName
            self.lastName.text = model?.lastName
            self.designationCode.text = model?.designationCode.description()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
