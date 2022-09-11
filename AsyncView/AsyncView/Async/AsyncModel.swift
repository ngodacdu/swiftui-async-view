//
//  AsyncModel.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

@MainActor
class AsyncModel<AsyncData>: ObservableObject {
    
    @Published private(set) var result = AsyncResult<AsyncData>.empty
    
    typealias AsyncOperation = () async throws -> AsyncData
    
    private var asyncOperationBlock: AsyncOperation = {
        fatalError("Override asyncOperation or pass a asyncOperationBlock to use async model")
    }
    
    init(asyncOperation: AsyncOperation? = nil) {
        if let asyncOperation {
            asyncOperationBlock = asyncOperation
        }
    }
    
    func asyncOperation() async throws -> AsyncData {
        try await asyncOperationBlock()
    }
    
    func load() async {
        if case .loading = result {
            return
        }
        result = .loading
        do {
            result = .success((try await asyncOperation()))
        } catch {
            result = .failure(error)
        }
    }
}
