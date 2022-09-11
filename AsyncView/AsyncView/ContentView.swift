//
//  ContentView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Using AsyncView with operation
        AsyncView(
            operation: { try await Endpoint.shared.countries() },
            empty: {
                Text("Empty State")
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
        
        // Using AsyncView with async model
        /*
        AsyncModelView(
            model: AsyncModel<[Country]>(asyncOperation: { try await Endpoint.shared.countries() }),
            empty: {
                Text("Empty State")
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
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
