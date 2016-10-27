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

    var managedObjectContext: NSManagedObjectContext?

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Quote"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        authorTextField.becomeFirstResponder()
    }

    // MARK: - Actions

    @IBAction func save(sender: UIBarButtonItem) {
        guard let managedObjectContext = managedObjectContext else { return }

        // Create Quote
        let quote = Quote(context: managedObjectContext)

        // Configure Quote
        quote.author = authorTextField.text
        quote.contents = contentsTextView.text
        quote.createdAt = Date().timeIntervalSince1970

        // Pop View Controller
        _ = navigationController?.popViewController(animated: true)
    }

}
