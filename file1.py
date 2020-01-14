# 7978_01_python.py
import pandas as pd
import numpy as np
df=pd.read_csv("C:\\Users\\siva.maineni\\Downloads\\movie_metadata.csv"
temp=df.groupby('title_year')['genres'].unique()
genre_combo=pd.DataFrame(temp)
genre_combo['avg_rating']=df.groupby(['genres'])['imdb_score'].mean()
genre_combo['max_rating']=df.groupby(['genres'])['imdb_score'].max()
genre_combo['min_rating']=df.groupby(['genres'])['imdb_score'].min()
