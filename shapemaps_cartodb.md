# Creating shape maps in CartoDB

## Find both sets of data: values, and shapes

First you need to find the data you want to map. Normally you will need to merge **two** datasets:

1. Firstly, the values you want to show on the map (these might be numerical, such as crime rates or votes, or categorical, such as food ratings or political party)
2. Secondly, the *shapes* you want to put on the map (colouring them comes later)

For the second part [read step 1 and 2 of this guide to shape files and Google Fusion Tables here](https://github.com/paulbradshaw/mapping/blob/master/shapefiles_fusiontables.md).

If you need some data to play with, here is a [fusion table with shapes for the political wards in Birmingham](https://www.google.com/fusiontables/DataSource?docid=1IYgtXCWjcqV3u8_Gv67KbJofK0k4zBUsIPNabqU#map:id=3). Download it in both KML and CSV, and use `VLOOKUP` to check it against [this sample file](https://drive.google.com/file/d/0B5To6f5Yj1iJOENXRmxGcFFIUFU/view?usp=sharing)

## Upload your KML file, and the 'values' data file, to CartoDB

Log in to CartoDB and click on **NEW MAP** (normally in the upper right corner)

Click on **Connect dataset** and upload your KML file.

Once it's finished, the data will be previewed to you. At the top you can switch between 'Data view' and 'Map view'. Click on 'Map view' to check those shapes have been imported correctly. At the moment they'll all be the same colour and you don't have any values to colour-code them by, but that's the next step...

Come out of the map by clicking on the backward arrow in the upper left corner. Or just change the URL to CartoDB.com.

Click on **NEW MAP** again and click on **Connect dataset**. This time, upload your CSV or XLS file **containing the values you want to show** on this map.

## Merge the two maps

Now that you have both the shapes and the values in CartoDB, you can create a new map by combining the two.

To do this, you need to be within *one* of those maps. 

While in a map, click on **Edit** in the upper right corner and select **Merge with dataset...**

![](https://github.com/paulbradshaw/mapping/blob/master/cartomerge.png?raw=true)

You'll then be asked what type of merge you want to do. Select **Column join**.

![](https://github.com/paulbradshaw/mapping/blob/master/cartojoin.png?raw=true)

You should now be able to choose which dataset you want to merge with, using a drop down list on the right hand side.

Then you now need to choose the column in each dataset that you are joining on. In other words, the column which each dataset has in common (the name of the column can be different, but the values in it must be the same).

For example, in the wards KML example above the column with the ward names is called `wd12nm`, but in another it might be `wardname`.

Select the relevant column from the dataset on the left, and from the one on the right.

Then click **Next step**.



