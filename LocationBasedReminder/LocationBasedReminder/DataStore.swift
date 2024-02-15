//
//  DataStore.swift
//  LocationBasedReminder
//
//  Created by Akshit Saxena on 2/15/24.
//

import Foundation



var coordArray = [[String]]()
struct StorageKeys{
    static let storedLat = "storedLat"
    static let storedLong = "storedLong"
}

class DataStore{
    
    
    
    func GetDefaults()->UserDefaults{
        return UserDefaults.standard
    }
    
    func StoreDataPoint(latitude: String, longitude: String){
        let def = GetDefaults()
        
        
        def.setValue(latitude, forKey: StorageKeys.storedLat)
        def.setValue(longitude, forKey: StorageKeys.storedLong)
        
        
        def.synchronize()
        coordArray.append([latitude, longitude])
        print(coordArray)
        
    }
    
}
