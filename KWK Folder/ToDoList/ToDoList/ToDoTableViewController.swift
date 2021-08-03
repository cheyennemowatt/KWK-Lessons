//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Cheyenne Mowatt on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    var listOfToDo : [ToDoCD] = []
    
//    func createToDo() -> [ToDoClass] {
 //       let swiftToDo = ToDoClass()
//        swiftToDo.description = "Learn Swift"
  //      swiftToDo.important = true
        
 //       let dogToDo = ToDoClass()
 //       dogToDo.description = "Walk the Dog"
        
  //      return [swiftToDo, dogToDo]
  //  }
    func getToDos() {
         if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

         if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
              listOfToDo = dataFromCoreData
              tableView.reloadData()
              }
         }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let accessToCoreData = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {

        if let dataFromCoreData = try? accessToCoreData.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
             listOfToDo = dataFromCoreData
             tableView.reloadData()
             }
        }
    }


    // MARK: - Table view data source

  

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfToDo.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let eachToDo = listOfToDo[indexPath.row]
      
        if let thereIsDescription = eachToDo.descriptionInCD {

        if eachToDo.importantInCD {
            cell.textLabel?.text = "❗️" + thereIsDescription
          } else {
            cell.textLabel?.text = eachToDo.descriptionInCD
          }
        }

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
   
    }
    */

    /*
    // Override to support editing the table view.
    
    */
    
    override func viewWillAppear(_ animated: Bool) {
         getToDos()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this gives us a single ToDo
        let eachToDo = listOfToDo[indexPath.row]

        performSegue(withIdentifier: "moveToCompletedToDoVC", sender: eachToDo)
   }


    /*
    // Override to support rearranging the table view.
   
    */

    /*
    // Override to support conditional rearranging of the table view.    */

 
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextAddToDoVC = segue.destination as? AddToDoViewController {
                  nextAddToDoVC.previousToDoTVC = self
    }
        if let nextCompletedToDoVC = segue.destination as? CompletedToDoViewController {
            if let choosenToDo = sender as? ToDoCD{
                      nextCompletedToDoVC.selectedToDo = choosenToDo
                      nextCompletedToDoVC.previousToDoTVC = self
                 }
            
}
    
    }


}
