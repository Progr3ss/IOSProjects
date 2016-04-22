//
//  GCDBlackBox.swift
//  Open Book
//
//  Created by martin chibwe on 4/17/16.
//  Copyright © 2016 martin chibwe. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(updates: () -> Void) {
	dispatch_async(dispatch_get_main_queue()){
		updates()
	}
}