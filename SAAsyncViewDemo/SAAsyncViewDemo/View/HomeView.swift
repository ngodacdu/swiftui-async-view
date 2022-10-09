//
//  ContentView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI
import SAAsyncView

struct HomeView: View {
    var body: some View {
        AsyncView(
            operation: { try await Endpoint.shared.countries() },
            empty: {
                EmptyView()
            },
            loading: {
                ProgressView()
            },
            success: { countries in
                List(countries) { country in
                    Text(country.name)
                }
            },
            failure: { error in
                Text(error.localizedDescription)
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
