//
//  SettingView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/12/22.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        AsyncModelView(
            model: AsyncModel<[Country]>(asyncOperation: { try await Endpoint.shared.countries() }),
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

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
