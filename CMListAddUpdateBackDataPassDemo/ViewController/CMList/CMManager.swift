//
//  CMManager.swift
//  CMListAddUpdateBackDataPassDemo
//
//  Created by Mirajkar on 15/05/21.
//  Copyright © 2021 Mirajkar. All rights reserved.
//

import Foundation


//Singleton Class
class CMManager {

    static let sharedInstance = CMManager()
    var listOfCMArrayS : [CMObject] = []
   
    func addCMObject(obj: CMObject, tag: Int?) -> Array<CMObject> {
        if let tag = tag {
                   listOfCMArrayS.remove(at: tag)
                   listOfCMArrayS.insert(obj, at: tag)
               } else {
                   listOfCMArrayS.append(obj)
               }
        return listOfCMArrayS
    }
    
    func getAllObjects() -> Array<CMObject> {
        return listOfCMArrayS
    }
    
    func getObject(tag: Int) -> CMObject {
        let obj = listOfCMArrayS[tag] 
        return obj
    }
}
