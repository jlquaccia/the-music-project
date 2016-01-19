# The Music Project

TMP is a practice project of mine which revolves around 2 main components:

1. Customized music news based on artists that _you_, the user, follows.
2. Customized calendar of upcoming concerts based on artists that _you_, the user, follows.

Checkout my app on [Heroku](https://el-proyecto-de-la-musica.herokuapp.com), under it's working title **_El Proyecto de la Musica_**

# A Brief Walkthrough

TMP is a practice project of mine which I thought would be cool and fun to build. Basically, as a user on TMP you will first sign up then shortly after receive a confirmation email with further instructions on how to log in. Next you will be redirected to your profile page, which will appear pretty vacant and unoccupied at first (empty Spotify player, lots of blank space, etc.).

In order to do anything on TMP you must first choose at least one artist to follow, everything on the site revolves around this. If you go to the Artist Search page you will be presented the option to search for any artist that resides in Spotify's catalog of music. Let's say you choose to follow an artist like, hmm.. how about Metallica. Upon searching for Metallica you will see search results that are sorted by followers total on Spotify, so basically by popularity. Metallica should appear at the top of the list, proceed to follow them by clicking the link to follow.


## Profile

Next you will be redirected back to your profile page and for the first time, actually see that it is populated with stuff! User profile pages consist of 3 main components:

### 1. Music

Immediately you will notice a Spotify player planted on the left side of the screen. Now that you are following an artist, Metallica, you will see that the player has been filled with tracks by this artist. These will be the top 10 tracks by any artist that you choose to follow. If you follow multiple artists, 10 additional tracks will be added to the Spotify player per each artist. Tracks are automatically shuffled as they come in as well making the order vary with every page refresh. Note: Spotify doesn't allow music to be streamed off of their site unless you have an account with them. Upon trying to hit the play button within your TMP profile you will be redirected to a Spotify page prompting you to either sign in or sign up with them. This doesn't take long, and is worth it. Additionally, you can only play tracks from your profile page through either the Spotify Web Player or a downloaded copy of the Spotify application on your computer. Again, Spotify rules..

### 2. Follows

On the right side of the screen you will see a list of all artists that you are currently following. This list can be edited from your profile by clicking the edit button and selecting any or all artists that you may wish to unfollow at any point.

### 3. Recommendations

As you scroll down the page you will see a list of suggested artists that you might like. Of course this list will be based upon that are following. All recommendations are in order of followers total on Spotify. So artists with more followers on Spotify will show up on the top of the list. This will dynamically change as you begin to follow multiple artists on TMP. Recommendations pertaining to each artist you follow will be integrated together and the most popular artists will remain in the list. A maximum of 50 artists will be suggested.


## Artist Search

Again TMP is connected to the Spotify API meaning that any artist that resides in the Spotify's catalog will be searchable on TMP. Search results are displayed in order of popularity. You can choose which artist you want to follow here.


## Newsfeed

Links to news articles relating to your followed artists will appear here, if there is news to be shared (otherwise you will see a message that reads "No news to report.."). All artist news is coming from Pitchfork.com


## Calendar

If any of the artists you follow happen to have upcoming concerts in your area, a list of each concert along with relevant information can be found in the calendar section of your TMP account. All upcoming shows are sorted in chronological order and include information about the artist (official website, facebook page), the location of the venue they are playing, a link to purchase tickets, a link to get directions to the show and lastly information about the date and time of the show.


In a nutshell, this has been a crash course on what The Music Project is all about and how to use it. Further instruction: Find out when your favorite band is playing around you and go see a show!

Listen Loud.