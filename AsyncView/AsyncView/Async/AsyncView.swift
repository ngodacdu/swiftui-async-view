//
//  AsyncView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

struct AsyncView<AsyncData, Empty: View, Loading: View, Success: View, Failure: View>: View {
    
    @StateObject var model: AsyncModel<AsyncData>
    let empty: () -> Empty
    let loading: () -> Loading
    let success: (_ item: AsyncData) -> Success
    let failure: (_ error: Error) -> Failure
    
    var body: some View {
        AsyncModelView(
            model: model,
            empty: empty,
            loading: loading,
            success: success,
            failure: failure
        )
    }
}

extension AsyncView {
    
    init(operation: @escaping AsyncModel<AsyncData>.AsyncOperation,
         @ViewBuilder empty: @escaping () -> Empty,
         @ViewBuilder loading: @escaping () -> Loading,
         @ViewBuilder success: @escaping (_ item: AsyncData) -> Success,
         @ViewBuilder failure: @escaping (_ error: Error) -> Failure) {
        self.init(
            model: AsyncModel(asyncOperation: operation),
            empty: empty,
            loading: loading,
            success: success,
            failure: failure
        )
    }
}
