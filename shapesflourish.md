# Choropleth maps: mapping shapes in Flourish

If your data relates to administrative areas (countries, local authorities, constituencies, regions, police forces, CCGS) then you will need to create a **choropleth map**. This is a map that shows *shapes* instead of *points*.

To do this you need at least *two* sets of data:

* The data containing the names or codes for the areas and any values you want to show
* Data containing the coordinates of the areas - often called **shape files**

Luckily, a number of data visualisation tools have the second part built in for certain areas. Flourish, for example, has constituencies and local authorities (and London boroughs only) for the UK and Great Britain, as well as European countries and administrative districts for countries including the US, Spain and India. Datawrapper has even more, including police force areas and CCGs. 

However, if Datawrapper or Flourish does not have the areas you want to use, you will need to find the data for those shapes, in GeoJSON format (you can convert to this format from others, such as KML or Shapefile).

Both are also somewhat limited when it comes to showing just one region: because all the shapes are at a national level, if your data only relates to one region then there is no way to exclude the rest, and in most cases zoom levels don't go in close enough to address this. In this situation you will also need a shapefile for the specific area. 

## Matching your data to the shape data

Those two datasets - the area names/codes and values, and the area shapes - will **need to match up** in some way. In other words, the tool you are using will combine 

## Getting shapes for other areas in GeoJSON
