//
//  ViewControllerLugar.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 11/4/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit

class ViewControllerLugar: UIViewController
{
    @IBOutlet weak var imgLugar: UIImageView!
    @IBOutlet weak var lblNombreLugar: UILabel!
    @IBOutlet weak var lblEvento: UILabel!
    @IBOutlet weak var lblDetallesLugar: UILabel!
    @IBOutlet weak var lblLatitud: UILabel!
    @IBOutlet weak var lblLongitud: UILabel!
    
    var nombre = ""
    var foto: UIImage? = nil
    var evento = ""
    var detalles = ""
    var latitud = 0.0
    var longitud = 0.0
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        lblNombreLugar.text = nombre
        lblEvento.text = evento
        lblDetallesLugar.text = detalles
        imgLugar!.image = foto
        lblLatitud.text = String(latitud)
        lblLongitud.text = String(longitud)
    }
    
    @IBAction func mandarDirreccion(_ sender: UIButton)
    {
        longitudRuta = longitud
        latitudRuta = latitud
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mapa = storyboard.instantiateViewController(withIdentifier: "Inicio") as! ViewController
        
        self.navigationController?.pushViewController(mapa, animated: true)
        // self.per
        
        // self.performSegue(withIdentifier: "mapa", sender: UIButton())
    }
}
