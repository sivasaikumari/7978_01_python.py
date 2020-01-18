least_sales<-function(df){
  df<-read_excel("c:/Users/siva.maineni/Downloads/SaleData.xlsx",sheet='Sales Data')
  df2 <- df %>% group_by(Item) %>%  summarise( min=min(Sale_amt))
  return(df2)
}

sales_year_region<-function(df){
  df %>% group_by(year,Region) %>% summarise(Sales=sum(Units))
  return(df)
}



days_diff<-function(df){
  df$OrderDate<- as.POSIXct(df$OrderDate,format="%Y%m%d")
  temp<-readline(prompt = "enter date :%Y%m%d")
  df$diff_days<- difftime(as.Date(temp),df$OrderDate,units="days")
  return(df)
}

mgr_slsmn<-function(df)
{
  df<-df %>% group_by(Manager) %>% summarize(SalesMan= paste(sort(unique(SalesMan)),collapse=", "))
  return(df)
}

slsmn_units<- function(df)
{ df<- df %>% group_by(Region) %>% summarise( salesman_count=length(unique(SalesMan)),totalSales=sum(Units))
return(df)
}

sales_pct<- function(df)
{
  df<-df %>% group_by(Manager) %>% summarise(percentage_sales=(sum(Units)/sum(df$Units)*100))
  return(df)
}

fn <- function(df)
{
  return(df[5,'imdbRating'])
}

movies<- function(df)
{
  temp<- min(df$duration)
  temp2<- max(df$duration)
  df<-df[(df$duration ==temp)| (df$duration == temp2),'wordsInTitle']
  return(df)
}


sort_df<- function(df)
{df<-<-arrange(df,year,desc(imdbRating))
return(df)
}

subset_df<- function(df)
{df<-subset(subset(df, budget>1000000,gross>2000000,duration >30 ,duration<180)
            return(df)
}

dupl_rows<- function(df)
{
  return(anyDuplicated(df))
}


drop_row <- function(df)
{
  df <- df %>% drop_na(carat,cut)
  return(df)
}

sub_numeric<-function(df)
{
  df<-select_if(df,is.numeric)
  return(df)
}

volume <-function(df)
{
  df2<- mutate(df, volume= ifelse(depth>60,(df$x *df$y)*df$z,8))
  return(df2)
}

impute <-function(df)
{
  df$price[is.na(df$price)]<-mean(df$price)
  return(df)
}








