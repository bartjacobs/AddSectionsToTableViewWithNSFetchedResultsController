### Implement the NSFetchedResultsControllerDelegate Protocol With Swift 3

#### Author: Bart Jacobs

In [yesterday's tutorial](https://cocoacasts.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/), we populated a table view with quotes using the `NSFetchedResultsController` class. But the table view is currently empty since we haven't added the ability to add quotes yet.

This tutorial focuses on the implementation of the `NSFetchedResultsControllerDelegate` protocol. It allows the application to respond to changes that take place in the managed object context it observes. The fetched results controller notifies its delegate when the data it manages is modified. If we correctly implement the protocol, updating the table view after a change is a breeze.

To follow along, clone or download the project from the [previous tutorial](https://cocoacasts.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/) from [GitHub](https://github.com/bartjacobs/PopulateATableViewWithNSFetchedResultsControllerAndSwift3).

**Read this article on [Cocoacasts](https://cocoacasts.com/implement-the-nsfetchedresultscontrollerdelegate-protocol-with-swift-3/)**.
