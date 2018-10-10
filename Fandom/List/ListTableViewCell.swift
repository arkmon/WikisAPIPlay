//  ListTableViewCell.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
	//should have own viewModel
	override func awakeFromNib() {
		super.awakeFromNib()
		titleLbl.font = UIFont(name: "Rubik-Medium", size: UIFont.systemFontSize)
		itemTextView.font = UIFont(name: "Rubik-Regular", size: UIFont.systemFontSize)
		imageView?.frame = CGRect(x: 23, y: 23, width: 130, height: 130)
	}
	@IBOutlet weak var cellImageView: UIImageView!
	@IBOutlet weak var itemTextView: UITextView!
	@IBOutlet weak var titleLbl: UILabel!
	@IBOutlet weak var lblArticles: UILabel!
	@IBOutlet weak var lblDisc: UILabel!
	@IBOutlet weak var lblVideos: UILabel!
	
	@IBOutlet weak var stViewArticles: UIStackView!
	@IBOutlet weak var stViewDisc: UIStackView!
	@IBOutlet weak var stViewVideos: UIStackView!
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
