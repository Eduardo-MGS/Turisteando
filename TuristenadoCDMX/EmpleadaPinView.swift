//
//  EmpleadaPinView.swift
//  ConfiaHogar
//
//  Created by Sergio Morales on 9/3/19.
//  Copyright © 2019 Gabriel Guevara Gutierrez. All rights reserved.
//

import MapKit

class EmpleadaPinView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let _myAnnotation = newValue as? EmpleadaPin else {return}
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            let mapButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            
            mapButton.setBackgroundImage(UIImage(named: "empleada"), for: UIControl.State())
            
            if _myAnnotation.tipo != "Yo" {
                rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            
            if let imageName = _myAnnotation.imageName {
                let imageResize = EmpleadaPinView.resizeImage(image: UIImage(named: imageName)!, newWidth: 30)
                image = imageResize
            } else {
                image = nil
            }
        }
    }
    
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage! }
}
