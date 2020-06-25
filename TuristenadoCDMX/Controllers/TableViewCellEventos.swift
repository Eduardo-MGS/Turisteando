//
//  TableViewCellEventos.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 11/22/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit

class TableViewCellEventos: UITableViewCell
{
    
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblNombreEvento: UILabel!
    @IBOutlet weak var lblBreveEvento: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
