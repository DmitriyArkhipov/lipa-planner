//
//  LipaPlannerApp.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI
import PartialSheet

@main
struct LipaPlannerApp: App {
    let sheetManager: PartialSheetManager = PartialSheetManager()

    var body: some Scene {
        WindowGroup {
            RootTabs().environmentObject(sheetManager)
        }
    }
}
