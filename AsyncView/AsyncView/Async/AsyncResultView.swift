//
//  AsyncResultView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

struct AsyncResultView<AsyncData, Empty: View, Loading: View, Success: View, Failure: View>: View {
    
    let result: AsyncResult<AsyncData>
    let empty: () -> Empty
    let loading: () -> Loading
    let success: (_ item: AsyncData) -> Success
    let failure: (_ error: Error) -> Failure
    
    init(result: AsyncResult<AsyncData>,
         @ViewBuilder empty: @escaping () -> Empty,
         @ViewBuilder loading: @escaping () -> Loading,
         @ViewBuilder success: @escaping (_ item: AsyncData) -> Success,
         @ViewBuilder failure: @escaping (_ error: Error) -> Failure) {
        self.result = result
        self.empty = empty
        self.loading = loading
        self.success = success
        self.failure = failure
    }
    
    var body: some View {
        switch result {
        case .empty:
            ZStack {
                empty()
            }
        case .loading:
            loading()
        case let .success(data):
            success(data)
        case let .failure(error):
            failure(error)
        }
    }
}
