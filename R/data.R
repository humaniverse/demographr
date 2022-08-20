#' Local Authority Districts to County and Unitary Authorities lookup (2019).
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 339 rows and 4 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{utla19_name}{County name}
#'   \item{utla19_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla19_utla19"

#' Local Authority Districts to County and Unitary Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 336 rows and 4 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{utla20_name}{County name}
#'   \item{utla20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla20_utla20"

#' Local Authority Districts to County and Unitary Authorities lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{utla21_name}{County name}
#'   \item{utla21_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_ltla21_utla21"

#' Population estimates for LSOAs in England and Wales (mid-2019 estimates with 2011 codes)
#'
#' A data set containing mid-2019 population estimates for Lower Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 94 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each LSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_lsoa11"

#' Population estimates for Local Authority Districts (mid-2019 values with 2019 codes)
#'
#' A data set containing mid-2019 population estimates for Local Authority
#' Districts (April 2019 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 339 rows and 94 variables:
#' \describe{
#'   \item{ltla19_name}{LAD name}
#'   \item{ltla19_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_ltla19"

#' Population estimates for Local Authority Districts (mid-2019 values with 2020 codes)
#'
#' A data set containing mid-2019 population estimates for Local Authority
#' Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 336 rows and 94 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_ltla20"

#' Population estimates for MSOAs in England and Wales (mid-2019 estimates with 2011 codes)
#'
#' A data set containing mid-2019 population estimates for Middle Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 94 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_msoa11"

#' Population estimates for Counties and Unitary Authorities (mid-2019 values with 2019 codes)
#'
#' A data set containing mid-2019 population estimates for County and Unitary
#' Authority Districts (April 2019 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 173 rows and 94 variables:
#' \describe{
#'   \item{utla19_name}{County or Unitary Authority name}
#'   \item{utla19_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_utla19"

#' Population estimates for Counties and Unitary Authorities (mid-2019 values with 2020 codes)
#'
#' A data set containing mid-2019 population estimates for County and Unitary
#' Authority Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 173 rows and 94 variables:
#' \describe{
#'   \item{utla20_name}{County or Unitary Authority name}
#'   \item{utla20_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population19_utla20"


#' Population estimates for Data Zones in Scotland (2020 estimates with 2011 codes)
#'
#' A data set containing 2020 population estimates by age and sex for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 20,928 rows and 94 variables:
#' \describe{
#'   \item{dz11_code}{Data Zone code}
#'   \item{total_population}{Total number of people living in each DZ}
#'   \item{sex}{'Female', 'Male' or 'All'}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"population20_dz11"

#' Population estimates for LSOAs in England and Wales (mid-2020 estimates with 2011 codes)
#'
#' A data set containing mid-2020 population estimates for Lower Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 94 variables:
#' \describe{
#'   \item{lsoa11_name}{LSOA name}
#'   \item{lsoa11_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each LSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population20_lsoa11"

#' Population estimates for Local Authority Districts (mid-2020 values with 2020 codes)
#'
#' A data set containing mid-2020 population estimates for Local Authority
#' Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 336 rows and 94 variables:
#' \describe{
#'   \item{ltla20_name}{LAD name}
#'   \item{ltla20_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population20_ltla20"

#' Population estimates for Local Authority Districts (mid-2020 values with 2021 codes)
#'
#' A data set containing mid-2020 population estimates for Local Authority
#' Districts (April 2021 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 331 rows and 94 variables:
#' \describe{
#'   \item{ltla21_name}{LAD name}
#'   \item{ltla21_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population20_ltla21"

#' Population estimates for MSOAs in England and Wales (mid-2020 estimates with 2011 codes)
#'
#' A data set containing mid-2020 population estimates for Middle Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 94 variables:
#' \describe{
#'   \item{msoa11_name}{MSOA name}
#'   \item{msoa11_code}{MSOA code}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population20_msoa11"

#' Population estimates for Counties and Unitary Authorities (mid-2020 values with 2020 codes)
#'
#' A data set containing mid-2020 population estimates for County and Unitary
#' Authority Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 172 rows and 94 variables:
#' \describe{
#'   \item{utla20_name}{County or Unitary Authority name}
#'   \item{utla20_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population20_utla20"

#' Population in UK countries, as of Census 2021
#' 
#' A data sets containing Census 2021 population counts for each UK nation. 
#' Note that Scotland has not yet released its latest Census results, so this
#' is based on mid-year population estimates.
#' 
#' @format A data frame of class "tbl" with 4 rows and 3 variables:
#' \describe{
#'   \item{country_name}{Country name}
#'   \item{country_code}{Country code}
#'   \item{population}{Number of people}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population21_country21"

#' Population in UK Lower Tier Local Authorities, as of Census 2021
#' 
#' A data sets containing Census 2021 population counts for each Lower Tier 
#' Local Authority in the UK. Currently only Local Authority data has been
#' released for England and Wales.
#' 
#' @format A data frame of class "tbl" with 331 rows and 3 variables:
#' \describe{
#'   \item{ltla21_name}{Local Authority name}
#'   \item{ltla21_code}{Local Authority code}
#'   \item{population}{Number of people}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population21_ltla21"

#' Households in Lower Tier Local Authorities in England and Wales, as of 
#' Census 2021
#' 
#' A data sets containing Census 2021 population counts for each Lower Tier 
#' Local Authority in the UK. Currently only Local Authority data has been
#' released for England and Wales.
#' 
#' @format A data frame of class "tbl" with 331 rows and 3 variables:
#' \describe{
#'   \item{ltla21_name}{Local Authority name}
#'   \item{ltla21_code}{Local Authority code}
#'   \item{households}{Number of households}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"households21_ltla21"
