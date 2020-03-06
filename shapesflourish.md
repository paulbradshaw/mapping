# Choropleth maps: mapping shapes in Flourish

If your data relates to administrative areas (countries, local authorities, constituencies, regions, police forces, CCGS) then you will need to create a **choropleth map**. This is a map that shows *shapes* instead of *points*.

To do this you need at least *two* sets of data:

* The data containing the names or codes for the areas and any values you want to show
* Data containing the coordinates of the areas - often called **shape files**

Luckily, a number of data visualisation tools have the second part built in for certain areas. Flourish, for example, has constituencies and local authorities (and London boroughs only) for the UK and Great Britain, as well as European countries and administrative districts for countries including the US, Spain and India. Datawrapper has even more, including police force areas and CCGs. 

However, if Datawrapper or Flourish does not have the areas you want to use, you will need to find the data for those shapes, in GeoJSON format (you can convert to this format from others, such as KML or Shapefile).

Both are also somewhat limited when it comes to showing just one region: because all the shapes are at a national level, if your data only relates to one region then there is no way to exclude the rest, and in most cases zoom levels don't go in close enough to address this. In this situation you will also need a shapefile for the specific area. 

## Matching your data to the shape data

Those two datasets - the area names/codes and values, and the area shapes - will **need to match up** in some way. In other words, the names or codes in the shapes dataset will need to match up with some names or codes in your values dataset. 

Before mapping, it's a good idea to check that this is the case, and clean up any that don't match. That's especially likely if you are matching on names rather than codes, because your version might use 'and' where the shapes data might use '&' or have other slight variations in naming.

Flourish, in fact, doesn't use codes for its shapes, which makes it more vulnerable to this problem. 

To check, then, go to Flourish's templates page at https://app.flourish.studio/templates and scroll down to the *Projection map* section. Click on the **Great Britain (local authorities)** map to start creating one.

A new visualisation should open. It will be in *Preview* view, where you can see the map you are creating. 

Switch to the *Data* view by clicking on that tab towards the top of the screen. 

There will be a *Regions* data tab, and a *Points* one. 

The *Points* table has some default data showing certain cities. Delete all this.

The *Regions* table has 3 columns: `geometry`, `id` and `Value`. 

Click on the drop-down arrow on the **Regions** tab and select **Download data** - select **Current sheet only**.

You will now have a copy of the data from the map. In the Values column use a VLOOKUP formula to fetch the values from your own data so that you have the values you want to visualise.

Chances are that in some cases the formula will give you an error (sort the column to bring these to the top). These will be the ones with some slight variation in naming - so go to the original data and check that the places are named the same.

Once you've finished cleaning up the data, you can return to Flourish and click **Upload data file** in the upper right corner of the data, and upload that file.

Switch to the *Preview* tab and you should now see those values visualised on your map. 

Use the options on the right to customise your map, adding a heading and intro, footer, and trying different colours etc.

## Only showing certain areas

There is a very simple way of limiting your visualisation to certain authorities or constituencies - delete all the others entirely.

When you download the data, sort it to bring all the ones you want to keep to the top (e.g. sort by value if some don't have any), and then delete the rows you want to omit.

When you upload it, the map will only show those areas.

## Getting shapes for other areas in GeoJSON

If you want to show other sorts of areas that aren't already in the data visualisation software, then you'll need to find the data describing those areas. Ideally these should be in GeoJSON format, but often you will find these in Shapefile format, or KML. In those cases you will need to convert to GeoJSON so that it will be recognised by Datawrapper or Flourish. 

If that's the situation Google "convert shapefile to geojson" and try one of the tools that you find, e.g. [https://mapshaper.org/](https://mapshaper.org/)

Once you've got a GeoJSON file, go into Flourish to create a new visualisation, scroll to the Projection map section, and click on the first option: **Blank (upload your own)** then upload the file to the Regions tab.

As before, you can now download this and match with other data.
