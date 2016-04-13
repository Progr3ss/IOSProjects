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
	var reflection : EntityReflection!
	let dataStack = CoreDataStack.sharedInstance
	
	var toDoItems = [ToDoItems]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
//		userIdeaReflection.text = toDoItems[0].text


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension Reflection {
	
	func insertDiaryEntry(){
		
		let entry = NSEntityDescription.insertNewObjectForEntityForName("EntityReflection", inManagedObjectContext: dataStack.managedObjectContext) as! EntityReflection
		
		entry.body = self.bodyReflection.text
		entry.idea = self.userIdeaReflection.text
		dataStack.saveContext()
		
	}
	

	
	@IBAction func doneWasPressed(sender: AnyObject) {
		insertDiaryEntry()
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