cut -f 2-4 -d , PredPreyData.csv > CleanData.csv
grep time CleanData.csv > FinalData.csv
tail CleanData.csv >> FinalData.csv
less FinalData.csv
