//
//  ViewControllerPersonaje.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 9/27/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit

class ViewControllerPersonaje: UIViewController
{
    var personajeSelect : Personajes?
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblProfesion: UILabel!
    @IBOutlet weak var lblFoto: UIImageView!
    @IBOutlet weak var lblDetails: UILabel!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        lblName.text = personajeSelect?.nombre
        lblProfesion.text = personajeSelect?.profesion
        lblFoto.image = UIImage(named: personajeSelect!.imagen!)
        lblDetails.text = personajeSelect?.detalles
        
        title = "Personaje"
        
        // Do any additional setup after loading the view.
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
