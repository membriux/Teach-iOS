
# Project 1 & 2- *Flix Pt.1 and Pt.2*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **2 + 2** hours spent in total

## User Stories

The following **required** user stories are complete:

Pt.1 
- [x] User sees app icon in home screen and styled launch screen (+1pt)
- [x] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [x] User can "Pull to refresh" the movie list (+2pt)
- [x] User sees a loading state while waiting for the movies to load (+2pt)

Pt.2 
- [x] User can tap a cell to see a detail view (+5pts)
- [x] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **stretch** user stories are implemented:

Pt.1 
- [ ] User sees an alert when there's a networking error (+1pt)
- [x] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user see's a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [ ] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

Pt.2
- [x] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [ ] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [x] Customize the navigation bar (+1pt)


The following **additional** user stories are implemented:

Pt.1
- [x] Can view more movies when pulling down to refresh. 

Pt.2
- [x] Added refresh control to load more movies
- [x] Added search bar functionality to search through movies on the collection view

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):


Pt.1
1. It was a bit challenging thinking about how to implement the search bar at first until I thought carefully about how to do it. I think creating an example implementing the search bar with data fetched by the API would make it easier. Or creating a walkthrough would be very useful since the searchbar is ean essential tool for iOS Apps. 
2.Creating a walkthrough that organizes the files would be helpful.

Pt.2
1. Surprisingly, I had less issues while creating the collection view. This is most likely due to the fact that it was because it was similar to the tableview.
2. I had a little bit of trouble finding the best way to add the border color for posterImage view. But I was able to find a short and easy way on Stack overflow

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Pt.1


<img src='https://github.com/membriux/iOSCodePath/blob/master/Flix/walkthrough.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

Pt.2


<img src='https://github.com/membriux/iOSCodePath/blob/master/Flix/walkthroughPt2.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The main challenge I encountered was using a lot of "as! String" and "as? String". It was very confusing since I am used to using SwiftyJSON, which is a handy iOS library that handles those issues and repetetive code. Hopefully we get to use it teach it as a tool to our fellow iOS Codepath students.

## License

    Copyright [2018] [Guillermo Sanchez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


# Lab 3 - *Name of App Here*

**Name of your app** is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **X** hours spent in total

## User Stories

The following **required** user stories are complete:

- The following screens use AutoLayout to adapt to various orientations and screen sizes
   - [x] Movie feed view (+3pt)
   - [x] 1/2 Detail view (+2pt)

The following **stretch** user stories are implemented:

- [x] Dynamic Height Cells (+1)
- [ ] Collection View AutoLayout (+2)

The following **additional** user stories are implemented:

- [ ] List anything else that you can get done to improve the app functionality! (+1-3pts)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I would like to discuss the aspect ratio. I am still having problems with it even after I set it up to be 1/3 for the detail view.
2. There is a problem with my orientation layout when I use my search tool bar to search for a movie while it's oriented in a different position. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/link/to/your/gif/file.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

- I still haven't been able to fix the collection view layout or the details view layout. Even though I set the height of the background image to the aspect ratio of 1/3, it still remains to be taking the full size of the screen. I also caught a new error. When searching movies in a different orientation and tap on it, it shows the details of the first index movie rather than the one I searched for.

## License

    Copyright [2018] [Guillermo Sanchez]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
