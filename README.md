# SAAsyncView – Asynchronous loading operations in SwiftUI

- SwiftUI View component is developed for handling in-progress and error states when loading data asynchronously. This serves as an exercise in creating abstractions and using Swift generics in practice.

- SAAsyncView is a SwiftUI View for handling in-progress and error states when loading data asynchronously using async/await.

- The resulting component is suitable as a ready-made package for use in projects that merely want to load data from URL endpoints and display it via SwiftUI, as well as a starting point for projects that require a more complex structure.

| Loading State | Success State | Failure State
| --- | --- | --- |
| ![Simulator Screen Shot - iPhone 14 Pro - 2022-10-11 at 00 23 33](https://user-images.githubusercontent.com/3876384/194921622-10a3d318-5c38-43e2-9cda-d7eb16b3ed6f.png) | ![Simulator Screen Shot - iPhone 14 Pro - 2022-10-11 at 00 25 03](https://user-images.githubusercontent.com/3876384/194921716-3701cd62-6bfb-45b1-bda8-e122332c4387.png) | ![Simulator Screen Shot - iPhone 14 Pro - 2022-10-11 at 00 23 52](https://user-images.githubusercontent.com/3876384/194921738-0fbbf1c5-d1ee-492a-abb5-806d7766e54c.png) |

## Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

Once you have your Swift package set up, adding SAAsyncView as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
https://github.com/ngodacdu/swiftui-async-view
```

## How to use

- You can use AsyncView or AsyncModelView:
  - Use AsyncView if not create model and providing an operation (async task)
  - Use AsyncModelView if create model and providing an async operation
  
- SAAsyncView manages 4 states:
  - Empty: display view in empty state
  - Loading: display view in loading state, await async task excute
  - Success: display view after async task finished
  - Failure: an error was thrown during the execution of the async task

#### 1. Using AsyncView

```swift
  AsyncView(
      operation: { try await Endpoint.shared.countries() },
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
```

#### 2. Using AsyncModelView

```swift
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
```

## Documentation

Ref: https://www.ralfebert.com/ios-app-development/swiftui/asyncview/
