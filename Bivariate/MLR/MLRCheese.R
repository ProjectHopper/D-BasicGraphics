#Cheese Data Set

################################################

#Correlation Matrix for the Cheese Data Set
cor(Cheese)

#            Taste    Acetic       H2S    Lactic
# Taste  1.0000000 0.5495393 0.7557523 0.7042362
# Acetic 0.5495393 1.0000000 0.6179559 0.6037826
# H2S    0.7557523 0.6179559 1.0000000 0.6448123
# Lactic 0.7042362 0.6037826 0.6448123 1.0000000

# Simple Linear Regression Models
FitA = lm(Taste ~ Acetic, data = Cheese)
FitB = lm(Taste ~ H2S, data = Cheese)
FitC = lm(Taste ~ Lactic, data = Cheese)

summary(FitA) ; AIC(FitA)
summary(FitB) ; AIC(FitB)
summary(FitC) ; AIC(FitC)
