# ABNAssignment

## Assumptions and scope

The changes made to the wikipedia app can be found in [this repository](https://github.com/RRUIZ5/wikipedia-ios).

For this exercise I replaced the original location dataset with six stadium datasets (one per country).
This allowed me to demonstrate parallel data loading using Swift Concurrency. Since each country is loaded independently, the application can fetch all datasets concurrently and merge the results before presenting them to the user.
The project enables Swift's approachable concurrency features together with strict concurrency checking to align with modern Swift development practices.

## Architecture

The application follows a simple MVVM architecture.

- View: SwiftUI views responsible for presentation.
- ViewModel: Uses Apple's Observation framework to expose observable state to SwiftUI views without relying on Combine or ObservableObject.
- Service layer: Responsible for data retrieval and decoding. Keeping this logic separate from the ViewModel improves testability and helps maintain a clear separation of concerns.

A protocol abstraction was chosen to allow dependency injection for unit tests and SwiftUI previews.

## State Management

The goal of `CountryListView` is to show the list of countries and a detail screen of the stadiums in each country.
Since there are six JSON files, the ViewModel calls the API to download each file and merges all of them into a dictionary.
A ThrowingTaskGroup was chosen to take advantage of Swift's structured concurrency model, allowing all country datasets to be loaded in parallel while still propagating failures correctly.
If any individual dataset fails to load, the task group propagates the error and the ViewModel transitions to the failed state.

The ViewModel exposes its state through a finite state machine:

- idle
- loading
- success
- failed

Using an enum prevents invalid UI states such as displaying loading indicators and error messages simultaneously.
This also makes the view rendering logic straightforward, as each state maps directly to a specific UI representation.

A small diagram of how the entities interact
```text
CountryListView
        ↓
CountryListViewModel
        ↓
StadiumApi
        ↓
JSON resources
```

## Tradeoffs

In the same scope of `CountryListView`, I considered exposing independent properties such as:

- isLoading
- stadiums
- error

but chose a state enum because it guarantees a single source of truth and inconsistencies like having `isLoading` as true and an error state at the same time.

For a larger application I would likely introduce a dedicated navigation coordinator and dependency container, but that felt unnecessary for the scope of this exercise.

## Testing

The API layer is abstracted behind a StadiumApi protocol.

Unit tests use MockStadiumApi to provide deterministic responses without relying on networking. The same mock implementation can also be used by SwiftUI previews.

The current implementation includes coverage for the successful loading path.

Additional tests that would be added in a production environment include:

- API failure handling
- Stadium grouping logic
- Empty dataset handling

Given the limited scope of the exercise, the implementation focuses on validating the successful loading path while keeping the architecture testable for future scenarios.

## Accessibility

The application includes:

- VoiceOver-friendly labels and hints for navigation items
- Descriptive loading and error states

Additional improvements could include:

- Dynamic Type validation across all screens
- Keyboard navigation support
- VoiceOver testing on physical devices
- Color contrast verification

## Future Improvements

Given more time I would add the following

Product improvements:
- Search and filtering
- Pull-to-refresh support
- Localization

Technical improvements:
- Snapshot and UI tests
- Offline caching
- Additional accessibility validation

## Key Technical Decisions

- Swift Concurrency was preferred over callbacks for readability and structured concurrency support.
- ThrowingTaskGroup was used to load country datasets in parallel.
- Dependency injection was implemented through protocols to improve testability.
- The Observation framework was chosen over ObservableObject because it is Apple's modern state observation system and reduces the amount of boilerplate required to keep SwiftUI views synchronized with application state.
