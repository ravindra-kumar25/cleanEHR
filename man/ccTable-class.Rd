% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ccTable.R
\docType{class}
\name{ccTable-class}
\alias{ccTable}
\alias{ccTable-class}
\title{Process the EHR data in table format}
\description{
ccRecord data are re-arranged into tables where the columns stands for 
data fields (e.g. heart rate, blood pressure) and the rows stands for 
each data record within a unique cadence. See ccTable_create_cctable.
ccTable is the data processing platform. It stores both original data 
and processed data alongside with the process details. It also contains 
various commonly used data filters.
}
\section{Fields}{

\describe{
\item{\code{record}}{ccRecord.}

\item{\code{conf}}{the YAML style configuration.}

\item{\code{torigin}}{the original data table.}

\item{\code{tclean}}{the data table after cleaning processes.}

\item{\code{dfilter}}{list contains data filtering information.}

\item{\code{dquality}}{list contains data quality.}

\item{\code{summary}}{list}

\item{\code{base_cadence}}{the base cadence is specified in hours}
}}
\section{Methods}{

\describe{
\item{\code{apply_filters(warnings = TRUE)}}{Apply all filters specified in the configuration to update the clean
table (tclean)}

\item{\code{create_table(freq)}}{Create a table contains the selected items in the conf with a given
frequency (in hour)}

\item{\code{export_csv(file = NULL)}}{Export the cleaned table to a CSV file.}

\item{\code{filter_categories()}}{Check individual entries if they are the in the categories specified
in conf.}

\item{\code{filter_missingness(recount = FALSE)}}{filter out the where missingness is too low.}

\item{\code{filter_nodata()}}{Exclude episodes when no data is presented in certain fields}

\item{\code{imputation()}}{Filling missing data to a time series data by performing a given imputation
method on a selected window period nearby the missing data.}

\item{\code{reload_conf(conf)}}{reload yaml configuration.}
}}
\examples{
rec <- ccRecord()
cctable <- create_cctable(rec, freq=1)
cctable <- cctable$clean()
#table <- cctable$tclean 
}

