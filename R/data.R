#' Local Authority Districts to County and Unitary Authorities lookup (2019).
#'
#' A data set containing a lookup between December 2019 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 339 rows and 4 variables:
#' \describe{
#'   \item{lad_19_name}{LAD name}
#'   \item{lad_19_code}{LAD code}
#'   \item{county_ua_19_name}{County name}
#'   \item{county_ua_19_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_19"

#' Local Authority Districts to County and Unitary Authorities lookup (2020).
#'
#' A data set containing a lookup between December 2020 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 336 rows and 4 variables:
#' \describe{
#'   \item{lad_20_name}{LAD name}
#'   \item{lad_20_code}{LAD code}
#'   \item{county_ua_20_name}{County name}
#'   \item{county_ua_20_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_20"

#' Local Authority Districts to County and Unitary Authorities lookup (2021).
#'
#' A data set containing a lookup between December 2021 Local Authority
#' Districts and County and Unitary Authorities.
#'
#' @format A data frame of class "tbl" with 331 rows and 4 variables:
#' \describe{
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   \item{county_ua_21_name}{County name}
#'   \item{county_ua_21_code}{County code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lad_counties_21"

#' Lower Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Lower Super Output Areas (LSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 34,753 rows and 4 variables:
#' \describe{
#'   \item{lsoa_11_name}{LSOA name}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_lad_21"

#' Lower Layer Super Output Area (2011) to Middle Layer Super Output Area (2011) Lookup
#'
#' A data set containing a lookup between 2011 Lower (LSOA) and Middle Layer Super Output Areas (MSOA).
#'
#' @format A data frame of class "tbl" with 41,729 rows and 4 variables:
#' \describe{
#'   \item{lsoa_11_name}{LSOA name}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_lsoa_msoa_11"

#' Middle Layer Super Output Area (2011) to LAD (December 2019) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2019 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_19_name}{LAD name}
#'   \item{lad_19_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_19"

#' Middle Layer Super Output Area (2011) to LAD (December 2020) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2020 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_c11_ode}{MSOA code}
#'   \item{lad_20_name}{LAD name}
#'   \item{lad_20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_20"

#' Middle Layer Super Output Area (2011) to LAD (December 2021) Lookup
#'
#' A data set containing a lookup between 2011 Middle Super Output Areas (MSOA)
#' and 2021 Local Authority Districts (LAD).
#'
#' @format A data frame of class "tbl" with 7,201 rows and 4 variables:
#' \describe{
#'   \item{msoa_11_name}{MSOA name}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_21_name}{LAD name}
#'   \item{lad_21_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_msoa_lad_21"

#' Postcode to Output Area (2011) to Lower Layer Super Output Area (2011) to
#'   Middle Layer Super Output Area (2011) to Local Authority District (2020)
#'   Lookup
#'
#' A data set containing a lookup between postcodes, OAs, LSOAs, MSOAs, and
#' 2020 Local Authority Districts, for England, Wales, and Scotland.
#'
#' @format A data frame of class "tbl" with 2,568,780 rows and 5 variables:
#' \describe{
#'   \item{postcode}{Postcodes}
#'   \item{oa_11_code}{OA code}
#'   \item{lsoa_11_code}{LSOA code}
#'   \item{msoa_11_code}{MSOA code}
#'   \item{lad_20_code}{LAD code}
#'   ...
#' }
#' @source \url{https://geoportal.statistics.gov.uk/}
"lookup_postcode_oa_lsoa_msoa_lad_20"


#' Population estimates for Counties and Unitary Authorities (mid-2019 with 2019 codes)
#'
#' A data set containing mid-2019 population estimates for County and Unitary
#' Authority Districts (April 2019 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 173 rows and 94 variables:
#' \describe{
#'   \item{county_ua_name}{County or Unitary Authority name}
#'   \item{county_ua_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_counties_ua_19_codes_19"


#' Population estimates for Counties and Unitary Authorities (mid-2019 with 2020 codes)
#'
#' A data set containing mid-2019 population estimates for County and Unitary
#' Authority Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 173 rows and 94 variables:
#' \describe{
#'   \item{county_ua_name}{County or Unitary Authority name}
#'   \item{county_ua_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_counties_ua_19_codes_20"

#' Population estimates for Counties and Unitary Authorities (mid-2020 with 2020 codes)
#'
#' A data set containing mid-2020 population estimates for County and Unitary
#' Authority Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 172 rows and 94 variables:
#' \describe{
#'   \item{county_ua_name}{County or Unitary Authority name}
#'   \item{county_ua_code}{County or Unitary Authority code}
#'   \item{total_population}{Total number of people living in each area}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_counties_ua_20_codes_20"

#' Population estimates for Data Zones in Scotland (2020 estimates)
#'
#' A data set containing 2020 population estimates by age and sex for Data Zones in Scotland.
#'
#' @format A data frame of class "tbl" with 20,928 rows and 94 variables:
#' \describe{
#'   \item{dz_code}{Data Zone code}
#'   \item{total_population}{Total number of people living in each DZ}
#'   \item{sex}{'Female', 'Male' or 'All'}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://www.opendata.nhs.scot/}
"population_dz_20"

#' Population estimates for Local Authority Districts (mid-2019 with 2019 codes)
#'
#' A data set containing mid-2019 population estimates for Local Authority
#' Districts (April 2019 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 339 rows and 94 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lad_19_codes_19"


#' Population estimates for Local Authority Districts (mid-2019 with 2020 codes)
#'
#' A data set containing mid-2019 population estimates for Local Authority
#' Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 336 rows and 94 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lad_19_codes_20"

#' Population estimates for Local Authority Districts (mid-2020 with 2020 codes)
#'
#' A data set containing mid-2020 population estimates for Local Authority
#' Districts (April 2020 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 336 rows and 94 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lad_20_codes_20"

#' Population estimates for Local Authority Districts (mid-2020 with 2021 codes)
#'
#' A data set containing mid-2020 population estimates for Local Authority
#' Districts (April 2021 codes) in each devolved nation.
#'
#' @format A data frame of class "tbl" with 331 rows and 94 variables:
#' \describe{
#'   \item{lad_name}{LAD name}
#'   \item{lad_code}{LAD code}
#'   \item{total_population}{Total number of people living in each LAD}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lad_20_codes_21"

#' Population estimates for LSOAs in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Lower Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 94 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each LSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lsoa_19"

#' Population estimates for LSOAs in England and Wales (mid-2020 estimates)
#'
#' A data set containing mid-2020 population estimates for Lower Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 34,753 rows and 94 variables:
#' \describe{
#'   \item{lsoa_name}{LSOA name}
#'   \item{lsoa_code}{LSOA code}
#'   \item{total_population}{Total number of people living in each LSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_lsoa_20"

#' Population estimates for MSOAs in England and Wales (mid-2019 estimates)
#'
#' A data set containing mid-2019 population estimates for Middle Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 94 variables:
#' \describe{
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_msoa_19"

#' Population estimates for MSOAs in England and Wales (mid-2020 estimates)
#'
#' A data set containing mid-2020 population estimates for Middle Layer Super Output Areas in England and Wales.
#'
#' @format A data frame of class "tbl" with 7,201 rows and 94 variables:
#' \describe{
#'   \item{msoa_name}{MSOA name}
#'   \item{msoa_code}{MSOA code}
#'   \item{total_population}{Total number of people living in each MSOA}
#'   \item{`0`:`90+`}{Number of people in each single age group}
#'   ...
#' }
#' @source \url{https://ons.gov.uk/}
"population_msoa_20"

