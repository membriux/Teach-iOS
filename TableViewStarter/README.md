

# UITableView Section Headers Steps

## Overview

[Table views](https://developer.apple.com/documentation/uikit/uitableview) are used to display grouped lists of cells. Here are some example of table views:

![TableViews Example](https://imgur.com/sI6L9Bx "TableViews")

This guide provides a quick recipe for setting up and using a simple table view with Interface Builder and prototype cells. 

## Xcode setup
...


## TableView Setup

The example we'll use throughout is a table with cities and state abbreviations.
![Cities and States](https://imgur.com/oYv2vmX "Cities and States")


### Step 1: Determine what data you need to display in the Table

Figure out what data you need to display in the table and how you're going to obtain this data. In our example, we have a static fixture which is a list of strings.

```Swift
let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
    "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
    "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
    "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
    "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
```

### Step 2: Add table view to view controller

In your storyboard drag a ```Table View``` (not ```Table View Controller```) from the Object Library into your view controller. Add an outlet for the table view in your view controller.

![Table View](https://imgur.com/DSHZu9r "TableView")



### Step 3: Add prototype cell to table view

You'll need a way to describe the appearance of the cells in your table. One way to design a reusable template for cells is to use _prototype cells_. Drag a ```Table View Cell``` from the Object Library into your table view. You can now design the layout of the prototype cell by adding more components from the Object Library.

![Table View Cell](https://imgur.com/nMFup96 "TableViewCell")


### Step 4: Create custom class for prototype cell

Select ```File -> New -> File... -> iOS -> Source -> Cocoa Touch Class``` and create a new subclass of ```UITableViewCell```. Make sure to select ```Swift``` as the language as well:

![Cell class](https://i.imgur.com/NJ5ROO5.png "Cell class")

Back in Interface Builder select your prototype cell, and in the Identity Inspector, set its custom class property to the new class you just created.

![Cell class](https://imgur.com/2r9tOJo "Cell class")



### Step 5: Add code that allows configuration of your prototype cell


Open the Assistant Editor (two overlapping rings view) and select your custom class. Add outlets for elements you need to configure. You might need to add code to provide an easy way to configure the cell.

![Add Code to cell](https://imgur.com/Tkofhwo "Add code to cell")

The example cell is simple enough that we don't have to do anything special. It just has two labels one for the city and one for the state abbreviation.

```Swift

class DemoPrototypeCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
}
```

### Step 6: Set prototype cell's reuse identifier

You'll need a way to tell the table view to create and reuse instances of this prototype cell. Select the cell and give it a unique identifier in the Attributes Inspector.

![Cell Identifier](https://imgur.com/nZdbnm5 "Cell identifier")


### Step 7: Set the table view's data source and delegate

Declare your view controller to implement the ```UITableViewDataSource``` and ```UITableViewDelegate``` protocols. In your view controller's ```viewDidLoad``` method, set the table view's data source and delegate properties to your view controller.

```Swift   

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    }
}
```

### Step 8: Implement data source methods

Implement methods from the ```UITableViewDataSource``` protocol in order to tell the table what data to show in its table.

Return the total number of rows from the ```numberOfRowsInSection``` method.

The ```cellForRowAtIndexPath``` requires that a table view cell is obtained, configured with the correct data and returned. Get an instance of the prototype cell by calling ```dequeueReusableCellWithIdentifier``` on the table view and passing it the identifier that was set in Step 6.

```Swift   

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    let data = ["New York, NY", ...,  "Fort Worth, TX"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.codepath.DemoPrototypeCell", for: indexPath) as! DemoPrototypeCell
        let cityState = data[indexPath.row].components(separatedBy: ", ")
        cell.cityLabel.text = cityState.first 
        cell.stateLabel.text = cityState.last 
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
```

## Table view usage
This section covers some common issues that arise when using table view cells.


### Automatically resize row heights
Sometimes you'll have cells that vary in height. The easiest way to have your rows be correctly sized is to set an ```estimatedRowHeight``` and set the table view's ```rowHeight``` to ```UITableViewAutomaticDimension```. This only works in iOS 8 and above. For a discussion of other ways to have variable row heights see our more in depth [table view guide](https://guides.codepath.com/ios/Table-View-Guide#setting-the-height-of-rows-in-a-table).

```Swift
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.estimatedRowHeight = 100
    tableView.rowHeight = UITableViewAutomaticDimension
    }
    ...
}
```

### Respond to row selection

The most common event you'll need respond to is the user selecting a row in the table.

#### Segue to another view controller

A common behavior when a row is selected, is to push a new view controller with details about that row. You can do this in a storyboard by control-dragging from the cell and selecting the appropriate segue under the ```Selection Segue``` section.

![Segues](https://imgur.com/GrT010h "Segues")

#### Handling row selection programmatically
You can also respond programmatically by implementing the ```UITableViewDelegate``` method ```didSelectRowAtIndexPath```:.

```Swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    // do something here
}
```




## **More Resources:**

- [CodePath's has a great guide](https://guides.codepath.com/ios/Table-View-Guide#) that covers table views more in-depth. 

– [Section Header Tutorial](https://guides.codepath.com/ios/Table-View-Guide#working-with-sections)

– [UISearchBarTutorial for TableViews](https://guides.codepath.com/ios/Search-Bar-Guide#working-with-uisearchbars-directly)

