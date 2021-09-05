//
//  RootTabs.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct RootTabs: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(Color(hex: "17171F"))
    }
    
    var body: some View {
        TabView(
            selection: .constant(1),
            content:  {
                SearchScreen().tabItem {
                    Image("Search")
                        .renderingMode(.template)
                    Text("Поиск")
                }.tag(1)
                Text("Tab Content 2").tabItem {
                    Image("Reminder")
                        .renderingMode(.template)
                    Text("Напоминания")
                }.tag(2)
                Text("Tab Content 3").tabItem {
                    Image("Settings")
                        .renderingMode(.template)
                    Text("Настройки")
                }.tag(3)
            }
        )
    }
}

struct RootTabs_Previews: PreviewProvider {
    static var previews: some View {
        RootTabs()
    }
}
