//
//  AppDelegate.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 9/26/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        if (UserDefaults.standard.value(forKey: "datosPersonaje")) as? Bool == nil
        {
            
            print("entrando a validación primera vez")
            class Personaje
            {
                var id: Int
                var nombre: String
                var profesion: String
                var detalles: String
                var imagen: String
                var breve: String
                
                init(id: Int, nombre: String, profesion: String, detalles: String, imagen: String, breve: String)
                {
                    self.id = id
                    self.nombre = nombre
                    self.profesion = profesion
                    self.detalles = detalles
                    self.imagen = imagen
                    self.breve = breve
                }
                
                static var personajes : [Personaje] =
                    [
                        
                        Personaje (id: 01, nombre: "Diego Rivera", profesion: "Muralista", detalles: "Fue un destacado muralista mexicano de ideología comunista, famoso por plasmar obras de alto contenido social en edificios públicos. Casado con Frida Kahlo, fue creador de diversos murales en distintos puntos del ahora llamado Centro Histórico de la Ciudad de México, así como en la Escuela Nacional de Agricultura de Chapingo,4​ y en otras ciudades mexicanas, norteamericanas y sudamericanas.", imagen: "DiegoRiveraB", breve: "Diego Rivera ​ fue un destacado muralista mexicano de ideología comunista, famoso por plasmar obras de alto contenido social en edificios públicos. "),
                        Personaje (id: 02, nombre: "Frida Khalo", profesion: "Pintora", detalles: "Magdalena Carmen Frida Kahlo Calderón fue una pintora mexicana.​ Su vida estuvo marcada por el infortunio de contraer poliomielitis y después por un grave accidente en su juventud que la mantuvo postrada en cama durante largos periodos, llegando a someterse hasta a 32 operaciones quirúrgicas.​", imagen: "FridaKahloB", breve: "Aunque se movió en el ambiente de los grandes muralistas mexicanos de su tiempo y compartió sus ideales, Frida Kahlo creó una pintura absolutamente personal, ingenua y profundamente metafórica al mismo tiempo, derivada de su exaltada sensibilidad y de varios acontecimientos que marcaron su vida."),
                        Personaje (id: 03, nombre: "Benito Juarez", profesion: "Político", detalles: "Benito Pablo Juárez García fue un abogado y político mexicano, de origen indígena, presidente de México en varias ocasiones, del 21 de enero de 1858 al 18 de julio de 1872.​", imagen: "Benito Juarez", breve: "Benito Pablo Juárez García fue un abogado y político mexicano, de origen indígena, presidente de México en varias ocasiones, del 21 de enero de 1858 al 18 de julio de 1872.​"),
                ]
            }
            for personaje in Personaje.personajes
            {
                print("guardando personajes")
                saveEntityPersonaje(id: personaje.id, nombre: personaje.nombre, profesion: personaje.profesion, detalles: personaje.detalles, imagen: personaje.imagen, breve: personaje.breve)
            }
            UserDefaults.standard.set(true, forKey: "datosPersonaje")
            getContext().reset()
            
            //------------------------------------
            
            class Evento
            {
                var id: Int
                var nombre: String
                var fecha_inicio: String
                var fecha_fin: String
                var personajes: String
                var breve: String
                var descripcion: String
                var foto: String
                
                init(id: Int, nombre: String, fecha_inicio: String, fecha_fin: String, personajes: String, breve: String, descripcion: String, foto: String)
                {
                    self.id = id
                    self.nombre = nombre
                    self.fecha_inicio = fecha_inicio
                    self.fecha_fin = fecha_fin
                    self.personajes = personajes
                    self.breve = breve
                    self.descripcion = descripcion
                    self.foto = foto
                }
                
                
                static var eventos : [Evento] =
                    [
                        Evento (id: 01, nombre: "Revolución Mexicana", fecha_inicio: "20 de Noviembre de 1910", fecha_fin: "20 de Noviembre de 1917", personajes: "Francisco I. Madero, Panchi Villa, Emiliano Zapata", breve: "Es un evento donde se buscaba la transformación política y social de nuestro país", descripcion: "Descripción 01", foto: "ImgIndependencia"),
                        Evento (id: 02, nombre: "Independencia Mexicana", fecha_inicio: "16 de Septembre 1810", fecha_fin: "27 de Septiembre de 1821", personajes: "Miguel Hidalgo y Costilla, Ignacio Allende, José Maria Morelos", breve: "Es un evento donde se buscaba la independencia de la corona Española por parte de México", descripcion: "Descripción 02", foto: "ImgRevolucion")
                ]
            }
            for evento in Evento.eventos
            {
                
                print("entrando iteración eventos")
                print("eventos", evento.descripcion)
                saveEntityEvento(id: evento.id, nombre: evento.nombre, fecha_inicio: evento.fecha_inicio, fecha_fin: evento.fecha_fin, personajes: evento.personajes, breve: evento.breve, descripcion: evento.descripcion, foto: evento.foto)
                
                
                
            }
            UserDefaults.standard.set(true, forKey: "datosEvento")
            
            
        }
        //
        //        if (UserDefaults.standard.value(forKey: "datosEvento")) as? Bool == nil
        //        {
        //
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
    {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
    {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "TuristenadoCDMX")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext()
    {
        let context = persistentContainer.viewContext
        if context.hasChanges
        {
            do
            {
                try context.save()
            }
            catch
            {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getContext() -> NSManagedObjectContext
    {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func saveEntityEvento(id : Int, nombre : String, fecha_inicio : String, fecha_fin : String,  personajes: String, breve: String, descripcion: String, foto: String)
    {
        let contextEvento = getContext()
        
        let entityEventos = NSEntityDescription.entity(forEntityName: "Evento", in: contextEvento)!
        let EventoManaged = NSManagedObject(entity: entityEventos, insertInto: contextEvento) as! Eventos
        
        EventoManaged.id = Int32(id)
        EventoManaged.nombre = nombre
        EventoManaged.fecha_inicio = fecha_inicio
        EventoManaged.fecha_fin = fecha_fin
        EventoManaged.personaje = personajes
        EventoManaged.breve = breve
        EventoManaged.descripcion = descripcion
        EventoManaged.foto = foto
        
        print("evento manage", EventoManaged.debugDescription)
        
        do
        {
            print("Guardando evento", contextEvento.debugDescription)
            try contextEvento.save()
        }
        catch let error as NSError
        {
            print("No se pudo salvar: \(error), \(error.userInfo)")
        }
    }
    
    func saveEntityPersonaje(id : Int, nombre : String, profesion : String, detalles : String, imagen : String, breve: String)
    {
        let contextPersonaje = getContext()
        
        let entityPersonaje = NSEntityDescription.entity(forEntityName: "Personajes", in: contextPersonaje)!
        let PersonajeManaged = NSManagedObject(entity: entityPersonaje, insertInto: contextPersonaje) as! Personajes
        
        PersonajeManaged.id = Int32(id)
        PersonajeManaged.nombre = nombre
        PersonajeManaged.profesion = profesion
        PersonajeManaged.detalles = detalles
        PersonajeManaged.imagen = imagen
        PersonajeManaged.breve = breve
        
        do
        {
            try contextPersonaje.save()
        }
        catch let error as NSError
        {
            print("No se pudo salvar: \(error), \(error.userInfo)")
        }
    }
}

