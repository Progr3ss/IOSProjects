//
//  NewEntry.swift
//  essence
//
//  Created by martin chibwe on 3/24/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit
import CoreData

enum Control:Int16 {
	case Camera
	case Photos
}

class NewEntry: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	var date: NSDate!
	var pickedImage:UIImage?
    var entry : Reflection!
	
    @IBOutlet weak var textField: UITextField!
	
//	@IBOutlet weak var buttonImage: UIImageView!
	@IBOutlet weak var dateLabel: UILabel!
    var reflection = [NSManagedObject]()
	let dataStack = CoreDataStack.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.entry != nil{
            self.textField.text = self.entry.body
			date = NSDate(timeIntervalSince1970: self.entry!.date)
//			date = NSDate(timeIntervalSinceReferenceDate:self.entry.date)
		}else {
			date = NSDate()
			
		}
		
		let df = NSDateFormatter()
		df.dateFormat = "EEEE, MMMM d, yyyy"
		
		self.dateLabel.text = df.stringFromDate(date!)
		

        // Do any additional setup after loading the view.
    }



}

//MARK: -IBAction
extension NewEntry {
    
    
    
	@IBAction func buttonImagePressed(sender: AnyObject) {
		
	}
    
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
		
		dataStack.saveContext()
		
//        
////        let  appDelegate =  UIApplication.sharedApplication().delegate as! AppDelegate
////        let managedContext = appDelegate.managedObjectContext
//		
//        //        managedContext.deletedObject(entry)
////        managedContext.deleteObject(entry!)
//        do{
//            try dataStack.saveContext()
//        }catch let error as NSError {
//            print("Error: \(error.localizedDescription)")
//        }//        fetchedResultsController.d

        
    }
    
    func dismissSelf(){
//        presentingViewController.an
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func insertDiaryEntry(){
		 let entry = NSEntityDescription.insertNewObjectForEntityForName("Reflection", inManagedObjectContext: dataStack.managedObjectContext) as! Reflection
		
		entry.body = self.textField.text
		entry.date = NSDate().timeIntervalSince1970
		dataStack.saveContext()
		

    }
	
	func promptForSource() {
		let actionSheet = UIActionSheet(title: "Image Source", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "")
	}
	
	func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
		
		// Check if the user hasnt canceled
		if buttonIndex != actionSheet.cancelButtonIndex {
			// User tapped camera
			if buttonIndex != actionSheet.firstOtherButtonIndex {
				self.promptFor(Control.Camera)
			} else {
				self.promptFor(Control.Photos)
			}
		}
	}
	
	
	// Choose the destination source controller (gallery or camera)
	func promptFor(source: Control) {
		let controller = UIImagePickerController()
		
		switch source {
		case .Camera:
			controller.sourceType = UIImagePickerControllerSourceType.Camera
		case .Photos:
			controller.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
		}
		
		controller.delegate = self
		
		self.presentViewController(controller, animated: true, completion: nil)
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		
		
		// Grab the selected image
//		let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//		setPickedImage(image)
		
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}
	
	
	func getPickedImage() -> UIImage {
		if self.pickedImage != nil {
			return self.pickedImage!
		} else {
			return UIImage(named: "icn_noimage")!
		}
	}
	
//	
//	func setPickedImage(pickedImage: UIImage){
//		
//	}
	
	
	
	
}


