# ---- Load libraries ----
library(tibble)

# ---- Build data ----
query_urls <-
  tribble(
    # Column Names
    ~demog_type, ~id, ~date, ~license, ~query, ~source,

    # - Ethnicity -
    "ethnicity", "ethnicity21_lsoa21", "29.11.22", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts021.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "ethnicity", "ethnicity21_ltla21", "29.11.22", "OGLv3", "https://www.ons.gov.uk/visualisations/dvc2203/map/datadownload.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/culturalidentity/ethnicity/bulletins/ethnicgroupenglandandwales/census2021",
    "ethnicity", "ethnicity21_msoa21", "29.11.22", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts022.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "ethnicity", "ethnicity21_ltla21_ni", "22.09.22", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-ms-b01.xlsx", "https://www.nisra.gov.uk/publications/census-2021-main-statistics-ethnicity-tables",

    # - Disability -
    "disability", "disability21_lsoa21_ew", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts038.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "disability", "disability21_lgd21_ni", "2021", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-ms-d03.xlsx", "https://www.nisra.gov.uk/publications/census-2021-main-statistics-health-disability-and-unpaid-care-tables",
    
    # - Households -
    "population", "age_gender_hsct20_ni", "06.07.23", "OGLv3", "https://www.ninis2.nisra.gov.uk/Download/Population/Population%20Estimates%20Broad%20Age%20Bands%20(administrative%20geographies).ods", "https://www.ninis2.nisra.gov.uk/public/AreaProfileReportViewer.aspx?tabchangeReportName=Investing%20for%20Health?",
    "population", "age_gender_ltla21_ni", "31.05.23", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-ms-a08.xlsx", "https://www.nisra.gov.uk/publications/census-2021-main-statistics-demography-tables-age-and-sex",
    "population", "age_gender_ltla21_ew", "31.05.23", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts009.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "population", "households_england_wales", "28.06.22", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationandhouseholdestimatesenglandandwalescensus2021/census2021/census2021firstresultsenglandwales1.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationandhouseholdestimatesenglandandwalescensus2021",
    "population", "households_northern_ireland", "24.05.22", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-population-and-household-estimates-for-northern-ireland-tables-24-may-2022.xlsx", "https://www.nisra.gov.uk/publications/census-2021-population-and-household-estimates-for-northern-ireland",

    # - Household deprivation -
    "deprivation", "household_deprivation21_lsoa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts011.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "deprivation", "household_deprivation21_oa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts011.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",

    # - Household overcrowding -
    "overcrowding", "household_overcrowding21_lsoa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts052.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "overcrowding", "household_overcrowding21_oa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts052.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",

    # - Household tenure -
    "tenure", "household_tenure21_lsoa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts054.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "tenure", "household_tenure21_oa21", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts054.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    
    # Migration census 2021 data
    "migration", "migration21_msoa21", "21.03.21", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts019.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",

    # - Population estimates -
    "population", "estimates17_lsoa11", "25.10.18", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates/mid2017/sape20dt1mid2017lsoasyoaestimatesformatted.zip", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates",
    "population", "estimates19_lsoa11", "09.11.20", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2flowersuperoutputareamidyearpopulationestimates%2fmid2019sape22dt2/sape22dt2mid2019lsoasyoaestimatesunformatted.zip", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates",
    "population", "estimates19_ltla19", "24.06.20", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fpopulationestimatesforukenglandandwalesscotlandandnorthernireland%2fmid2019april2019localauthoritydistrictcodes/ukmidyearestimates20192019ladcodes.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates19_ltla20", "24.06.20", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland/mid2019april2020localauthoritydistrictcodes/ukmidyearestimates20192020ladcodes.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates19_msoa11", "09.11.20", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/middlesuperoutputareamidyearpopulationestimates/mid2019sape22dt4/sape22dt4mid2019msoasyoaestimatesunformatted.zip", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/middlesuperoutputareamidyearpopulationestimates",
    "population", "estimates19_utla19", "24.06.20", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fpopulationestimatesforukenglandandwalesscotlandandnorthernireland%2fmid2019april2019localauthoritydistrictcodes/ukmidyearestimates20192019ladcodes.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates19_utla20", "24.06.20", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland/mid2019april2020localauthoritydistrictcodes/ukmidyearestimates20192020ladcodes.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates20_dz11", "11.10.21", "OGLv3", "https://www.opendata.nhs.scot/datastore/dump/c505f490-c201-44bd-abd1-1bd7a64285ee?bom=True", "https://www.opendata.nhs.scot/dataset/population-estimates/resource/c505f490-c201-44bd-abd1-1bd7a64285ee",
    "population", "estimates20_lsoa11", "16.109.21", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2flowersuperoutputareamidyearpopulationestimates%2fmid2020sape23dt2/sape23dt2mid2020lsoasyoaestimatesunformatted.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/lowersuperoutputareamidyearpopulationestimates",
    "population", "estimates20_ltla20", "25.06.21", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fpopulationestimatesforukenglandandwalesscotlandandnorthernireland%2fmid2020/ukpopestimatesmid2020on2020geography.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates20_ltla21", "25.06.21", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fpopulationestimatesforukenglandandwalesscotlandandnorthernireland%2fmid2020/ukpopestimatesmid2020on2021geography.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates20_msoa11", "16.109.21", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fmiddlesuperoutputareamidyearpopulationestimates%2fmid2020sape23dt4/sape23dt4mid2020msoasyoaestimatesunformatted.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/middlesuperoutputareamidyearpopulationestimates",
    "population", "estimates20_utla20", "25.06.21", "OGLv3", "https://www.ons.gov.uk/file?uri=%2fpeoplepopulationandcommunity%2fpopulationandmigration%2fpopulationestimates%2fdatasets%2fpopulationestimatesforukenglandandwalesscotlandandnorthernireland%2fmid2020/ukpopestimatesmid2020on2021geography.xls", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/populationestimatesforukenglandandwalesscotlandandnorthernireland",
    "population", "estimates21_ltla21_scot", "13.07.21", "OGLv3", "https://www.nrscotland.gov.uk/files//statistics/population-estimates/mid-21/mid-year-pop-est-21-data.xlsx", "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/population/population-estimates/mid-year-population-estimates/mid-2021",
    "population", "estimates_hb19", "15.07.22", "OGLv3", "https://www.opendata.nhs.scot/dataset/7f010430-6ce1-4813-b25c-f7f335bdc4dc/resource/27a72cc8-d6d8-430c-8b4f-3109a9ceadb1/download/hb2019_pop_est_15072022.csv", "https://www.opendata.nhs.scot/dataset/population-estimates/resource/27a72cc8-d6d8-430c-8b4f-3109a9ceadb1",
    "population", "estimates22_ltla19_scot", "15.07.22", "OGLv3", "https://www.nrscotland.gov.uk/files//statistics/population-estimates/mid-22/mid-year-pop-est-22-data.xlsx", "https://www.nrscotland.gov.uk/statistics-and-data/statistics/statistics-by-theme/population/population-estimates/mid-year-population-estimates/mid-2022#:~:text=Of%20the%2032%20council%20areas,and%20Orkney%20Islands%20with%2022%2C020)",
    "population", "estimates21_scot", "", "OGLv3", "https://statistics.gov.scot/slice/observations.csv?&dataset=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Fpopulation-estimates-2011-datazone-linked-dataset&http%3A%2F%2Fpurl.org%2Flinked-data%2Fsdmx%2F2009%2Fdimension%23refPeriod=http%3A%2F%2Freference.data.gov.uk%2Fid%2Fyear%2F2021&http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fdimension%2Fage=http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fconcept%2Fage%2Fall&http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fdimension%2Fsex=http%3A%2F%2Fstatistics.gov.scot%2Fdef%2Fconcept%2Fsex%2Fall", "https://statistics.gov.scot/data/population-estimates-2011-datazone-linked-dataset",

    # - Population estimate OA -
    # East Midlands
    "population", "population20_oa11_em", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesintheeastmidlandsregionofengland/mid2020sape23dt10f/sape23dt10fmid2020coaunformattedsyoaestimateseastmidlands.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # North West
    "population", "population20_oa11_nw", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthenorthwestregionofengland/mid2020sape23dt10b/sape23dt10bmid2020coaunformattedsyoaestimatesnorthwest.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # South East
    "population", "population20_oa11_se", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthesoutheastregionofengland/mid2020sape23dt10i/sape23dt10imid2020coaunformattedsyoaestimatessoutheast.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # East
    "population", "population20_oa11_e", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesintheeastregionofengland/mid2020sape23dt10h/sape23dt10hmid2020coaunformattedsyoaestimateseast.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # West Midlands
    "population", "population20_oa11_wm", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthewestmidlandsregionofengland/mid2020sape23dt10e/sape23dt10emid2020coaunformattedsyoaestimateswestmidlands.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # Wales
    "population", "population20_oa11_w", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinwales/mid2020sape23dt10j/sape23dt10jmid2020coaunformattedsyoaestimateswales.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # North East
    "population", "population20_oa11_ne", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthenortheastregionofengland/mid2020sape23dt10d/sape23dt10dmid2020coaunformattedsyoaestimatesnortheast.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # South West
    "population", "population20_oa11_sw", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthesouthwestregionofengland/mid2020sape23dt10g/sape23dt10gmid2020coaunformattedsyoaestimatessouthwest.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # Yorkshire and The Humber
    "population", "population20_oa11_yh", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesintheyorkshireandthehumberregionofengland/mid2020sape23dt10c/sape23dt10cmid2020coaunformattedsyoaestimatesyorkshireandthehumber.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    # London
    "population", "population20_oa11_l", "16.09.21", "OGLv3", "https://www.ons.gov.uk/file?uri=/peoplepopulationandcommunity/populationandmigration/populationestimates/datasets/censusoutputareaestimatesinthelondonregionofengland/mid2020sape23dt10a/sape23dt10amid2020coaunformattedsyoaestimateslondon.xlsx", "https://www.ons.gov.uk/peoplepopulationandcommunity/populationandmigration/populationestimates/bulletins/annualsmallareapopulationestimates/mid2020/relateddata?page=1",
    
    # Proficiency in English
    "proficiency", "proficiency21_msoa21", "29.11.22", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts029.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    
    # Religion
    "religion", "religion", "", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts030.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "religion", "religion21_lgd21_ni", "", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-ms-b19.xlsx", "https://www.nisra.gov.uk/publications/census-2021-main-statistics-religion-tables",
    
    # Sexual orientation
    "Sexual orientation", "sexualorientation21_msoa21_ew", "2021", "OGLv3", "https://www.nomisweb.co.uk/output/census/2021/census2021-ts077.zip", "https://www.nomisweb.co.uk/sources/census_2021_bulk",
    "Sexual orientation", "sexualorientation21_lgd21_ni", "2021", "OGLv3", "https://www.nisra.gov.uk/system/files/statistics/census-2021-ms-c01.xlsx", "https://www.nisra.gov.uk/publications/census-2021-main-statistics-sexual-orientation-tables"
    
    
  )

usethis::use_data(query_urls, internal = TRUE, overwrite = TRUE)
