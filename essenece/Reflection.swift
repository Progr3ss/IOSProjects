//
//  Reflection.swift
//  essenece
//
//  Created by martin chibwe on 4/9/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData
class Reflection: UIViewController {
	
	

	@IBOutlet weak var bodyReflection: UITextField!
	@IBOutlet weak var userIdeaReflection: UILabel!
	@IBOutlet weak var reflectionView: UITextView!
	
	
	
	var reflection : EntityReflection!
	var entry: EntityReflection!
	let dataStack = CoreDataStack.sharedInstance
	
	var toDoItems = [ToDoItems]()
	
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (toDoItems.count > 0) {
            
            print(toDoItems[0].text)
            userIdeaReflection.text = toDoItems[0].text
        }

		if self.entry != nil{
            
			self.reflectionView.text = self.entry.body //self.entry.body
            userIdeaReflection.text = self.entry.idea
		}
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Reflection {
	
	func insertDiaryEntry(){
		
		let entry = NSEntityDescription.insertNewObjectForEntityForName("EntityReflection", inManagedObjectContext: dataStack.managedObjectContext) as! EntityReflection
		
		entry.body = self.reflectionView.text
		entry.idea = self.userIdeaReflection.text
		
		dataStack.saveContext()
		
	}
	
	func updateDiaryEntry() {
		self.entry.body = self.reflectionView.text
		
		
//		self.entry.body = self.
//		self.entry?.body = self.textView.text
//		self.entry?.imageData = UIImagePNGRepresentation(getPickedImage())!
//		self.entry?.mood = pickedMood!.rawValue
		let dataStack = CoreDataStack.sharedInstance
		
		dataStack.saveContext()
	}
	

	
	@IBAction func doneWasPressed(sender: AnyObject) {
		
		if self.entry != nil{
			self.updateDiaryEntry()
		}else{
			insertDiaryEntry()
		}
		transferToListDismiss()
		
	}
	
	
	@IBAction func cancelWasPressed(sender: AnyObject) {
		
		transferToListDismiss()
	}
	
	func transferToListDismiss(){
		performSegueWithIdentifier("timelineSegue", sender: nil)
//		self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
	}
}