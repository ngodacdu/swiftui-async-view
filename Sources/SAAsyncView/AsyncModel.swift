//
//  AsyncModel.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import SwiftUI

@MainActor
open class AsyncModel<AsyncData>: ObservableObject {
    
    @Published public var result = AsyncResult<AsyncData>.empty
    
    public typealias AsyncOperation = () async throws -> AsyncData
    
    private var asyncOperationBlock: AsyncOperation = {
        fatalError("Override asyncOperation or pass a asyncOperationBlock to use async model")
    }
    
    public init(asyncOperation: AsyncOperation? = nil) {
        if let asyncOperation {
            asyncOperationBlock = asyncOperation
        }
        Task {
            await load()
        }
    }
    
    open func asyncOperation() async throws -> AsyncData {
        try await asyncOperationBlock()
    }
    
    public func load() async {
        if case .loading = result {
            return
        }
        result = .loading
        do {
            result = .success(try await asyncOperation())
        } catch {
            result = .failure(error)
        }
    }
}
