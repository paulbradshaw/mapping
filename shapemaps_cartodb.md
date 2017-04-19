# Creating shape maps in CartoDB

## Find both sets of data: values, and shapes

First you need to find the data you want to map. Normally you will need to merge **two** datasets:

1. Firstly, the values you want to show on the map (these might be numerical, such as crime rates or votes, or categorical, such as food ratings or political party)
2. Secondly, the *shapes* you want to put on the map (colouring them comes later)

For the second part [read step 1 and 2 of this guide to shape files and Google Fusion Tables here](https://github.com/paulbradshaw/mapping/blob/master/shapefiles_fusiontables.md). See also the notes at the end of this for other examples of shape files outside of Fusion Tables.

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

Now you have the option to choose with parts of each dataset will be carried into the new one. If you just want everything then switch on the 'Select all columns' button in the bottom right, or you can turn them off and on individually.

Click **Merge datasets**

After a few moments the new, merged, dataset will be ready and you'll be taken to the data view of that new dataset. Scroll to the right to check the fields are there from both datasets.

Note the name of this new dataset in the upper left corner: you can change this by clicking on it and editing it.

You can also switch to 'Map view' at the top. At this stage all the shapes will still be the same colour, but you can change that by clicking on the 'Wizard' button on the right side (a paint brush icon), selecting the type of effect you want (choropleth for numerical values like crimes or votes; category for things like parties or food ratings).

Once you select an effect you can then select the column that determines the colour from a dropdown menu underneath. And at this point the data from one dataset (values) is affecting the data from another (shapes).

## Other shape files

Sometimes you can't find the shapes on Fusion Tables. In that case, you need to look more widely for shape files. For example, if you want to use constituencies you might find [this guide](http://hublog.hubmed.org/archives/001987.html) that links to [this zip file of political constituencies](https://github.com/hubgit/boundary-line-constituencies-simplified/blob/master/simplified-1/westminster_constituencies.zip).

To use those constitencies, drag and drop *the zip file* when creating a new dataset in Carto. You do not need to unzip it, and indeed it will reject any attempt to do so. Once added, you can merge it with other datasets as detailed above.
