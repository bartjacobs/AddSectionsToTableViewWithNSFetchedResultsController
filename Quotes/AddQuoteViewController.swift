//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by Bart Jacobs on 27/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit
import CoreData

class AddQuoteViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!

    // MARK: -

    var quote: Quote?

    // MARK: -

    var managedObjectContext: NSManagedObjectContext?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Quote"

        if let quote = quote {
            authorTextField.text = quote.author
            contentsTextView.text = quote.contents
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        authorTextField.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func save(sender: UIBarButtonItem) {
        guard let managedObjectContext = managedObjectContext else { return }

        if quote == nil {
            // Create Quote
            let newQuote = Quote(context: managedObjectContext)

            // Configure Quote
            newQuote.createdAt = Date().timeIntervalSince1970

            // Set Quote
            quote = newQuote
        }

        if let quote = quote {
            // Configure Quote
            quote.author = authorTextField.text
            quote.contents = contentsTextView.text
        }

        // Pop View Controller
        _ = navigationController?.popViewController(animated: true)
    }

}
