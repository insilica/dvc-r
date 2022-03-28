
# dvcr

This package provides a simple wrapper around [Data Version Control (DVC)](https://dvc.org/).

## Prerequisites 

1. You will need to [install dvc](https://dvc.org/doc/install).

2. Make sure that your R installation can see the `dvc` bin. 

You should see a `dvc` help menu if you type this into the R console
```{r}
system("dvc")
```

If not, find the path of `dvc` in your terminal
```
$ which dvc
/usr/local/bin/dvc
```

Make sure the path to `dvc` (e.g. `/usr/local/bin`) is in your R
env

```{r}
Sys.getenv("PATH")
```

If not, use this command to add it to your R system env
```{r}
Sys.setenv(PATH=paste0(Sys.getenv("PATH"),":","/usr/local/bin"))
```

Add the above line to your `.Rprofile` file to ensure it can be found
on restart

## Installation

``` r
devtools::install_github("insilica/dvcr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dvcr)
## basic example code

# setup dvc in your current project
dvcr::use_dvc()

# tell dvc to track a file
write.csv2(x = mtcars, file = "mtcars.csv")
dvcr::add(path = "mtcars.csv")

# setup remote storage
dvcr::remote_add(name = "myremote", url = "s3://my-bucket/dvc-storage")
dvcr::push()
dvcr::pull()
```

## Overview

[Data Version Control](https://dvc.org/), or DVC, is a data and ML experiment management tool that takes advantage of the existing engineering toolset that you're already familiar with (Git, CI/CD, etc.).  See the [official documentation](https://dvc.org/doc) for a full overview of DVC's functionality.
 
The purpose of this package is to aid in using DVC from within R.  For example, you may want to run DVC commands from an RMarkdown file as part of an analysis. The primary focus of the package currently implements the data tracking functionality of DVC.  

