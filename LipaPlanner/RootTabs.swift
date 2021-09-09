//
//  RootTabs.swift
//  LipaPlanner
//
//  Created by Dmitriy Arkhipov on 04.09.2021.
//

import SwiftUI

struct RootTabs: View {
    init() {
        UITabBar.appearance().barTintColor = UIColor(Color(hex: "17171F"))
        UINavigationBar.appearance().barTintColor = UIColor(Color(hex: "1A1A20"))
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
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
        ).preferredColorScheme(.dark)
    }
}

struct RootTabs_Previews: PreviewProvider {
    static var previews: some View {
        RootTabs()
    }
}
