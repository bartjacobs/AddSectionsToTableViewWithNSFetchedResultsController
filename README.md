### Respond to Updates Using the NSFetchedResultsControllerDelegate Protocol

#### Author: Bart Jacobs

We can now add and remove quotes and the table view is updated accordingly. But everyone makes a mistake from time to time and we don't want to remove a quote because of a silly mistake.

In this tutorial, we add the ability to update quotes. Not only do we want the table view to reflect the changes we make to a quote, we also want to make sure the sort order of the quotes is updated when a quote is modified. You guessed it. The `NSFetchedResultsController` class and the `NSFetchedResultsControllerDelegate` protocol make this almost trivial.

To follow along, clone or download the project from the [previous tutorial](https://cocoacasts.com/implement-the-nsfetchedresultscontrollerdelegate-protocol-with-swift-3/) from [GitHub](https://github.com/bartjacobs/ImplementTheNSFetchedResultsControllerDelegateProtocolWithSwift3).

**Read this article on [Cocoacasts](https://cocoacasts.com/respond-to-updates-using-the-nsfetchedresultscontrollerdelegate-protocol/)**.
