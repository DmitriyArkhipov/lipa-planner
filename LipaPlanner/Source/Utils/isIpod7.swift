//
//  isIpod7.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 20.09.2021.
//

import UIKit

func isIpod7() -> Bool {
    let bounds = UIScreen.main.bounds
    
    return bounds.size.width == 320 ? true : false
}
