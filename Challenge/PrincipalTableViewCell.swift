//
//  PrincipalTableViewCell.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/9/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation
import UIKit

class PrincipalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelId: UILabel!
    
    class func nib() -> UINib {
        return UINib(nibName: "PrincipalCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
