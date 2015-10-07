import UIKit

class SwitchedTableViewCell: UITableViewCell {
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var theSwitch: UISwitch!

	var action: ((sender: UISwitch) -> Void)?

	@IBAction func switchChanged(sender: UISwitch){
		action?(sender: sender)
	}
}
