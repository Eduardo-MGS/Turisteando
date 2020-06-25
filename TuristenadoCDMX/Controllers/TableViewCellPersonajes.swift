//
//  TableViewCellPersonajes.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 9/27/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit

class TableViewCellPersonajes: UITableViewCell
{
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblDetalles: UILabel!
    @IBOutlet weak var imPersonaje: UIImageView!
    
    
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
