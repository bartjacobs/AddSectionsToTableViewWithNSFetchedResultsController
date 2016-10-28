//
//  ViewController.swift
//  Quotes
//
//  Created by Bart Jacobs on 26/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    // MARK: - Properties

    private let segueAddQuoteViewController = "SegueAddQuoteViewController"
    private let segueEditQuoteViewController = "SegueEditQuoteViewController"

    // MARK: -

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!

    // MARK: -

    private let persistentContainer = NSPersistentContainer(name: "Quotes")

    // MARK: -

    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Quote> = {
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<Quote> = Quote.fetchRequest()

        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "author", ascending: true)]

        // Create Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)

        // Configure Fetched Results Controller
        fetchedResultsController.delegate = self

        return fetchedResultsController
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Quotes"

        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            if let error = error {
                print("Unable to Load Persistent Store")
                print("\(error), \(error.localizedDescription)")

            } else {
                self.setupView()

                do {
                    try self.fetchedResultsController.performFetch()
                } catch {
                    let fetchError = error as NSError
                    print("Unable to Perform Fetch Request")
                    print("\(fetchError), \(fetchError.localizedDescription)")
                }

                self.updateView()
            }
        }

        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground(_:)), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationViewController = segue.destination as? AddQuoteViewController else { return }

        // Configure View Controller
        destinationViewController.managedObjectContext = persistentContainer.viewContext

        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == segueEditQuoteViewController {
            // Configure View Controller
            destinationViewController.quote = fetchedResultsController.object(at: indexPath)
        }
    }

    // MARK: - View Methods

    private func setupView() {
        setupMessageLabel()

        updateView()
    }

    fileprivate func updateView() {
        var hasQuotes = false

        if let quotes = fetchedResultsController.fetchedObjects {
            hasQuotes = quotes.count > 0
        }

        tableView.isHidden = !hasQuotes
        messageLabel.isHidden = hasQuotes

        activityIndicatorView.stopAnimating()
    }

    // MARK: -

    private func setupMessageLabel() {
        messageLabel.text = "You don't have any quotes yet."
    }

    // MARK: - Notification Handling

    func applicationDidEnterBackground(_ notification: Notification) {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            print("Unable to Save Changes")
            print("\(error), \(error.localizedDescription)")
        }
    }

}

extension ViewController: NSFetchedResultsControllerDelegate {

    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }

    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()

        updateView()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case .update:
            if let indexPath = indexPath, let cell = tableView.cellForRow(at: indexPath) as? QuoteTableViewCell {
                configure(cell, at: indexPath)
            }
            break;
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }

            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
        }
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {

    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let quotes = fetchedResultsController.fetchedObjects else { return 0 }
        return quotes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.reuseIdentifier, for: indexPath) as? QuoteTableViewCell else {
            fatalError("Unexpected Index Path")
        }

        // Configure Cell
        configure(cell, at: indexPath)

        return cell
    }

    func configure(_ cell: QuoteTableViewCell, at indexPath: IndexPath) {
        // Fetch Quote
        let quote = fetchedResultsController.object(at: indexPath)

        // Configure Cell
        cell.authorLabel.text = quote.author
        cell.contentsLabel.text = quote.contents
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Fetch Quote
            let quote = fetchedResultsController.object(at: indexPath)

            // Delete Quote
            quote.managedObjectContext?.delete(quote)
        }
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
