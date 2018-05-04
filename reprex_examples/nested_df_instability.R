library(tidyverse)
library(caret)
library(randomForest)

data(mtcars)

set.seed(413)

train_control <- 
  trainControl(method="cv", number = 5, savePredictions = TRUE,
               preProcOptions = c("centre", "scale"))

form <- mpg ~ cyl + disp + hp

model_df <-
  tibble(
    model_name = c("LM1", "RF", "LM2", "LM3", "LM4", "LM5", "XGB1", "XGB2", "XGB3", "XGB4", "XGB5"),
    model = list(LM1 = train(form, data = mtcars,
                             trControl=train_control,
                             method="lm"),
                 RF = train(form, data=mtcars,
                            trControl=train_control, 
                            method="rf"),
                 LM2 = train(form, data = mtcars,
                             trControl=train_control,
                             method="lm"),
                 LM3 = train(form, data = mtcars,
                             trControl=train_control,
                             method="lm"),
                 LM4 = train(form, data = mtcars,
                             trControl=train_control,
                             method="lm"),
                 LM5 = train(form, data = mtcars,
                             trControl=train_control,
                             method="lm"),
                 XGB1 = train(form, data=mtcars,
                             trControl=train_control,
                             method="xgbLinear"),
                 XGB2 = train(form, data=mtcars,
                             trControl=train_control,
                             method="xgbLinear"),
                 XGB3 = train(form, data=mtcars,
                             trControl=train_control,
                             method="xgbLinear"),
                 XGB4 = train(form, data=mtcars,
                             trControl=train_control,
                             method="xgbLinear"),
                 XGB5 = train(form, data=mtcars,
                             trControl=train_control,
                             method="xgbLinear")
    )
)

model_df$model$XGB$results

View(model_df)


