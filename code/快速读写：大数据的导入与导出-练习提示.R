
library(pacman)
p_load(tidyverse,tidyfst)

# 生成指定行数的数据框
get_df = \(no_of_rows) {
  tibble(
    Logical = sample(c(TRUE, FALSE, NA), prob = c(0.85, 0.1, 0.05), no_of_rows, replace = TRUE),
    Integer = sample(1L:100L, no_of_rows, replace = TRUE),
    Double = sample(sample(1:10000, 20) / 100, no_of_rows, replace = TRUE),
    Factor = as.factor(sample(LETTERS, no_of_rows, replace = TRUE))
  )
}

pst(
  map(10^(6:8),get_df) -> all_data
)

# 观察数据大小
walk(all_data,object_size)

# walk2(str_c("df",6:8),all_data,~assign(x = .x,value = .y,envir = .GlobalEnv))

# 读写函数
p_load(fst,data.table,arrow,qs,readxl,writexl)

# csv
fread();fwrite() 
read_csv();write_csv() 

# xlsx
readxl::read_xlsx();writexl::write_xlsx() 

# rds
readRDS();saveRDS()
read_rds();write_rds()

# fst
read_fst();write_fst()

# arrow
read_parquet();write_parquet()
read_feather();write_feather()

# qs
qload();qsave()

# 读写时间
bench::mark()

# 文件体积
fs::file_size()







