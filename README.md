mapguide-sample-melbourne
=========================

This is an example MapGuide Data Package using open data from [City of Melbourne](https://data.melbourne.vic.gov.au/)

License
=======

All data from City of Melbourne licensed under [CC BY 3.0 AU](http://creativecommons.org/licenses/by/3.0/au/deed.en)

Map icons courtesy of [Map Icons Collection](http://mapicons.nicolasmollet.com/) and licensed under [Creative Commons 3.0 BY-SA](https://creativecommons.org/licenses/by-sa/3.0/us/)

This MapGuide data package and its resources are licensed under [CC BY 3.0 AU](http://creativecommons.org/licenses/by/3.0/au/deed.en)

Datasets Used
=============

For convenience, all mentioned datasets are included in this repo to simplify the package build process (CC permits redistrubtion and re-mixing of data licensed under it)

SHP
---

Where applicable, extraneous files (*.sbn, *.sbx, *.xml) have been removed from the original SHP "file" in this repo

 * [Address Points](https://data.melbourne.vic.gov.au/Property-and-Planning/Address-Points/a7rp-xtya)
 * [Building Footprints](https://data.melbourne.vic.gov.au/Property-and-Planning/Building-Foot-Prints/qe9w-cym8)
 * [City Circle Route](https://data.melbourne.vic.gov.au/Transport/City-Circle-Route/nmnx-3ct3)
 * [City Circle Stops](https://data.melbourne.vic.gov.au/Transport/City-Circle-Stops/dh3m-ckxm)
 * [Major Features](https://data.melbourne.vic.gov.au/dataset/Major-Features/55i7-4f8v)
 * [Municipal Boundary](https://data.melbourne.vic.gov.au/Property-and-Planning/Municipal-Boundary/ck33-yh8z)
 * [Property Boundaries](https://data.melbourne.vic.gov.au/Property-and-Planning/Property-Boundaries/e56b-j9mj)
 * [Syringe Bins](https://data.melbourne.vic.gov.au/Community/Syringe-Bins/96gt-j9ix)
 * [Census Of Land Use And Employment (CLUE) Small Area](https://data.melbourne.vic.gov.au/dataset/Census-Of-Land-Use-And-Employment-CLUE-Small-Area-/gei8-3w86)
 * [Census of Land Use and Employment Blocks - 2012](https://data.melbourne.vic.gov.au/Business/Census-of-Land-Use-and-Employment-Blocks-2012-Map/aia8-ryiq)
 * [FootpathGrades](https://data.melbourne.vic.gov.au/Property-and-Planning/Footpath-Gradients/rpt3-2axt)
 * [Road Corridor](https://data.melbourne.vic.gov.au/Property-and-Planning/City-of-Melbourne-Road-Corridor/rnwk-3yw9)
 * [Overland Flow Routes](https://data.melbourne.vic.gov.au/Environment/Overland-Flow-Routes-Urbanforest/6yxs-smdz)

CSV
---

All CSV datasets below are converted to [SQLite](http://www.gdal.org/drv_sqlite.html) via [ogr2ogr](http://www.gdal.org/ogr2ogr.html).

The original source CSV files are included in this repo un-modified.

[VRT configuration files](http://www.gdal.org/drv_vrt.html) to allow ogr2ogr to convert to SQLite are also included in this repository

 * [Building Accessibility location map](https://data.melbourne.vic.gov.au/Property-and-Planning/Building-Accessibility-location-map/63vh-4yw9)
 * [Melbourne Bike Share Locations Map](https://data.melbourne.vic.gov.au/Recreation/Melbourne-Bike-Share-Locations-Map/rrw4-gj7n)
 * [Melbourne's Urban Forest Map](https://data.melbourne.vic.gov.au/Environment/Melbourne-s-Urban-Forest-Map/8reg-ju2w)

Requirements
============

The build environment assumes a Windows operating system.

For preparing and building the data package:
 
 * [GDAL/OGR](http://www.gdal.org/) 1.11 (you can grab windows binaries [here](http://gisinternals.com/sdk/))
 * [7-zip](http://www.7-zip.org/)

Supported versions of MapGuide:

 * [MapGuide Open Source](http://mapguide.osgeo.org/) 2.6 (this dataset should also work on 2.5 and 2.4 releases)

Building
========

 1. Ensure GDAL/OGR binaries and the 7z command-line executable are in the PATH environment variable
 2. Clone this repository
 3. Run build.bat to build the MapGuide data package from the source data files

How this dataset is constructed/updated
=======================================

 1. All the SHP files are loaded into MapGuide via [MapGuide Maestro](http://trac.osgeo.org/mapguide/wiki/maestro)
 2. All the CSV files are converted into SQLite via [ogr2ogr](). The converted SQLite files are loaded into MapGuide via Maestro.
 3. Maestro was used to author up all the various layers, styles, maps, symbols and application configurations.
 4. The resulting set of resources was then packaged up into a MGP file via the MapGuide Site Administrator.
 5. The contents of this MGP package has been extracted into the `Package` subdirectory of this repo (so our XML-based resources can be version controlled).
 6. Package assembly can now be done outside of MapGuide by copying the relevant source SHP files and converting the relevant source CSV files with ogr2ogr. A new package file can be created by creating a new zip archive of the `Package` subdirectory and renaming the `.zip` extension to `.mgp`