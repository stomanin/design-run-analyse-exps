
## One-sample tests of proportions

# read in a data file with 2 response categories
devprefs = read.csv("deviceprefs.csv")
View(devprefs)
devprefs$Subject = factor(devprefs$Subject) # convert to nominal factor
summary(devprefs)
plot(devprefs$Pref)
plot(devprefs[devprefs$Disability == "1",]$Pref)
plot(devprefs[devprefs$Disability == "0",]$Pref)

# Pearson chi-square test
prfs = xtabs( ~ Pref, data=devprefs)
prfs # show counts
chisq.test(prfs)

# binomial test, people withouth disabilities
prfs.no.dis = xtabs( ~ Pref, data=devprefs[devprefs$Disability == "0",])
prfs.no.dis  # show counts
binom.test(prfs.no.dis)

# binomial test, people with disabilities
prfs.dis = xtabs( ~ Pref, data=devprefs[devprefs$Disability == "1",])
prfs.dis  # show counts
binom.test(prfs.dis)

## Two-sample tests of proportions

# Pearson chi-square test
prfs2 = xtabs( ~ Pref + Disability, data=devprefs) # the '+' sign indicates two vars
View(prfs2)
chisq.test(prfs2)

# G-test, asymptotic like chi-square
library(RVAideMemoire)
G.test(prfs2)

# Fisher's exact test
fisher.test(prfs2)

