clean_titanic <- function(titanic_raw) {
  titanic_raw %>% 
    select(-Cabin, -PassengerId, -Ticket) %>% 
    mutate(Age = ifelse(is.na(Age), median(Age, na.rm=TRUE), Age),
           NumRelations = SibSp + Parch,
           NameLength = nchar(Name),
           Title = stringr::str_extract(Name, "(\\S+)\\s*\\.")) %>% 
    filter(!is.na(Embarked)) %>% 
    mutate_at(vars(Survived, Pclass, SibSp, Parch),
              make.names) %>% # make the levels of factors valid
    mutate(Survived = as.factor(Survived),
           Pclass = as.factor(Pclass),
           Sex= as.factor(Sex),
           SibSp = as.factor(SibSp),
           Parch = as.factor(Parch),
           Embarked = as.factor(Embarked),
           Title = as.factor(Title))
}