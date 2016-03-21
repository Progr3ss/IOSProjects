//
//  Divergent.swift
//  essence
//
//  Created by martin chibwe on 3/20/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import UIKit

class Divergent: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
     var mDataArray : NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Divergent mData \(mDataArray)")

        // Do any additional setup after loading the view.
    }

    
}



extension Divergent: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = mDataArray[indexPath.row] as! String
        
        return cell
    }
    
    
    
    
    
    
}
