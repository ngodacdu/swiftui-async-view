//
//  AsyncModelView.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

public struct AsyncModelView<AsyncData, Empty: View, Loading: View, Success: View, Failure: View>: View {
    
    @ObservedObject var model: AsyncModel<AsyncData>
    public let empty: () -> Empty
    public let loading: () -> Loading
    public let success: (_ item: AsyncData) -> Success
    public let failure: (_ error: Error) -> Failure
    
    public init(model: AsyncModel<AsyncData>,
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
    
    public var body: some View {
        AsyncResultView(
            result: model.result,
            empty: empty,
            loading: loading,
            success: success,
            failure: failure
        )
    }
}
