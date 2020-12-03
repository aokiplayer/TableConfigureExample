import UIKit

// Table view controller for Example1 scene
class Example1TableVC: UITableViewController {
    private var items:[(product: String, description: String)] = [
        ("AAA", "aaa aaaaa aaaa"),
        ("BBB", "bbb bbbbb bbbb"),
        ("CCC", "ccc ccccc cccc"),
        ("DDD", "ddd ddddd dddd"),
        ("EEE", "eee eeeee eeee"),
        ("FFF", "fff fffff ffff"),
        ("GGG", "ggg ggggg gggg"),
        ("HHH", "hhh hhhhh hhhh"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ex1Cell", for: indexPath)
        
        // Use default settings
        var content = cell.defaultContentConfiguration()
        
        #if DEBUG
        print(content)
        #endif

        content.text = items[indexPath.row].product
        content.secondaryText = items[indexPath.row].description
        content.image = UIImage(systemName: "appletv")
        
        // Set content
        cell.contentConfiguration = content

        return cell
    }
}
