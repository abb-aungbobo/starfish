//
//  ContentView.swift
//  Starfish
//
//  Created by Aung Bo Bo on 19/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ProductsScene.live()
                .navigationDestination(for: Route.self) { route in
                    Route.destination(route: route, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
