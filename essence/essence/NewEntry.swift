//
//  NewEntry.swift
//  essence
//
//  Created by martin chibwe on 3/24/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData
class NewEntry: UIViewController {

    var entry : Reflection!
    @IBOutlet weak var textField: UITextField!
    var reflection = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.entry != nil{
            self.textField.text = self.entry.body
        }

        // Do any additional setup after loading the view.
    }



}

//MARK: -IBAction
extension NewEntry {
    
    
    
    
    @IBAction func cancelWasPressed(sender: AnyObject) {
        self.dismissSelf()
    }
    @IBAction func doneWasPressed(sender: AnyObject) {
        if self.entry != nil {
            self.updateReflection()
        }else{
            insertDiaryEntry()
        }
        self.dismissSelf()
    }
}
//MARK: -Functions
extension NewEntry{
    
    func updateReflection(){
        self.entry.body = self.textField.text
        
        let  appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //        managedContext.deletedObject(entry)
//        managedContext.deleteObject(entry!)
        do{
            try managedContext.save()
        }catch let error as NSError {
            print("Error: \(error.localizedDescription)")
        }//        fetchedResultsController.d

        
    }
    
    func dismissSelf(){
//        presentingViewController.an
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func insertDiaryEntry(){
        
        //1 
        let  appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity = NSEntityDescription.entityForName("Reflection",inManagedObjectContext:managedContext)
        
        let bodyReflection = NSManagedObject(entity: entity!,insertIntoManagedObjectContext:managedContext)
        
        //3
        bodyReflection.setValue(self.textField.text, forKey: "body")
//        entity.body = self.textField.text
        
        //4
        do{
            try managedContext.save()
            //5
            reflection.append(bodyReflection)
            
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
}


