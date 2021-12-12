//
//  View+cornerRadius.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 12.12.2021.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
