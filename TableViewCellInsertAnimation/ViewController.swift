import UIKit

class ViewController: UITableViewController {

	var rowsCount = 1 //needs to update when inserting and deleting rows

	func configureLabelsCell(indexPath: NSIndexPath) -> LabelsTableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("LabelsCell", forIndexPath: indexPath) as! LabelsTableViewCell
		cell.leadingLabel.text = "hello"
		cell.trailingLabel.text = "goodbye"
		return cell
	}


	func configureSwitchCell(indexPath: NSIndexPath) -> SwitchedTableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchedTableViewCell
		if indexPath.row == 0 {
			cell.action = { mySwitch in
				if !mySwitch.on {
					print("Hiding extra rows")
					self.rowsCount = 1
					self.tableView.deleteRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0),NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
				} else {
					print("Showing extra Rows")
					self.rowsCount = 3
					self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0),NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: .Fade)
				}
			}
		} else {
			cell.action = appStateSwitch
		}
		return cell
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if indexPath.row % 2 == 1 {
			return configureLabelsCell(indexPath)
		} else {
			return configureSwitchCell(indexPath)
		}
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return rowsCount
	}

	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 44
	}

	private let appStateSwitch: ((sender: UISwitch) -> Void) = {
		mySwitch in
		print("Changing some app state somewhere")
	}
}

