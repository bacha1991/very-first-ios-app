//
//  Meal.swift
//  test-1
//
//  Created by Maksym Bachynskyi on 05.12.2019.
//  Copyright © 2019 Maksym Bachynskyi. All rights reserved.
//

import UIKit

class Meal {
    // MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialization should fail if there is no name or if the rating is negative.
        guard !name.isEmpty else {
            print("name is empty", name)
            return nil
        }
        
        guard (rating > 0) || (rating < 5) else {
            print("bad rating", rating)
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
