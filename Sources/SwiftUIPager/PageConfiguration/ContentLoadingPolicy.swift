//
//  File.swift
//  
//
//  Created by Fernando Moya de Rivas on 05/07/2020.
//

import Foundation

/// Policy to follow when loading content
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public enum ContentLoadingPolicy: Equatable {

    /// Content is loaded on demand by applying a recycling the ratio.
    ///
    /// - Parameter recyclingRatio: Manages the number of items that should be displayed in the screen.
    ///
    /// A ratio of `5`, for instance, will load enough items in memory to fill five times the size of `Pager`.
    /// - Note: `recyclingRatio` must be greather than `0`.
    case lazy(recyclingRatio: UInt)

    /// Choose `eager` to load all items at once
    case eager
    
    /// Progressive loading: starts with the current page, then loads adjacent pages after the initial page is visible.
    /// This provides the fastest initial display while still loading other pages in the background.
    ///
    /// - Parameter initialCount: Number of pages to load initially (default 1). These will be centered around the current page.
    /// - Parameter expansionRate: Number of additional pages to load in each direction during progressive loading (default 2).
    case progressive(initialCount: UInt = 1, expansionRate: UInt = 2)

    /// Default policy, a.k.a, `lazy(recyclingRatio: 5)`
    static var `default`: ContentLoadingPolicy = .lazy(recyclingRatio: 5)
}

