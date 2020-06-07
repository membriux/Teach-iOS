:::warning
☝️ **NO submission is required for labs**
:::

## Yelpy - Part 1

<img src="https://i.imgur.com/JL1snRo.gif" width=200 /></br>

### Overview

In this lab, you'll build the first part of an app that will allow users to view Yelp restaurants. You'll work in collaborative pairs--Pair Programming--to apply the skills you've learned so far building your Flix App Assignment. Just like the Flix App, you'll create a network request to fetch data from the web, however instead of movies, you'll be getting blog restaurant data from the Yelp API.

### Pair Programming - Working in Collaborative Pairs

The checkpoints below should be implemented as pairs. In pair programming, there are two roles: navigator and driver.

- **[How to Collaborate in Labs - Pair Programming Video](https://www.youtube.com/watch?v=9yCn03s5mzI):** Check out this short video before getting started with the lab.
- **Navigator:** Makes the decision on what step to do next. Their job is to describe the step using high level language ("Let's print out something when the user is scrolling"). They also have a browser open in case they need to do any research.
- **Driver:** is typing and their role is to translate the high level task into code ("Set the scroll view delegate, implement the didScroll method").
- After you finish each checkpoint, switch the Navigator and Driver roles. The person on the right will be the first Navigator.

### User Stories - What will our app do?

1. User can view and scroll through a list of Yelp restaurants.

## Let's Get Building

### Milestone 1: Setup Project + Storyboard

#### 0. Download the Yelpy Starter Lab: @[[assets/yelpy_starter_1.zip]]

#### 1. Add TableView to our `Main.storyboard`

- From the `+` objects library button, search and add the tableView to your storyboard:
  - ==NOTE:== You can reference **steps 1-4** of the [Basic Table View Guide](http://guides.codepath.org/ios/Using-UITableView#basic-table-view)

![Add TableView](https://i.imgur.com/iMtrlzo.gif)

- Connect your tableView outlet to your `RestaurantsViewController` file
- Open the your `RestaurantsViewController` file by holding the <kbd>alt/option</kbd> key and click on the file
- Hold the <kbd>control</kbd> key, then drag and drop the tableView to your View controller:

![Connect tableView outlet](https://i.imgur.com/OXU5uJO.gif)

#### 2. Add a Cell to our tableView

- Add a `tableViewCell` from `+` objects library +
  - Inside the cell, add a `label` and an `Image View` as well:

![Add label and Image view](https://i.imgur.com/PMCT5NB.gif)

- Create `RestaurantCell` file under the `Cells` folder
  - Configure cell's Class and Identifier on the 'Identity Inspector' + 'Attribute Inspector' to `RestaurantCell`:

![Cell attributes](https://i.imgur.com/3dYeMwc.gif)

[**Reference:** Creating a Custom Cell Guide](http://guides.codepath.org/ios/Using-UITableView#step-1-create-the-custom-cell)

- Create cell's label + image outlets on the `RestaurantCell` file:

![Cell Outlets](https://i.imgur.com/XKtmZVz.gif)

### Milestone 2: Hook up the Yelp API

On the lab starter, take a look at the `exampleAPI.json` file to get yourself familiarized with the JSON format of the response data from the API.

**Note:** For the purposes of this lab, we won't go into a lot of detail about the network request code because it's mainly a lot of repetitive configuration that--for the purposes of this course--won't ever change. Whats important for you to know are the next steps:

:::warning
:bulb: However, you can learn more about networks and APIs in our [course guides](https://guides.codepath.com/ios#networking-and-models) and in this [in-depth slide](https://docs.google.com/presentation/d/1XNZFyECpxZNzfCI-tXfGVxjaSRZQ3PmI9IKz0qJ2a_g/edit?usp=sharing) deck about API requests in Swift.
:::

#### 1. [Create a Yelp Account](https://www.yelp.com/developers/v3/manage_app) and generate an API Key

- Once generated, go to your `Network` folder and copy/paste your API key on the `API.swift`
- Next, lets add the logic to our API request:
  - Under the "TODO" section, type this:

![Getting API Data](https://i.imgur.com/yCZoGfd.png)

Here is the flow of the code:

- Traverse the data in JSON Format and convert it to a dictionary.
- From the dictionary, the "businesses" value is an array of businesses, so we convert it to an array of dictionaries that represent the data of each restaurant
- Return the array of dictionaries representing the restaurants
  - "What happens in closures, stay in closures." In order to get the data inside the closure, we use the @escaping method using the variable `completion` to return it.

:::warning
**Closures** are basically functions within a function. Make sure to review the [**Swift fundamentals**](https://guides.codepath.com/ios/Understanding-Swift#closures) to understand them!
:bulb: Tip: If you are having trouble understanding it at first glance, don't worry! No one really understands code at first glance. It takes a while to fully get the flow of how code works. But be sure to always ask questions!
:::

#### 2. Connect `RestaurantsViewController` to API data

- Initialize your `restaurantsArray` on your `RestaurantsViewController` file. It should look something like this:

```Swift
var restaurantsArray: [[String:Any?]] = []
```

![Initialize restaurantsArray](https://i.imgur.com/edjBpxl.jpg)

The `restaurantsArray` is our placeholder for storing all the data we get from the API request

- Create a function `getAPIData()` that retrieves the data from the API and stores the data in our `restaurantsArray` variable:

![getAPIData() Function](https://i.imgur.com/fFxsWND.png)       ```

### Milestone 3: Build the basic Restaurants Feed

#### 1. Configure tableView

- Add the tableView.delegate + tableView.dataSource on `viewDidLoad()`:

```Swift
// ––––– TODO: Add tableView datasource + delegate
override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self
}
```

- Add the protocols for `UITableViewDelegate` and `UITableViewDataSource` to your `RestaurantsViewController` class:

```Swift
class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    ...
}
```

- An error should pop up. In that error, click on "fix" to automatically add the protocol stubs and place them at the bottom of all your code:

![Protocol Stubs](https://i.imgur.com/rShwj0M.jpg)

- **==Note:==** The `numberOfRowsInSection` method simply tells the table view how many rows, or cells in this case, to create. How many cells do we want? Well, as many as we have restaurants. We can get that number by calling the `count` method on our `restaurantsArray` array. So, instead of returning a hard coded number like `5` we will want to `return restaurantsArray.count`. This is where you can get into trouble if `restaurantsArray` contains `nil` which is why we initialized `restaurantsArray` as an empty array because although empty, it is not `nil`.

#### 2. Configure tableView protocol stubs for cells

- Configure `numberOfCellsInSection` protocol stub:

![num of Rows](https://i.imgur.com/kaZOQG4.png)

- Configure our custom RestaurantViewCell:

    ```swift
    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantCell
    ```

- Configure `cellForRowAt` protocol stub:

![Cell forRowAt](https://i.imgur.com/vJuEfGK.png)

### ^^ What's happening here

- **References:** [Setting up the Image View](https://guides.codepath.org/ios/Working-with-UIImageView) in your Custom Cell:
  - Each cell will need a single `UIImageView`. Make sure to create an outlet from the image view to your **RestaurantCell** class and not your RestaurantsViewController class; after all, we created a the custom cell class to control the properties of our reusable cell. **DO NOT** name this outlet `imageView` to avoid colliding with the default `imageView` property of the `UITableViewCell` base class.
  - **NOTE:** The `tableView(_:cellForRowAt:)` method is called each time a cell is made or referenced. Each cell will have a unique `indexPath.row`, starting at `0` for the first cell, `1` for the second and so on. This makes the `indexPath.row` very useful to pull out objects from an array at particular index points and then use the information from a particular object to populate the views of our cell.
  - In the `tableView(_:cellForRowAt:)` method, pull out a single `restaurant` from our `restaurantsArray` array

    ```swift
    let restaurant = restaurantsArray[indexPath.row]
    ```

- Getting the image from the restaurant dictionary:
  1. It's possible that we may get a `nil` value for an element in the `restaurantArray`, i.e. maybe no images exist for a given restaurant. We can check to make sure it is **not** `nil` before unwrapping. We can check using a shorthand swift syntax called **if let**
  1. `restaurant` is a dictionary containing information about the restaurant. We can access the `restaurantArray` array of a `restaurant` using a **key** and **subscript syntax**.

- Implementation to getting the image:
  - 💡 This is the url location of the image. We'll use our AlamofireImge helper method to fetch that image once we get the url.
    1. Get the image url string from the restaurant dictionary
    1. Get the convert url string –> url
    1. set image using the image url with AlamofireImage

    ```swift
    // 1.
    if let imageUrlString = restaurant["image_url"] as? String {
        // 2.
        let imageUrl = URL(string: imageUrlString)
        // 3.
        cell.restaurantImage.af.setImage(withURL: imageUrl!)
    }
    ```

- Set the image view
  1. We'll be bringing in a 3rd party library to help us display our restaurant image. To do that, we'll use a library manager called CocoaPods. If you haven't already, **[install CocoaPods](http://guides.codepath.org/ios/CocoaPods#installing-cocoapods)** on your computer now.
  1. Navigate to your project using the Terminal and create a podfile by running, `pod init`.
  1. Add `pod 'AlamofireImage'` to your `podfile`, this will bring in the AlamofireImage library to your project.
  1. In the Terminal run, `pod install`. When it's finished installing your pods, you'll need to close your `xcodeproj` and open the newly created `xcworkspace` file.
  1. import the AlamofireImage framework to your file. Do this at the top of the file under `import UIKit`. This will allow the file access to the AlamofireImage framework.

        ```swift
        import AlamofireImage
        ```

  1. call the AlamofireImage method, `af_setImage(withURL:)` on your image view, passing in the url where it will retrieve the image.

        ```swift
        cell.restaurantImage.af.setImage(withURL: imageUrl!)
        ```

#### 3. Last Step! Update the table view to display any new information

- Our table view will likely be created before we get our data back from the network request. Anytime we have fresh or updated data for our table view to display, we need to call:
- Do this inside the **getAPIData()** function, right after we load the data we got back into our `restaurantsArray` property.

  ```swift
  // ––––– TODO: Get data from API helper and retrieve restaurants
  func getAPIData() {
      API.getRestaurants() { (restaurants) in
          guard let restaurants = restaurants else {
              return
          }            
          self.restaurantsArray = restaurants
          self.tableView.reloadData() // reload data!
      }
  }
  ```

- Call our `getAPIData()` from `viewDidLoad()`

    ``` Swift
    override func viewDidLoad() {
      ...            
      getAPIData()
    }
    ```

## Bonus

- [ ] Make your Yelpy app look like the one shown in the GIF introduction of the lab!
  - You can download the star ratings images from Yelp [**here**](https://www.yelp.com/developers/display_requirements)

## Gotchas

- If your app crashes with the exception: `Unknown class RestaurantsViewController in Interface Builder file`, try following the steps in this [stackoverflow answer](http://stackoverflow.com/questions/24924966/xcode-6-strange-bug-unknown-class-in-interface-builder-file/24924967#24924967).

- Compile Error: "No such module AlamofireImage"
  - Try cleaning and building your project. <kbd>Command</kbd> + <kbd>Shift</kbd> + <kbd>K</kbd> and <kbd>Command</kbd> + <kbd>B</kbd>
