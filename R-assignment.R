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

#2Ans
dataframe <- read.csv('C:/Users/siva.maineni/Downloads/diamond.csv')
q2<-function(dataframe)
{
  dataframe1$length1<-nchar(gsub(" ","",dataframe1$wordsInTitle,fixed=TRUE))
  dataframe1$quantile<-as.numeric(ntile(dataframe1$length1,4))
  df3<-as.data.frame.matrix(table(dataframe1$year,dataframe1$quantile))
  df4<-dataframe1%>%group_by(year)%>%summarise(minimum=min(length1,na.rm=TRUE),maximum=max(length1,na.rm=TRUE))
  df4=drop_na(df4)
  df5<-cbind(df4,df3)
  row.names(df5)<-NULL
  return(df5)
}
#q2(dataframe)


#3Ans
dataframe <- read.csv('C:/Users/siva.maineni/Downloads/diamonds.csv')
q3<-function(dataframe)
{
  depth.filter<-dataframe$depth>60
  v<-c()
  for(i in 1:length(depth.filter))
    {
      if(depth.filter[i])
        {
          vol<-(as.numeric(as.character(dataframe$x[i]))*
          as.numeric(as.character(dataframe$y[i]))*
          as.numeric(as.character(dataframe$z[i])))
        }
      else
      {
        vol<-8
      }
    v<-c(v,vol)
  }
  dataframe$volume<-v
  dataframe$Bins<-as.numeric(ntile(dataframe$volume,5))
  tvol=sum(dataframe$volume)
  t<-crosstab(dataframe$Bins,dataframe$cut,plot=FALSE,prop.t=TRUE)
  return(t)
}
#q3(dataframe)


#5Ans
df2<-read_delim("c"/Users/siva.maineni/Downloads/imdb.csv", delim=',', escape_double=FALSE, escape_backslash=TRUE)
q5<-function(df)
{
  df2<-na_mean(df2)
  df2$deciles<-as.numeric(ntile(df2$duration,10))
  df3<-df2%>%group_by(deciles)%>%summarise(nr_Of_Nominations=sum(nrOfNominations,na.rm=TRUE),nr_Of_Wins=sum(nrOfWins))
  df3$count<-as.data.frame(table(df2$deciles))['Freq']
  df4<-df2[c(17:45)]
  df5<-df4%>%group_by(deciles)%>%summarise_all(sum)
  df5<-as.data.frame.matrix(t(df5))
  names<-row.names(df5)
  high<-function(x)
  {
    return(names[order(x,decreasing = TRUE)[1:3]])
  }
  df6<-as.data.frame.matrix(t(sapply(df5,high)))
  colnames(df6)<-c('first','second','third')
  df3['top genres']<-paste(df6$first,',',df6$second,',',df6$third)
  return(df3)
}
#q5(df2)






