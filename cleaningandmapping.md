# Cleaning and mapping

Food Standards Agency (FSA) data is a great way to get started with mapping - and cleaning. Here's how to use Open Refine to fetch, combine and clean that data - and then map it.

## Install Open Refine

First, [download and install Open Refine from the official website](http://openrefine.org/download.html). Open it up - it should open in a browser at http://127.0.0.1:3333/ - this is like an address pointing at your own computer rather than the web: you do not need to be connected to the internet to use it.

## Fetching (and combining) FSA data in Open Refine

Open Refine is one of the easiest ways to import and convert data from formats like XML and JSON into a spreadsheet you can analyse using Excel or Google Sheets.

1. Find some data for your area on the [Food Hygiene rating data API page](http://ratings.food.gov.uk/open-data/) - this will be in XML format
2. [Follow the tutorial I've written on the Online Journalism Blog here](https://onlinejournalismblog.com/2015/10/21/how-to-convert-xml-or-json-into-spreadsheets-using-open-refine/)

You can download and **combine** multiple XML files by adding more URLs (in separate boxes).

For a JSON example look for a petition of interest on the [UK Government's petitions website](https://petition.parliament.uk/petitions). Click on the petition page. At the bottom of each petition page should be a link to *Get petition data (json format)* - you can copy the URL for that page and use it to import the data into Open Refine in the same way.

## 'Clustering': fixing misspellings of the same thing

Food hygiene data is a particularly good example to demonstrate another feature of Open Refine.

Like a lot of data, the food hygiene data isn't as consistent as it could be: sometimes McDonalds has an apostrophe, sometimes not; sometimes it's WHSmith, sometimes W H Smith, and sometimes WH Smith. If you're trying to find out how many takeaways there are, your pivot table will be treating each of those as separate entities.

Open Refine has a built-in method for detecting entries that are similar enough that there's a good chance it's just a different spelling of the same thing: it's called clustering. Here's how to do it.

1. Follow the steps above to import the XML data for food hygiene inspections for a particular area: Birmingham's is the URL `http://ratings.food.gov.uk/OpenDataFiles/FHRS402en-GB.xml`
2. Once the project has been created, click on the downward arrow at the top of the *Establishment Detail - Business Name* column (it's normally the 6th column, after the rating out of 5). Select **Edit cells > Cluster and edit...**
3. A new window will appear showing you entries which are *different but very similar*. For example: Nandos, Nando's (with an apostrophe) and Nando'S (with a capital S). To make any cluster of similar entries all the same, tick the box next to each cluster where you are confident they *are* the same (for example Balti Spice and Spice Balti may be different businesses so you would leave that unticked), and then click the button at the bottom marked **Merge Selected & Re-Cluster**. (Tip: if you want to select most of them, it's probably easier to click **Select All** first, and deselect the few that aren't right.)
4. At this point it's worth knowing that what you were seeing was only one *type* of similarity - a particular clustering *algorithm*. Now you can try out a different one by selecting the *Keying Function* drop-down menu and choosing the next one: **ngram fingerprint**. Then, once again, tick the clusters you want to make consistent, and merge them as before. 
5. Repeat this process for the other two algorithms under *Keying Function*: metaphone3 and cologne-phonetic. 
6. That's 4 algorithms used - but there are another two. To access these, click on the *Method* drop-down menu to the left and switch from key collision to **nearest neighbour**. Wait for the clusters to appear and merge the ones that need fixing. For the final algorithm, change the *Distance Function* dropdown menu to **PPM**, and merge the ones that it gets right. 
7. Click **Close** to finish. 

You can now export the results and analyse them in Excel.

