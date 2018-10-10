//
//  ItemViewController.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit

final class ItemViewController: UIViewController {

    var viewModel: ItemViewModel!

    @IBOutlet weak var itemLabel: UILabel!

    override func viewDidLoad() {
        itemLabel.text = viewModel.itemTitle
    }

}
