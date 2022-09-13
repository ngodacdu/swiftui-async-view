//
//  AsyncViewApp.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

@main
struct AsyncViewApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack(alignment: .center, spacing: 20) {
                    NavigationLink(destination: HomeView()) {
                        Text("Using AsyncView")
                            .font(.headline)
                    }
                    NavigationLink(destination: SettingView()) {
                        Text("Using AsyncModelView")
                            .font(.headline)
                    }
                }
            }
        }
    }
}
