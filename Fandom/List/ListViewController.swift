//
//  ListViewController.swift
//  Fandom
//
//  Copyright © 2018 Arkadiusz. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {

    var viewModel: ListViewModel!

    @IBOutlet weak var tableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "Top Wikis"
		self.tableView.rowHeight = UITableView.automaticDimension
		self.tableView.estimatedRowHeight = 230

		let nib = UINib(nibName: "ListTableViewCell", bundle: nil)
		tableView.register(nib, forCellReuseIdentifier: "ListTableViewCell")

		tableView.separatorStyle = .none
		
        viewModel.items.signal.observeResult { [unowned self] _ in
            self.tableView.reloadData()
        }
		
        viewModel.viewDidLoad()
    }

}

// MARK: - UITableVissasewDataSource

extension ListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
		// #TODO Cell should have its own viewModel but no time for this
        let item = viewModel.item(at: indexPath)
        cell.titleLbl?.text = item.title
		
		cell.cellImageView.downloaded(from: item.image)
		cell.itemTextView.text = item.desc
		
		if let videos = viewModel.numberOfVideos(at: indexPath) {
			cell.lblVideos.text = videos
		} else {
			cell.stViewVideos.isHidden = true
		}
		
		if let disc = viewModel.numberOfDiscussions(at: indexPath) {
			cell.lblDisc.text = disc
		} else {
			cell.stViewDisc.isHidden = true
		}
		
		if let articles = viewModel.numberOfArticles(at: indexPath) {
			cell.lblArticles.text = articles
		} else {
			cell.stViewArticles.isHidden = true
		}
		
        return cell
    }

}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRow(at: indexPath)
    }

}
// Maybe not the most efficient way
extension UIImageView {
	func downloaded(from url: URL) {
		//contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async() {
				self.image = image
			}
			}.resume()
	}
	func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
		guard let url = URL(string: link) else { return }
		downloaded(from: url)
	}
}
