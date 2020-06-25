//
//  ViewControllerEvento.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 11/22/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit

class ViewControllerEvento: UIViewController
{
    var eventoSelect : Eventos?
    
    @IBOutlet weak var lblNombreEvento: UILabel!
    @IBOutlet weak var lblFecha_Inicio: UILabel!
    @IBOutlet weak var lblFecha_Fin: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var lblDetalles: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        lblNombreEvento.text = eventoSelect?.nombre
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
