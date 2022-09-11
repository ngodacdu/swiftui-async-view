//
//  Endpoint.swift
//  DMCountry
//
//  Created by Ngo Dac Du on 9/9/22.
//

import Foundation

struct Endpoint {
     
    static let shared = Endpoint()
    
    func countries() async throws -> [Country] {
        let url = URL(string: "https://www.ralfebert.de/examples/v3/countries.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
}
