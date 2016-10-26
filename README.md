### Populate a Table View With NSFetchedResultsController and Swift 3

#### Author: Bart Jacobs

Even though you don't need to use the `NSFetchedResultsController` class to populate a table view, I find myself using it quite a bit in Core Data applications. Swift 3 has substantially improved support for Core Data and the `NSFetchedResultsController` class also benefits from these optimizations.

In this tutorial, we create an application that manages a list of quotes. We populate a table view with quotes using the `NSFetchedResultsController` class. The tools we use are Swift 3 and Xcode 8.

## Setting Up the Project

Create a new project in Xcode and choose the **Single View Application** template. Name the project **Quotes** and make sure the **Use Core Data** checkbox is unchecked. We won't be using Xcode's Core Data template.

![Setting Up the Project In Xcode 8](https://cocoacasts.s3.amazonaws.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/figure-project-setup-1.jpg)

![Setting Up the Project In Xcode 8](https://cocoacasts.s3.amazonaws.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/figure-project-setup-2.jpg)

**Read this article on [Cocoacasts](https://cocoacasts.com/populate-a-table-view-with-nsfetchedresultscontroller-and-swift-3/)**.
