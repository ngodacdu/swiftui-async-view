//
//  SAAsyncViewDemoApp.swift
//  SAAsyncViewDemo
//
//  Created by Ngo Dac Du on 10/9/22.
//

import SwiftUI

@main
struct SAAsyncViewDemoApp: App {
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
