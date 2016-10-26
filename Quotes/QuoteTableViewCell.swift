//
//  QuoteTableViewCell.swift
//  Quotes
//
//  Created by Bart Jacobs on 26/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {

    // MARK: - Properties

    static let reuseIdentifier = "QuoteCell"

    // MARK: -

    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
