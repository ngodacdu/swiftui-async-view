//
//  AsyncModelView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

struct AsyncModelView<AsyncData, Empty: View, Loading: View, Success: View, Failure: View>: View {
    
    @ObservedObject var model: AsyncModel<AsyncData>
    let empty: () -> Empty
    let loading: () -> Loading
    let success: (_ item: AsyncData) -> Success
    let failure: (_ error: Error) -> Failure
    
    init(model: AsyncModel<AsyncData>,
         @ViewBuilder empty: @escaping () -> Empty,
         @ViewBuilder loading: @escaping () -> Loading,
         @ViewBuilder success: @escaping (_ item: AsyncData) -> Success,
         @ViewBuilder failure: @escaping (_ error: Error) -> Failure) {
        self.model = model
        self.empty = empty
        self.loading = loading
        self.success = success
        self.failure = failure
    }
    
    var body: some View {
        AsyncResultView(
            result: model.result,
            empty: empty,
            loading: loading,
            success: success,
            failure: failure
        )
        .task {
            await model.load()
        }
        .refreshable {
            await model.load()
        }
    }
}
