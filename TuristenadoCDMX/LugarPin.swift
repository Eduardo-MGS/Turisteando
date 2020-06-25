//
//  LugarPin.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 10/29/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import Foundation
import MapKit

class LugarPin: NSObject, MKAnnotation {
     
    var title: String?
    var subtitle: String?
    var descripcion: String?
    var coordinate: CLLocationCoordinate2D
    var latitud: Double?
    var longitud: Double?
    var foto: UIImage?
    var tipo: String?
    
    init(title: String, subtitle: String, descripcion: String, latitud: Double, longitud: Double, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        self.descripcion = descripcion
        self.latitud = latitud
        self.longitud = longitud
        
        super.init()
    }
    
    var imageName: String?
    {
        if tipo == "CAtencion"
        {
            return "Centro"
        }
        return "Marcador"
    }
}
