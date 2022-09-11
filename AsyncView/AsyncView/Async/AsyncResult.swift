//
//  AsyncResult.swift
//  AsyncView
//
//  Created by Ngo Dac Du on 9/11/22.
//

import Foundation

@frozen enum AsyncResult<AsyncData> {
    case empty
    case loading
    case success(AsyncData)
    case failure(Error)
}
