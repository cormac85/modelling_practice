objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)

typeof_list <- purrr::map(.x = funs, .f = typeof)

primitive_funs_list <- Filter(x = typeof_list, f = )
