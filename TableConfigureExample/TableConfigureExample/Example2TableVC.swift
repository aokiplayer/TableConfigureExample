import UIKit

// Table view controller for Example2 scene
class Example2TableVC: UITableViewController {
    private var contents: [UIListContentConfiguration] = [
        {
            var content: UIListContentConfiguration = .valueCell()
            content.textProperties.font = .systemFont(ofSize: 20, weight: .heavy)
            content.textProperties.color = .systemGreen
            content.secondaryTextProperties.font = .monospacedSystemFont(ofSize: 16, weight: .light)
            content.secondaryTextProperties.color = .systemOrange
            content.imageProperties.tintColor = .systemPurple

            return content
        }(),
        {
            var content: UIListContentConfiguration = .subtitleCell()
            content.textProperties.font = .systemFont(ofSize: 20, weight: .heavy)
            content.textProperties.color = .systemBlue
            content.secondaryTextProperties.font = .systemFont(ofSize: 16, weight: .light)
            content.secondaryTextProperties.color = .systemTeal
            content.imageProperties.tintColor = .systemRed

            return content
        }()
    ]
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ex2Cell", for: indexPath)
        
        // Set different UIListContentConfiguration for odd/even cell
        var content = indexPath.row % 2 == 0 ? contents[0] : contents[1]
        
        #if DEBUG
        print(content)
        #endif

        content.text = items[indexPath.row].product
        content.secondaryText = items[indexPath.row].description
        content.image = UIImage(systemName: "iphone")

        // Set content
        cell.contentConfiguration = content

        return cell
    }
}
