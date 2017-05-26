# Notes on a tutorial for creating a swing map in D3

This is based on [a tutorial](https://medium.com/@puntofisso/how-to-create-an-interactive-vote-swing-viewer-in-d3-a6bbd4c96b6f).

It's a useful tutorial because it actually involves a range of skills: R, command line, and JavaScript.

## Download the data

First, you need to download the data from the [British Election Study](http://www.britishelectionstudy.com/data-objects/linked-data/): *Version 2.21 2015 BES Constituency Results with Census and Candidate Data*. This comes in [SPSS](http://www.britishelectionstudy.com/custom/uploads/2017/05/BES-2015-General-Election-results-file-v2.21.sav) or [Stata](http://www.britishelectionstudy.com/custom/uploads/2017/05/BES-2015-General-Election-results-file-v2.21.dta) format, so we'll need to convert that.

## Using R to convert to CSV or JSON

R is very useful for importing either format (I [wrote about that here](https://github.com/paulbradshaw/Rintro/blob/master/stata_spss/stata-spss-election-survey.Rmd)), and then you can export in whatever format you want. Here's the code:

```r
#install the package for reading stata
install.packages("readstata13")
library(readstata13)
#read data into new object
election15results <- read.dta13("http://www.britishelectionstudy.com/custom/uploads/2017/05/BES-2015-General-Election-results-file-v2.21.dta")
```

Now we have the data we can just export. But we may as well delete some columns while we're at it.

```r
#This just grabs columns 1, 3, 7 and 16 and puts in a new object
election15clean <- election15results[c(1,3,7,16)]
```

## Exporting as JSON from R

Now to export as JSON. In [the tutorial](https://medium.com/@puntofisso/how-to-create-an-interactive-vote-swing-viewer-in-d3-a6bbd4c96b6f), Giuseppe uses a bash script to do this from a CSV of the data. That's pretty cool, but we can do all that in R instead:

```
#install the jsonlite library
library("jsonlite")
election15json <- toJSON(election15clean)
write(election15json,"election15.json")
```

## Using command line to convert a CSV to JSON

If you do want a CSV file to do that bash thing, you can export one too:

```
write.csv(election15clean,"election15.csv")
```

Running the bash script is cool, but Giuseppe assumed a bit of knowledge I'll fill in here. Firstly, you need to copy the text of the shell script and save it with a `.sh` extension in the same folder as your CSV. Second, make sure that the CSV file named in the bash script, right at the end, is the same as yours (he calls his bes.csv). Finally, navigate to the same folder using Terminal or PowerShell, and when you run the script, make sure to identify an output for it, e.g. `csvtojson.sh > newjsonfile.json`. I've [written more about command line and shell scripts here](https://github.com/paulbradshaw/commandline). Also, remember he says to delete the final comma in the resulting file (open in a text editor).

## On to the HTML webpage

Giuseppe mentions that he used a bootstrap template. Looking into the HTML of his page, I'm guessing it's [this one: Paper Dashboard](https://www.creative-tim.com/product/paper-dashboard). But you can just copy the source HTML from [his page](http://swing.puntofisso.net/) and begin to adapt it.

In particular, most of the links to CSS and JS files will need changing to a copy in your own folder, or a version from [CDNJS](https://cdnjs.com/). As he says: *"Remember to add the latest jquery library and D3 (my code uses D3 version 4)"*.

These lines are the ones that need changing:

`<script src="assets/js/d3.v4.min.js"></script>`

to:

`<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.9.1/d3.min.js"></script>`

And:

`<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>`

to:

`<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" type="text/javascript"></script>`
