//
//  LugarPinView.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 11/4/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import MapKit

class LugarPinView: MKAnnotationView
{
    override var annotation: MKAnnotation?
    {
        willSet
        {
            guard let _myAnnotation = newValue as? LugarPin else {return}
            
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            
            let mapButton = UIButton(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 30, height: 30)))
            mapButton.setBackgroundImage(UIImage(named: "Marcador"), for: UIControl.State())

            if _myAnnotation.tipo != "Yo"
            {
                rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            
            if let imageName = _myAnnotation.imageName
            {
                let imageResize = LugarPinView.resizeImage(image: UIImage(named: imageName)!, newWidth: 30)
                image = imageResize
            }
            else
            {
                image = nil
            }
        }
    }
    static func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage
    {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return newImage!
    }
}
