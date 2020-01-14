# 7978_01_python.py
# import pandas, numpy
# Create the required data frames by reading in the files

# Q1 Find least sales amount for each item
# has been solved as an example



#BONUS QUESTIONS#
import pandas as pd
import numpy as np
df=pd.read_csv("C:\\Users\\siva.maineni\\Downloads\\movie_metadata.csv"
temp=df.groupby('title_year')['genres'].unique()
genre_combo=pd.DataFrame(temp)
genre_combo['avg_rating']=df.groupby(['genres'])['imdb_score'].mean()
genre_combo['max_rating']=df.groupby(['genres'])['imdb_score'].max()
genre_combo['min_rating']=df.groupby(['genres'])['imdb_score'].min()
 
[2]
import pandas as pd
import numpy as np
df=pd.read_csv("C:\\Users\\siva.maineni\\Downloads\\movie_metadata.csv")
df['length']=df['movie_title'].apply(len)
newdf=temp.groupby(['title_year'])['length'].quantile([0.25,0.5,0.75])
newdf=newdf.to_frame()
temp=pd.DataFrame()
for i in temp['title_year'].unique():
    year.append(i)
    c1=temp[(df['title_year']==i)  & (df['length']<newdf['length'][i][0.25])]['color'].count()
    l1=newdf['length'][i][0.25]
    c2=temp[(df['title_year']==i) & (df['length']<newdf['length'][i][0.5])]['color'].count() 
    l2=newdf['length'][i][0.5]
    c3=temp[(df['title_year']==i)  & (df['length']<newdf['length'][i][0.75])]['color'].count()
    l3=temp['length']<newdf['length'][i][0.75]
    c4=temp[(df['title_year']==i)  & (df['length']>newdf['length'][i][0.75])]['color'].count()
    m1=temp[(df['title_year']==i)]['length'].min()
    m2=temp[(df['title_year']==i)]['length'].max()
    
    
    T.append(c1)
    c1=0
    F.append(c2)
    c2=0
    S.append(c3)
    c3=0
    G.append(c4)
    c4=0
    L1.append(l1)
    L2.append(l2)
    L3.append(l3)
    M1.append(m1)
    M2.append(m2)
T=pd.Series(T)
F=pd.Series(F)
S=pd.Series(S)
G=pd.Series(G)
L1=pd.Series(L1)
L3=pd.Series(L2)
L2=pd.Series(L3)
year=pd.Series(year)
M1=pd.Series(M1,dtype=int)
M2=pd.Series(M2,dtype=int)
temp2['year']=year
temp2['min']=M1
temp2['max']=M2
temp2['0,25%']=L1
temp2['0.5%']=L2
temp2['0.75%']=L3
temp2['< 0.25%']=T
temp2['< 0.5%']=F
temp2['< 0.75%']=S
temp2['>0.75%']=G
               
 [3]
 
               
               
               




def least_sales(df):
    # write code to return pandas dataframe
	ls = df.groupby(["Item"])["Sale_amt"].min().reset_index()
    return ls

# Q2 compute total sales at each year X region
def sales_year_region(df):
    # write code to return pandas dataframe
    df['Order'] = pd.DatetimeIndex(df['OrderDate']).year
    df1=df.groupby('Order')
    return df1.sum()

# Q3 append column with no of days difference from present date to each order date
def days_diff(df):
    # write code to return pandas dataframe
    df['days_diff']='2019-12-03'
    df['days_diff']= pd.to_datetime(df['days_diff']) 
    df['days_diff']= df['days_diff']-df['OrderDate']
    return df

# Q4 get dataframe with manager as first column and  salesman under them as lists in rows in second column.
def mgr_slsmn(df):
    # write code to return pandas dataframe
    df1=df.groupby('Manager')['SalesMan'].apply(list).reset_index(name='list_of_salesmen')
    return df1

# Q5 For all regions find number of salesman and number of units
def slsmn_units(df):
    # write code to return pandas dataframe
    df=df1.groupby('Region')['SalesMan'].apply(set).reset_index(name='list_of_salesmen')
    df['salesman_count']=df['list_of_salesmen'].str.len()
    df3=a.groupby('Region')['Sale_amt'].apply(sum).reset_index(name='sum')
    df['total_sales']=df3['sum']
    return df

# Q6 Find total sales as percentage for each manager
def sales_pct(df):
    # write code to return pandas dataframe
    df6=df.groupby('Manager')['Sale_amt'].apply(sum).reset_index(name='percent_sales')
    s=df6['percent_sales'].sum()
    df6['percent_sales']=(df6['percent_sales']/s)*100 
    return df6

# Q7 get imdb rating for fifth movie of dataframe
def fifth_movie(df):
	# write code here
	return df['imdbRating'][4]

# Q8 return titles of movies with shortest and longest run time
def movies(df):
	# write code here
	return df['title']

# Q9 sort by two columns - release_date (earliest) and Imdb rating(highest to lowest)
def sort_df(df):
	# write code here
	df.sort_values(['year', 'imdbRating'], ascending=[True, False])
        return df

# Q10 subset revenue more than 2 million and spent less than 1 million & duration between 30 mintues to 180 minutes
def subset_df(df):
	# write code here
	df[['duration']] = df[['duration']].apply(pd.to_numeric) 
        df1= df[(df['duration'] > 1800) & (df['duration'] < 10800)]
        return df1

# Q11 count the duplicate rows of diamonds DataFrame.
def dupl_rows(df):
	# write code here
	df = (df.fillna('')/
      .groupby(df.columns.tolist()).apply(len)/
      .rename('count')/
      .reset_index()/
      .replace('',np.nan)/
      .sort_values(by = ['count'], ascending = False))
	return df

# Q12 droping those rows where any value in a row is missing in carat and cut columns
def drop_row(df):
	# write code here
	df.dropna(subset=['carat','cut'])
	return df

# Q13 subset only numeric columns
def sub_numeric(df):
	# write code here
	df1=df._get_numeric_data()
	return df1

# Q14 compute volume as (x*y*z) when depth > 60 else 8
def volume(df):
	# write code here
	df['volume']=8
	df.loc[df['depth'] > 60, 'volume'] = (df['x']*df['y'])*df['z']
	return df

# Q15 impute missing price values with mean
def impute(df):
	# write code here
	df.fillna(df.mean())
	return df
	









