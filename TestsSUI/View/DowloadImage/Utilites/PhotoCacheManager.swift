//
//  PhotoCacheManager.swift
//  TestsSUI
//
//  Created by Денис Мишин on 16.04.2023.
//

import SwiftUI

class PhotoCacheManager {

    static let instance = PhotoCacheManager()
    
    private init(){}
    
    var photoCache: NSCache<NSString, UIImage> = {
       var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
    
}
