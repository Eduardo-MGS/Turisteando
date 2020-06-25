//
//  TableViewControllerEventos.swift
//  TuristenadoCDMX
//
//  Created by Laboratorio UNAM-Apple 03 on 11/22/19.
//  Copyright © 2019 Laboratorio UNAM-Apple 03. All rights reserved.
//

import UIKit
import CoreData

class TableViewControllerEventos: UITableViewController
//{
//    var EventoSeleccionado: Eventos?
//    var eventos : [Eventos] = [Eventos]()
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//
//        title = "Eventos"
//        tableView.estimatedRowHeight = tableView.rowHeight
//        tableView.rowHeight = UITableView.automaticDimension
//
//        recuperarEventos()
//        print("eventos table view", eventos.debugDescription)
//        tableView.backgroundColor = .blue
//        tableView.reloadData()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int
//    {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return eventos.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
//    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellEve", for: indexPath) as! TableViewCellEventos
//
//        let evento = eventos[indexPath.row]
//
//        if evento.foto != nil
//        {
//            cell.imgFoto.image = UIImage(named: evento.foto!)
//        }
//
//        cell.lblNombreEvento.text = evento.nombre
//        cell.lblBreveEvento.text = evento.breve
//        cell.backgroundColor = .red
//
//        return cell
//    }
//
//
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 140
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        let viewEventoSeleccionado = segue.destination as! ViewControllerEvento
//        viewEventoSeleccionado.eventoSelect = eventos[tableView.indexPathForSelectedRow!.row]
//    }
//
//    func getContextEventos() -> NSManagedObjectContext
//    {
//        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    }
//
//
//    func recuperarEventos()
//    {
//        let context = getContextEventos()
//        let fetchRequest : NSFetchRequest<Eventos> = Eventos.fetchRequest()
//        do
//        {
//            print("fetc", fetchRequest.debugDescription)
//            self.eventos = try context.fetch(fetchRequest)
//            print("eventos recuperados", eventos.debugDescription)
//        }
//        catch let error as NSError
//        {
//            print("no se puede recuperar \(error), \(error.userInfo)")
//        }
//    }
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

{
   var EventoSeleccionado: Eventos?
   var eventos : [Eventos] = [Eventos]()
   
   override func viewDidLoad()
   {
       super.viewDidLoad()
       
       title = "Eventos"
       tableView.estimatedRowHeight = tableView.rowHeight
       tableView.rowHeight = UITableView.automaticDimension
       
       recuperarEvento()
    tableView.reloadData()
       
       // Uncomment the following line to preserve selection between presentations
       // self.clearsSelectionOnViewWillAppear = false
       
       // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
       // self.navigationItem.rightBarButtonItem = self.editButtonItem
   }
   
   // MARK: - Table view data source
   
   override func numberOfSections(in tableView: UITableView) -> Int
   {
       // #warning Incomplete implementation, return the number of sections
       return 1
   }
   
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       // #warning Incomplete implementation, return the number of rows
       return eventos.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
   {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellEve", for: indexPath) as! TableViewCellEventos
       
       // Configure the cell...
       let evento = eventos[indexPath.row]
       
       /*if personaje.imagen != nil
       {
           cell.imPersonaje.image = UIImage(named: personaje.imagen!)
           
       }*/
       
    cell.lblNombreEvento.text = evento.nombre
    cell.backgroundColor = .blue
    cell.backgroundView?.backgroundColor = .yellow
       /*cell.lblNombre.text = eventos.nombre
       cell.lblDetalles.text = eventos.breve*/
       
       return cell
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?)
   {
       let viewEventoSeleccionado = segue.destination as! ViewControllerEvento
    viewEventoSeleccionado.eventoSelect = eventos[tableView.indexPathForSelectedRow!.row]
   }
   
   func getContextEvento() -> NSManagedObjectContext
   {
       return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   }
   
   
   func recuperarEvento()
   {
        print("Entrado a recuperar",eventos.debugDescription)
       let context = getContextEvento()
       let fetchRequest : NSFetchRequest<Eventos> = Eventos.fetchRequest()
       do
       {
           eventos = try context.fetch(fetchRequest)
        print(eventos.debugDescription)
       }
       catch let error as NSError
       {
           print("no se puede recuperar \(error), \(error.userInfo)")
       }
   }


     /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //        let viewLaQueSigue = segue.destination as! ViewControllerJob
   //
   //        viewLaQueSigue.job = jobs[((tableView.indexPathForSelectedRow?.item)!)]
           
           if segue.identifier == "seguePersonajeDetail" {
               if (tableView.indexPathForSelectedRow) != nil {
                   let viewPersonajeSeleccionado = segue.destination as! ViewControllerPersonaje
                   viewPersonajeSeleccionado.persoanaje = per
               }
           }
       }
*/

   /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
       // Return false if you do not want the specified item to be editable.
       return true
   }
   */

   /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle == .delete {
           // Delete the row from the data source
           tableView.deleteRows(at: [indexPath], with: .fade)
       } else if editingStyle == .insert {
           // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
       }
   }
   */

   /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

   }
   */

   /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
       // Return false if you do not want the item to be re-orderable.
       return true
   }
   */

   /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // Get the new view controller using segue.destination.
       // Pass the selected object to the new view controller.
   }
   */

}
