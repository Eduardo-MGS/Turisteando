//
//  ViewController.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 9/26/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var latitudRuta = 0.0
var longitudRuta = 0.0

class ViewController: UIViewController, CLLocationManagerDelegate
{
    @IBOutlet weak var mvMapaPrincipal: MKMapView!
    
    let locationManager = CLLocationManager()
    let locationDestination = CLLocationCoordinate2DMake
    let regionRadius: CLLocationDistance = 600
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        locationManager.delegate = self
        mvMapaPrincipal.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.stopUpdatingLocation()
        
        mvMapaPrincipal.showsUserLocation = true
        mvMapaPrincipal.register(LugarPinView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        Lugares()
        
        
    }
        
    @IBAction func centrarUbicacion(_ sender: UIButton)
    {
        centerMapOnLocation(location: locationManager.location!, map: mvMapaPrincipal, radius: regionRadius)
    }
    
    func centerMapOnLocation(location: CLLocation, map: MKMapView, radius: CLLocationDistance)
    {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: radius * 1.0, longitudinalMeters: radius * 1.0)
        
        map.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        if latitudRuta != 0.0 && longitudRuta != 0.0
        {
            let coordenadas = CLLocationCoordinate2D(latitude: latitudRuta, longitude: longitudRuta)
            print(latitudRuta)
            print(longitudRuta)
            mapThis(destinationCord: coordenadas)
        }
        else
        {
            latitudRuta = 0.0
            longitudRuta = 0.0
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        if latitudRuta != 0.0 && longitudRuta != 0.0
        {
            print(latitudRuta)
            print(longitudRuta)
        }
        else
        {
            latitudRuta = 0.0
            longitudRuta = 0.0
        }
    }
    
    func Lugares()
    {
        let _annotationl01 = LugarPin(title: "Zócalo de la Ciudad de México", subtitle: "Este es el corazón de la ciudad de México", descripcion: "Aquí se encuentra el presidente", latitud: 19.432881, longitud: -99.133578, coordinate: CLLocationCoordinate2DMake(19.432881, -99.133578))
        
        _annotationl01.title = "Zócalo de la Ciudad de México"
        _annotationl01.subtitle = "Este es el corazón de la ciudad de México"
        _annotationl01.descripcion = "Aquí se encuentra el presidente"
        _annotationl01.foto = UIImage(named: "MexicoPrehispanico")
        _annotationl01.latitud = 19.432881
        _annotationl01.longitud = -99.133578
        
        mvMapaPrincipal.addAnnotation(_annotationl01)
        
        let _annotationl02 = LugarPin(title: "Templo Mayor", subtitle: "Este fue el principal centro ceremonial del México Prehispánico", descripcion: "Aquí se encuentra el México Antiguo", latitud: 19.434927, longitud: -99.131881, coordinate: CLLocationCoordinate2DMake(19.434927, -99.131881))
        
        _annotationl02.title = "Templo Mayor"
        _annotationl02.subtitle = "Este fue el principal centro ceremonial del México Prehispánico"
        _annotationl02.descripcion = "Aquí se encuentra el México Antiguo"
        _annotationl02.foto = UIImage(named: "MuralismoB")
        _annotationl02.latitud = 19.434927
        _annotationl02.longitud = -99.131881
        
        mvMapaPrincipal.addAnnotation(_annotationl02)
        
        let _annotationl03 = LugarPin(title: "Palacio de Bellas Artes", subtitle: "Este fue el museo dedicado a las artes en México", descripcion: "Aquí se encuentra las artes", latitud: 19.435490, longitud: -99.141202, coordinate: CLLocationCoordinate2DMake(19.435490, -99.141202))
        
        _annotationl03.title = "Palacio de Bellas Artes"
        _annotationl03.subtitle = "Este fue el museo dedicado a las artes en México"
        _annotationl03.descripcion = "Aquí se encuentra las artes"
        _annotationl03.foto = UIImage(named: "RevolucionB")
        
        mvMapaPrincipal.addAnnotation(_annotationl03)
        
        let _annotationl04 = LugarPin(title: "Torre Latinoamericana", subtitle: "Este fue el edificio más altos por los años 90s", descripcion: "Aquí se encuentra las artes", latitud: 19.434104, longitud: -99.140559, coordinate: CLLocationCoordinate2DMake(19.434104, -99.140559))
        
        _annotationl04.title = "Torre Latinoamericana"
        _annotationl04.subtitle = "Este fue el edificio más altos por los años 90s"
        _annotationl04.descripcion = "Aquí se encuentra las artes"
        _annotationl04.foto = UIImage(named: "RevolucionB")
        
        mvMapaPrincipal.addAnnotation(_annotationl04)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .green
        return render
    }
    
    func mapThis(destinationCord : CLLocationCoordinate2D)
    {
        let souceCordinate = (locationManager.location?.coordinate)!
        let soucePlaceMark = MKPlacemark(coordinate: souceCordinate)
        let destPlaceMark = MKPlacemark(coordinate: destinationCord)
        
        
        let sourceItem = MKMapItem(placemark: soucePlaceMark)

        let destItem = MKMapItem(placemark: destPlaceMark)
        let destinationRequest = MKDirections.Request()
        
        destinationRequest.source = sourceItem
        destinationRequest.destination = destItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true
        
        // Un booleano que indica si su aplicación desea múltiples rutas cuando están disponibles.
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate { (response, error) in
            guard let response = response else
            {
                if let error = error
                {
                    print("Algo salió mal")
                }
                return
            }
            
          let route = response.routes[0]
          self.mvMapaPrincipal.addOverlay(route.polyline)
          self.mvMapaPrincipal.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            // Cambia la parte actualmente visible del mapa, lo que le permite especificar espacio adicional alrededor de
        }
    }
}
extension ViewController: MKMapViewDelegate
{
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annView = view.annotation as? LugarPin
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detalleLugar = storyboard.instantiateViewController(withIdentifier: "Detalle") as! ViewControllerLugar
        
        detalleLugar.nombre = (annView?.title!)!
        detalleLugar.detalles = ((annView?.descripcion!)!)
        detalleLugar.evento = annView!.subtitle!
        detalleLugar.foto = LugarPinView.resizeImage(image: annView!.foto!, newWidth: 250)
        detalleLugar.latitud = (annView?.latitud!)!
        detalleLugar.longitud = (annView?.longitud!)!
        
        mvMapaPrincipal.removeOverlays(mvMapaPrincipal.overlays)
        
        self.navigationController?.pushViewController(detalleLugar, animated: true)
    }
}






