//
//  StarfishApp.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import SwiftUI

@main
struct StarfishApp: App {
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(.pink)
        }
    }
}
