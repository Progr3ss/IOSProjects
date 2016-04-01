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
    private var entryCell = NewEntryCell()
    var fetchedResultsController: NSFetchedResultsController!
    let dataStack = CoreDataStack.sharedInstance
    
    
    
    
    
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! NewEntryCell
        
        let entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Reflection
        
        cell.configureCellForEntry(entry!)

        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let sectionInfo =  fetchedResultsController.sections![section]
        return sectionInfo.name
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let entry = self.fetchedResultsController().objectAtIndexPath(indexPath) as! Reflection
        let entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as! Reflection

        let height = entryCell.getHeightForEntry(entry)
        
        return height
    }
    
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		
        let entry = self.fetchedResultsController.objectAtIndexPath(indexPath) as? Reflection
		
		dataStack.managedObjectContext.deleteObject(entry!)
		dataStack.saveContext()

        
    }
    
    
    


    
    //MARK: NSFetch
    
    func entryListFetchequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Reflection")
        let date =
            NSSortDescriptor(key: "date", ascending: false)
        fetchRequest.sortDescriptors = [date]
        return fetchRequest
    }
    
    func fetchResultController() -> NSFetchedResultsController{
        if fetchedResultsController != nil{
            return fetchedResultsController
            
        }

		let fetchRequest:NSFetchRequest = self.entryListFetchequest()

		
		fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataStack.managedObjectContext, sectionNameKeyPath: "sectionName", cacheName: nil)
        
        
        return fetchedResultsController
    }
    
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        
        tableView.beginUpdates()
    }

    
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

            let cell = sender as? UITableViewCell
            let indexPath = tableView.indexPathForCell(cell!)
            let navigationController = segue.destinationViewController as? UINavigationController
            let entryViewCon = navigationController?.topViewController as? NewEntry
            entryViewCon?.entry = self.fetchedResultsController.objectAtIndexPath(indexPath!) as! Reflection
//            entryViewCon.entry
        }
    
    }

}





