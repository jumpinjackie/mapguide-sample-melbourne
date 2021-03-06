@echo off
SET SRC_SHP=%CD%\SourceData\SHP
SET SRC_CSV=%CD%\SourceData\CSV
SET PKG_ROOT=%CD%\Package
SET PKG_DATA=%PKG_ROOT%\Library\Samples\Melbourne\Data

REM Convert CSV files to SQLite
for /F "tokens=*" %%A in (vrtfiles.txt) do (
    echo [convert]: %%A.csv
    pushd "%SRC_CSV%"
    ogr2ogr -overwrite -gt 65536 -f "SQLite" "%%A.sqlite" "%%A.vrt"
    echo [copy]: %%A.sqlite
    copy /Y "%%A.sqlite" "%PKG_DATA%\%%A.FeatureSource_DATA_%%A.sqlite"
    popd
)

REM Copy SHP files
for /F "tokens=*" %%A in (shpfiles.txt) do (
    echo [copy]: %%A.shp
    copy /Y "%SRC_SHP%\%%A.shp" "%PKG_DATA%\%%A.FeatureSource_DATA_%%A.shp"
    copy /Y "%SRC_SHP%\%%A.dbf" "%PKG_DATA%\%%A.FeatureSource_DATA_%%A.dbf"
    copy /Y "%SRC_SHP%\%%A.prj" "%PKG_DATA%\%%A.FeatureSource_DATA_%%A.prj"
    copy /Y "%SRC_SHP%\%%A.shx" "%PKG_DATA%\%%A.FeatureSource_DATA_%%A.shx"
)
echo [build]: MapGuide Data Package
pushd %PKG_ROOT%
7z a -tzip Melbourne.mgp Library/ MgResourcePackageManifest.xml
popd