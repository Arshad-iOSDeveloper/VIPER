//
//  UsersTVCell.swift
//  ViperDemo1
//
//  Created by Apple on 01/09/22.
//

import UIKit

class UsersTVCell: UITableViewCell {
    
    //MARK: Outlet
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
