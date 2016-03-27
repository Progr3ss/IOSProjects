//
//  EntryList.swift
//  essence
//
//  Created by martin chibwe on 3/25/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData

class EntryList: UITableViewController , NSFetchedResultsControllerDelegate {

    var reflection = [NSManagedObject]()
    var coreDataStack: CoreDataStack!
    var fetchedResultsController: NSFetchedResultsController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchResultController()
    fetchedResultsController.delegate = self
        //3
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }
        
        
    }
    
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        //1
//        let appDelegate =
//            UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let fetchRequest = NSFetchRequest(entityName: "Reflection")
//        let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//
//        
//        //3
//        do {
//            let results =
//                try managedContext.executeFetchRequest(fetchRequest)
//            reflection = results as! [NSManagedObject]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let sectionInfo =  fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        var entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Reflection
        
        cell.textLabel?.text = entry!.body
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionInfo =  fetchedResultsController.sections![section]
        return sectionInfo.name
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Reflection
        let  appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
//        managedContext.deletedObject(entry)
        managedContext.deleteObject(entry!)
        do{
            try managedContext.save()
        }catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }//        fetchedResultsController.d
//        manged
//        entry.dele
        
    }
    
    
    


    
    //MARK: NSFetch
    
    func entryListFetchequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Reflection")
        let date =
            NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [date]
        return fetchRequest
    }
    
    func fetchResultController() -> NSFetchedResultsController{
        if fetchedResultsController != nil{
            return fetchedResultsController
            
        }
//        let fetchRequest = NSFetchRequest(entityName: "Reflection")
        //1
        let  appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
    fetchedResultsController =
            NSFetchedResultsController(fetchRequest: entryListFetchequest(),
                                       managedObjectContext:managedContext,
                                       sectionNameKeyPath: "sectionName",
                                       cacheName: nil)
        
        
        
        return fetchedResultsController
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        
        tableView.beginUpdates()
    }
//    func controllerDidChangeContent(controller:
//        NSFetchedResultsController) {
////        tableView.reloadData()
//    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case .Insert:
            print("*** NSFetchedResultsChangeInsert (object)")
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
            
        case .Delete:
            print("*** NSFetchedResultsChangeDelete (object)")
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            
        case .Update:
            tableView.reloadRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        case .Move:
            print("*** NSFetchedResultsChangeMove (object)")
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case .Insert:
            print("*** NSFetchedResultsChangeInsert (section)")
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
            
        case .Delete:
            print("*** NSFetchedResultsChangeDelete (section)")
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
            
        case .Update:
            print("*** NSFetchedResultsChangeUpdate (section)")
            
        case .Move:
            print("*** NSFetchedResultsChangeMove (section)")
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        print("*** controllerDidChangeContent")
        tableView.endUpdates()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "edit" {
//            let destinationController = segue.destinationViewController as? NewEntry
//            UITableViewCell *cell = sender
//          var cell = sender?.superview.superview as
            var cell = sender as? UITableViewCell
            var indexPath = tableView.indexPathForCell(cell!)
            var navigationController = segue.destinationViewController as? UINavigationController
            var entryViewCon = navigationController?.topViewController as? NewEntry
            entryViewCon?.entry = self.fetchedResultsController.objectAtIndexPath(indexPath!) as! Reflection
//            entryViewCon.entry
        }
    
    }

}





