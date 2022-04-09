//
//  TypedAnnotaion.swift
//  LipaPlanner
//
//  Created by Дмитрий Архипов on 10.04.2022.
//

import MapKit

enum AnnotationType: String {
    case source
    case destination
}

class TypedPointAnnotation: MKPointAnnotation, Identifiable {
    let id = UUID()

    var type: AnnotationType?
}
